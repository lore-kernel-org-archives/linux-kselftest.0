From: nstange@suse.de (Nicolai Stange)
Date: Sat, 27 Apr 2019 12:06:36 +0200
Subject: [PATCH 1/4] x86/thread_info: introduce ->ftrace_int3_stack member
In-Reply-To: <20190427100639.15074-1-nstange@suse.de>
References: <20190427100639.15074-1-nstange@suse.de>
Message-ID: <20190427100639.15074-2-nstange@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190427100636.BhmxbjEa84btDFA8-IXIqAEI3BpRB-NOqQk1uwK2L_k@z>

Before actually rewriting an insn, x86' DYNAMIC_FTRACE  implementation
places an int3 breakpoint on it. Currently, ftrace_int3_handler() simply
treats the insn in question as nop and advances %rip past it. An upcoming
patch will improve this by making the int3 trap handler emulate the call
insn. To this end, ftrace_int3_handler() will be made to change its iret
frame's ->ip to some stub which will then mimic the function call in the
original context.

Somehow the trapping ->ip address will have to get communicated from
ftrace_int3_handler() to these stubs though. Note that at any given point
in time, there can be at most four such call insn emulations pending:
namely at most one per "process", "irq", "softirq" and "nmi" context.

Introduce struct ftrace_int3_stack providing four entries for storing
the instruction pointer.

In principle, it could be made per-cpu, but this would require making
ftrace_int3_handler() to return with preemption disabled and to enable it
from those emulation stubs again only after the stack's top entry has been
consumed. I've been told that this would "break a lot of norms" and that
making this stack part of struct thread_info instead would be less fragile.
Follow this advice and add a struct ftrace_int3_stack instance to x86's
struct thread_info. Note that these stacks will get only rarely accessed
(only during ftrace's code modifications) and thus, cache line dirtying
won't have any significant impact on the neighbouring fields.

Initialization will take place implicitly through INIT_THREAD_INFO as per
the rules for missing elements in initializers. The memcpy() in
arch_dup_task_struct() will propagate the initial state properly, because
it's always run in process context and won't ever see a non-zero ->depth
value.

Finally, add the necessary bits to asm-offsets for making struct
ftrace_int3_stack accessible from assembly.

Suggested-by: Steven Rostedt <rostedt at goodmis.org>
Signed-off-by: Nicolai Stange <nstange at suse.de>
---
 arch/x86/include/asm/thread_info.h | 11 +++++++++++
 arch/x86/kernel/asm-offsets.c      |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index e0eccbcb8447..83434a88cfbb 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -56,6 +56,17 @@ struct task_struct;
 struct thread_info {
 	unsigned long		flags;		/* low level flags */
 	u32			status;		/* thread synchronous flags */
+#ifdef CONFIG_DYNAMIC_FTRACE
+	struct ftrace_int3_stack {
+		int depth;
+		/*
+		 * There can be at most one slot in use per context,
+		 * i.e. at most one for "normal", "irq", "softirq" and
+		 * "nmi" each.
+		 */
+		unsigned long slots[4];
+	} ftrace_int3_stack;
+#endif
 };
 
 #define INIT_THREAD_INFO(tsk)			\
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 168543d077d7..ca6ee24a0c6e 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -105,4 +105,12 @@ static void __used common(void)
 	OFFSET(TSS_sp0, tss_struct, x86_tss.sp0);
 	OFFSET(TSS_sp1, tss_struct, x86_tss.sp1);
 	OFFSET(TSS_sp2, tss_struct, x86_tss.sp2);
+
+#ifdef CONFIG_DYNAMIC_FTRACE
+	BLANK();
+	OFFSET(TASK_TI_ftrace_int3_depth, task_struct,
+	       thread_info.ftrace_int3_stack.depth);
+	OFFSET(TASK_TI_ftrace_int3_slots, task_struct,
+	       thread_info.ftrace_int3_stack.slots);
+#endif
 }
-- 
2.13.7
