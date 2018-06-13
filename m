From: keescook@chromium.org (Kees Cook)
Date: Tue, 12 Jun 2018 17:02:02 -0700
Subject: [PATCH] selftests: pstore: return Kselftest Skip code for skipped
 tests
In-Reply-To: <20180612232230.27864-1-shuah@kernel.org>
References: <20180612232230.27864-1-shuah@kernel.org>
Message-ID:
 <CAGXu5j+QyS_RCKgyL-hH9HO4vo1ZR0BuWbeBtzHBt8AnWMPU2A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180613000202.k82gilBkhuF4tbJy9UhqUfLnm7dbXJ7Kwvmm5nFJfM4@z>

On Tue, Jun 12, 2018 at 4:22 PM, Shuah Khan (Samsung OSG)
<shuah@kernel.org> wrote:
> When pstore_post_reboot test gets skipped because of unmet dependencies
> and/or unsupported configuration, it returns 0 which is treated as a pass
> by the Kselftest framework. This leads to false positive result even when
> the test could not be run.
>
> Change it to return kselftest skip code when a test gets skipped to clearly
> report that the test could not be run.
>
> Kselftest framework SKIP code is 4 and the framework prints appropriate
> messages to indicate that the test is skipped.
>
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Reviewed-by: Kees Cook <keescook at chromium.org>

Thanks!

-Kees

> ---
>  tools/testing/selftests/pstore/pstore_post_reboot_tests | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/pstore/pstore_post_reboot_tests b/tools/testing/selftests/pstore/pstore_post_reboot_tests
> index 6ccb154cb4aa..22f8df1ad7d4 100755
> --- a/tools/testing/selftests/pstore/pstore_post_reboot_tests
> +++ b/tools/testing/selftests/pstore/pstore_post_reboot_tests
> @@ -7,13 +7,16 @@
>  #
>  # Released under the terms of the GPL v2.
>
> +# Kselftest framework requirement - SKIP code is 4.
> +ksft_skip=4
> +
>  . ./common_tests
>
>  if [ -e $REBOOT_FLAG  ]; then
>      rm $REBOOT_FLAG
>  else
>      prlog "pstore_crash_test has not been executed yet. we skip further tests."
> -    exit 0
> +    exit $ksft_skip
>  fi
>
>  prlog -n "Mounting pstore filesystem ... "
> --
> 2.17.0
>



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
