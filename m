From: bauerman@linux.ibm.com (Thiago Jung Bauermann)
Date: Tue, 24 Jul 2018 23:42:09 -0300
Subject: [PATCH 3/3] userfaultfd: selftest: Report XFAIL if shmem doesn't
 support zeropage
In-Reply-To: <20180725024209.32586-1-bauerman@linux.ibm.com>
References: <20180725024209.32586-1-bauerman@linux.ibm.com>
Message-ID: <20180725024209.32586-4-bauerman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180725024209.ExO-ovJp6PgAnmper0y344MEg6sGBLPqc3xy4wL43q0@z>

If userfaultfd runs on a system that doesn't support UFFDIO_ZEROPAGE for
shared memory, it currently ends with error code 1 which indicates test
failure:

  # ./userfaultfd shmem 10 10
  nr_pages: 160, nr_pages_per_cpu: 80
  bounces: 9, mode: rnd poll, unexpected missing ioctl for anon memory
  # echo $?
  1

This is a real failure, but expected so signal that to the test harness:

  # ./userfaultfd shmem 10 10
  nr_pages: 160, nr_pages_per_cpu: 80
  bounces: 9, mode: rnd poll, UFFDIO_ZEROPAGE unsupported in shmem VMAs
  # echo $?
  2

Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index bc9ec38fbc34..686fe96f617f 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -1115,6 +1115,14 @@ static int userfaultfd_stress(void)
 		expected_ioctls = uffd_test_ops->expected_ioctls;
 		if ((uffdio_register.ioctls & expected_ioctls) !=
 		    expected_ioctls) {
+			if (test_type == TEST_SHMEM &&
+			    (uffdio_register.ioctls & expected_ioctls) ==
+			    UFFD_API_RANGE_IOCTLS_BASIC) {
+				fprintf(stderr,
+					"UFFDIO_ZEROPAGE unsupported in shmem VMAs\n");
+				return KSFT_XFAIL;
+			}
+
 			fprintf(stderr,
 				"unexpected missing ioctl for anon memory\n");
 			return 1;

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
