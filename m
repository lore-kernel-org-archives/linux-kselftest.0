From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 11 Jul 2018 17:44:11 -0700
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180711131256.GH2476@hirez.programming.kicks-ass.net>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
 <20180711131256.GH2476@hirez.programming.kicks-ass.net>
Message-ID: <20180712004411.GD32091@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180712004411.2pd75UcMPRZg1vXfS5qP75n3DSL77J_xMH_iMBsvG2Y@z>

On Wed, Jul 11, 2018@03:12:56PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 28, 2018@11:21:47AM -0700, Joel Fernandes wrote:
> > One note, I have to check for lockdep recursion in the code that calls
> > the trace events API and bail out if we're in lockdep recursion
> 
> I'm not seeing any new lockdep_recursion checks...

I meant its this part:

void trace_hardirqs_on(void)
{
	if (lockdep_recursing(current) || !this_cpu_read(tracing_irq_cpu))
		return;

> > protection to prevent something like the following case: a spin_lock is
> > taken. Then lockdep_acquired is called.  That does a raw_local_irq_save
> > and then sets lockdep_recursion, and then calls __lockdep_acquired. In
> > this function, a call to get_lock_stats happens which calls
> > preempt_disable, which calls trace IRQS off somewhere which enters my
> > tracepoint code and sets the tracing_irq_cpu flag to prevent recursion.
> > This flag is then never cleared causing lockdep paths to never be
> > entered and thus causing splats and other bad things.
> 
> Would it not be much easier to avoid that entirely, afaict all
> get/put_lock_stats() callers already have IRQs disabled, so that
> (traced) preempt fiddling is entirely superfluous.

Let me try to apply Peter's diff and see if I still don't need lockdep
recursion checking. I believe it is still harmless to still check for lockdep
recursion just to be safe. But I'll give it a try and let you know how it
goes.

thanks!

- Joel


> ---
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 5fa4d3138bf1..8f5ce0048d15 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -248,12 +248,7 @@ void clear_lock_stats(struct lock_class *class)
>  
>  static struct lock_class_stats *get_lock_stats(struct lock_class *class)
>  {
> -	return &get_cpu_var(cpu_lock_stats)[class - lock_classes];
> -}
> -
> -static void put_lock_stats(struct lock_class_stats *stats)
> -{
> -	put_cpu_var(cpu_lock_stats);
> +	return &this_cpu_ptr(&cpu_lock_stats)[class - lock_classes];
>  }
>  
>  static void lock_release_holdtime(struct held_lock *hlock)
> @@ -271,7 +266,6 @@ static void lock_release_holdtime(struct held_lock *hlock)
>  		lock_time_inc(&stats->read_holdtime, holdtime);
>  	else
>  		lock_time_inc(&stats->write_holdtime, holdtime);
> -	put_lock_stats(stats);
>  }
>  #else
>  static inline void lock_release_holdtime(struct held_lock *hlock)
> @@ -4090,7 +4084,6 @@ __lock_contended(struct lockdep_map *lock, unsigned long ip)
>  		stats->contending_point[contending_point]++;
>  	if (lock->cpu != smp_processor_id())
>  		stats->bounces[bounce_contended + !!hlock->read]++;
> -	put_lock_stats(stats);
>  }
>  
>  static void
> @@ -4138,7 +4131,6 @@ __lock_acquired(struct lockdep_map *lock, unsigned long ip)
>  	}
>  	if (lock->cpu != cpu)
>  		stats->bounces[bounce_acquired + !!hlock->read]++;
> -	put_lock_stats(stats);
>  
>  	lock->cpu = cpu;
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
