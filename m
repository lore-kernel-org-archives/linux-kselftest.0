From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 6 Nov 2018 17:15:01 -0500
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181104115913.74l4yzecisvtt2j5@yavin>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181103070253.ajrqzs5xu2vf5stu@yavin>
 <20181104115913.74l4yzecisvtt2j5@yavin>
Message-ID: <20181106171501.59ccabbc@gandalf.local.home>

On Sun, 4 Nov 2018 22:59:13 +1100
Aleksa Sarai <cyphar at cyphar.com> wrote:

> The same issue is present in __save_stack_trace
> (arch/x86/kernel/stacktrace.c). This is likely the only reason that --
> as Steven said -- stacktraces wouldn't work with ftrace-graph (and thus
> with the refactor both of you are discussing).

By the way, I was playing with the the orc unwinder and stack traces
from the function graph tracer return code, and got it working with the
below patch. Caution, that patch also has a stack trace hardcoded in
the return path of the function graph tracer, so you don't want to run
function graph tracing without filtering.

You can apply the patch and do:

 # cd /sys/kernel/debug/tracing
 # echo schedule > set_ftrace_filter
 # echo function_graph > current_tracer
 # cat trace

 3)               |  schedule() {
     rcu_preempt-10    [003] ....    91.160297: <stack trace>
 => ftrace_return_to_handler
 => return_to_handler
 => schedule_timeout
 => rcu_gp_kthread
 => kthread
 => ret_from_fork
 3) # 4009.085 us |  }
 3)               |  schedule() {
     kworker/1:0-17    [001] ....    91.163288: <stack trace>
 => ftrace_return_to_handler
 => return_to_handler
 => worker_thread
 => kthread
 => ret_from_fork
 1) # 7000.070 us |  }
 1)               |  schedule() {
     rcu_preempt-10    [003] ....    91.164311: <stack trace>
 => ftrace_return_to_handler
 => return_to_handler
 => schedule_timeout
 => rcu_gp_kthread
 => kthread
 => ret_from_fork
 3) # 4006.540 us |  }


Where just adding the stack trace without the other code, these traces
ended at "return_to_handler".

This patch is not for inclusion, it was just a test to see how to make
this work.

-- Steve

diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 91b2cff4b79a..4bcd646ae1f4 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -320,13 +320,15 @@ ENTRY(ftrace_graph_caller)
 ENDPROC(ftrace_graph_caller)
 
 ENTRY(return_to_handler)
-	UNWIND_HINT_EMPTY
-	subq  $24, %rsp
+	subq $8, %rsp
+	UNWIND_HINT_FUNC
+	subq  $16, %rsp
 
 	/* Save the return values */
 	movq %rax, (%rsp)
 	movq %rdx, 8(%rsp)
 	movq %rbp, %rdi
+	leaq 16(%rsp), %rsi
 
 	call ftrace_return_to_handler
 
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 169b3c44ee97..aaeca73218cc 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -242,13 +242,16 @@ ftrace_pop_return_trace(struct ftrace_graph_ret *trace, unsigned long *ret,
 	trace->calltime = current->ret_stack[index].calltime;
 	trace->overrun = atomic_read(&current->trace_overrun);
 	trace->depth = index;
+
+	trace_dump_stack(0);
 }
 
 /*
  * Send the trace to the ring-buffer.
  * @return the original return address.
  */
-unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
+unsigned long ftrace_return_to_handler(unsigned long frame_pointer,
+	unsigned long *ptr)
 {
 	struct ftrace_graph_ret trace;
 	unsigned long ret;
@@ -257,6 +260,8 @@ unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
 	trace.rettime = trace_clock_local();
 	barrier();
 	current->curr_ret_stack--;
+	*ptr = ret;
+
 	/*
 	 * The curr_ret_stack can be less than -1 only if it was
 	 * filtered out and it's about to return from the function.
