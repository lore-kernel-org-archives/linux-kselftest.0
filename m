From: mojha@codeaurora.org (Mukesh Ojha)
Date: Thu, 28 Mar 2019 12:03:41 +0530
Subject: [PATCH] selftests:powerpc/tm/tm-vmx-unavail.c : Remove duplicate
 header
In-Reply-To: <1553723356-40069-1-git-send-email-jagdsh.linux@gmail.com>
References: <1553723356-40069-1-git-send-email-jagdsh.linux@gmail.com>
Message-ID: <682ef220-efac-3c11-0205-35c00fa4b611@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190328063341.aFujBcci6g6SQpw_lHxlw95IAfNBwhtFRmuUf1LoXLk@z>


On 3/28/2019 3:19 AM, jagdsh.linux@gmail.com wrote:
> From: Jagadeesh Pagadala <jagdsh.linux at gmail.com>
>
> Remove duplicate header which is included twice.
>
> Signed-off-by: Jagadeesh Pagadala <jagdsh.linux at gmail.com>
Reviewed-by: Mukesh Ojha <mojha at codeaurora.org>

-Mukesh
> ---
>   tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
> index 137185b..1cb963a 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
> @@ -17,7 +17,6 @@
>   #include <pthread.h>
>   #include <sys/mman.h>
>   #include <unistd.h>
> -#include <pthread.h>
>   
>   #include "tm.h"
>   #include "utils.h"
