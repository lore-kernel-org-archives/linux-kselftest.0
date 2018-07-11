From: rostedt at goodmis.org (Steven Rostedt)
Date: Wed, 11 Jul 2018 09:22:34 -0400
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180711091944.4d8e78ef@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
 <20180711131256.GH2476@hirez.programming.kicks-ass.net>
 <20180711091944.4d8e78ef@gandalf.local.home>
Message-ID: <20180711092234.11d4e34f@gandalf.local.home>

On Wed, 11 Jul 2018 09:19:44 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Wed, 11 Jul 2018 15:12:56 +0200
> Peter Zijlstra <peterz at infradead.org> wrote:
> 
> > On Thu, Jun 28, 2018 at 11:21:47AM -0700, Joel Fernandes wrote:  
> > > One note, I have to check for lockdep recursion in the code that calls
> > > the trace events API and bail out if we're in lockdep recursion    
> > 
> > I'm not seeing any new lockdep_recursion checks...  
> 
> I believe he's talking about this part:
> 
> +void trace_hardirqs_on(void)
> +{
> +	if (lockdep_recursing(current) || !this_cpu_read(tracing_irq_cpu))
> +		return;
> +

And the reason he said this is new, IIUC, is because the old way we
could still do irqsoff tracing even if lockdep_recursion is set. Now,
irqsoff tracing is disable within lockdep_recursion.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
