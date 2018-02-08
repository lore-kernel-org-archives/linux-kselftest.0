From: pintu.ping at gmail.com (Pintu Kumar)
Date: Thu, 8 Feb 2018 10:47:07 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests/android: Fix line
	continuation in Makefile
In-Reply-To: <1517961219-17700-1-git-send-email-daniel.diaz@linaro.org>
References: <1517961219-17700-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <CAOuPNLgJx9voztUYGoUmgPR6B7qKfDXx8TUx5utpSi0gxMOFcQ@mail.gmail.com>

On Wed, Feb 7, 2018 at 5:22 AM, Daniel Díaz <daniel.diaz at linaro.org> wrote:
> The Makefile lacks a couple of line continuation backslashes
> in an `if' clause, which can make the subsequent rsync
> command go awry over the whole filesystem (`rsync -a / /`).
>
>   /bin/sh: -c: line 5: syntax error: unexpected end of file
>   make[1]: [all] Error 1 (ignored)
>   TEST=$DIR"_test.sh"; \
>                   if [ -e $DIR/$TEST ]; then
>   /bin/sh: -c: line 2: syntax error: unexpected end of file
>   make[1]: [all] Error 1 (ignored)
>   rsync -a $DIR/$TEST $BUILD_TARGET/;
>   [...a myriad of:]
>   [  rsync: readlink_stat("...") failed: Permission denied (13)]
>   [  skipping non-regular file "..."]
>   [  rsync: opendir "..." failed: Permission denied (13)]
>   [and many other errors...]
>   fi
>   make[1]: fi: Command not found
>   make[1]: [all] Error 127 (ignored)
>   done
>   make[1]: done: Command not found
>   make[1]: [all] Error 127 (ignored)
>
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> ---
>  tools/testing/selftests/android/Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/android/Makefile b/tools/testing/selftests/android/Makefile
> index 1a74922..f6304d2 100644
> --- a/tools/testing/selftests/android/Makefile
> +++ b/tools/testing/selftests/android/Makefile
> @@ -11,11 +11,11 @@ all:
>                 BUILD_TARGET=$(OUTPUT)/$$DIR;   \
>                 mkdir $$BUILD_TARGET  -p;       \
>                 make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
> -               #SUBDIR test prog name should be in the form: SUBDIR_test.sh
> +               #SUBDIR test prog name should be in the form: SUBDIR_test.sh \
>                 TEST=$$DIR"_test.sh"; \
> -               if [ -e $$DIR/$$TEST ]; then
> -                       rsync -a $$DIR/$$TEST $$BUILD_TARGET/;
> -               fi
> +               if [ -e $$DIR/$$TEST ]; then \
> +                       rsync -a $$DIR/$$TEST $$BUILD_TARGET/; \
> +               fi \
>         done
>
>  override define RUN_TESTS

Acked-by: Pintu Agarwal <pintu.ping at gmail.com>

> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
