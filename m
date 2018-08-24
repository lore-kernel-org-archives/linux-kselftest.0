From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 17:50:17 -0400
Subject: [PATCH v2 10/32] selftests/ftrace: Fix checkbashisms errors
In-Reply-To: <153443723502.23257.14228272091408974348.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443723502.23257.14228272091408974348.stgit@devbox>
Message-ID: <20180824175017.7a902933@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824215017.aXSSRRwP6Q9aVDuuVOGM6osJDSOC3gdUZt7M_9vH0ck@z>

On Fri, 17 Aug 2018 01:33:55 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Fix a test case to make checkbashisms clean.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  .../trigger/trigger-trace-marker-snapshot.tc       |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc
> index 79ce7d51350b..df246e505af7 100644
> --- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc
> +++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-trace-marker-snapshot.tc
> @@ -39,10 +39,10 @@ test_trace() {
>  	fi
>  	echo "testing $line for >$x<"
>  	match=`echo $line | sed -e "s/>$x<//"`
> -	if [ "$line" == "$match" ]; then
> +	if [ "$line" = "$match" ]; then
>  	    fail "$line does not have >$x< in it"
>  	fi
> -	let x=$x+2
> +	x=$((x+2))

I didn't realize "let" was a bashism. I've been using that on other
shells I believe. But whatever.

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

-- Steve

>      done
>  }
>  
