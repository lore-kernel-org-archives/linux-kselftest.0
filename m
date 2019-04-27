From: nstange@suse.de (Nicolai Stange)
Date: Sat, 27 Apr 2019 12:06:38 +0200
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip fops
 invocation
In-Reply-To: <20190427100639.15074-1-nstange@suse.de>
References: <20190427100639.15074-1-nstange@suse.de>
Message-ID: <20190427100639.15074-4-nstange@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190427100638.bsvTH163MMEJFPgKjIXMzKjwQHXWTihXDZ2wxumBaLY@z>

With dynamic ftrace, ftrace patches call sites on x86 in a three steps:
1. Put a breakpoint at the to be patched location,
2. update call site and
3. finally remove the breakpoint again.

Note that the breakpoint ftrace_int3_handler() simply makes execution to
skip over the to be patched instruction.

This patching happens in the following circumstances:
a.) the global ftrace_trace_function changes and the call sites at
    ftrace_call and ftrace_regs_call get patched,
b.) an ftrace_ops' ->func changes and the call site in its trampoline gets
    patched,
c.) graph tracing gets enabled/disabled and the jump site at
    ftrace_graph_call gets patched,
d.) a mcount site gets converted from nop -> call, call -> nop, or
    call -> call.

The latter case, i.e. a mcount call getting redirected, is possible in e.g.
a transition from trampolined to not trampolined upon a user enabling
function tracing on a live patched function.

The ftrace_int3_handler() simply skipping over the updated insn is quite
problematic in the context of live patching, because it means that a live
patched function gets temporarily reverted to its unpatched original and
this breaks the live patching consistency model. But even without live
patching, it is desirable to avoid missing traces when making changes to
the tracing setup.

Make ftrace_int3_handler not to skip over the fops invocation, but modify
the interrupted control flow to issue a call as needed.

Case c.) from the list above can be ignored, because a jmp instruction gets
changed to a nop or vice versa.

The remaining cases a.), b.) and d.) all involve call instructions. For a.)
and b.), the call always goes to some ftrace_func_t and the generic
ftrace_ops_list_func() impementation will be able to demultiplex and do the
right thing. For case d.), the call target is either of ftrace_caller(),
ftrace_regs_caller() or some ftrace_ops' trampoline. Because providing the
register state won't cause any harm for !FTRACE_OPS_FL_SAVE_REGS
ftrace_ops, ftrace_regs_caller() would be a suitable target capable of
handling any case.

ftrace_int3_handler()'s context is different from the interrupted call
instruction's one, obviously. In order to be able to emulate the call
within the original context, make ftrace_int3_handler() set its iret
frame's ->ip to some helper stub. Upon return from the trap, this stub will
then mimic the call by pushing the the return address onto the stack and
issuing a jmp to the target address. As describe above, the jmp target
will be either of ftrace_ops_list_func() or ftrace_regs_caller(). Provide
one such stub implementation for each of the two cases.

Finally, the desired return address, which is derived from the trapping
->ip, must get passed from ftrace_int3_handler() to these stubs. Make
ftrace_int3_handler() push it onto the ftrace_int3_stack introduced by an
earlier patch and let the stubs consume it. Be careful to use proper
compiler barriers such that nested int3 handling from e.g. irqs won't
clobber entries owned by outer instances.

Suggested-by: Steven Rostedt <rostedt at goodmis.org>
Signed-off-by: Nicolai Stange <nstange at suse.de>
---
 arch/x86/kernel/Makefile            |  1 +
 arch/x86/kernel/ftrace.c            | 79 +++++++++++++++++++++++++++++++------
 arch/x86/kernel/ftrace_int3_stubs.S | 61 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 11 deletions(-)
 create mode 100644 arch/x86/kernel/ftrace_int3_stubs.S

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 00b7e27bc2b7..0b63ae02b1f3 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_LIVEPATCH)	+= livepatch.o
 obj-$(CONFIG_FUNCTION_TRACER)	+= ftrace_$(BITS).o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER) += ftrace.o
 obj-$(CONFIG_FTRACE_SYSCALLS)	+= ftrace.o
+obj-$(CONFIG_DYNAMIC_FTRACE)	+= ftrace_int3_stubs.o
 obj-$(CONFIG_X86_TSC)		+= trace_clock.o
 obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec_$(BITS).o
 obj-$(CONFIG_KEXEC_CORE)	+= relocate_kernel_$(BITS).o crash.o
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index ef49517f6bb2..917494f35cba 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -280,25 +280,84 @@ static nokprobe_inline int is_ftrace_caller(unsigned long ip)
 	return 0;
 }
 
