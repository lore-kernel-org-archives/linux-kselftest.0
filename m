From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 18:53:42 -0400
Subject: [PATCH v2 19/32] selftests/ftrace: Add a testcase for nop tracer
In-Reply-To: <153443748943.23257.13855745627496095446.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443748943.23257.13855745627496095446.stgit@devbox>
Message-ID: <20180824185342.542d8a6a@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824225342.EdG-jqaXrq856_0qDK12-8i5uAs0zIYMZX6h6F_j6Sc@z>

On Fri, 17 Aug 2018 01:38:09 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add a testcase for nop tracer. This tracer has 2 test
> options, so check it too.
> 

I'd rather not include this. In fact, I'd love to get rid of the nop
options. They were added to make sure options worked when we first
added them. They are actually pointless.

The only point of this test is to know if options work or not. Hmm, I
guess that is something that could possibly be valuable :-/

-- Steve


> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../testing/selftests/ftrace/test.d/tracer/nop.tc  |   22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/tracer/nop.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/tracer/nop.tc b/tools/testing/selftests/ftrace/test.d/tracer/nop.tc
> new file mode 100644
> index 000000000000..ca63e316e0f5
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/tracer/nop.tc
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: Test nop tracer
> +
> +# nop must be supported always
> +grep -q "nop" available_tracers
> +
> +echo "nop" > current_tracer
> +
> +# nop provides 2 test options
> +grep -q "test_nop_accept" trace_options
> +grep -q "test_nop_refuse" trace_options
> +
> +# nop_accept always success
> +echo "test_nop_accept" > trace_options
> +echo "notest_nop_accept" > trace_options
> +
> +# nop_refuse always failed
> +! echo "test_nop_refuse" > trace_options
> +! echo "notest_nop_refuse" > trace_options
> +
> +exit 0
