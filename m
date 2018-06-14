From: tom.hromatka@oracle.com (Tom Hromatka)
Date: Thu, 14 Jun 2018 12:49:08 -0600
Subject: [PATCH] selftests: sparc64: Add missing SPDX License Identifiers
In-Reply-To: <20180614010559.5144-1-shuah@kernel.org>
References: <20180614010559.5144-1-shuah@kernel.org>
Message-ID: <2f9d0d78-067f-7a25-dc10-f4476a7ae54c@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614184908.cOKZANirYmECxJDYTW9mMuMnBuBTrgeclvsfanpxB4M@z>



On 06/13/2018 07:05 PM, Shuah Khan (Samsung OSG) wrote:
> Add missing SPDX License Identifiers to Makefile(s).
>
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

Reviewed-by: Tom Hromatka <tom.hromatka at oracle.com>

> ---
>   tools/testing/selftests/sparc64/Makefile         | 1 +
>   tools/testing/selftests/sparc64/drivers/Makefile | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/sparc64/Makefile b/tools/testing/selftests/sparc64/Makefile
> index 76b2206932c3..a19531dba4dc 100644
> --- a/tools/testing/selftests/sparc64/Makefile
> +++ b/tools/testing/selftests/sparc64/Makefile
> @@ -1,3 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
>   uname_M := $(shell uname -m 2>/dev/null || echo not)
>   ARCH ?= $(shell echo $(uname_M) | sed -e s/x86_64/x86/)
>   
> diff --git a/tools/testing/selftests/sparc64/drivers/Makefile b/tools/testing/selftests/sparc64/drivers/Makefile
> index 6264f40bbdbc..deb0df415565 100644
> --- a/tools/testing/selftests/sparc64/drivers/Makefile
> +++ b/tools/testing/selftests/sparc64/drivers/Makefile
> @@ -1,4 +1,4 @@
> -
> +# SPDX-License-Identifier: GPL-2.0
>   INCLUDEDIR := -I.
>   CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
>   

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
