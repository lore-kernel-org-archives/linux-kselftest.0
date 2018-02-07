From: keescook at chromium.org (Kees Cook)
Date: Wed, 7 Feb 2018 20:20:41 +1100
Subject: [Linux-kselftest-mirror] [PATCH] selftests: pstore: Adding
	config fragment CONFIG_PSTORE_RAM=m
In-Reply-To: <1517995040-22929-1-git-send-email-naresh.kamboju@linaro.org>
References: <1517995040-22929-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <CAGXu5jJO9Cm37U=GwHPVpfh4yumszN3LuZweZuC5hqb-d0s3zw@mail.gmail.com>

On Wed, Feb 7, 2018 at 8:17 PM, Naresh Kamboju
<naresh.kamboju at linaro.org> wrote:
> pstore_tests and pstore_post_reboot_tests need CONFIG_PSTORE_RAM=m

Does it need to be =m, or is =y okay too?

> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>

Either way:

Acked-by: Kees Cook <keescook at chromium.org>

-Kees

> ---
>  tools/testing/selftests/pstore/config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/pstore/config b/tools/testing/selftests/pstore/config
> index 6a8e5a9..d148f9f 100644
> --- a/tools/testing/selftests/pstore/config
> +++ b/tools/testing/selftests/pstore/config
> @@ -2,3 +2,4 @@ CONFIG_MISC_FILESYSTEMS=y
>  CONFIG_PSTORE=y
>  CONFIG_PSTORE_PMSG=y
>  CONFIG_PSTORE_CONSOLE=y
> +CONFIG_PSTORE_RAM=m
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
