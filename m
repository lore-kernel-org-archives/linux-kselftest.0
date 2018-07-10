From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 10 Jul 2018 10:20:50 -0400
Subject: [PATCH v9 5/7] tracing: Centralize preemptirq tracepoints and
 unify their usage
In-Reply-To: <20180628182149.226164-6-joel@joelfernandes.org>
References: <20180628182149.226164-1-joel@joelfernandes.org>
 <20180628182149.226164-6-joel@joelfernandes.org>
Message-ID: <20180710102050.78ae0ea8@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180710142050.Jn5iDgx3PxISR-SFPiMlMKdVLeGp--kzFXYNMY713rA@z>

On Thu, 28 Jun 2018 11:21:47 -0700
Joel Fernandes <joel@joelfernandes.org> wrote:

> diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
> new file mode 100644
> index 000000000000..dc01c7f4d326
> --- /dev/null
> +++ b/kernel/trace/trace_preemptirq.c
> @@ -0,0 +1,71 @@

Can you send a patch on top of this, that adds a SPDX header here. Just
add another patch, no need to resend this one.

I need to go through all the files in kernel/trace/* and add SPDX
headers. I don't want to add more files that don't have them.

I'm still playing around with this patch, and testing it.

-- Steve

> +/*
> + * preemptoff and irqoff tracepoints
> + *
> + * Copyright (C) Joel Fernandes (Google) <joel at joelfernandes.org>
> + */
> +
> +#include <linux/kallsyms.h>
> +#include <linux/uaccess.h>
> +#include <linux/module.h>
> +#include <linux/ftrace.h>
> +
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/preemptirq.h>
> +
> +#ifdef CONFIG_TRACE_IRQFLAGS
> +/* Per-cpu variable to prevent redundant calls when IRQs already off */
> +static DEFINE_PER_CPU(int, tracing_irq_cpu);
> +
> +void trace_hardirqs_on(void)
> +{
> +	if (lockdep_recursing(current) || !this_cpu_read(tracing_irq_cpu))
> +		return;
> +
> +	trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> +	this_cpu_write(tracing_irq_cpu, 0);
> +}
> +EXPORT_SYMBOL(trace_hardirqs_on);
> +
> +void trace_hardirqs_off(void)
> +{
> +	if (lockdep_recursing(current) || this_cpu_read(tracing_irq_cpu))
> +		return;
> +
> +	this_cpu_write(tracing_irq_cpu, 1);
> +	trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> +}
> +EXPORT_SYMBOL(trace_hardirqs_off);
> +
> +__visible void trace_hardirqs_on_caller(unsigned long caller_addr)
> +{
> +	if (lockdep_recursing(current) || !this_cpu_read(tracing_irq_cpu))
> +		return;
> +
> +	trace_irq_enable_rcuidle(CALLER_ADDR0, caller_addr);
> +	this_cpu_write(tracing_irq_cpu, 0);
> +}
> +EXPORT_SYMBOL(trace_hardirqs_on_caller);
> +
> +__visible void trace_hardirqs_off_caller(unsigned long caller_addr)
> +{
> +	if (lockdep_recursing(current) || this_cpu_read(tracing_irq_cpu))
> +		return;
> +
> +	this_cpu_write(tracing_irq_cpu, 1);
> +	trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
> +}
> +EXPORT_SYMBOL(trace_hardirqs_off_caller);
> +#endif /* CONFIG_TRACE_IRQFLAGS */
> +
> +#ifdef CONFIG_TRACE_PREEMPT_TOGGLE
> +
> +void trace_preempt_on(unsigned long a0, unsigned long a1)
> +{
> +	trace_preempt_enable_rcuidle(a0, a1);
> +}
> +
> +void trace_preempt_off(unsigned long a0, unsigned long a1)
> +{
> +	trace_preempt_disable_rcuidle(a0, a1);
> +}
> +#endif

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
