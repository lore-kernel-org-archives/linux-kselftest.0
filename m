From: rostedt at goodmis.org (Steven Rostedt)
Date: Wed, 11 Jul 2018 09:19:44 -0400
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180711131256.GH2476@hirez.programming.kicks-ass.net>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
 <20180711131256.GH2476@hirez.programming.kicks-ass.net>
Message-ID: <20180711091944.4d8e78ef@gandalf.local.home>

On Wed, 11 Jul 2018 15:12:56 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> On Thu, Jun 28, 2018 at 11:21:47AM -0700, Joel Fernandes wrote:
> > One note, I have to check for lockdep recursion in the code that calls
> > the trace events API and bail out if we're in lockdep recursion  
> 
> I'm not seeing any new lockdep_recursion checks...

I believe he's talking about this part:

+void trace_hardirqs_on(void)
+{
+	if (lockdep_recursing(current) || !this_cpu_read(tracing_irq_cpu))
+		return;
+

[etc]

> 
> > protection to prevent something like the following case: a spin_lock is
> > taken. Then lockdep_acquired is called.  That does a raw_local_irq_save
> > and then sets lockdep_recursion, and then calls __lockdep_acquired. In
> > this function, a call to get_lock_stats happens which calls
> > preempt_disable, which calls trace IRQS off somewhere which enters my
> > tracepoint code and sets the tracing_irq_cpu flag to prevent recursion.
> > This flag is then never cleared causing lockdep paths to never be
> > entered and thus causing splats and other bad things.  
> 
> Would it not be much easier to avoid that entirely, afaict all
> get/put_lock_stats() callers already have IRQs disabled, so that
> (traced) preempt fiddling is entirely superfluous.

Agreed. Looks like a good clean up.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
