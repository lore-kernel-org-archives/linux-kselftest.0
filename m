From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 11 Jul 2018 21:28:25 -0700
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711232120.5dbfa1c7@vmware.local.home>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711124954.GE2476@hirez.programming.kicks-ass.net>
 <20180711090003.42596c2b@gandalf.local.home>
 <20180711142744.GN3593@linux.vnet.ibm.com>
 <20180711104618.05dc4b46@gandalf.local.home>
 <20180711205249.GA32091@joelaf.mtv.corp.google.com>
 <20180711232120.5dbfa1c7@vmware.local.home>
Message-ID: <20180712042825.GA154647@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712042825.9PjreeqPNS7Mv0nGMDS93PKzgY4vgHfj9VI1SRhbEas@z>

On Wed, Jul 11, 2018@11:21:20PM -0400, Steven Rostedt wrote:
> On Wed, 11 Jul 2018 13:52:49 -0700
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
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
> > Sounds good, I'm Ok with making this change.
> > 
> > Just to clarify, are you proposing to change the rcu_dereference_sched to
> > rcu_dereference_raw in both __DECLARE_TRACE and __DO_TRACE?
> 
> No, just in __DO_TRACE(). The rcu_dereference_sched() above in
> __DECLARE_TRACE() in the if (IS_ENABLED(CONFIG_LOCKDEP) block is
> required to show the warnings if trace_##name() is used wrong, and is
> the reason we can use rcu_dereference_raw() in __DO_TRACE() in the
> first place ;-)
> 
> This brings up another point. We should probably add to
> __DECLARE_TRACE_RCU() this:
> 
> #ifndef MODULE
> #define __DECLARE_TRACE_RCU(name, proto, args, cond, data_proto, data_args) \
> 	static inline void trace_##name##_rcuidle(proto)		\
> 	{								\
> 		if (static_key_false(&__tracepoint_##name.key))		\
> 			__DO_TRACE(&__tracepoint_##name,		\
> 				TP_PROTO(data_proto),			\
> 				TP_ARGS(data_args),			\
> 				TP_CONDITION(cond), 1);			\
> +		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
> +			int idx;					\
> +			idx = srcu_read_lock_notrace(&tracepoint_srcu); \
> +			srcu_dereference_notrace(__tracepoint_##name.funcs, \
> +						&tracepoint_srcu);	\
> +			srcu_read_unlock_notrace(&tracepoint_srcu, idx); \
> +		}							\
> 	}
> #else
> 
> 
> So that lockdep works with trace_##name##__rcuidle() when the trace
> event is not enabled.
> 
> But that should be a separate patch and not part of this series. I may
> write that up tomorrow.

Yes, that sounds good to me and would be good to add the safe guard there.
But you meant srcu_dereference above, not srcu_dereference_notrace right?

Meanwhile I'll drop that lockdep_recursion tomorrow and run some tests and
see how it behaves with Peter's changes.

thanks!

- Joel

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
