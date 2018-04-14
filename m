From: rppt at linux.vnet.ibm.com (Mike Rapoport)
Date: Sat, 14 Apr 2018 20:28:27 +0300
Subject: [PATCH] selftests:vm: add include file
In-Reply-To: <1523732936-42546-1-git-send-email-peng.hao2@zte.com.cn>
References: <1523732936-42546-1-git-send-email-peng.hao2@zte.com.cn>
Message-ID: <20180414172826.GA3211@rapoport-lnx>

On Sun, Apr 15, 2018 at 03:08:56AM +0800, Peng Hao wrote:
> userfaultfd.c: In function ‘hugetlb_release_pages’:
> userfaultfd.c:145:25: error: ‘FALLOC_FL_PUNCH_HOLE’ undeclared 
> (first use in this function)
> 
> Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
> ---
>  tools/testing/selftests/vm/userfaultfd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
> index de2f9ec..d8fe447 100644
> --- a/tools/testing/selftests/vm/userfaultfd.c
> +++ b/tools/testing/selftests/vm/userfaultfd.c
> @@ -68,6 +68,7 @@
>  #include <linux/userfaultfd.h>
>  #include <setjmp.h>
>  #include <stdbool.h>
> +#include <linux/falloc.h>
  
The FALLOC_FL_PUNCH_HOLE definition should come from #include <fcntl.h>.
What are the versions of your kernel and the libc-development package?

>  #ifdef __NR_userfaultfd
>  
> -- 
> 1.8.3.1
> 

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
