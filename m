From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Thu, 23 May 2019 21:05:52 +0200
Subject: [PATCH 4.14 34/77] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <20190523181719.982121681@linuxfoundation.org>
References: <20190523181719.982121681@linuxfoundation.org>
Message-ID: <20190523181724.937933016@linuxfoundation.org>

From: Peter Zijlstra <peterz at infradead.org>

commit 9e298e8604088a600d8100a111a532a9d342af09 upstream.

Nicolai Stange discovered[1] that if live kernel patching is enabled, and the
function tracer started tracing the same function that was patched, the
conversion of the fentry call site during the translation of going from
calling the live kernel patch trampoline to the iterator trampoline, would
have as slight window where it didn't call anything.

As live kernel patching depends on ftrace to always call its code (to
prevent the function being traced from being called, as it will redirect
it). This small window would allow the old buggy function to be called, and
this can cause undesirable results.

Nicolai submitted new patches[2] but these were controversial. As this is
similar to the static call emulation issues that came up a while ago[3].
But after some debate[4][5] adding a gap in the stack when entering the
breakpoint handler allows for pushing the return address onto the stack to
easily emulate a call.

[1] http://lkml.kernel.org/r/20180726104029.7736-1-nstange at suse.de
[2] http://lkml.kernel.org/r/20190427100639.15074-1-nstange at suse.de
[3] http://lkml.kernel.org/r/3cf04e113d71c9f8e4be95fb84a510f085aa4afa.1541711457.git.jpoimboe at redhat.com
[4] http://lkml.kernel.org/r/CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A at mail.gmail.com
[5] http://lkml.kernel.org/r/CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w at mail.gmail.com

[
  Live kernel patching is not implemented on x86_32, thus the emulate
  calls are only for x86_64.
]

Cc: Andy Lutomirski <luto at kernel.org>
Cc: Nicolai Stange <nstange at suse.de>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Ingo Molnar <mingo at redhat.com>
Cc: Borislav Petkov <bp at alien8.de>
Cc: "H. Peter Anvin" <hpa at zytor.com>
Cc: the arch/x86 maintainers <x86 at kernel.org>
Cc: Josh Poimboeuf <jpoimboe at redhat.com>
Cc: Jiri Kosina <jikos at kernel.org>
Cc: Miroslav Benes <mbenes at suse.cz>
Cc: Petr Mladek <pmladek at suse.com>
Cc: Joe Lawrence <joe.lawrence at redhat.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk at oracle.com>
Cc: Tim Chen <tim.c.chen at linux.intel.com>
Cc: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
Cc: Mimi Zohar <zohar at linux.ibm.com>
Cc: Juergen Gross <jgross at suse.com>
Cc: Nick Desaulniers <ndesaulniers at google.com>
Cc: Nayna Jain <nayna at linux.ibm.com>
Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
Cc: Joerg Roedel <jroedel at suse.de>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest at vger.kernel.org>
Cc: stable at vger.kernel.org
Fixes: b700e7f03df5 ("livepatch: kernel: add support for live patching")
Tested-by: Nicolai Stange <nstange at suse.de>
Reviewed-by: Nicolai Stange <nstange at suse.de>
Reviewed-by: Masami Hiramatsu <mhiramat at kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
[ Changed to only implement emulated calls for x86_64 ]
Signed-off-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 arch/x86/kernel/ftrace.c |   32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -30,6 +30,7 @@
 #include <asm/sections.h>
 #include <asm/ftrace.h>
 #include <asm/nops.h>
+#include <asm/text-patching.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
@@ -229,6 +230,7 @@ int ftrace_modify_call(struct dyn_ftrace
 }
 
 static unsigned long ftrace_update_func;
+static unsigned long ftrace_update_func_call;
 
 static int update_ftrace_func(unsigned long ip, void *new)
 {
@@ -257,6 +259,8 @@ int ftrace_update_ftrace_func(ftrace_fun
 	unsigned char *new;
 	int ret;
 
+	ftrace_update_func_call = (unsigned long)func;
+
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	ret = update_ftrace_func(ip, new);
 
@@ -292,13 +296,28 @@ int ftrace_int3_handler(struct pt_regs *
 	if (WARN_ON_ONCE(!regs))
 		return 0;
 
-	ip = regs->ip - 1;
-	if (!ftrace_location(ip) && !is_ftrace_caller(ip))
-		return 0;
+	ip = regs->ip - INT3_INSN_SIZE;
 
-	regs->ip += MCOUNT_INSN_SIZE - 1;
+#ifdef CONFIG_X86_64
+	if (ftrace_location(ip)) {
+		int3_emulate_call(regs, (unsigned long)ftrace_regs_caller);
+		return 1;
+	} else if (is_ftrace_caller(ip)) {
+		if (!ftrace_update_func_call) {
+			int3_emulate_jmp(regs, ip + CALL_INSN_SIZE);
+			return 1;
+		}
+		int3_emulate_call(regs, ftrace_update_func_call);
+		return 1;
+	}
+#else
+	if (ftrace_location(ip) || is_ftrace_caller(ip)) {
+		int3_emulate_jmp(regs, ip + CALL_INSN_SIZE);
+		return 1;
+	}
+#endif
 
-	return 1;
+	return 0;
 }
 
 static int ftrace_write(unsigned long ip, const char *val, int size)
@@ -869,6 +888,8 @@ void arch_ftrace_update_trampoline(struc
 
 	func = ftrace_ops_get_func(ops);
 
+	ftrace_update_func_call = (unsigned long)func;
+
 	/* Do a safe modify in case the trampoline is executing */
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	ret = update_ftrace_func(ip, new);
@@ -965,6 +986,7 @@ static int ftrace_mod_jmp(unsigned long
 {
 	unsigned char *new;
 
+	ftrace_update_func_call = 0UL;
 	new = ftrace_jmp_replace(ip, (unsigned long)func);
 
 	return update_ftrace_func(ip, new);
