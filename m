From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 2 May 2019 18:52:25 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
Message-ID: <20190502185225.0cdfc8bc@gandalf.local.home>

On Thu, 2 May 2019 22:21:46 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> On Thu, May 02, 2019 at 11:43:37AM -0700, Linus Torvalds wrote:
> > What would it look like with the "int3-from-kernel is special" modification?  
> 
> Something like so; it boots; but I could've made some horrible mistake
> (again).
> 
> ---
> diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
> index 7b23431be5cb..4de51cff5b8a 100644
> --- a/arch/x86/entry/entry_32.S
> +++ b/arch/x86/entry/entry_32.S

Oh, and so close!

I was running this on my i386 tests and for test 8 of 9 (passed 1-7) I
hit this:

Testing all events: OK
Testing ftrace filter: OK
trace_kprobe: Testing kprobe tracing: 
BUG: unable to handle kernel paging request at 10ec839c
#PF error: [INSTR]
*pdpt = 0000000000000000 *pde = 0000000000000000 
Oops: 0010 [#1] SMP PTI
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.1.0-rc3-test+ #1
Hardware name: MSI MS-7823/CSM-H87M-G43 (MS-7823), BIOS V1.6 02/22/2014
EIP: 0x10ec839c
Code: Bad RIP value.
EAX: 54e24bbc EBX: 00000000 ECX: 00000003 EDX: 00000002
ESI: ebcae400 EDI: c1513a88 EBP: ee641f30 ESP: c0439a07
DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210202
CR0: 80050033 CR2: 10ec8392 CR3: 0167e000 CR4: 001406f0
Call Trace:
Modules linked in:
CR2: 0000000010ec839c
---[ end trace 8aa996061578b437 ]---
EIP: 0x10ec839c
Code: Bad RIP value.
EAX: 54e24bbc EBX: 00000000 ECX: 00000003 EDX: 00000002
ESI: ebcae400 EDI: c1513a88 EBP: ee641f30 ESP: c16834bc
DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210202
CR0: 80050033 CR2: 10ec8392 CR3: 0167e000 CR4: 001406f0
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
Kernel Offset: disabled
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009 ]---
------------[ cut here ]------------
sched: Unexpected reschedule of offline CPU#3!
WARNING: CPU: 1 PID: 1 at arch/x86/kernel/smp.c:128 native_smp_send_reschedule+0x1c/0x37
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Tainted: G      D           5.1.0-rc3-test+ #1
Hardware name: MSI MS-7823/CSM-H87M-G43 (MS-7823), BIOS V1.6 02/22/2014
EIP: native_smp_send_reschedule+0x1c/0x37
Code: 4a 18 ba fb 00 00 00 e8 71 d6 9c 00 5d c3 55 89 e5 e8 37 6f 00 00 0f a3 05 e0 20 44 c1 72 11 50 68 d2 75 15 c1 e8 c7 a4 01 00 <0f> 0b 58 5a eb 13 8b 15 c0 36 28 c1 8b 4a 18 ba fd 00 00 00 e8 3a
EAX: 0000002e EBX: 00000003 ECX: c049977e EDX: ee638000
ESI: 00000003 EDI: 00000003 EBP: ee641e04 ESP: ee641dfc
DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210092
CR0: 80050033 CR2: 10ec8392 CR3: 0167e000 CR4: 001406f0
Call Trace:
 kick_ilb+0x77/0x7c
 trigger_load_balance+0x279/0x280
 ? __pick_first_entity+0x18/0x18
 scheduler_tick+0x90/0xa9
 ? __pick_first_entity+0x18/0x18
 update_process_times+0x3f/0x4a
 tick_sched_handle+0x4c/0x5a
 tick_sched_timer+0x3b/0x79
 ? tick_sched_do_timer+0x44/0x44
 __hrtimer_run_queues+0x180/0x26a
 ? tick_sched_do_timer+0x44/0x44
 hrtimer_interrupt+0xa6/0x18e
 ? rcu_irq_enter+0x60/0x7e
 smp_apic_timer_interrupt+0xdf/0x179
 apic_timer_interrupt+0xda/0xe0
