From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Fri,  3 Aug 2018 19:00:45 -0300
Subject: [PATCH v2 3/4] userfaultfd: selftest: Skip test if a feature isn't
 supported
In-Reply-To: <20180803220046.4019-1-bauerman@linux.ibm.com>
References: <20180803220046.4019-1-bauerman@linux.ibm.com>
Message-ID: <20180803220046.4019-4-bauerman@linux.ibm.com>

If userfaultfd runs on a system that doesn't support some feature it is
trying to test, it currently ends with error code 1 which indicates
test failure:

  # ./userfaultfd anon 10 10
  nr_pages: 160, nr_pages_per_cpu: 80
  bounces: 9, mode: rnd poll, userfaults: 7 59
  bounces: 8, mode: poll, userfaults: 0 0
  bounces: 7, mode: rnd racing ver, userfaults: 45 2
  bounces: 6, mode: racing ver, userfaults: 3 1
  bounces: 5, mode: rnd ver, userfaults: 55 32
  bounces: 4, mode: ver, userfaults: 69 0
  bounces: 3, mode: rnd racing, userfaults: 1 1
  bounces: 2, mode: racing, userfaults: 65 0
  bounces: 1, mode: rnd, userfaults: 44 1
  bounces: 0, mode:, userfaults: 3 2
  testing UFFDIO_ZEROPAGE: done.
  testing signal delivery: UFFDIO_API
  # echo $?
  1

Make each test return KSFT_SKIP instead, which is more accurate since it is
not a real test failure and try to run the other tests which may still
work:

  # ./userfaultfd anon 10 10
  nr_pages: 160, nr_pages_per_cpu: 80
  bounces: 9, mode: rnd poll, userfaults: 65 27
  bounces: 8, mode: poll, userfaults: 0 0
  bounces: 7, mode: rnd racing ver, userfaults: 60 29
  bounces: 6, mode: racing ver, userfaults: 58 1
  bounces: 5, mode: rnd ver, userfaults: 69 3
  bounces: 4, mode: ver, userfaults: 35 27
  bounces: 3, mode: rnd racing, userfaults: 44 0
  bounces: 2, mode: racing, userfaults: 40 25
  bounces: 1, mode: rnd, userfaults: 2 1
  bounces: 0, mode:, userfaults: 0 1
  testing UFFDIO_ZEROPAGE: done.
  testing signal delivery: UFFDIO_API: Invalid argument
  testing events (fork, remap, remove): userfaults: 160
  # echo $?
  0

While at it, also improve the error message of the ioctl(UFFDIO_API) call.

Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 42 +++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index d728bd1cb33c..c84e44ddf314 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -647,8 +647,11 @@ static int userfaultfd_open(int features)
 	uffdio_api.api = UFFD_API;
 	uffdio_api.features = features;
 	if (ioctl(uffd, UFFDIO_API, &uffdio_api)) {
-		fprintf(stderr, "UFFDIO_API\n");
-		return 1;
+		int errnum = errno;
+
+		perror("UFFDIO_API");
+
+		return errnum == EINVAL ? KSFT_SKIP : 1;
 	}
 	if (uffdio_api.api != UFFD_API) {
 		fprintf(stderr, "UFFDIO_API error %Lu\n", uffdio_api.api);
@@ -854,6 +857,7 @@ static int userfaultfd_zeropage_test(void)
 {
 	struct uffdio_register uffdio_register;
 	unsigned long expected_ioctls;
+	int err;
 
 	printf("testing UFFDIO_ZEROPAGE: ");
 	fflush(stdout);
@@ -861,8 +865,10 @@ static int userfaultfd_zeropage_test(void)
 	if (uffd_test_ops->release_pages(area_dst))
 		return 1;
 
-	if (userfaultfd_open(0))
-		return 1;
+	err = userfaultfd_open(0);
+	if (err)
+		return err;
+
 	uffdio_register.range.start = (unsigned long) area_dst;
 	uffdio_register.range.len = nr_pages * page_size;
 	uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;
@@ -904,8 +910,10 @@ static int userfaultfd_events_test(void)
 
 	features = UFFD_FEATURE_EVENT_FORK | UFFD_FEATURE_EVENT_REMAP |
 		UFFD_FEATURE_EVENT_REMOVE;
-	if (userfaultfd_open(features))
-		return 1;
+	err = userfaultfd_open(features);
+	if (err)
+		return err;
+
 	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
 
 	uffdio_register.range.start = (unsigned long) area_dst;
@@ -963,8 +971,9 @@ static int userfaultfd_sig_test(void)
 		return 1;
 
 	features = UFFD_FEATURE_EVENT_FORK|UFFD_FEATURE_SIGBUS;
-	if (userfaultfd_open(features))
-		return 1;
+	err = userfaultfd_open(features);
+	if (err)
+		return err;
 	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
 
 	uffdio_register.range.start = (unsigned long) area_dst;
@@ -1029,8 +1038,9 @@ static int userfaultfd_stress(void)
 	if (!area_dst)
 		return 1;
 
-	if (userfaultfd_open(0))
-		return 1;
+	err = userfaultfd_open(0);
+	if (err)
+		return err;
 
 	count_verify = malloc(nr_pages * sizeof(unsigned long long));
 	if (!count_verify) {
@@ -1201,8 +1211,16 @@ static int userfaultfd_stress(void)
 		return err;
 
 	close(uffd);
-	return userfaultfd_zeropage_test() || userfaultfd_sig_test()
-		|| userfaultfd_events_test();
+
+	err = userfaultfd_zeropage_test();
+	if (err && err != KSFT_SKIP)
+		return err;
+
+	err = userfaultfd_sig_test();
+	if (err && err != KSFT_SKIP)
+		return err;
+
+	return userfaultfd_events_test();
 }
 
 /*

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
