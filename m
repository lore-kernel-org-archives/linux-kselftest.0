From: shuah@kernel.org (Shuah Khan)
Date: Tue, 13 Feb 2018 14:30:14 -0700
Subject: [PATCH] selftest/vDSO: fix O=
In-Reply-To: <20180211105950.14720-1-linux@dominikbrodowski.net>
References: <20180211105950.14720-1-linux@dominikbrodowski.net>
Message-ID: <03fc8983-8ed2-0a49-4268-6dd1f79d22fa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180213213014.dftDRL4blPORXXEbKrit7ZBIKEzkuBWx7HM7j5BDKzU@z>

On 02/11/2018 03:59 AM, Dominik Brodowski wrote:
> The vDSO selftests ignored the O= or KBUILD_OUTPUT= parameters. Fix it.
> 
> Signed-off-by: Dominik Brodowski <linux at dominikbrodowski.net>
> ---
>  tools/testing/selftests/vDSO/Makefile | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
> index 3d5a62ff7d31..f5d7a7851e21 100644
> --- a/tools/testing/selftests/vDSO/Makefile
> +++ b/tools/testing/selftests/vDSO/Makefile
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> +include ../lib.mk
> +
>  ifndef CROSS_COMPILE
>  CFLAGS := -std=gnu99
>  CFLAGS_vdso_standalone_test_x86 := -nostdlib -fno-asynchronous-unwind-tables -fno-stack-protector
> @@ -6,16 +8,14 @@ ifeq ($(CONFIG_X86_32),y)
>  LDLIBS += -lgcc_s
>  endif
>  
> -TEST_PROGS := vdso_test vdso_standalone_test_x86
> +TEST_PROGS := $(OUTPUT)/vdso_test $(OUTPUT)/vdso_standalone_test_x86
>  
>  all: $(TEST_PROGS)
> -vdso_test: parse_vdso.c vdso_test.c
> -vdso_standalone_test_x86: vdso_standalone_test_x86.c parse_vdso.c
> +$(OUTPUT)/vdso_test: parse_vdso.c vdso_test.c
> +$(OUTPUT)/vdso_standalone_test_x86: vdso_standalone_test_x86.c parse_vdso.c
>  	$(CC) $(CFLAGS) $(CFLAGS_vdso_standalone_test_x86) \
>  		vdso_standalone_test_x86.c parse_vdso.c \
> -		-o vdso_standalone_test_x86
> +		-o $@
>  
> -include ../lib.mk
> -clean:
> -	rm -fr $(TEST_PROGS)
> +EXTRA_CLEAN := $(TEST_PROGS)
>  endif
> 

Thanks for the patch. Applied to linux-kselftest fixes for 4.16-rc3

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