EIP: panic+0x208/0x24a
Code: 83 c3 64 eb ad 83 3d a8 d1 68 c1 00 74 05 e8 01 bf 01 00 68 e0 d1 68 c1 68 cc e6 15 c1 e8 bd e7 04 00 e8 02 ff 0a 00 fb 31 db <58> 5a e8 c5 a9 09 00 39 fb 7c 18 83 f6 01 8b 15 a0 d1 68 c1 89 f0
EAX: c044c764 EBX: 00000000 ECX: c049977e EDX: 318e4000
ESI: 00000000 EDI: 00000000 EBP: ee641f6c ESP: ee641f54
DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00200246
 ? console_unlock+0x466/0x4b8
 ? panic+0x205/0x24a
 ? do_exit+0x4bd/0x8d1
 do_exit+0x4e3/0x8d1
 ? copy_oldmem_page+0x63/0x9b
 rewind_stack_do_exit+0x11/0x13
irq event stamp: 1400780
hardirqs last  enabled at (1400779): [<c0401568>] trace_hardirqs_on_thunk+0xc/0x10
hardirqs last disabled at (1400780): [<c0401578>] trace_hardirqs_off_thunk+0xc/0x10
softirqs last  enabled at (1400760): [<c0dfefb2>] __do_softirq+0x2a2/0x2d2
softirqs last disabled at (1400753): [<c0416fb7>] call_on_stack+0x45/0x4b
---[ end trace 8aa996061578b438 ]---
------------[ cut here ]------------

That's one of the startup tests that happens on boot up.

Config attached.

Good news is, it appears very reproducible.

-- Steve

Here's the patch I applied (both folded together):

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index d309f30cf7af..2885acd691ac 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -67,9 +67,20 @@
 # define preempt_stop(clobbers)	DISABLE_INTERRUPTS(clobbers); TRACE_IRQS_OFF
 #else
 # define preempt_stop(clobbers)
-# define resume_kernel		restore_all_kernel
 #endif
 
+.macro RETINT_PREEMPT
+#ifdef CONFIG_PREEMPT
+	DISABLE_INTERRUPTS(CLBR_ANY)
+	cmpl	$0, PER_CPU_VAR(__preempt_count)
+	jnz	.Lend_\@
+	testl	$X86_EFLAGS_IF, PT_EFLAGS(%esp)	# interrupts off (exception path) ?
+	jz	.Lend_\@
+	call	preempt_schedule_irq
+.Lend_\@:
+#endif
+.endm
+
 .macro TRACE_IRQS_IRET
 #ifdef CONFIG_TRACE_IRQFLAGS
 	testl	$X86_EFLAGS_IF, PT_EFLAGS(%esp)     # interrupts off?
@@ -753,7 +764,7 @@ ret_from_intr:
 	andl	$SEGMENT_RPL_MASK, %eax
 #endif
 	cmpl	$USER_RPL, %eax
-	jb	resume_kernel			# not returning to v8086 or userspace
+	jb	restore_all_kernel		# not returning to v8086 or userspace
 
 ENTRY(resume_userspace)
 	DISABLE_INTERRUPTS(CLBR_ANY)
@@ -763,19 +774,6 @@ ENTRY(resume_userspace)
 	jmp	restore_all
 END(ret_from_exception)
 
