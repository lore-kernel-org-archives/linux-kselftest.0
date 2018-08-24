From: rostedt at goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 17:47:10 -0400
Subject: [PATCH v2 04/32] selftests/ftrace: Add case number prefix to
 logfile
In-Reply-To: <153443706488.23257.9219288456614329354.stgit@devbox>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443706488.23257.9219288456614329354.stgit@devbox>
Message-ID: <20180824174710.3a5050ca@gandalf.local.home>

On Fri, 17 Aug 2018 01:31:05 +0900
Masami Hiramatsu <mhiramat at kernel.org> wrote:

> Add a case number prefix to each logfile. This makes
> it easier to find which logfile is corresponding
> to which failure.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>


-- Steve

> ---
>  tools/testing/selftests/ftrace/ftracetest |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> index 8debd37038e4..3ca596255eff 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -284,13 +284,13 @@ __run_test() { # testfile
>  # Run one test case
>  run_test() { # testfile
>    local testname=`basename $1`
> +  testcase $1
>    if [ ! -z "$LOG_FILE" ] ; then
> -    local testlog=`mktemp $LOG_DIR/${testname}-log.XXXXXX`
> +    local testlog=`mktemp $LOG_DIR/${CASENO}-${testname}-log.XXXXXX`
>    else
>      local testlog=/proc/self/fd/1
>    fi
>    export TMPDIR=`mktemp -d /tmp/ftracetest-dir.XXXXXX`
> -  testcase $1
>    echo "execute$INSTANCE: "$1 > $testlog
>    SIG_RESULT=0
>    if [ $VERBOSE -eq -1 ]; then
