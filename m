From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 08 May 2019 09:49:02 +0200
Subject: [PATCH 1/4] x86/entry/32: Clean up return from interrupt preemption
 path
References: <20190508074901.982470324@infradead.org>
Message-ID: <20190508080612.665396175@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508074902.c7qhh6beUs1Gmy1_3ZNTr-Khvo7KUnJ7USuy0KM-dq4@z>

The code flow around the return from interrupt preemption point seems
needlesly complicated.

There is only one site jumping to resume_kernel, and none (outside of
resume_kernel) jumping to restore_all_kernel. Inline resume_kernel
in restore_all_kernel and avoid the CONFIG_PREEMPT dependent label.

Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
---
 arch/x86/entry/entry_32.S |   24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -67,7 +67,6 @@
 # define preempt_stop(clobbers)	DISABLE_INTERRUPTS(clobbers); TRACE_IRQS_OFF
 #else
 # define preempt_stop(clobbers)
-# define resume_kernel		restore_all_kernel
 #endif
 
 .macro TRACE_IRQS_IRET
@@ -755,7 +754,7 @@ END(ret_from_fork)
 	andl	$SEGMENT_RPL_MASK, %eax
 #endif
 	cmpl	$USER_RPL, %eax
-	jb	resume_kernel			# not returning to v8086 or userspace
+	jb	restore_all_kernel		# not returning to v8086 or userspace
 
 ENTRY(resume_userspace)
 	DISABLE_INTERRUPTS(CLBR_ANY)
@@ -765,18 +764,6 @@ ENTRY(resume_userspace)
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
@@ -1027,6 +1014,15 @@ ENTRY(entry_INT80_32)
 	INTERRUPT_RETURN
 
 restore_all_kernel:
+#ifdef CONFIG_PREEMPT
+	DISABLE_INTERRUPTS(CLBR_ANY)
+	cmpl	$0, PER_CPU_VAR(__preempt_count)
+	jnz	.Lno_preempt
+	testl	$X86_EFLAGS_IF, PT_EFLAGS(%esp)	# interrupts off (exception path) ?
+	jz	.Lno_preempt
+	call	preempt_schedule_irq
+.Lno_preempt:
+#endif
 	TRACE_IRQS_IRET
 	PARANOID_EXIT_TO_KERNEL_MODE
 	BUG_IF_WRONG_CR3
