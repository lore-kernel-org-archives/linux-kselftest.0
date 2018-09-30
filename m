From: peterx at redhat.com (Peter Xu)
Date: Sun, 30 Sep 2018 15:42:59 +0800
Subject: [PATCH v2 3/3] userfaultfd: selftest: recycle lock threads first
In-Reply-To: <20180930074259.18229-1-peterx@redhat.com>
References: <20180930074259.18229-1-peterx@redhat.com>
Message-ID: <20180930074259.18229-4-peterx@redhat.com>

Now we recycle the uffd servicing threads earlier than the lock
threads.  It might happen that when the lock thread is still blocked at
a pthread mutex lock while the servicing thread has already quitted for
the cpu so the lock thread will be blocked forever and hang the test
program.  To fix the possible race, recycle the lock threads first.

This never happens with current missing-only tests, but when I start to
run the write-protection tests (the feature is not yet posted upstream)
it happens every time of the run possibly because in that new test we'll
need to service two page faults for each lock operation.

Acked-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
Signed-off-by: Peter Xu <peterx at redhat.com>
---
 tools/testing/selftests/vm/userfaultfd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index 7a8c6937cc67..5d1db824f73a 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -626,6 +626,12 @@ static int stress(unsigned long *userfaults)
 	if (uffd_test_ops->release_pages(area_src))
 		return 1;
 
+
+	finished = 1;
+	for (cpu = 0; cpu < nr_cpus; cpu++)
+		if (pthread_join(locking_threads[cpu], NULL))
+			return 1;
+
 	for (cpu = 0; cpu < nr_cpus; cpu++) {
 		char c;
 		if (bounces & BOUNCE_POLL) {
@@ -643,11 +649,6 @@ static int stress(unsigned long *userfaults)
 		}
 	}
 
-	finished = 1;
-	for (cpu = 0; cpu < nr_cpus; cpu++)
-		if (pthread_join(locking_threads[cpu], NULL))
-			return 1;
-
 	return 0;
 }
 
-- 
2.17.1
