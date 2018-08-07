From: rppt at linux.vnet.ibm.com (Mike Rapoport)
Date: Tue, 7 Aug 2018 09:56:42 +0300
Subject: [PATCH v2 4/4] userfaultfd: selftest: Cope if shmem doesn't
 support zeropage
In-Reply-To: <20180803220046.4019-5-bauerman@linux.ibm.com>
References: <20180803220046.4019-1-bauerman@linux.ibm.com>
 <20180803220046.4019-5-bauerman@linux.ibm.com>
Message-ID: <20180807065642.GD20140@rapoport-lnx>

Hi,

On Fri, Aug 03, 2018 at 07:00:46PM -0300, Thiago Jung Bauermann wrote:
> If userfaultfd runs on a system that doesn't support UFFDIO_ZEROPAGE for
> shared memory, it currently ends with error code 1 which indicates test
> failure:
> 
>   # ./userfaultfd shmem 10 10
>   nr_pages: 160, nr_pages_per_cpu: 80
>   bounces: 9, mode: rnd poll, unexpected missing ioctl for anon memory
>   # echo $?
>   1
> 
> Change userfaultfd_zeropage_test() to return KSFT_SKIP to indicate that
> the test is being skipped.

I took a deeper look at what userfaultfd_zeropage_test() does and,
apparently, I've mislead you. The test checks if the range has
UFFDIO_ZEROPAGE and verifies that it works if yes; otherwise the test
verifies that EINVAL is returned.

Can you please check if the patch below works in your environment?

>From 7a34c84c0461b5073742275638c44b6535d19166 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt at linux.vnet.ibm.com>
Date: Tue, 7 Aug 2018 09:44:19 +0300
Subject: [PATCH] userfaultfd: selftest: make supported range ioctl
 verification more robust

When userfaultfd tests runs on older kernel that does not support
UFFDIO_ZEROPAGE for shared memory it fails at the ioctl verification.

Split out the verification that supported ioctls are superset of the
expected ioctls and relax the checks for UFFDIO_ZEROPAGE for shared memory
areas.

Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 63 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 7b8171e3128a..a64bc38bc0e1 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -271,6 +271,32 @@ static int my_bcmp(char *str1, char *str2, size_t n)
 	return 0;
 }
 
+static int verify_ioctls(unsigned long supported_ioctls)
+{
+	unsigned long expected_ioctls = uffd_test_ops->expected_ioctls;
+
+	if ((supported_ioctls & expected_ioctls) == expected_ioctls)
+		return 0;
+
+	/*
+	 * For older kernels shared memory may not have UFFDIO_ZEROPAGE.
+	 * In this case we just mask it out from the
+	 * expected_ioctls. The userfaultfd_zeropage_test will then
+	 * verify that an attempt to use UFFDIO_ZEROPAGE returns
+	 * EINVAL
+	 */
+	if (test_type == TEST_SHMEM) {
+		expected_ioctls &= ~(1 << _UFFDIO_ZEROPAGE);
+		if ((supported_ioctls & expected_ioctls) == expected_ioctls) {
+			uffd_test_ops->expected_ioctls = expected_ioctls;
+			return 0;
+		}
+	}
+
+	fprintf(stderr,	"unexpected missing ioctl\n");
+	return 1;
+}
+
 static void *locking_thread(void *arg)
 {
 	unsigned long cpu = (unsigned long) arg;
@@ -851,7 +877,6 @@ static int uffdio_zeropage(int ufd, unsigned long offset)
 static int userfaultfd_zeropage_test(void)
 {
 	struct uffdio_register uffdio_register;
-	unsigned long expected_ioctls;
 
 	printf("testing UFFDIO_ZEROPAGE: ");
 	fflush(stdout);
@@ -867,12 +892,8 @@ static int userfaultfd_zeropage_test(void)
 	if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register))
 		fprintf(stderr, "register failure\n"), exit(1);
 
-	expected_ioctls = uffd_test_ops->expected_ioctls;
-	if ((uffdio_register.ioctls & expected_ioctls) !=
-	    expected_ioctls)
-		fprintf(stderr,
-			"unexpected missing ioctl for anon memory\n"),
-			exit(1);
+	if (verify_ioctls(uffdio_register.ioctls))
+		return 1;
 
 	if (uffdio_zeropage(uffd, 0)) {
 		if (my_bcmp(area_dst, zeropage, page_size))
@@ -887,7 +908,6 @@ static int userfaultfd_zeropage_test(void)
 static int userfaultfd_events_test(void)
 {
 	struct uffdio_register uffdio_register;
-	unsigned long expected_ioctls;
 	unsigned long userfaults;
 	pthread_t uffd_mon;
 	int err, features;
@@ -912,12 +932,8 @@ static int userfaultfd_events_test(void)
 	if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register))
 		fprintf(stderr, "register failure\n"), exit(1);
 
-	expected_ioctls = uffd_test_ops->expected_ioctls;
-	if ((uffdio_register.ioctls & expected_ioctls) !=
-	    expected_ioctls)
-		fprintf(stderr,
-			"unexpected missing ioctl for anon memory\n"),
-			exit(1);
+	if (verify_ioctls(uffdio_register.ioctls))
+		return 1;
 
 	if (pthread_create(&uffd_mon, &attr, uffd_poll_thread, NULL))
 		perror("uffd_poll_thread create"), exit(1);
