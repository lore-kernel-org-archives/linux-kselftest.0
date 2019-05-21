From: tiwai@suse.de (Takashi Iwai)
Date: Tue, 21 May 2019 07:21:42 +0200
Subject: [PATCH 1/2] selftests: Remove forced unbuffering for test running
In-Reply-To: <20190520223749.13476-2-keescook@chromium.org>
References: <20190520223749.13476-1-keescook@chromium.org>
 <20190520223749.13476-2-keescook@chromium.org>
Message-ID: <s5hlfz0757d.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190521052142.WcVeyEWiZUJxCToETVKgIYiYGAKuRMqe0Kc-rBjxJ0M@z>

On Tue, 21 May 2019 00:37:48 +0200,
Kees Cook wrote:
> 
> As it turns out, the "stdbuf" command will actually force all
> subprocesses into unbuffered output, and some implementations of "echo"
> turn into single-character writes, which utterly wrecks writes to /sys
> and /proc files.
> 
> Instead, drop the "stdbuf" usage, and for any tests that want explicit
> flushing between newlines, they'll have to add "fflush(stdout);" as
> needed.
> 
> Reported-by: Takashi Iwai <tiwai at suse.de>
> Fixes: 5c069b6dedef ("selftests: Move test output to diagnostic lines")
> Signed-off-by: Kees Cook <keescook at chromium.org>

Tested-by: Takashi Iwai <tiwai at suse.de>

BTW, this might be specific to shell invocation.  As in the original
discussion thread, it starts working when I replace "echo" with
"/usr/bin/echo".

Still it's not easy to control in a script itself, so dropping the
unbuffered mode is certainly safer, yes.

Thanks!


Takashi


> ---
>  tools/testing/selftests/kselftest/runner.sh | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index eff3ee303d0d..00c9020bdda8 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -24,16 +24,6 @@ tap_prefix()
>  	fi
>  }
>  
> -# If stdbuf is unavailable, we must fall back to line-at-a-time piping.
> -tap_unbuffer()
> -{
> -	if ! which stdbuf >/dev/null ; then
> -		"$@"
> -	else
> -		stdbuf -i0 -o0 -e0 "$@"
> -	fi
> -}
> -
>  run_one()
>  {
>  	DIR="$1"
> @@ -54,7 +44,7 @@ run_one()
>  		echo "not ok $test_num $TEST_HDR_MSG"
>  	else
>  		cd `dirname $TEST` > /dev/null
> -		(((((tap_unbuffer ./$BASENAME_TEST 2>&1; echo $? >&3) |
> +		(((((./$BASENAME_TEST 2>&1; echo $? >&3) |
>  			tap_prefix >&4) 3>&1) |
>  			(read xs; exit $xs)) 4>>"$logfile" &&
>  		echo "ok $test_num $TEST_HDR_MSG") ||
> -- 
> 2.17.1
> 
