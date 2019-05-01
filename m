From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 1 May 2019 14:52:00 -0400
Subject: [RFC][PATCH v3] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
References: <20190501113238.0ab3f9dd@gandalf.local.home>
 <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
Message-ID: <20190501145200.6c095d7f@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501185200.MZZYrxxWyQ1DqS87oXcxrtnz_r7f0oMtx88za2jqb8E@z>

On Wed, 1 May 2019 11:01:07 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> This looks sane to me, although I'm surprised that we didn't already
> have an annotation for the nonstandard stack frame for asm files. That
> probably would be cleaner in a separate commit, but I guess it doesn't
> matter.

It's still an RFC patch, and I was planning on breaking out the
non-standard stack change before the real patches.

> 
> Anyway, I'm willing to consider the entry code version if it looks a
> _lot_ simpler than this (so I'd like to see them side-by-side), but
> it's not like this looks all that complicated to me either.

I got Peter's patch working. Here it is. What do you think?

What's nice about Peter's is that this will easily work for the static
call case too, without needing any more special trampolines.

The diffstat looks nice too:

Peter's patch:

 entry/entry_32.S            |    7 +++++++
 entry/entry_64.S            |   14 ++++++++++++--
 include/asm/text-patching.h |   20 ++++++++++++++++++++
 kernel/ftrace.c             |   25 ++++++++++++++++++++-----
 4 files changed, 59 insertions(+), 7 deletions(-)

My patch:

 arch/x86/include/asm/frame.h |  15 ++++++
 arch/x86/kernel/ftrace.c     | 102 ++++++++++++++++++++++++++++++++++-
 arch/x86/kernel/ftrace_64.S  |  56 +++++++++++++++++++
 3 files changed, 172 insertions(+), 1 deletion(-)

-- Steve

Index: linux-trace.git/arch/x86/entry/entry_32.S
===================================================================
--- linux-trace.git.orig/arch/x86/entry/entry_32.S
+++ linux-trace.git/arch/x86/entry/entry_32.S
@@ -1478,6 +1478,13 @@ ENTRY(int3)
 	ASM_CLAC
 	pushl	$-1				# mark this as an int
 
+	testl	$SEGMENT_RPL_MASK, PT_CS(%esp)
+	jnz	.Lfrom_usermode_no_gap
+	.rept 6
+	pushl	5*4(%esp)
+	.endr
+.Lfrom_usermode_no_gap:
+
 	SAVE_ALL switch_stacks=1
 	ENCODE_FRAME_POINTER
 	TRACE_IRQS_OFF
Index: linux-trace.git/arch/x86/entry/entry_64.S
===================================================================
--- linux-trace.git.orig/arch/x86/entry/entry_64.S
+++ linux-trace.git/arch/x86/entry/entry_64.S
@@ -879,7 +879,7 @@ apicinterrupt IRQ_WORK_VECTOR			irq_work
  * @paranoid == 2 is special: the stub will never switch stacks.  This is for
  * #DF: if the thread stack is somehow unusable, we'll still get a useful OOPS.
  */
-.macro idtentry sym do_sym has_error_code:req paranoid=0 shift_ist=-1
+.macro idtentry sym do_sym has_error_code:req paranoid=0 shift_ist=-1 create_gap=0
 ENTRY(\sym)
 	UNWIND_HINT_IRET_REGS offset=\has_error_code*8
 
@@ -899,6 +899,16 @@ ENTRY(\sym)
 	jnz	.Lfrom_usermode_switch_stack_\@
 	.endif
 
+	.if \create_gap == 1
+	testb	$3, CS-ORIG_RAX(%rsp)
+	jnz	.Lfrom_usermode_no_gap_\@
+	.rept 6
+	pushq	5*8(%rsp)
+	.endr
+	UNWIND_HINT_IRET_REGS offset=8
+.Lfrom_usermode_no_gap_\@:
+	.endif
+
 	.if \paranoid
 	call	paranoid_entry
 	.else
@@ -1130,7 +1140,7 @@ apicinterrupt3 HYPERV_STIMER0_VECTOR \
 #endif /* CONFIG_HYPERV */
 
 idtentry debug			do_debug		has_error_code=0	paranoid=1 shift_ist=DEBUG_STACK
-idtentry int3			do_int3			has_error_code=0
+idtentry int3			do_int3			has_error_code=0	create_gap=1
 idtentry stack_segment		do_stack_segment	has_error_code=1
 
 #ifdef CONFIG_XEN_PV
Index: linux-trace.git/arch/x86/include/asm/text-patching.h
===================================================================
--- linux-trace.git.orig/arch/x86/include/asm/text-patching.h
+++ linux-trace.git/arch/x86/include/asm/text-patching.h
@@ -39,4 +39,24 @@ extern int poke_int3_handler(struct pt_r
 extern void *text_poke_bp(void *addr, const void *opcode, size_t len, void *handler);
 extern int after_bootmem;
 
+static inline void int3_emulate_push(struct pt_regs *regs, unsigned long val)
+{
+	regs->sp -= sizeof(unsigned long);
+	*(unsigned long *)regs->sp = val;
+}
+
+static inline void int3_emulate_jmp(struct pt_regs *regs, unsigned long ip)
+{
+	regs->ip = ip;
+}
+
+#define INT3_INSN_SIZE 1
+#define CALL_INSN_SIZE 5
+
+static inline void int3_emulate_call(struct pt_regs *regs, unsigned long func)
+{
+	int3_emulate_push(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);
+	int3_emulate_jmp(regs, func);
+}
+
 #endif /* _ASM_X86_TEXT_PATCHING_H */
Index: linux-trace.git/arch/x86/kernel/ftrace.c
===================================================================
--- linux-trace.git.orig/arch/x86/kernel/ftrace.c
+++ linux-trace.git/arch/x86/kernel/ftrace.c
@@ -29,6 +29,7 @@
 #include <asm/kprobes.h>
 #include <asm/ftrace.h>
 #include <asm/nops.h>
+#include <asm/text-patching.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
@@ -231,6 +232,7 @@ int ftrace_modify_call(struct dyn_ftrace
 }
 
 static unsigned long ftrace_update_func;
+static unsigned long ftrace_update_func_call;
 
 static int update_ftrace_func(unsigned long ip, void *new)
 {
@@ -259,6 +261,8 @@ int ftrace_update_ftrace_func(ftrace_fun
 	unsigned char *new;
 	int ret;
 
+	ftrace_update_func_call = (unsigned long)func;
+
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	ret = update_ftrace_func(ip, new);
 
@@ -294,13 +298,21 @@ int ftrace_int3_handler(struct pt_regs *
 	if (WARN_ON_ONCE(!regs))
 		return 0;
 
-	ip = regs->ip - 1;
-	if (!ftrace_location(ip) && !is_ftrace_caller(ip))
-		return 0;
+	ip = regs->ip - INT3_INSN_SIZE;
 
-	regs->ip += MCOUNT_INSN_SIZE - 1;
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
 
-	return 1;
+	return 0;
 }
 NOKPROBE_SYMBOL(ftrace_int3_handler);
 
@@ -859,6 +871,8 @@ void arch_ftrace_update_trampoline(struc
 
 	func = ftrace_ops_get_func(ops);
 
+	ftrace_update_func_call = (unsigned long)func;
+
 	/* Do a safe modify in case the trampoline is executing */
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	ret = update_ftrace_func(ip, new);
@@ -960,6 +974,7 @@ static int ftrace_mod_jmp(unsigned long
 {
 	unsigned char *new;
 
+	ftrace_update_func_call = 0UL;
 	new = ftrace_jmp_replace(ip, (unsigned long)func);
 
 	return update_ftrace_func(ip, new);
