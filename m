From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 12 Jul 2018 01:38:05 -0700
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180711091944.4d8e78ef@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
 <20180711131256.GH2476@hirez.programming.kicks-ass.net>
 <20180711091944.4d8e78ef@gandalf.local.home>
Message-ID: <20180712083805.GA67912@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712083805.2UkxkoyzywP3yByWVNCk3bxC0z-jHsuj8wF8958BB-Y@z>

On Wed, Jul 11, 2018@09:19:44AM -0400, Steven Rostedt wrote:
> > > protection to prevent something like the following case: a spin_lock is
> > > taken. Then lockdep_acquired is called.  That does a raw_local_irq_save
> > > and then sets lockdep_recursion, and then calls __lockdep_acquired. In
> > > this function, a call to get_lock_stats happens which calls
> > > preempt_disable, which calls trace IRQS off somewhere which enters my
> > > tracepoint code and sets the tracing_irq_cpu flag to prevent recursion.
> > > This flag is then never cleared causing lockdep paths to never be
> > > entered and thus causing splats and other bad things.  
> > 
> > Would it not be much easier to avoid that entirely, afaict all
> > get/put_lock_stats() callers already have IRQs disabled, so that
> > (traced) preempt fiddling is entirely superfluous.
> 
> Agreed. Looks like a good clean up.

So actually with or without the clean up, I don't see any issues with
dropping lockdep_recursing in my tests at the moment. I'm not sure something
else changed between then and now causing the issue to go away. I can include
Peter's clean up in my series though if he's Ok with it since you guys agree
its a good clean up anyway. Would you prefer I did that, and then also
dropped the lockdep_recursing checks? Or should I keep the
lockdep_recursing() checks just to be safe? Do you see cases where you want
irqsoff tracing while lockdep_recursing() is true?

thanks,

- Joel

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
