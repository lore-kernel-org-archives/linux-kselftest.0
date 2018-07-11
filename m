From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Wed, 11 Jul 2018 12:40:19 -0400 (EDT)
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180711151751.GI2476@hirez.programming.kicks-ass.net>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
 <20180711125647.GG2476@hirez.programming.kicks-ass.net>
 <20180711090649.68af40f9@gandalf.local.home>
 <20180711151751.GI2476@hirez.programming.kicks-ass.net>
Message-ID: <1447856878.4127.1531327219355.JavaMail.zimbra@efficios.com>

----- On Jul 11, 2018, at 11:17 AM, Peter Zijlstra peterz at infradead.org wrote:

> On Wed, Jul 11, 2018 at 09:06:49AM -0400, Steven Rostedt wrote:
>> On Wed, 11 Jul 2018 14:56:47 +0200
>> Peter Zijlstra <peterz at infradead.org> wrote:
>> 
>> > On Thu, Jun 28, 2018 at 11:21:46AM -0700, Joel Fernandes wrote:
>> > >  static inline void tracepoint_synchronize_unregister(void)
>> > >  {
>> > > +	synchronize_srcu(&tracepoint_srcu);
>> > >  	synchronize_sched();
>> > >  }
>> > 
>> > Given you below do call_rcu_sched() and then call_srcu(), isn't the
>> > above the wrong way around?
>> 
>> Good catch!
>> 
>> 	release_probes()
>> 		call_rcu_sched()
>> 			---> rcu_free_old_probes() queued
>> 
>> 	tracepoint_synchronize_unregister()
>> 		synchronize_srcu(&tracepoint_srcu);
>> 			< finishes right away >
>> 		synchronize_sched()
>> 			--> rcu_free_old_probes()
>> 				--> srcu_free_old_probes() queued
>> 	
>> Here tracepoint_synchronize_unregister() returned before the srcu
>> portion ran.
> 
> I just read the comment that goes with that function; the order doesn't
> matter. All we want to ensure is that the unregistration is visible to
> either sched or srcu tracepoint users.

Exactly, the order does not matter here.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
