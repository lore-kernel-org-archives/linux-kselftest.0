From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Fri, 2 Nov 2018 00:20:39 +0900
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181101083551.3805-2-cyphar@cyphar.com>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
Message-ID: <20181102002039.8f22c10fa47cae75fa709165@kernel.org>

Hi Aleksa,

On Thu,  1 Nov 2018 19:35:50 +1100
Aleksa Sarai <cyphar at cyphar.com> wrote:
[...]
> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_stacktrace.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_stacktrace.tc

Please split the test case as an independent patch.

> new file mode 100644
> index 000000000000..03146c6a1a3c
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kretprobe_stacktrace.tc
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0+
> +# description: Kretprobe dynamic event with a stacktrace
> +
> +[ -f kprobe_events ] || exit_unsupported # this is configurable
> +
> +echo 0 > events/enable
> +echo 1 > options/stacktrace
> +
> +echo 'r:teststackprobe sched_fork $retval' > kprobe_events
> +grep teststackprobe kprobe_events
> +test -d events/kprobes/teststackprobe

Hmm, what happen if we have 2 or more kretprobes on same stack?
It seems you just save stack in pre_handler, but that stack can already
includes another kretprobe's trampline address...

Thank you,

> +
> +clear_trace
> +echo 1 > events/kprobes/teststackprobe/enable
> +( echo "forked")
> +echo 0 > events/kprobes/teststackprobe/enable
> +
> +# Make sure we don't see kretprobe_trampoline and we see _do_fork.
> +! grep 'kretprobe' trace
> +grep '_do_fork' trace
> +
> +echo '-:teststackprobe' >> kprobe_events
> +clear_trace
> +test -d events/kprobes/teststackprobe && exit_fail || exit_pass
> -- 
> 2.19.1
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
