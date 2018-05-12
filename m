From: pintu.ping@gmail.com (Pintu Kumar)
Date: Sat, 12 May 2018 21:42:10 +0530
Subject: [PATCH] selftests: android: delete RUN_TESTS and EMIT_TESTS
 overrides
In-Reply-To: <20180502211848.22404-1-shuah@kernel.org>
References: <20180502211848.22404-1-shuah@kernel.org>
Message-ID:
 <CAOuPNLhZyWQfm=eK440suESciE-1q0Rpwx0nKHXWD2jxMZ74xw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180512161210.WWG36XmfrhQVLTuUbZyQ1YZZ4niBlVvm96htN4Rmv5o@z>

On Thu, May 3, 2018 at 2:48 AM, Shuah Khan (Samsung OSG)
<shuah@kernel.org> wrote:
> Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
> lib.mk. Common defines work just fine and there is no need to define
> custom overrides.
>
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> ---
>  tools/testing/selftests/android/Makefile | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/tools/testing/selftests/android/Makefile b/tools/testing/selftests/android/Makefile
> index f6304d2be90c..72c25a3cb658 100644
> --- a/tools/testing/selftests/android/Makefile
> +++ b/tools/testing/selftests/android/Makefile
> @@ -18,10 +18,6 @@ all:
>                 fi \
>         done
>
> -override define RUN_TESTS
> -       @cd $(OUTPUT); ./run.sh
> -endef
> -
>  override define INSTALL_RULE
>         mkdir -p $(INSTALL_PATH)
>         install -t $(INSTALL_PATH) $(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES)
> @@ -33,10 +29,6 @@ override define INSTALL_RULE
>         done;
>  endef
>
> -override define EMIT_TESTS
> -       echo "./run.sh"
> -endef
> -
>  override define CLEAN
>         @for DIR in $(SUBDIRS); do              \
>                 BUILD_TARGET=$(OUTPUT)/$$DIR;   \
> --
> 2.14.1
>

OK.

Acked-by: Pintu Agarwal <pintu.ping at gmail.com>

---

Note: This mail goes into my spam email box.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
