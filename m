From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Tue, 13 Feb 2018 14:23:36 -0700
Subject: [PATCH] selftests: memfd: add config fragment for fuse
In-Reply-To: <1517955648-11186-1-git-send-email-daniel.diaz@linaro.org>
References: <1517955648-11186-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <14ff3440-ebaf-5d1d-66a3-d6213ca4cb95@osg.samsung.com>

On 02/06/2018 03:20 PM, Daniel Díaz wrote:
> From: Anders Roxell <anders.roxell at linaro.org>
> 
> The memfd test requires to insert the fuse module (CONFIG_FUSE_FS).
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> ---
>  tools/testing/selftests/memfd/config | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tools/testing/selftests/memfd/config
> 
> diff --git a/tools/testing/selftests/memfd/config b/tools/testing/selftests/memfd/config
> new file mode 100644
> index 0000000..835c7f4
> --- /dev/null
> +++ b/tools/testing/selftests/memfd/config
> @@ -0,0 +1 @@
> +CONFIG_FUSE_FS=m
> 


Thanks for the patch. Applied to linux-kselftest fixes for 4.16-rc3

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
