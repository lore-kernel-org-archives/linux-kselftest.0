From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 16:38:15 -0400
Subject: [PATCH v2 02/32] selftests/ftrace: Add --stop-fail hidden
 option for debug
In-Reply-To: <153443700818.23257.8232348122806172328.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443700818.23257.8232348122806172328.stgit@devbox>
Message-ID: <20180824163815.4614d4cd@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824203815.YogH9ovzvCtK5UWbLbbxgJF3RxbsjNaGdQLacNtxKgU@z>

On Fri, 17 Aug 2018 01:30:08 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add --stop-fail option for debugging the ftracetest.
> 

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

-- Steve

> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  tools/testing/selftests/ftrace/ftracetest |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> index f9a9d424c980..c9c7fa8dc440 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -69,6 +69,10 @@ parse_opts() { # opts