@@ -947,7 +963,6 @@ static int userfaultfd_events_test(void)
 static int userfaultfd_sig_test(void)
 {
 	struct uffdio_register uffdio_register;
-	unsigned long expected_ioctls;
 	unsigned long userfaults;
 	pthread_t uffd_mon;
 	int err, features;
@@ -971,12 +986,8 @@ static int userfaultfd_sig_test(void)
 	if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register))
 		fprintf(stderr, "register failure\n"), exit(1);
 
-	expected_ioctls = uffd_test_ops->expected_ioctls;
-	if ((uffdio_register.ioctls & expected_ioctls) !=
-	    expected_ioctls)
-		fprintf(stderr,
-			"unexpected missing ioctl for anon memory\n"),
-			exit(1);
+	if (verify_ioctls(uffdio_register.ioctls))
+		return 1;
 
 	if (faulting_process(1))
 		fprintf(stderr, "faulting process failed\n"), exit(1);
@@ -1076,8 +1087,6 @@ static int userfaultfd_stress(void)
 
 	err = 0;
 	while (bounces--) {
-		unsigned long expected_ioctls;
-
 		printf("bounces: %d, mode:", bounces);
 		if (bounces & BOUNCE_RANDOM)
 			printf(" rnd");
@@ -1103,13 +1112,9 @@ static int userfaultfd_stress(void)
 			fprintf(stderr, "register failure\n");
 			return 1;
 		}
-		expected_ioctls = uffd_test_ops->expected_ioctls;
-		if ((uffdio_register.ioctls & expected_ioctls) !=
-		    expected_ioctls) {
-			fprintf(stderr,
-				"unexpected missing ioctl for anon memory\n");
+
+		if (verify_ioctls(uffdio_register.ioctls))
 			return 1;
-		}
 
 		if (area_dst_alias) {
 			uffdio_register.range.start = (unsigned long)
-- 
2.7.4

 
> Also change userfaultfd_events_test() and userfaultfd_stress() to ignore
> the missing UFFDIO_ZEROPAGE bit from the list of supported ioctls since
> these tests don't require that feature.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
> ---
>  tools/testing/selftests/vm/userfaultfd.c | 36 +++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
> index c84e44ddf314..00f1ca663d67 100644
> --- a/tools/testing/selftests/vm/userfaultfd.c
> +++ b/tools/testing/selftests/vm/userfaultfd.c
> @@ -852,6 +852,16 @@ static int uffdio_zeropage(int ufd, unsigned long offset)
>  	return __uffdio_zeropage(ufd, offset, false);
>  }
> 
> +/* Tells whether the kernel doesn't support ZEROPAGE on shared memory VMAs. */
> +static bool shmem_without_zeropage_support(unsigned long expected_ioctls,
> +					   unsigned long supported_ioctls)
> +{
> +	/* Turn off ZEROPAGE bit from expected_ioctls. */
> +	expected_ioctls &= ~(1 << _UFFDIO_ZEROPAGE);
> +
> +	return test_type == TEST_SHMEM && supported_ioctls == expected_ioctls;
> +}
> +
>  /* exercise UFFDIO_ZEROPAGE */
>  static int userfaultfd_zeropage_test(void)
>  {
> @@ -877,10 +887,20 @@ static int userfaultfd_zeropage_test(void)
> 
>  	expected_ioctls = uffd_test_ops->expected_ioctls;
>  	if ((uffdio_register.ioctls & expected_ioctls) !=
> -	    expected_ioctls)
> +	    expected_ioctls) {
> +		close(uffd);
> +
> +		if (shmem_without_zeropage_support(expected_ioctls,
> +						   uffdio_register.ioctls)) {
> +			fprintf(stderr,
> +				"UFFDIO_ZEROPAGE unsupported in shmem VMAs\n");
> +			return KSFT_SKIP;
> +		}
> +
>  		fprintf(stderr,
> -			"unexpected missing ioctl for anon memory\n"),
> -			exit(1);
> +			"unexpected missing ioctl for anon memory\n");
> +		return 1;
> +	}
> 
>  	if (uffdio_zeropage(uffd, 0)) {
>  		if (my_bcmp(area_dst, zeropage, page_size))
> @@ -924,7 +944,10 @@ static int userfaultfd_events_test(void)
> 
>  	expected_ioctls = uffd_test_ops->expected_ioctls;
>  	if ((uffdio_register.ioctls & expected_ioctls) !=
> -	    expected_ioctls)
> +	    expected_ioctls &&
> +	    /* No need for zeropage support in this test, so ignore it. */
> +	    !shmem_without_zeropage_support(expected_ioctls,
> +					    uffdio_register.ioctls))
>  		fprintf(stderr,
>  			"unexpected missing ioctl for anon memory\n"),
>  			exit(1);
> @@ -1117,7 +1140,10 @@ static int userfaultfd_stress(void)
>  		}
>  		expected_ioctls = uffd_test_ops->expected_ioctls;
>  		if ((uffdio_register.ioctls & expected_ioctls) !=
> -		    expected_ioctls) {
> +		    expected_ioctls &&
> +		    /* No need for zeropage support in this test, so ignore it. */
> +		    !shmem_without_zeropage_support(expected_ioctls,
> +						    uffdio_register.ioctls)) {
>  			fprintf(stderr,
>  				"unexpected missing ioctl for anon memory\n");
>  			return 1;

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