-/*
- * A breakpoint was added to the code address we are about to
- * modify, and this is the handle that will just skip over it.
- * We are either changing a nop into a trace call, or a trace
- * call to a nop. While the change is taking place, we treat
- * it just like it was a nop.
- */
+extern void ftrace_graph_call(void);
+
+asmlinkage void ftrace_int3_stub_regs_caller(void);
+asmlinkage void ftrace_int3_stub_list_func(void);
+
+/* A breakpoint was added to the code address we are about to modify. */
 int ftrace_int3_handler(struct pt_regs *regs)
 {
 	unsigned long ip;
+	bool is_ftrace_location;
+	struct ftrace_int3_stack *stack;
+	int slot;
 
 	if (WARN_ON_ONCE(!regs))
 		return 0;
 
 	ip = regs->ip - 1;
-	if (!ftrace_location(ip) && !is_ftrace_caller(ip))
+	is_ftrace_location = ftrace_location(ip);
+	if (!is_ftrace_location && !is_ftrace_caller(ip))
 		return 0;
 
-	regs->ip += MCOUNT_INSN_SIZE - 1;
+	ip += MCOUNT_INSN_SIZE;
+
+	if (!is_ftrace_location &&
+	    ftrace_update_func == (unsigned long)ftrace_graph_call) {
+		/*
+		 * The insn at ftrace_graph_call is being changed from a
+		 * nop to a jmp or vice versa. Treat it as a nop and
+		 * skip over it.
+		 */
+		regs->ip = ip;
+		return 1;
+	}
+
+	/*
+	 * The insn having the breakpoint on it is either some mcount
+	 * call site or one of ftrace_call, ftrace_regs_call and their
+	 * equivalents within some trampoline. The currently pending
+	 * transition is known to turn the insn from a nop to a call,
+	 * from a call to a nop or to change the target address of an
+	 * existing call. We're going to emulate a call to the most
+	 * generic implementation capable of handling any possible
+	 * configuration. For the mcount sites that would be
+	 * ftrace_regs_caller() and for the remaining calls, which all
+	 * have got some ftrace_func_t target, ftrace_ops_list_func()
+	 * will do the right thing.
+	 *
+	 * However, the call insn can't get emulated from this trap
+	 * handler here. Rewrite the iret frame's ->ip value to one of
+	 * the ftrace_int3_stub instances which will then setup
+	 * everything in the original context. The address following
+	 * the current insn will be passed to the stub via the
+	 * ftrace_int3_stack.
+	 */
+	stack = &current_thread_info()->ftrace_int3_stack;
+	if (WARN_ON_ONCE(stack->depth >= 4)) {
+		/*
+		 * This should not happen as at most one stack slot is
+		 * required per the contexts "normal", "irq",
+		 * "softirq" and "nmi" each. However, be conservative
+		 * and treat it like a nop.
+		 */
+		regs->ip = ip;
+		return 1;
+	}
+
+	/*
+	 * Make sure interrupts will see the incremented ->depth value
+	 * before writing the stack entry.
+	 */
+	slot = stack->depth;
+	WRITE_ONCE(stack->depth, slot + 1);
+	WRITE_ONCE(stack->slots[slot], ip);
+
+	if (is_ftrace_location)
+		regs->ip = (unsigned long)ftrace_int3_stub_regs_caller;
+	else
+		regs->ip = (unsigned long)ftrace_int3_stub_list_func;
 
 	return 1;
 }
@@ -949,8 +1008,6 @@ void arch_ftrace_trampoline_free(struct ftrace_ops *ops)
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-extern void ftrace_graph_call(void);
-
 static unsigned char *ftrace_jmp_replace(unsigned long ip, unsigned long addr)
 {
 	return ftrace_text_replace(0xe9, ip, addr);
diff --git a/arch/x86/kernel/ftrace_int3_stubs.S b/arch/x86/kernel/ftrace_int3_stubs.S
new file mode 100644
index 000000000000..ef5f580450bb
--- /dev/null
+++ b/arch/x86/kernel/ftrace_int3_stubs.S
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019 SUSE Linux GmbH */
+
+#include <asm/asm.h>
+#include <asm/percpu.h>
+#include <asm/unwind_hints.h>
+#include <asm/asm-offsets.h>
+#include <linux/linkage.h>
+
+#ifdef CONFIG_X86_64
+#define WORD_SIZE 8
+#else
+#define WORD_SIZE 4
+#endif
+
+.macro ftrace_int3_stub call_target
+	/*
+	 * We got here from ftrace_int3_handler() because a breakpoint
+	 * on a call insn currently being modified has been
+	 * hit. ftrace_int3_handler() can't emulate the function call
+	 * directly, because it's running at a different position on
+	 * the stack, obviously. Hence it sets the regs->ip to this
+	 * stub so that we end up here upon the iret from the int3
+	 * handler. The stack is now in its original state and we can
+	 * emulate the function call insn by pushing the return
+	 * address onto the stack and jumping to the call target. The
+	 * desired return address has been put onto the ftrace_int3_stack
+	 * kept within struct thread_info.
+	 */
+	UNWIND_HINT_EMPTY
+	/* Reserve room for the emulated call's return address. */
+	sub	$WORD_SIZE, %_ASM_SP
+	/*
+	 * Pop the return address from ftrace_int3_ip_stack and write
+	 * it to the location just reserved. Be careful to retrieve
+	 * the address before decrementing ->depth in order to protect
+	 * against nested contexts clobbering it.
+	 */
+	push	%_ASM_AX
+	push	%_ASM_CX
+	push	%_ASM_DX
+	mov	PER_CPU_VAR(current_task), %_ASM_AX
+	mov	TASK_TI_ftrace_int3_depth(%_ASM_AX), %_ASM_CX
+	dec	%_ASM_CX
+	mov	TASK_TI_ftrace_int3_slots(%_ASM_AX, %_ASM_CX, WORD_SIZE), %_ASM_DX
+	mov	%_ASM_CX, TASK_TI_ftrace_int3_depth(%_ASM_AX)
+	mov	%_ASM_DX, 3*WORD_SIZE(%_ASM_SP)
+	pop	%_ASM_DX
+	pop	%_ASM_CX
+	pop	%_ASM_AX
+	/* Finally, transfer control to the target function. */
+	jmp	\call_target
+.endm
+
+ENTRY(ftrace_int3_stub_regs_caller)
+	ftrace_int3_stub ftrace_regs_caller
+END(ftrace_int3_stub_regs_caller)
+
+ENTRY(ftrace_int3_stub_list_func)
+	ftrace_int3_stub ftrace_ops_list_func
+END(ftrace_int3_stub_list_func)
-- 
2.13.7
