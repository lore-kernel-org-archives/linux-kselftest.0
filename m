From: keescook at chromium.org (Kees Cook)
Date: Tue, 27 Nov 2018 09:56:39 -0800
Subject: [PATCH 2/2] selftests: firmware: add
 CONFIG_FW_LOADER_USER_HELPER_FALLBACK to config
In-Reply-To: <20181127031218.24419-3-dan.rue@linaro.org>
References: <20181127031218.24419-1-dan.rue@linaro.org>
 <20181127031218.24419-3-dan.rue@linaro.org>
Message-ID: <CAGXu5jK=oOHsM50iGDcp4PzOHv58r2-XfryAs0N=gfjD+rEaQg@mail.gmail.com>

On Mon, Nov 26, 2018 at 7:12 PM, Dan Rue <dan.rue at linaro.org> wrote:
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y is required for fw_fallback.sh.
> Without it, fw_fallback.sh fails with 'usermode helper disabled so
> ignoring test'. Enable the config in selftest so that it gets built by
> default.
>
> Signed-off-by: Dan Rue <dan.rue at linaro.org>

Acked-by: Kees Cook <keescook at chromium.org>

-Kees

> ---
>  tools/testing/selftests/firmware/config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/firmware/config b/tools/testing/selftests/firmware/config
> index bf634dda0720..913a25a4a32b 100644
> --- a/tools/testing/selftests/firmware/config
> +++ b/tools/testing/selftests/firmware/config
> @@ -1,5 +1,6 @@
>  CONFIG_TEST_FIRMWARE=y
>  CONFIG_FW_LOADER=y
>  CONFIG_FW_LOADER_USER_HELPER=y
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
> --
> 2.19.1
>



-- 
Kees Cook
