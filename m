From: gregkh at linuxfoundation.org (Greg Kroah-Hartman)
Date: Thu, 23 May 2019 21:06:36 +0200
Subject: [PATCH 5.1 074/122] x86_64: Allow breakpoints to emulate call
 instructions
In-Reply-To: <20190523181705.091418060@linuxfoundation.org>
References: <20190523181705.091418060@linuxfoundation.org>
Message-ID: <20190523181714.548131991@linuxfoundation.org>

From: Peter Zijlstra <peterz at infradead.org>

commit 4b33dadf37666c0860b88f9e52a16d07bf6d0b03 upstream.

In order to allow breakpoints to emulate call instructions, they need to push
the return address onto the stack. The x86_64 int3 handler adds a small gap
to allow the stack to grow some. Use this gap to add the return address to
be able to emulate a call instruction at the breakpoint location.

These helper functions are added:

  int3_emulate_jmp(): changes the location of the regs->ip to return there.

 (The next two are only for x86_64)
  int3_emulate_push(): to push the address onto the gap in the stack
  int3_emulate_call(): push the return address and change regs->ip

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
[ Modified to only work for x86_64 and added comment to int3_emulate_push() ]
Signed-off-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 arch/x86/include/asm/text-patching.h |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -39,4 +39,32 @@ extern int poke_int3_handler(struct pt_r
 extern void *text_poke_bp(void *addr, const void *opcode, size_t len, void *handler);
 extern int after_bootmem;
 
+static inline void int3_emulate_jmp(struct pt_regs *regs, unsigned long ip)
+{
+	regs->ip = ip;
+}
+
+#define INT3_INSN_SIZE 1
+#define CALL_INSN_SIZE 5
+
+#ifdef CONFIG_X86_64
+static inline void int3_emulate_push(struct pt_regs *regs, unsigned long val)
+{
+	/*
+	 * The int3 handler in entry_64.S adds a gap between the
+	 * stack where the break point happened, and the saving of
+	 * pt_regs. We can extend the original stack because of
+	 * this gap. See the idtentry macro's create_gap option.
+	 */
+	regs->sp -= sizeof(unsigned long);
+	*(unsigned long *)regs->sp = val;
+}
+
+static inline void int3_emulate_call(struct pt_regs *regs, unsigned long func)
+{
+	int3_emulate_push(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);
+	int3_emulate_jmp(regs, func);
+}
+#endif
+
 #endif /* _ASM_X86_TEXT_PATCHING_H */
