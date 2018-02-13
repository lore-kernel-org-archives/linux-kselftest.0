From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Tue, 13 Feb 2018 14:24:38 -0700
Subject: [PATCH] selftests/memfd: add run_fuse_test.sh to TEST_FILES
In-Reply-To: <1517955779-11386-1-git-send-email-daniel.diaz@linaro.org>
References: <1517955779-11386-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <de659f18-cba6-daeb-3289-b6b36cae1dbb@osg.samsung.com>

On 02/06/2018 03:22 PM, Daniel Díaz wrote:
> From: Anders Roxell <anders.roxell at linaro.org>
> 
> While testing memfd tests, there is a missing script, as reported by
> kselftest:
> 
> ./run_tests.sh: line 7: ./run_fuse_test.sh: No such file or directory
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> ---
>  tools/testing/selftests/memfd/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/memfd/Makefile b/tools/testing/selftests/memfd/Makefile
> index a5276a9..0862e6f 100644
> --- a/tools/testing/selftests/memfd/Makefile
> +++ b/tools/testing/selftests/memfd/Makefile
> @@ -5,6 +5,7 @@ CFLAGS += -I../../../../include/
>  CFLAGS += -I../../../../usr/include/
>  
>  TEST_PROGS := run_tests.sh
> +TEST_FILES := run_fuse_test.sh
>  TEST_GEN_FILES := memfd_test fuse_mnt fuse_test
>  
>  fuse_mnt.o: CFLAGS += $(shell pkg-config fuse --cflags)
> 

Looks like Andrew applied this mm. It will go through mm tree.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
