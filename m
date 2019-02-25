From: shuah@kernel.org (shuah)
Date: Mon, 25 Feb 2019 07:51:13 -0700
Subject: [RESEND PATCH] selftests/ftrace: Handle the absence of tput
In-Reply-To: <20190225131450.4775-1-juergh@canonical.com>
References: <20190220153706.24686-1-juergh@canonical.com>
 <20190225131450.4775-1-juergh@canonical.com>
Message-ID: <41adf479-e6e3-8233-4066-983d5e701177@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190225145113.E14tWXFWkmxOvRgAicNXv4f_KBBBuqLyBSuEoYyCfVI@z>

On 2/25/19 6:14 AM, Juerg Haefliger wrote:
> In environments where tput is not available, we get the following
> error
> $ ./ftracetest: 163: [: Illegal number:
> because ncolors is an empty string. Fix that by setting it to 0 if the
> tput command fails.
> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
> Signed-off-by: Juerg Haefliger <juergh at canonical.com>
> ---
>   tools/testing/selftests/ftrace/ftracetest | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
> index 75244db70331..fc755e1b50f1 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -154,13 +154,13 @@ fi
>   
>   # Define text colors
>   # Check available colors on the terminal, if any
> -ncolors=`tput colors 2>/dev/null`
> +ncolors=`tput colors 2>/dev/null || echo 0`
>   color_reset=
>   color_red=
>   color_green=
>   color_blue=
>   # If stdout exists and number of colors is eight or more, use them
> -if [ -t 1 -a "$ncolors" -a "$ncolors" -ge 8 ]; then
> +if [ -t 1 -a "$ncolors" -ge 8 ]; then
>     color_reset="\e[0m"
>     color_red="\e[31m"
>     color_green="\e[32m"
> 

Juerg!

Thanks for the resend. Applied to linux-kselftest next for 5.1-rc1.

Since I applied this patch out of order, I had to resolve minor merge
conflict. Please review.

thanks,
-- Shuah
