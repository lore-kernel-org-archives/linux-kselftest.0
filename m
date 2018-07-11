From: peterz at infradead.org (Peter Zijlstra)
Date: Wed, 11 Jul 2018 14:56:47 +0200
Subject: [PATCH v9 4/7] tracepoint: Make rcuidle tracepoint callers use
 SRCU
In-Reply-To: <20180628182149.226164-5-joel@joelfernandes.org>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-5-joel@joelfernandes.org>
Message-ID: <20180711125647.GG2476@hirez.programming.kicks-ass.net>

On Thu, Jun 28, 2018 at 11:21:46AM -0700, Joel Fernandes wrote:
>  static inline void tracepoint_synchronize_unregister(void)
>  {
> +	synchronize_srcu(&tracepoint_srcu);
>  	synchronize_sched();
>  }

Given you below do call_rcu_sched() and then call_srcu(), isn't the
above the wrong way around?

Also, does the above want to be barrier instead of synchronize, so as to
guarantee completion of the callbacks.

> +static void srcu_free_old_probes(struct rcu_head *head)
>  {
>  	kfree(container_of(head, struct tp_probes, rcu));
>  }
>  
> +static void rcu_free_old_probes(struct rcu_head *head)
> +{
> +	call_srcu(&tracepoint_srcu, head, srcu_free_old_probes);
> +}
> +
>  static inline void release_probes(struct tracepoint_func *old)
>  {
>  	if (old) {
>  		struct tp_probes *tp_probes = container_of(old,
>  			struct tp_probes, probes[0]);
> +		/*
> +		 * Tracepoint probes are protected by both sched RCU and SRCU,
> +		 * by calling the SRCU callback in the sched RCU callback we
> +		 * cover both cases. So let us chain the SRCU and sched RCU
> +		 * callbacks to wait for both grace periods.
> +		 */
>  		call_rcu_sched(&tp_probes->rcu, rcu_free_old_probes);
>  	}
>  }
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
