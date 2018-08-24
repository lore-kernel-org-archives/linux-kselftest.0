From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 19:28:00 -0400
Subject: [PATCH v2 27/32] selftests/ftrace: Add stacktrace ftrace filter
 command testcase
In-Reply-To: <153443771560.23257.1531051659949223265.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443771560.23257.1531051659949223265.stgit@devbox>
Message-ID: <20180824192800.04290c1e@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824232800.seQYCJYmPQHIJgzL5lt3yG9PFs2GckS_DXs_GR1XLnE@z>

On Fri, 17 Aug 2018 01:41:55 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add a test case for stacktrace filter command for ftrace.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../ftrace/test.d/ftrace/func-filter-stacktrace.tc |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
> new file mode 100644
> index 000000000000..ec0d8216d509
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL2.0
> +# description: ftrace - stacktrace filter command

Add:

 # flags: instance

> +
> +echo _do_fork:stacktrace >> set_ftrace_filter
> +
> +grep -q "_do_fork:stacktrace:unlimited" set_ftrace_filter
> +
> +(echo "forked"; sleep 1)
> +
> +grep -q "<stack trace>" trace

> +

Can remove the extra line.

-- Steve
