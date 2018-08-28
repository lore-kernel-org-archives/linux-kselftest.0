From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Tue, 28 Aug 2018 14:26:05 -0300
Subject: [PATCH v3 1/4] userfaultfd: selftest: Fix checking of
 userfaultfd_open() result
In-Reply-To: <20180828172608.30075-1-bauerman@linux.ibm.com>
References: <20180828172608.30075-1-bauerman@linux.ibm.com>
Message-ID: <20180828172608.30075-2-bauerman@linux.ibm.com>

If the userfaultfd test is run on a kernel with CONFIG_USERFAULTFD=n, it
will report that the system call is not available yet go ahead and continue
anyway:

  # ./userfaultfd anon 30 1
  nr_pages: 480, nr_pages_per_cpu: 120
  userfaultfd syscall not available in this kernel
  bounces: 0, mode:, register failure

This is because userfaultfd_open() returns 0 on success and 1 on error but
all callers assume that it returns < 0 on error.

Since the convention of the test as a whole is the one used by
userfault_open(), fix its callers instead. Now the test behaves correctly:

  # ./userfaultfd anon 30 1
  nr_pages: 480, nr_pages_per_cpu: 120
  userfaultfd syscall not available in this kernel

Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
Reviewed-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 7b8171e3128a..e4099afe7557 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -859,7 +859,7 @@ static int userfaultfd_zeropage_test(void)
 	if (uffd_test_ops->release_pages(area_dst))
 		return 1;
 
-	if (userfaultfd_open(0) < 0)
+	if (userfaultfd_open(0))
 		return 1;
 	uffdio_register.range.start = (unsigned long) area_dst;
 	uffdio_register.range.len = nr_pages * page_size;
@@ -902,7 +902,7 @@ static int userfaultfd_events_test(void)
 
 	features = UFFD_FEATURE_EVENT_FORK | UFFD_FEATURE_EVENT_REMAP |
 		UFFD_FEATURE_EVENT_REMOVE;
-	if (userfaultfd_open(features) < 0)
+	if (userfaultfd_open(features))
 		return 1;
 	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
 
@@ -961,7 +961,7 @@ static int userfaultfd_sig_test(void)
 		return 1;
 
 	features = UFFD_FEATURE_EVENT_FORK|UFFD_FEATURE_SIGBUS;
-	if (userfaultfd_open(features) < 0)
+	if (userfaultfd_open(features))
 		return 1;
 	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
 
@@ -1027,7 +1027,7 @@ static int userfaultfd_stress(void)
 	if (!area_dst)
 		return 1;
 
-	if (userfaultfd_open(0) < 0)
+	if (userfaultfd_open(0))
 		return 1;
 
 	count_verify = malloc(nr_pages * sizeof(unsigned long long));
