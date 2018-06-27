From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Wed, 27 Jun 2018 21:21:27 +0900
Subject: [PATCH v9 7/7] kselftests: Add tests for the preemptoff and
 irqsoff tracers
In-Reply-To: <20180625162102.GA49367@joelaf.mtv.corp.google.com>
References: <20180621223236.211495-1-joel@joelfernandes.org>
 <20180621223236.211495-8-joel@joelfernandes.org>
 <20180625221302.8507c98e500d8efc70c19d88@kernel.org>
 <20180625162102.GA49367@joelaf.mtv.corp.google.com>
Message-ID: <20180627212127.e05d66b4f5d11b20d0364375@kernel.org>

On Mon, 25 Jun 2018 09:21:02 -0700
Joel Fernandes <joel at joelfernandes.org> wrote:


> 
> From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
> Subject: [PATCH v9.1 7/7] kselftests: Add tests for the preemptoff and irqsoff
>  tracers
> 
> Here we add unit tests for the preemptoff and irqsoff tracer by using a
> kernel module introduced previously to trigger atomic sections in the
> kernel.
> 

Looks good to me.

Acked-by: Masami Hiramatsu <mhiramat at kernel.org>

Thanks!

> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
>  tools/testing/selftests/ftrace/config         |  3 +
>  .../test.d/preemptirq/irqsoff_tracer.tc       | 74 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100755 tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc
> 
> diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
> index b01924c71c09..29588b328345 100644
> --- a/tools/testing/selftests/ftrace/config
> +++ b/tools/testing/selftests/ftrace/config
> @@ -4,3 +4,6 @@ CONFIG_FUNCTION_PROFILER=y
>  CONFIG_TRACER_SNAPSHOT=y
>  CONFIG_STACK_TRACER=y
>  CONFIG_HIST_TRIGGERS=y
> +CONFIG_PREEMPT_TRACER=y
> +CONFIG_IRQSOFF_TRACER=y
> +CONFIG_TEST_ATOMIC_SECTIONS=m
> diff --git a/tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc b/tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc
> new file mode 100755
> index 000000000000..2dcd5e4cafb4
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/preemptirq/irqsoff_tracer.tc
> @@ -0,0 +1,74 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: test for the preemptirqsoff tracer
> +
> +MOD=test_atomic_sections
> +
> +fail() {
> +    reset_tracer
> +    rmmod $MOD || true
> +    exit_fail
> +}
> +
> +unsup() { #msg
> +    reset_tracer
> +    rmmod $MOD || true
> +    echo $1
> +    exit_unsupported
> +}
> +
> +modprobe $MOD || unsup "$MOD module not available"
> +rmmod $MOD
> +
> +grep -q "preemptoff" available_tracers || unsup "preemptoff tracer not enabled"
> +grep -q "irqsoff" available_tracers || unsup "irqsoff tracer not enabled"
> +
> +reset_tracer
> +
> +# Simulate preemptoff section for half a second couple of times
> +echo preemptoff > current_tracer
> +sleep 1
> +modprobe $MOD atomic_mode=preempt atomic_time=500000 || fail
> +rmmod $MOD || fail
> +modprobe $MOD atomic_mode=preempt atomic_time=500000 || fail
> +rmmod $MOD || fail
> +modprobe $MOD atomic_mode=preempt atomic_time=500000 || fail
> +rmmod $MOD || fail
> +
> +cat trace
> +
> +# Confirm which tracer
> +grep -q "tracer: preemptoff" trace || fail
> +
> +# Check the end of the section
> +egrep -q "5.....us : <stack trace>" trace || fail
> +
> +# Check for 500ms of latency
> +egrep -q "latency: 5..... us" trace || fail
> +
> +reset_tracer
> +
> +# Simulate irqsoff section for half a second couple of times
> +echo irqsoff > current_tracer
> +sleep 1
> +modprobe $MOD atomic_mode=irq atomic_time=500000 || fail
> +rmmod $MOD || fail
> +modprobe $MOD atomic_mode=irq atomic_time=500000 || fail
> +rmmod $MOD || fail
> +modprobe $MOD atomic_mode=irq atomic_time=500000 || fail
> +rmmod $MOD || fail
> +
> +cat trace
> +
> +# Confirm which tracer
> +grep -q "tracer: irqsoff" trace || fail
> +
> +# Check the end of the section
> +egrep -q "5.....us : <stack trace>" trace || fail
> +
> +# Check for 500ms of latency
> +egrep -q "latency: 5..... us" trace || fail
> +
> +reset_tracer
> +exit 0
> +
> -- 
> 2.18.0.rc2.346.g013aa6912e-goog
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
