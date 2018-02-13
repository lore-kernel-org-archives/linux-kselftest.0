From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Tue, 13 Feb 2018 14:26:46 -0700
Subject: [PATCH] selftests/futex: Fix line continuation in Makefile
In-Reply-To: <1518024271-12467-1-git-send-email-daniel.diaz@linaro.org>
References: <1518024271-12467-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <dbf5a78f-4178-2210-9a6c-bf71de7b939d@osg.samsung.com>

On 02/07/2018 10:24 AM, Daniel Díaz wrote:
> The Makefile lacks a couple of line continuation backslashes
> in an `if' clause, which produces an error while make'ing:
> 
>   $ make
>   make[1]: Entering directory `/[...]/linux/tools/testing/selftests/futex'
>   /bin/sh: -c: line 5: syntax error: unexpected end of file
>   make[1]: *** [all] Error 1
>   make[1]: Leaving directory `/[...]/linux/tools/testing/selftests/futex'
>   make: *** [all] Error 2
> 
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> ---
>  tools/testing/selftests/futex/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
> index cea4adc..a63e845 100644
> --- a/tools/testing/selftests/futex/Makefile
> +++ b/tools/testing/selftests/futex/Makefile
> @@ -12,9 +12,9 @@ all:
>  		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
>  		mkdir $$BUILD_TARGET  -p;	\
>  		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
> -		if [ -e $$DIR/$(TEST_PROGS) ]; then
> -			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/;
> -		fi
> +		if [ -e $$DIR/$(TEST_PROGS) ]; then \
> +			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/; \
> +		fi \
>  	done
>  
>  override define RUN_TESTS
> 

Thanks for the patch. Applied to linux-kselftest fixes for 4.16-rc3

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
