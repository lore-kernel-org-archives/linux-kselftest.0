From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 11 Jul 2018 19:32:37 -0700
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711125322.GF2476@hirez.programming.kicks-ass.net>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711125322.GF2476@hirez.programming.kicks-ass.net>
Message-ID: <20180712023237.GA122777@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712023237.RA4op6GHJ3O_O7CL5lmJDsqP0sGbiIre6P23HrTq3Bw@z>

On Wed, Jul 11, 2018@02:53:22PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 28, 2018@11:21:46AM -0700, Joel Fernandes wrote:
> > -		rcu_read_lock_sched_notrace();				\
> > -		it_func_ptr = rcu_dereference_sched((tp)->funcs);	\
> > +									\
> > +		/*							\
> > +		 * For rcuidle callers, use srcu since sched-rcu	\
> > +		 * doesn't work from the idle path.			\
> > +		 */							\
> > +		if (rcuidle) {						\
> > +			if (in_nmi()) {					\
> > +				WARN_ON_ONCE(1);			\
> > +				return; /* no srcu from nmi */		\
> > +			}						\
> > +									\
> > +			idx = srcu_read_lock_notrace(&tracepoint_srcu);	\
> > +			it_func_ptr =					\
> > +				srcu_dereference_notrace((tp)->funcs,	\
> > +						&tracepoint_srcu);	\
> > +			/* To keep it consistent with !rcuidle path */	\
> > +			preempt_disable_notrace();			\
> > +		} else {						\
> > +			rcu_read_lock_sched_notrace();			\
> > +			it_func_ptr =					\
> > +				rcu_dereference_sched((tp)->funcs);	\
> > +		}							\
> > +									\
> >  		if (it_func_ptr) {					\
> >  			do {						\
> >  				it_func = (it_func_ptr)->func;		\
> > @@ -148,9 +177,13 @@ extern void syscall_unregfunc(void);
> >  				((void(*)(proto))(it_func))(args);	\
> >  			} while ((++it_func_ptr)->func);		\
> >  		}							\
> > -		rcu_read_unlock_sched_notrace();			\
> > -		if (rcucheck)						\
> > -			rcu_irq_exit_irqson();				\
> > +									\
> > +		if (rcuidle) {						\
> > +			preempt_enable_notrace();			\
> > +			srcu_read_unlock_notrace(&tracepoint_srcu, idx);\
> > +		} else {						\
> > +			rcu_read_unlock_sched_notrace();		\
> > +		}							\
> >  	} while (0)
> 
> In fact, I would write the thing like:
> 
> 		preempt_disable_notrace();
> 		if (rcuidle)
> 			idx = srcu_read_lock_notrace(&tracepoint_srcu);
> 
> 		it_func_ptr = rcu_dereference_raw((tp)->funcs);
> 
> 		/* ... */
> 
> 		if (rcu_idle)
> 			srcu_read_unlock_notrace(&tracepoint_srcu, idx);
> 		preempt_enable_notrace();
> 
> Much simpler and very much the same.

Cool, thanks! I will do it this way and resend.

- Joel

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
