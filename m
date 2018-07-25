From: rppt at linux.vnet.ibm.com (Mike Rapoport)
Date: Wed, 25 Jul 2018 17:11:48 +0300
Subject: [PATCH 2/3] userfaultfd: selftest: Skip test if a feature isn't
 supported
In-Reply-To: <20180725024209.32586-3-bauerman@linux.ibm.com>
References: <20180725024209.32586-1-bauerman@linux.ibm.com>
 <20180725024209.32586-3-bauerman@linux.ibm.com>
Message-ID: <20180725141148.GD25188@rapoport-lnx>

Hi,

On Tue, Jul 24, 2018 at 11:42:08PM -0300, Thiago Jung Bauermann wrote:
> If userfaultfd runs on a system that doesn't support some feature it is
> trying to test, it currently ends with error code 1 which indicates
> test failure:
> 
>   # ./userfaultfd anon 10 10
>   nr_pages: 160, nr_pages_per_cpu: 80
>   bounces: 9, mode: rnd poll, userfaults: 7 59
>   bounces: 8, mode: poll, userfaults: 0 0
>   bounces: 7, mode: rnd racing ver, userfaults: 45 2
>   bounces: 6, mode: racing ver, userfaults: 3 1
>   bounces: 5, mode: rnd ver, userfaults: 55 32
>   bounces: 4, mode: ver, userfaults: 69 0
>   bounces: 3, mode: rnd racing, userfaults: 1 1
>   bounces: 2, mode: racing, userfaults: 65 0
>   bounces: 1, mode: rnd, userfaults: 44 1
>   bounces: 0, mode:, userfaults: 3 2
>   testing UFFDIO_ZEROPAGE: done.
>   testing signal delivery: UFFDIO_API
>   # echo $?
>   1
> 
> Make the testcase return KSFT_SKIP instead, which is more accurate since it
> is not a real test failure:
> 
>   # ./userfaultfd anon 10 10
>   nr_pages: 160, nr_pages_per_cpu: 80
>   bounces: 9, mode: rnd poll, userfaults: 3 0
>   bounces: 8, mode: poll, userfaults: 6 1
>   bounces: 7, mode: rnd racing ver, userfaults: 3 1
>   bounces: 6, mode: racing ver, userfaults: 2 1
>   bounces: 5, mode: rnd ver, userfaults: 2 1
>   bounces: 4, mode: ver, userfaults: 3 47
>   bounces: 3, mode: rnd racing, userfaults: 38 0
>   bounces: 2, mode: racing, userfaults: 4 61
>   bounces: 1, mode: rnd, userfaults: 16 6
>   bounces: 0, mode:, userfaults: 55 25
>   testing UFFDIO_ZEROPAGE: done.
>   testing signal delivery: UFFDIO_API: Invalid argument
>   # echo $?
>   4
> 
> While at it, also improve the error message of the ioctl(UFFDIO_API) call.

Can you please also make the test return KSFT_SKIP if userfaultfd(2) fails
with ENOSYS?
 
> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
> ---
>  tools/testing/selftests/vm/userfaultfd.c | 41 ++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
> index e4099afe7557..bc9ec38fbc34 100644
> --- a/tools/testing/selftests/vm/userfaultfd.c
> +++ b/tools/testing/selftests/vm/userfaultfd.c
> @@ -645,8 +645,11 @@ static int userfaultfd_open(int features)
>  	uffdio_api.api = UFFD_API;
>  	uffdio_api.features = features;
>  	if (ioctl(uffd, UFFDIO_API, &uffdio_api)) {
> -		fprintf(stderr, "UFFDIO_API\n");
> -		return 1;
> +		int errnum = errno;
> +
> +		perror("UFFDIO_API");
> +
> +		return errnum == EINVAL ? KSFT_SKIP : 1;
>  	}
>  	if (uffdio_api.api != UFFD_API) {
>  		fprintf(stderr, "UFFDIO_API error %Lu\n", uffdio_api.api);
> @@ -852,6 +855,7 @@ static int userfaultfd_zeropage_test(void)
>  {
>  	struct uffdio_register uffdio_register;
>  	unsigned long expected_ioctls;
> +	int err;
> 
>  	printf("testing UFFDIO_ZEROPAGE: ");
>  	fflush(stdout);
> @@ -859,8 +863,10 @@ static int userfaultfd_zeropage_test(void)
>  	if (uffd_test_ops->release_pages(area_dst))
>  		return 1;
> 
> -	if (userfaultfd_open(0))
> -		return 1;
> +	err = userfaultfd_open(0);
> +	if (err)
> +		return err;
> +
>  	uffdio_register.range.start = (unsigned long) area_dst;
>  	uffdio_register.range.len = nr_pages * page_size;
>  	uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;
> @@ -902,8 +908,9 @@ static int userfaultfd_events_test(void)
> 
>  	features = UFFD_FEATURE_EVENT_FORK | UFFD_FEATURE_EVENT_REMAP |
>  		UFFD_FEATURE_EVENT_REMOVE;
> -	if (userfaultfd_open(features))
> -		return 1;
> +	err = userfaultfd_open(features);
> +	if (err)
> +		return err;
>  	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
> 
>  	uffdio_register.range.start = (unsigned long) area_dst;
> @@ -961,8 +968,9 @@ static int userfaultfd_sig_test(void)
>  		return 1;
> 
>  	features = UFFD_FEATURE_EVENT_FORK|UFFD_FEATURE_SIGBUS;
> -	if (userfaultfd_open(features))
> -		return 1;
> +	err = userfaultfd_open(features);
> +	if (err)
> +		return err;
>  	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
> 
>  	uffdio_register.range.start = (unsigned long) area_dst;
> @@ -1027,8 +1035,9 @@ static int userfaultfd_stress(void)
>  	if (!area_dst)
>  		return 1;
> 
> -	if (userfaultfd_open(0))
> -		return 1;
> +	err = userfaultfd_open(0);
> +	if (err)
> +		return err;
> 
>  	count_verify = malloc(nr_pages * sizeof(unsigned long long));
>  	if (!count_verify) {
> @@ -1199,8 +1208,16 @@ static int userfaultfd_stress(void)
>  		return err;
> 
>  	close(uffd);
> -	return userfaultfd_zeropage_test() || userfaultfd_sig_test()
> -		|| userfaultfd_events_test();
> +
> +	err = userfaultfd_zeropage_test();
> +	if (err)
> +		return err;
> +
> +	err = userfaultfd_sig_test();
> +	if (err)
> +		return err;
> +
> +	return userfaultfd_events_test();
>  }
> 
>  /*

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
