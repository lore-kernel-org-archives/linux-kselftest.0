From: rostedt at goodmis.org (Steven Rostedt)
Date: Wed, 11 Jul 2018 21:26:26 -0400
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180712003100.GC32091@joelaf.mtv.corp.google.com>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711125647.GG2476@hirez.programming.kicks-ass.net>
 <20180711090649.68af40f9@gandalf.local.home>
 <20180712003100.GC32091@joelaf.mtv.corp.google.com>
Message-ID: <20180711212626.5992e2c8@vmware.local.home>

On Wed, 11 Jul 2018 17:31:00 -0700
Joel Fernandes <joel at joelfernandes.org> wrote:

> On Wed, Jul 11, 2018 at 09:06:49AM -0400, Steven Rostedt wrote:
> > On Wed, 11 Jul 2018 14:56:47 +0200
> > Peter Zijlstra <peterz at infradead.org> wrote:
> >   
> > > On Thu, Jun 28, 2018 at 11:21:46AM -0700, Joel Fernandes wrote:  
> > > >  static inline void tracepoint_synchronize_unregister(void)
> > > >  {
> > > > +	synchronize_srcu(&tracepoint_srcu);
> > > >  	synchronize_sched();
> > > >  }    
> > > 
> > > Given you below do call_rcu_sched() and then call_srcu(), isn't the
> > > above the wrong way around?  
> > 
> > Good catch!
> > 
> > 	release_probes()
> > 		call_rcu_sched()  
> > 			---> rcu_free_old_probes() queued  
> > 
> > 	tracepoint_synchronize_unregister()
> > 		synchronize_srcu(&tracepoint_srcu);
> > 			< finishes right away >
> > 		synchronize_sched()  
> > 			--> rcu_free_old_probes()
> > 				--> srcu_free_old_probes() queued  
> > 	
> > Here tracepoint_synchronize_unregister() returned before the srcu
> > portion ran.  
> 
> But isn't the point of synchronize_rcu to make sure that we're no longer in
> an RCU read-side section, not that *all* queued callbacks already ran? So in that
> case, I think it doesn't matter which order the 2 synchronize functions are
> called in. Please let me know if if I missed something!
> 
> I believe what we're trying to guarantee here is that no tracepoints using
> either flavor of RCU are active after tracepoint_synchronize_unregister
> returns.

Yes you are correct. If tracepoint_synchronize_unregister() is only to
make sure that there is no more trace events using the probes, then
this should work. I was focused on looking at it with release_probes()
too. So the patch is fine as is.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
