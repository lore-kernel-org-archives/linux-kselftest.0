From: rostedt at goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 19:06:21 -0400
Subject: [PATCH v2 21/32] selftests/ftrace: Add trace_printk sample
 module test
In-Reply-To: <153443754593.23257.6968622935654299173.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443754593.23257.6968622935654299173.stgit@devbox>
Message-ID: <20180824190621.1683e34c@gandalf.local.home>

On Fri, 17 Aug 2018 01:39:06 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> Add trace_printk sample module test. This requires to
> enable trace_printk.ko module for test.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../selftests/ftrace/test.d/event/trace_printk.tc  |   27 ++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/event/trace_printk.tc b/tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
> new file mode 100644
> index 000000000000..4da4d739f03d
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/event/trace_printk.tc
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test trace_printk from module
> +
> +rmmod trace-printk ||:
> +if ! modprobe trace-printk.ko ; then

"modprobe trace-printk.ko" doesn't work. You need to drop the ".ko"

-- Steve

> +  echo "No trace-printk sample module - please make CONFIG_SAMPLE_TRACE_PRINTK=m"
> +  exit_unresolved;
> +fi
> +
> +echo "Waiting for irq work"
> +sleep 1
> +
> +grep -q ": This .* trace_bputs" trace
> +grep -q ": This .* trace_puts" trace
> +grep -q ": This .* trace_bprintk" trace
> +grep -q ": This .* trace_printk" trace
> +
> +grep -q ": (irq) .* trace_bputs" trace
> +grep -q ": (irq) .* trace_puts" trace
> +grep -q ": (irq) .* trace_bprintk" trace
> +grep -q ": (irq) .* trace_printk" trace
> +
> +grep -q "This is a %s that will use trace_bprintk" printk_formats
> +grep -q "(irq) This is a static string that will use trace_bputs" printk_formats
> +
> +rmmod trace-printk ||:
