From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Tue, 8 May 2018 12:38:12 +0900
Subject: [PATCH 09/24] selftests: ftrace: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-9-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
 <20180505011328.32078-9-shuah@kernel.org>
Message-ID: <20180508123812.874ff8d2a22abd62148b293d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508033812.e0YZVBI7kO5zhInCkVhF6NcYB2ObJ5q9mCz3Y7xRQeM@z>

On Fri,  4 May 2018 19:13:13 -0600
"Shuah Khan (Samsung OSG)" <shuah@kernel.org> wrote:

> When ftrace test is skipped because of unmet dependencies and/or
> unsupported configuration, it returns 0 which is treated as a pass
> by the Kselftest framework. This leads to false positive result even
> when the test could not be run.
> 
> Change it to return kselftest skip code when a test gets skipped to
> clearly report that the test could not be run.
> 
> Kselftest framework SKIP code is 4 and the framework prints appropriate
> messages to indicate that the test is skipped.
> 
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> ---
>  tools/testing/selftests/ftrace/ftracetest | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> index f9a9d424c980..b731c8cdcffb 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -23,6 +23,9 @@ echo "		            If <dir> is -, all logs output in console only"
>  exit $1
>  }
>  
> +# Kselftest framework requirement - SKIP code is 4.
> +ksft_skip=4
> +
>  errexit() { # message
>    echo "Error: $1" 1>&2
>    exit 1
> @@ -30,7 +33,8 @@ errexit() { # message
>  
>  # Ensuring user privilege
>  if [ `id -u` -ne 0 ]; then
> -  errexit "this must be run by root user"
> +  echo "Skipping: test must be run by root user"
> +  exit $ksft_skip
>  fi
>  
>  # Utilities
> @@ -249,7 +253,7 @@ trap 'SIG_RESULT=$UNTESTED' $SIG_UNTESTED
>  SIG_UNSUPPORTED=$((SIG_BASE + UNSUPPORTED))
>  exit_unsupported () {
>    kill -s $SIG_UNSUPPORTED $SIG_PID
> -  exit 0
> +  exit $ksft_skip

This should return 0. If you want to change the result code,
you have to change the last part as below.
(Note that we need a switch option of return code, so that
 ftracetest user can continue to use same way...)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index f9a9d424c980..d6ce56a2a937 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -326,5 +326,15 @@ prlog "# of unsupported: " `echo $UNSUPPORTED_CASES | wc -w`
 prlog "# of xfailed: " `echo $XFAILED_CASES | wc -w`
 prlog "# of undefined(test bug): " `echo $UNDEFINED_CASES | wc -w`
 
-# if no error, return 0
-exit $TOTAL_RESULT
+# following kselftest result code
+if [ $UNSUPPORTED_CASES -ne 0 -o \
+       $UNTESTED_CASES -ne 0 -o \
+       $UNRESOLVED_CASES -ne 0]; then # There are skipped tests
+  exit 4
+elif [ $XAILED_CASES -ne 0 -o ]; then # XFAILs
+  exit 2
+elif [ $FAILED_CASES -ne 0 -o ]; then # FAILs
+  exit 1
+else # PASS
+  exit 0
+fi

Thanks,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