-#ifdef CONFIG_PREEMPT
-ENTRY(resume_kernel)
-	DISABLE_INTERRUPTS(CLBR_ANY)
-.Lneed_resched:
-	cmpl	$0, PER_CPU_VAR(__preempt_count)
-	jnz	restore_all_kernel
-	testl	$X86_EFLAGS_IF, PT_EFLAGS(%esp)	# interrupts off (exception path) ?
-	jz	restore_all_kernel
-	call	preempt_schedule_irq
-	jmp	.Lneed_resched
-END(resume_kernel)
-#endif
-
 GLOBAL(__begin_SYSENTER_singlestep_region)
 /*
  * All code from here through __end_SYSENTER_singlestep_region is subject
@@ -1026,6 +1024,7 @@ restore_all:
 	INTERRUPT_RETURN
 
 restore_all_kernel:
+	RETINT_PREEMPT
 	TRACE_IRQS_IRET
 	PARANOID_EXIT_TO_KERNEL_MODE
 	BUG_IF_WRONG_CR3
@@ -1476,6 +1475,94 @@ END(nmi)
 
 ENTRY(int3)
 	ASM_CLAC
+
+#ifdef CONFIG_VM86
+	testl	$X86_EFLAGS_VM, 8(%esp)
+	jnz	.Lfrom_usermode_no_gap
+#endif
+	testl	$SEGMENT_RPL_MASK, 4(%esp)
+	jnz	.Lfrom_usermode_no_gap
+
+	/*
+	 * Here from kernel mode; so the (exception) stack looks like:
+	 *
+	 * 12(esp) - <previous context>
+	 *  8(esp) - flags
+	 *  4(esp) - cs
+	 *  0(esp) - ip
+	 *
+	 * Lets build a 5 entry IRET frame after that, such that struct pt_regs
+	 * is complete and in particular regs->sp is correct. This gives us
+	 * the original 3 enties as gap:
+	 *
+	 * 32(esp) - <previous context>
+	 * 28(esp) - orig_flags / gap
+	 * 24(esp) - orig_cs	/ gap
+	 * 20(esp) - orig_ip	/ gap
+	 * 16(esp) - ss
+	 * 12(esp) - sp
+	 *  8(esp) - flags
+	 *  4(esp) - cs
+	 *  0(esp) - ip
+	 */
+	pushl	%ss	  # ss
+	pushl	%esp      # sp (points at ss)
+	pushl	4*4(%esp) # flags
+	pushl	4*4(%esp) # cs
+	pushl	4*4(%esp) # ip
+
+	add	$16, 12(%esp) # point sp back at the previous context
+
+	pushl	$-1				# orig_eax; mark as interrupt
+
+	SAVE_ALL
+	ENCODE_FRAME_POINTER
+	TRACE_IRQS_OFF
+	xorl	%edx, %edx			# zero error code
+	movl	%esp, %eax			# pt_regs pointer
+	call	do_int3
+
+	RETINT_PREEMPT
+	TRACE_IRQS_IRET
+	/*
+	 * If we really never INT3 from entry code, it looks like
+	 * we can skip this one.
+	PARANOID_EXIT_TO_KERNEL_MODE
+	 */
+	BUG_IF_WRONG_CR3
+	RESTORE_REGS 4				# consume orig_eax
+
+	/*
+	 * Reconstruct the 3 entry IRET frame right after the (modified)
+	 * regs->sp without lowering %esp in between, such that an NMI in the
+	 * middle doesn't scribble our stack.
+	 */
+
+	pushl	%eax
+	pushl	%ecx
+	movl	5*4(%esp), %eax		# (modified) regs->sp
+
+	movl	4*4(%esp), %ecx		# flags
+	movl	%ecx, -4(%eax)
+
+	movl	3*4(%esp), %ecx		# cs
+	andl	$0x0000ffff, %ecx
+	movl	%ecx, -8(%eax)
+
+	movl	2*4(%esp), %ecx		# ip
+	movl	%ecx, -12(%eax)
+
+	movl	1*4(%esp), %ecx		# eax
+	movl	%ecx, -16(%eax)
+
+	popl	%ecx
+	lea	-16(%eax), %esp
+	popl	%eax
+
+	jmp	.Lirq_return
+
+.Lfrom_usermode_no_gap:
+
 	pushl	$-1				# mark this as an int
 
 	SAVE_ALL switch_stacks=1
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 1f0efdb7b629..834ec1397dab 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -879,7 +879,7 @@ apicinterrupt IRQ_WORK_VECTOR			irq_work_interrupt		smp_irq_work_interrupt
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
diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index e85ff65c43c3..ba275b6292db 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -39,4 +39,24 @@ extern int poke_int3_handler(struct pt_regs *regs);
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
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index ef49517f6bb2..fd152f5a937b 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -29,6 +29,7 @@
 #include <asm/kprobes.h>
 #include <asm/ftrace.h>
 #include <asm/nops.h>
+#include <asm/text-patching.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
@@ -231,6 +232,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 }
 
 static unsigned long ftrace_update_func;
+static unsigned long ftrace_update_func_call;
 
 static int update_ftrace_func(unsigned long ip, void *new)
 {
@@ -259,6 +261,8 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	unsigned char *new;
 	int ret;
 
+	ftrace_update_func_call = (unsigned long)func;
+
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	ret = update_ftrace_func(ip, new);
 
@@ -294,13 +298,21 @@ int ftrace_int3_handler(struct pt_regs *regs)
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
 
@@ -859,6 +871,8 @@ void arch_ftrace_update_trampoline(struct ftrace_ops *ops)
 
 	func = ftrace_ops_get_func(ops);
 
+	ftrace_update_func_call = (unsigned long)func;
+
 	/* Do a safe modify in case the trampoline is executing */
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	ret = update_ftrace_func(ip, new);
@@ -960,6 +974,7 @@ static int ftrace_mod_jmp(unsigned long ip, void *func)
 {
 	unsigned char *new;
 
+	ftrace_update_func_call = 0UL;
 	new = ftrace_jmp_replace(ip, (unsigned long)func);
 
 	return update_ftrace_func(ip, new);


-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.xz
Type: application/x-xz
Size: 27036 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190502/ea1d42f4/attachment-0001.bin>
