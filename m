From: rppt at linux.ibm.com (Mike Rapoport)
Date: Tue, 28 May 2019 08:33:55 +0300
Subject: [PATCH] userfaultfd: selftest: fix compiler warning
In-Reply-To: <20190527151859.GA3217@ip-172-31-44-144.us-west-2.compute.internal>
References: <20190527151859.GA3217@ip-172-31-44-144.us-west-2.compute.internal>
Message-ID: <20190528053355.GB5055@rapoport-lnx>

On Mon, May 27, 2019 at 03:18:59PM +0000, Alakesh Haloi wrote:
> Fixes following compiler warning
> 
> userfaultfd.c: In function ‘usage’:
> userfaultfd.c:126:2: warning: format not a string literal and no format
> 	arguments [-Wformat-security]
>   fprintf(stderr, examples);
> 
> Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>

Reviewed-by: Mike Rapoport <rppt at linux.ibm.com>

> ---
>  tools/testing/selftests/vm/userfaultfd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
> index 5d1db824f73a..b3e6497b080c 100644
> --- a/tools/testing/selftests/vm/userfaultfd.c
> +++ b/tools/testing/selftests/vm/userfaultfd.c
> @@ -123,7 +123,7 @@ static void usage(void)
>  	fprintf(stderr, "Supported <test type>: anon, hugetlb, "
>  		"hugetlb_shared, shmem\n\n");
>  	fprintf(stderr, "Examples:\n\n");
> -	fprintf(stderr, examples);
> +	fprintf(stderr, "%s", examples);
>  	exit(1);
>  }
> 
> -- 
> 2.17.1
> 

-- 
Sincerely yours,
Mike.
