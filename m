From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 11 Jul 2018 10:46:18 -0400
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711142744.GN3593@linux.vnet.ibm.com>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711124954.GE2476@hirez.programming.kicks-ass.net>
 <20180711090003.42596c2b@gandalf.local.home>
 <20180711142744.GN3593@linux.vnet.ibm.com>
Message-ID: <20180711104618.05dc4b46@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180711144618.3UU82oPSaSCr2GSf70yPx4x-dA4llBAdYlKJ_Un8Z_o@z>

On Wed, 11 Jul 2018 07:27:44 -0700
"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:

> On Wed, Jul 11, 2018@09:00:03AM -0400, Steven Rostedt wrote:
> > On Wed, 11 Jul 2018 14:49:54 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >   
> > > On Thu, Jun 28, 2018 at 11:21:46AM -0700, Joel Fernandes wrote:  
> > > > -		it_func_ptr = rcu_dereference_sched((tp)->funcs);	\    
> > > 
> > > I would convert to rcu_dereference_raw() to appease sparse. The fancy
> > > stuff below is pointless if you then turn off all checking.  
> > 
> > The problem with doing this is if we use a trace event without the
> > proper _idle() or whatever, we wont get a warning that it is used
> > incorrectly with lockdep. Or does lockdep still check if "rcu is
> > watching" with rcu_dereference_raw()?  
> 
> No lockdep checking is done by rcu_dereference_raw().

Correct, but I think we can do this regardless. So Joel please resend
with Peter's suggestion.

The reason being is because of this:


#define __DECLARE_TRACE(name, proto, args, cond, data_proto, data_args) \
	extern struct tracepoint __tracepoint_##name;			\
	static inline void trace_##name(proto)				\
	{								\
		if (static_key_false(&__tracepoint_##name.key))		\
			__DO_TRACE(&__tracepoint_##name,		\
				TP_PROTO(data_proto),			\
				TP_ARGS(data_args),			\
				TP_CONDITION(cond), 0);			\
		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
			rcu_read_lock_sched_notrace();			\
			rcu_dereference_sched(__tracepoint_##name.funcs);\
			rcu_read_unlock_sched_notrace();		\
		}							\
	}

Because lockdep would only trigger warnings when the tracepoint was
enabled and used in a place it shouldn't be, we added the above
IS_ENABLED(CONFIG_LOCKDEP) part to test regardless if the the
tracepoint was enabled or not. Because we do this, we don't need to
have the test in the __DO_TRACE() code itself. That means we can clean
up the code as per Peter's suggestion.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
