From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Tue, 28 Aug 2018 14:26:08 -0300
Subject: [PATCH v3 4/4] userfaultfd: selftest: make supported range ioctl
 verification more robust
In-Reply-To: <20180828172608.30075-1-bauerman@linux.ibm.com>
References: <20180828172608.30075-1-bauerman@linux.ibm.com>
Message-ID: <20180828172608.30075-5-bauerman@linux.ibm.com>

From: Mike Rapoport <rppt at linux.vnet.ibm.com>

When userfaultfd tests runs on older kernel that does not support
UFFDIO_ZEROPAGE for shared memory it fails at the ioctl verification.

Split out the verification that supported ioctls are superset of the
expected ioctls and relax the checks for UFFDIO_ZEROPAGE for shared memory
areas.

Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 63 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index c84e44ddf314..676cbedff3db 100644
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
+	fprintf(stderr, "unexpected missing ioctl\n");
+	return 1;
+}
+
 static void *locking_thread(void *arg)
 {
 	unsigned long cpu = (unsigned long) arg;
@@ -856,7 +882,6 @@ static int uffdio_zeropage(int ufd, unsigned long offset)
 static int userfaultfd_zeropage_test(void)
 {
 	struct uffdio_register uffdio_register;
-	unsigned long expected_ioctls;
 	int err;
 
 	printf("testing UFFDIO_ZEROPAGE: ");
@@ -875,12 +900,8 @@ static int userfaultfd_zeropage_test(void)
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
@@ -895,7 +916,6 @@ static int userfaultfd_zeropage_test(void)
 static int userfaultfd_events_test(void)
 {
 	struct uffdio_register uffdio_register;
-	unsigned long expected_ioctls;
 	unsigned long userfaults;
 	pthread_t uffd_mon;
 	int err, features;
@@ -922,12 +942,8 @@ static int userfaultfd_events_test(void)
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
@@ -957,7 +973,6 @@ static int userfaultfd_events_test(void)
 static int userfaultfd_sig_test(void)
 {
 	struct uffdio_register uffdio_register;
-	unsigned long expected_ioctls;
 	unsigned long userfaults;
 	pthread_t uffd_mon;
 	int err, features;
@@ -982,12 +997,8 @@ static int userfaultfd_sig_test(void)
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
@@ -1088,8 +1099,6 @@ static int userfaultfd_stress(void)
 
 	err = 0;
 	while (bounces--) {
-		unsigned long expected_ioctls;
-
 		printf("bounces: %d, mode:", bounces);
 		if (bounces & BOUNCE_RANDOM)
 			printf(" rnd");
@@ -1115,13 +1124,9 @@ static int userfaultfd_stress(void)
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
