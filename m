From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 22:19:26 -0400
Subject: [PATCH v2 31/32] selftests/ftrace: Add output format testcase
In-Reply-To: <153443782973.23257.16320326555688796000.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443782973.23257.16320326555688796000.stgit@devbox>
Message-ID: <20180824221926.40cae9f9@vmware.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180825021926.AoEY3FPWe5dMUMxIbebVSte_xu2qONmS7CRoPfKn9rE@z>

On Fri, 17 Aug 2018 01:43:49 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add a testcase for tracing output format using trace_marker.
> This tests raw, hex and bin format output.

I'd like to deprecate these formats. They are useless ever since we
implemented trace_pipe_raw.

Let's not add this test.

Thanks,

-- Steve

> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../ftrace/test.d/00basic/print_format.tc          |   51 ++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/00basic/print_format.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/00basic/print_format.tc b/tools/testing/selftests/ftrace/test.d/00basic/print_format.tc
> new file mode 100644
> index 000000000000..55feb542e83e
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/00basic/print_format.tc
> @@ -0,0 +1,51 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL2.0
> +# description: Change print trace format
> +
> +if [ ! -f trace_marker ]; then
> +  echo "trace_marker is not supported, can not continue testing"
> +  exit_unresolved
> +fi
> +
> +do_reset() {
> +  if [ `cat options/bin` -eq 1 ]; then
> +    grep -v "^#" trace | od -h | cut -f 2- -d " " | xargs echo
> +  fi
> +  echo 0 > options/hex
> +  echo 0 > options/raw
> +  echo 0 > options/bin
> +  cat trace
> +  exit 1
> +}
> +
> +echo > trace
> +echo "abcdefgh" > trace_marker
> +echo 0 > tracing_on
> +
> +: "Get the pid and cpu#"
> +IDS=`grep -v "^#" trace | sed -e 's/[[:space:]]*.*-\([[:digit:]]*\)[[:space:]]*\[\([[:digit:]]*\)\].*/\1 \2/'`
> +
> +read_pid_cpu() {
> +  _PID=$1
> +  _CPU=`printf "%d" $2`
> +}
> +
> +read_pid_cpu $IDS
> +
> +: "Test raw output format"
> +echo 1 > options/raw
> +grep -v "^#" trace | grep "^$_PID $_CPU" || do_reset
> +echo 0 > options/raw
> +
> +: "Test hex output format"
> +echo 1 > options/hex
> +PAT=`printf "%08x %08x" $_PID $_CPU`
> +grep -v "^#" trace | grep "^$PAT" || do_reset
> +echo 0 > options/hex
> +
> +: "Test bin output format"
> +echo 1 > options/bin
> +PAT=`printf "%04x [[:xdigit:]]* [[:xdigit:]]*%02x" $_PID $_CPU`
> +# Make a stream of hexdump
> +grep -v "^#" trace | od -h | cut -f 2- -d " " | xargs echo | grep "$PAT" || do_reset
> +echo 0 > options/bin
