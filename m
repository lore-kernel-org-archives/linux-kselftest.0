From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Fri,  3 Aug 2018 19:00:46 -0300
Subject: [PATCH v2 4/4] userfaultfd: selftest: Cope if shmem doesn't support
 zeropage
In-Reply-To: <20180803220046.4019-1-bauerman@linux.ibm.com>
References: <20180803220046.4019-1-bauerman@linux.ibm.com>
Message-ID: <20180803220046.4019-5-bauerman@linux.ibm.com>

If userfaultfd runs on a system that doesn't support UFFDIO_ZEROPAGE for
shared memory, it currently ends with error code 1 which indicates test
failure:

  # ./userfaultfd shmem 10 10
  nr_pages: 160, nr_pages_per_cpu: 80
  bounces: 9, mode: rnd poll, unexpected missing ioctl for anon memory
  # echo $?
  1

Change userfaultfd_zeropage_test() to return KSFT_SKIP to indicate that
the test is being skipped.

Also change userfaultfd_events_test() and userfaultfd_stress() to ignore
the missing UFFDIO_ZEROPAGE bit from the list of supported ioctls since
these tests don't require that feature.

Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 36 +++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index c84e44ddf314..00f1ca663d67 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -852,6 +852,16 @@ static int uffdio_zeropage(int ufd, unsigned long offset)
 	return __uffdio_zeropage(ufd, offset, false);
 }
 
+/* Tells whether the kernel doesn't support ZEROPAGE on shared memory VMAs. */
+static bool shmem_without_zeropage_support(unsigned long expected_ioctls,
+					   unsigned long supported_ioctls)
+{
+	/* Turn off ZEROPAGE bit from expected_ioctls. */
+	expected_ioctls &= ~(1 << _UFFDIO_ZEROPAGE);
+
+	return test_type == TEST_SHMEM && supported_ioctls == expected_ioctls;
+}
+
 /* exercise UFFDIO_ZEROPAGE */
 static int userfaultfd_zeropage_test(void)
 {
@@ -877,10 +887,20 @@ static int userfaultfd_zeropage_test(void)
 
 	expected_ioctls = uffd_test_ops->expected_ioctls;
 	if ((uffdio_register.ioctls & expected_ioctls) !=
-	    expected_ioctls)
+	    expected_ioctls) {
+		close(uffd);
+
+		if (shmem_without_zeropage_support(expected_ioctls,
+						   uffdio_register.ioctls)) {
+			fprintf(stderr,
+				"UFFDIO_ZEROPAGE unsupported in shmem VMAs\n");
+			return KSFT_SKIP;
+		}
+
 		fprintf(stderr,
-			"unexpected missing ioctl for anon memory\n"),
-			exit(1);
+			"unexpected missing ioctl for anon memory\n");
+		return 1;
+	}
 
 	if (uffdio_zeropage(uffd, 0)) {
 		if (my_bcmp(area_dst, zeropage, page_size))
@@ -924,7 +944,10 @@ static int userfaultfd_events_test(void)
 
 	expected_ioctls = uffd_test_ops->expected_ioctls;
 	if ((uffdio_register.ioctls & expected_ioctls) !=
-	    expected_ioctls)
+	    expected_ioctls &&
+	    /* No need for zeropage support in this test, so ignore it. */
+	    !shmem_without_zeropage_support(expected_ioctls,
+					    uffdio_register.ioctls))
 		fprintf(stderr,
 			"unexpected missing ioctl for anon memory\n"),
 			exit(1);
@@ -1117,7 +1140,10 @@ static int userfaultfd_stress(void)
 		}
 		expected_ioctls = uffd_test_ops->expected_ioctls;
 		if ((uffdio_register.ioctls & expected_ioctls) !=
-		    expected_ioctls) {
+		    expected_ioctls &&
+		    /* No need for zeropage support in this test, so ignore it. */
+		    !shmem_without_zeropage_support(expected_ioctls,
+						    uffdio_register.ioctls)) {
 			fprintf(stderr,
 				"unexpected missing ioctl for anon memory\n");
 			return 1;

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
