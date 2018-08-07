From: rppt at linux.vnet.ibm.com (Mike Rapoport)
Date: Tue, 7 Aug 2018 09:50:59 +0300
Subject: [PATCH v2 2/4] userfaultfd: selftest: Skip test if userfaultfd()
 syscall not supported
In-Reply-To: <20180803220046.4019-3-bauerman@linux.ibm.com>
References: <20180803220046.4019-1-bauerman@linux.ibm.com>
 <20180803220046.4019-3-bauerman@linux.ibm.com>
Message-ID: <20180807065057.GB20140@rapoport-lnx>

On Fri, Aug 03, 2018 at 07:00:44PM -0300, Thiago Jung Bauermann wrote:
> Since there's no point in doing anything in this case, immediately exit the
> process.
> 
> And take the opportunity to improve the error message.
> 
> Before:
> 
>   # ./userfaultfd shmem 10 10
>   nr_pages: 160, nr_pages_per_cpu: 40
>   userfaultfd syscall not available in this kernel
>   # echo $?
>   1
> 
> After:
> 
>   # ./userfaultfd shmem 10 10
>   nr_pages: 160, nr_pages_per_cpu: 40
>   userfaultfd syscall not available in this kernel: Function not implemented
>   # echo $?
>   4
> 
> Suggested-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>

Acked-by: Mike Rapoport <rppt at linux.vnet.ibm.com>

> ---
>  tools/testing/selftests/vm/userfaultfd.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
> index e4099afe7557..d728bd1cb33c 100644
> --- a/tools/testing/selftests/vm/userfaultfd.c
> +++ b/tools/testing/selftests/vm/userfaultfd.c
> @@ -636,9 +636,11 @@ static int userfaultfd_open(int features)
> 
>  	uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
>  	if (uffd < 0) {
> -		fprintf(stderr,
> -			"userfaultfd syscall not available in this kernel\n");
> -		return 1;
> +		int errnum = errno;
> +
> +		perror("userfaultfd syscall not available in this kernel");
> +
> +		exit(errnum == ENOSYS ? KSFT_SKIP : 1);
>  	}
>  	uffd_flags = fcntl(uffd, F_GETFD, NULL);
> 

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
