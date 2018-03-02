From: namhyung at kernel.org (Namhyung Kim)
Date: Fri, 2 Mar 2018 14:31:17 +0900
Subject: [PATCH v4 18/19] selftests: ftrace: Add a testcase for $argN
 with kprobe_event
In-Reply-To: <151978849122.2577.13948527724464684401.stgit@devbox>
References: <151978796240.2577.6531711990653677529.stgit@devbox>
 <151978849122.2577.13948527724464684401.stgit@devbox>
Message-ID: <20180302053117.GB31540@sejong>

On Wed, Feb 28, 2018 at 12:28:11PM +0900, Masami Hiramatsu wrote:
> Add a testcase for array type with kprobe event.
> This tests whether the traced data is correct or not.
> If the kernel doesn't support array type, it skips
> the test as UNSUPPORTED.

This description is wrong - it's for positional (argN) arguments.

Thanks,
Namhyung


> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../ftrace/test.d/kprobe/kprobe_args_argN.tc       |   25 ++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
> new file mode 100644
> index 000000000000..d5c5c8c3a51e
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_argN.tc
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Kprobe event argN argument
> +
> +[ -f kprobe_events ] || exit_unsupported # this is configurable
> +
> +grep -q "arg<N>" README || exit_unsupported # version issue
> +
> +echo 0 > events/enable
> +echo > kprobe_events
> +
> +: "Test bad pattern : arg0 is not allowed"
> +! echo 'p:testprobe create_trace_kprobe $arg0' > kprobe_events
> +
> +: "Test get argument"
> +echo 'p:testprobe create_trace_kprobe $arg1' > kprobe_events
> +echo 1 > events/kprobes/testprobe/enable
> +! echo test >> kprobe_events
> +tail -n 1 trace | grep -qe "testprobe.* arg1=0x1"
> +
> +! echo test test test >> kprobe_events
> +tail -n 1 trace | grep -qe "testprobe.* arg1=0x3"
> +
> +echo 0 > events/enable
> +echo > kprobe_events
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
