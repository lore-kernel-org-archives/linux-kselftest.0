From: shuah@kernel.org (shuah)
Date: Fri, 22 Feb 2019 15:33:50 -0700
Subject: [RESEND PATCH v2 1/2] selftests/ftrace: Replace echo -e with
 printf
In-Reply-To: <20190222205351.743-2-juergh@canonical.com>
References: <20190222091021.10178-1-juergh@canonical.com>
 <20190222205351.743-1-juergh@canonical.com>
 <20190222205351.743-2-juergh@canonical.com>
Message-ID: <93621fe0-c098-ac00-f780-043be5925917@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222223350.jBMQ48vcz1OdwyUTmQ92tGgIM-ka0i3nrrEUTQlxnOE@z>

On 2/22/19 1:53 PM, Juerg Haefliger wrote:
> echo -e is not POSIX. Depending on what /bin/sh is, we can get
> incorrect output like:
> $ -e -n [1] Basic trace file check
> $ -e 	[PASS]
> 
> Fix that by using printf instead.
> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
> Signed-off-by: Juerg Haefliger <juergh at canonical.com>
> ---
>   tools/testing/selftests/ftrace/ftracetest | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> index fc755e1b50f1..20c9c0ad8682 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -173,8 +173,13 @@ strip_esc() {
>   }
>   
>   prlog() { # messages
> -  echo -e "$@"
> -  [ "$LOG_FILE" ] && echo -e "$@" | strip_esc >> $LOG_FILE
> +  newline="\n"
> +  if [ "$1" = "-n" ] ; then
> +    newline=
> +    shift
> +  fi
> +  printf "$*$newline"
> +  [ "$LOG_FILE" ] && printf "$*$newline" | strip_esc >> $LOG_FILE
>   }
>   catlog() { #file
>     cat $1
> 

This patch applied to linux-kselftest next which is at 5.0rc6
I queued this for 5.1-rc1.

thanks,
-- Shuah
