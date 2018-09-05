From: shuah@kernel.org (Shuah Khan)
Date: Wed, 5 Sep 2018 10:56:36 -0600
Subject: [PATCH] selftests/efivarfs: add required kernel configs
In-Reply-To: <1536117289-15240-1-git-send-email-Lei.Yang@windriver.com>
References: <1536117289-15240-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <af970d74-8e88-341b-b703-bed94f0746bc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180905165636.K6kB8-TBfKjLYpJpuQgBz_UHcXM1q--y3ZemQd83lvc@z>

On 09/04/2018 09:14 PM, Lei Yang wrote:
> add config file
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/efivarfs/config | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tools/testing/selftests/efivarfs/config
> 
> diff --git a/tools/testing/selftests/efivarfs/config b/tools/testing/selftests/efivarfs/config
> new file mode 100644
> index 0000000..4e151f1
> --- /dev/null
> +++ b/tools/testing/selftests/efivarfs/config
> @@ -0,0 +1 @@
> +CONFIG_EFIVAR_FS=y
> 


Thanks. Applied to linux-kselftest next,

-- Shuah
