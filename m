From: rostedt at goodmis.org (Steven Rostedt)
Date: Wed, 11 Jul 2018 21:22:37 -0400
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711205639.GB32091@joelaf.mtv.corp.google.com>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711124954.GE2476@hirez.programming.kicks-ass.net>
 <20180711090003.42596c2b@gandalf.local.home>
 <20180711142744.GN3593@linux.vnet.ibm.com>
 <20180711104618.05dc4b46@gandalf.local.home>
 <20180711151559.GR3593@linux.vnet.ibm.com>
 <20180711205639.GB32091@joelaf.mtv.corp.google.com>
Message-ID: <20180711212237.3eff418f@vmware.local.home>

On Wed, 11 Jul 2018 13:56:39 -0700
Joel Fernandes <joel at joelfernandes.org> wrote:

> > > #define __DECLARE_TRACE(name, proto, args, cond, data_proto, data_args) \
> > > 	extern struct tracepoint __tracepoint_##name;			\
> > > 	static inline void trace_##name(proto)				\
> > > 	{								\
> > > 		if (static_key_false(&__tracepoint_##name.key))		\
> > > 			__DO_TRACE(&__tracepoint_##name,		\
> > > 				TP_PROTO(data_proto),			\
> > > 				TP_ARGS(data_args),			\
> > > 				TP_CONDITION(cond), 0);			\
> > > 		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
> > > 			rcu_read_lock_sched_notrace();			\
> > > 			rcu_dereference_sched(__tracepoint_##name.funcs);\
> > > 			rcu_read_unlock_sched_notrace();		\
> > > 		}							\
> > > 	}
> > > 
> > > Because lockdep would only trigger warnings when the tracepoint was
> > > enabled and used in a place it shouldn't be, we added the above
> > > IS_ENABLED(CONFIG_LOCKDEP) part to test regardless if the the
> > > tracepoint was enabled or not. Because we do this, we don't need to
> > > have the test in the __DO_TRACE() code itself. That means we can clean
> > > up the code as per Peter's suggestion.  
> > 
> > Indeed, the rcu_dereference_sched() would catch it in that case, so
> > agreed, Peter's suggestion isn't losing any debuggability.  
> 
> Hmm, but if we are doing the check later anyway, then why not do it in
> __DO_TRACE itself?

Because __DO_TRACE is only called if the trace event is enabled. If we
never enable a trace event, we never know if it has a potential of
doing it wrong. The second part is to trigger the warning immediately
regardless if the trace event is enabled or not.

> 
> Also I guess we are discussing about changing the rcu_dereference_sched which
> I think should go into a separate patch since my patch isn't touching how the
> rcuidle==0 paths use the RCU API. So I think this is an existing issue
> independent of this series.

But the code you added made it much more complex to keep the checks as
is. If we remove the checks then this patch doesn't need to have all
the if statements, and we can do it the way Peter suggested.

But sure, go ahead and make a separate patch first that removes the
checks from __DO_TRACE() first if you want to.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
