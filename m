From: peterz at infradead.org (Peter Zijlstra)
Date: Thu, 2 May 2019 22:21:46 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
Message-ID: <20190502202146.GZ2623@hirez.programming.kicks-ass.net>

On Thu, May 02, 2019 at 11:43:37AM -0700, Linus Torvalds wrote:
> What would it look like with the "int3-from-kernel is special" modification?

Something like so; it boots; but I could've made some horrible mistake
(again).

---
diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 7b23431be5cb..4de51cff5b8a 100644
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
@@ -755,7 +766,7 @@ END(ret_from_fork)
 	andl	$SEGMENT_RPL_MASK, %eax
 #endif
 	cmpl	$USER_RPL, %eax
-	jb	resume_kernel			# not returning to v8086 or userspace
+	jb	restore_all_kernel		# not returning to v8086 or userspace
 
 ENTRY(resume_userspace)
 	DISABLE_INTERRUPTS(CLBR_ANY)
@@ -765,18 +776,6 @@ ENTRY(resume_userspace)
 	jmp	restore_all
 END(ret_from_exception)
 
-#ifdef CONFIG_PREEMPT
-ENTRY(resume_kernel)
-	DISABLE_INTERRUPTS(CLBR_ANY)
-	cmpl	$0, PER_CPU_VAR(__preempt_count)
-	jnz	restore_all_kernel
-	testl	$X86_EFLAGS_IF, PT_EFLAGS(%esp)	# interrupts off (exception path) ?
-	jz	restore_all_kernel
-	call	preempt_schedule_irq
-	jmp	restore_all_kernel
-END(resume_kernel)
-#endif
-
 GLOBAL(__begin_SYSENTER_singlestep_region)
 /*
  * All code from here through __end_SYSENTER_singlestep_region is subject
@@ -1027,6 +1026,7 @@ ENTRY(entry_INT80_32)
 	INTERRUPT_RETURN
 
 restore_all_kernel:
+	RETINT_PREEMPT
 	TRACE_IRQS_IRET
 	PARANOID_EXIT_TO_KERNEL_MODE
 	BUG_IF_WRONG_CR3
@@ -1477,6 +1477,94 @@ END(nmi)
 
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
