From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 19:26:29 -0400
Subject: [PATCH v2 26/32] selftests/ftrace: Add trace_pipe testcase
In-Reply-To: <153443768729.23257.2645114356784631107.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443768729.23257.2645114356784631107.stgit@devbox>
Message-ID: <20180824192629.42c8e906@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824232629.br4tNz9WdkfSxGyyKI96wEHR1l2qjl_AfUixUh3G-CA@z>

On Fri, 17 Aug 2018 01:41:27 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add a simple testcase for trace_pipe which can consume
> ringbuffer.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../selftests/ftrace/test.d/00basic/trace_pipe.tc  |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
> new file mode 100644
> index 000000000000..a7dd6fda487a
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/00basic/trace_pipe.tc
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: trace_pipe and trace_marker

Should add:

 # flags: instance

-- Steve

> +
> +[ ! -f trace_marker ] && exit_unsupported
> +
> +echo "test input 1" > trace_marker
> +
> +: "trace interface never consume the ring buffer"
> +grep -q "test input 1" trace
> +grep -q "test input 1" trace
> +
> +: "trace interface never consume the ring buffer"
> +head -n 1 trace_pipe | grep -q "test input 1"
> +! grep -q "test input 1" trace
