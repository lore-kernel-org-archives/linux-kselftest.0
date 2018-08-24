From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 19:23:52 -0400
Subject: [PATCH v2 24/32] selftests/ftrace: Add max stack tracer testcase
In-Reply-To: <153443763074.23257.4052504725796725062.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443763074.23257.4052504725796725062.stgit@devbox>
Message-ID: <20180824192352.262144f5@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824232352.wJLpfiWT9Q6PwTsAFfUcfG9rs9fDO4X4tJ-YBObf90Q@z>

On Fri, 17 Aug 2018 01:40:30 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add a testcase for max stack tracer, which checks basic
> max stack usage tracing and its filter feature.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../ftrace/test.d/ftrace/func_stack_tracer.tc      |   39 ++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
> new file mode 100644
> index 000000000000..b414f0e3c646
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_stack_tracer.tc
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: ftrace - Max stack tracer
> +# Test the basic function of max-stack usage tracing
> +
> +if [ ! -f stack_trace ]; then
> +  echo "Max stack tracer is not supported - please make CONFIG_STACK_TRACER=y"
> +  exit_unsupported
> +fi
> +
> +echo > stack_trace_filter
> +echo 0 > stack_max_size
> +echo 1 > /proc/sys/kernel/stack_tracer_enabled
> +
> +: "Fork and wait for the first entry become !lock"
> +timeout=10
> +while [ $timeout -ne 0 ]; do
> +  ( echo "forked" )
> +  FL=`grep " 0)" stack_trace`
> +  echo $FL | grep -q "lock" || break;
> +  timeout=$((timeout - 1))
> +done
> +echo 0 > /proc/sys/kernel/stack_tracer_enabled
> +
> +echo '*lock*' > stack_trace_filter
> +test `cat stack_trace_filter | wc -l` -eq `grep lock stack_trace_filter | wc -l`
> +
> +echo 0 > stack_max_size
> +echo 1 > /proc/sys/kernel/stack_tracer_enabled

This test fails quite a bit because it doesn't guarantee that another
stack trace gets in that is bigger, and we don't find the "lock".

-- Steve

> +
> +: "Fork and always the first entry including lock"
> +timeout=10
> +while [ $timeout -ne 0 ]; do
> +  ( echo "forked" )
> +  FL=`grep " 0)" stack_trace`
> +  echo $FL | grep -q "lock"
> +  timeout=$((timeout - 1))
> +done
> +echo 0 > /proc/sys/kernel/stack_tracer_enabled
