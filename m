From: zanussi at kernel.org (Tom Zanussi)
Date: Thu, 29 Nov 2018 10:43:13 -0600
Subject: [PATCH] sefltests/ftrace: Use /bin/echo for output with options
In-Reply-To: <154350406317.4422.7595059658374071660.stgit@devbox>
References: <20181129235407.9788e718a4ae7830f9e5d225@kernel.org>
 <154350406317.4422.7595059658374071660.stgit@devbox>
Message-ID: <1543509793.2018.2.camel@kernel.org>

Hi Masami,

On Fri, 2018-11-30 at 00:07 +0900, Masami Hiramatsu wrote:
> Use /bin/echo for console output with options like non
> newline (-n) and/or backslash escape (-e).
> 
> Tom Zanussi reported that when he tested ftracetest, it
> shows "-e" and "-n" options on the console, since a system
> which uses dash as the alias of /bin/sh, uses dash built-in
> echo command which doesn't accept "-e".
> 
> To avoid this issue, use /bin/echo instead of echo for
> the output with options.
> 
> Fixes: 8f381ac4d321 ("selftests/ftrace: Add color to the PASS / FAIL
> results")
> Link: http://lkml.kernel.org/r/cover.1542221862.git.tom.zanussi at linux
> .intel.com
> Reported-by: Tom Zanussi <zanussi at kernel.org>
> Suggested-by: Tom Zanussi <zanussi at kernel.org>
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> ---
>  tools/testing/selftests/ftrace/ftracetest |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/ftracetest
> b/tools/testing/selftests/ftrace/ftracetest
> index 75244db70331..ba670b452bdb 100755
> --- a/tools/testing/selftests/ftrace/ftracetest
> +++ b/tools/testing/selftests/ftrace/ftracetest
> @@ -173,8 +173,8 @@ strip_esc() {
>  }
>  
>  prlog() { # messages
> -  echo -e "$@"
> -  [ "$LOG_FILE" ] && echo -e "$@" | strip_esc >> $LOG_FILE
> +  /bin/echo -e "$@"
> +  [ "$LOG_FILE" ] && /bin/echo -e "$@" | strip_esc >> $LOG_FILE
>  }
>  catlog() { #file
>    cat $1
> 

I tried this on the three systems mentioned before, and it worked fine
on all of them.

Tested-by: Tom Zanussi <tom.zanussi at linux.intel.com>
