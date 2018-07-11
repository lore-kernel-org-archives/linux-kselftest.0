From: paulmck at linux.vnet.ibm.com (Paul E. McKenney)
Date: Wed, 11 Jul 2018 07:27:44 -0700
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711090003.42596c2b@gandalf.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711124954.GE2476@hirez.programming.kicks-ass.net>
 <20180711090003.42596c2b@gandalf.local.home>
Message-ID: <20180711142744.GN3593@linux.vnet.ibm.com>

On Wed, Jul 11, 2018 at 09:00:03AM -0400, Steven Rostedt wrote:
> On Wed, 11 Jul 2018 14:49:54 +0200
> Peter Zijlstra <peterz at infradead.org> wrote:
> 
> > On Thu, Jun 28, 2018 at 11:21:46AM -0700, Joel Fernandes wrote:
> > > -		it_func_ptr = rcu_dereference_sched((tp)->funcs);	\  
> > 
> > I would convert to rcu_dereference_raw() to appease sparse. The fancy
> > stuff below is pointless if you then turn off all checking.
> 
> The problem with doing this is if we use a trace event without the
> proper _idle() or whatever, we wont get a warning that it is used
> incorrectly with lockdep. Or does lockdep still check if "rcu is
> watching" with rcu_dereference_raw()?

No lockdep checking is done by rcu_dereference_raw().

							Thanx, Paul

> -- Steve
> 
> > 
> > > +									\
> > > +		/*							\
> > > +		 * For rcuidle callers, use srcu since sched-rcu	\
> > > +		 * doesn't work from the idle path.			\
> > > +		 */							\
> > > +		if (rcuidle) {						\
> > > +			if (in_nmi()) {					\
> > > +				WARN_ON_ONCE(1);			\
> > > +				return; /* no srcu from nmi */		\
> > > +			}						\
> > > +									\
> > > +			idx = srcu_read_lock_notrace(&tracepoint_srcu);	\
> > > +			it_func_ptr =					\
> > > +				srcu_dereference_notrace((tp)->funcs,	\
> > > +						&tracepoint_srcu);	\
> > > +			/* To keep it consistent with !rcuidle path */	\
> > > +			preempt_disable_notrace();			\
> > > +		} else {						\
> > > +			rcu_read_lock_sched_notrace();			\
> > > +			it_func_ptr =					\
> > > +				rcu_dereference_sched((tp)->funcs);	\
> > > +		}							\  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
