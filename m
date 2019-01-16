From: shuah@kernel.org (shuah)
Date: Wed, 16 Jan 2019 14:56:42 -0700
Subject: [PATCH 1/4] selftests: lib: allow to override CC in the top-level
 Makefile
In-Reply-To: <20190116174320.14938-1-daniel.diaz@linaro.org>
References: <20190116174320.14938-1-daniel.diaz@linaro.org>
Message-ID: <7d75f420-d624-d53d-4fa1-3827c90fa608@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190116215642.ljEVq4amETTI8nLgswg5Z1CcwsLVoAOtbCNhMSqscBA@z>

On 1/16/19 10:43 AM, Daniel Díaz wrote:
> From: Fathi Boudra <fathi.boudra at linaro.org>
> 
> Relax CC assignment to allow to override CC in the top-level Makefile.
> 
> Signed-off-by: Denys Dmytriyenko <denys at ti.com>
> ---
>   tools/testing/selftests/lib.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 8b0f16409ed7..0f9c47eaaa6f 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -1,6 +1,6 @@
>   # This mimics the top-level Makefile. We do it explicitly here so that this
>   # Makefile can operate with or without the kbuild infrastructure.
> -CC := $(CROSS_COMPILE)gcc
> +CC ?= $(CROSS_COMPILE)gcc
>   
>   ifeq (0,$(MAKELEVEL))
>   OUTPUT := $(shell pwd)
> 

What problem does this fix?

thanks,
-- Shuah
