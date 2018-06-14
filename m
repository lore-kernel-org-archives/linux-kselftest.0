From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Wed, 13 Jun 2018 21:35:57 -0600
Subject: [PATCH] selftests: vm: return Kselftest Skip code for skipped tests
Message-ID: <20180614033557.10191-1-shuah@kernel.org>

When vm test is skipped because of unmet dependencies and/or unsupported
configuration, it exits with error which is treated as a fail by the
Kselftest framework. This leads to false negative result even when the
test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/vm/compaction_test.c |  4 +++-
 tools/testing/selftests/vm/mlock2-tests.c    | 12 +++++++-----
 tools/testing/selftests/vm/run_vmtests       |  5 ++++-
 tools/testing/selftests/vm/userfaultfd.c     |  4 +++-
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/vm/compaction_test.c b/tools/testing/selftests/vm/compaction_test.c
index 1097f04e4d80..bcec71250873 100644
--- a/tools/testing/selftests/vm/compaction_test.c
+++ b/tools/testing/selftests/vm/compaction_test.c
@@ -16,6 +16,8 @@
 #include <unistd.h>
 #include <string.h>
 
+#include "../kselftest.h"
+
 #define MAP_SIZE 1048576
 
 struct map_list {
@@ -169,7 +171,7 @@ int main(int argc, char **argv)
 		printf("Either the sysctl compact_unevictable_allowed is not\n"
 		       "set to 1 or couldn't read the proc file.\n"
 		       "Skipping the test\n");
-		return 0;
+		return KSFT_SKIP;
 	}
 
 	lim.rlim_cur = RLIM_INFINITY;
diff --git a/tools/testing/selftests/vm/mlock2-tests.c b/tools/testing/selftests/vm/mlock2-tests.c
index 4997b9222cfa..637b6d0ac0d0 100644
--- a/tools/testing/selftests/vm/mlock2-tests.c
+++ b/tools/testing/selftests/vm/mlock2-tests.c
@@ -9,6 +9,8 @@
 #include <stdbool.h>
 #include "mlock2.h"
 
+#include "../kselftest.h"
+
 struct vm_boundaries {
 	unsigned long start;
 	unsigned long end;
@@ -303,7 +305,7 @@ static int test_mlock_lock()
 	if (mlock2_(map, 2 * page_size, 0)) {
 		if (errno == ENOSYS) {
 			printf("Cannot call new mlock family, skipping test\n");
-			_exit(0);
+			_exit(KSFT_SKIP);
 		}
 		perror("mlock2(0)");
 		goto unmap;
@@ -412,7 +414,7 @@ static int test_mlock_onfault()
 	if (mlock2_(map, 2 * page_size, MLOCK_ONFAULT)) {
 		if (errno == ENOSYS) {
 			printf("Cannot call new mlock family, skipping test\n");
-			_exit(0);
+			_exit(KSFT_SKIP);
 		}
 		perror("mlock2(MLOCK_ONFAULT)");
 		goto unmap;
@@ -425,7 +427,7 @@ static int test_mlock_onfault()
 	if (munlock(map, 2 * page_size)) {
 		if (errno == ENOSYS) {
 			printf("Cannot call new mlock family, skipping test\n");
-			_exit(0);
+			_exit(KSFT_SKIP);
 		}
 		perror("munlock()");
 		goto unmap;
@@ -457,7 +459,7 @@ static int test_lock_onfault_of_present()
 	if (mlock2_(map, 2 * page_size, MLOCK_ONFAULT)) {
 		if (errno == ENOSYS) {
 			printf("Cannot call new mlock family, skipping test\n");
-			_exit(0);
+			_exit(KSFT_SKIP);
 		}
 		perror("mlock2(MLOCK_ONFAULT)");
 		goto unmap;
@@ -583,7 +585,7 @@ static int test_vma_management(bool call_mlock)
 	if (call_mlock && mlock2_(map, 3 * page_size, MLOCK_ONFAULT)) {
 		if (errno == ENOSYS) {
 			printf("Cannot call new mlock family, skipping test\n");
-			_exit(0);
+			_exit(KSFT_SKIP);
 		}
 		perror("mlock(ONFAULT)\n");
 		goto out;
diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
index 22d564673830..88cbe5575f0c 100755
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: GPL-2.0
 #please run as root
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 mnt=./huge
 exitcode=0
 
@@ -36,7 +39,7 @@ if [ -n "$freepgs" ] && [ -n "$hpgsize_KB" ]; then
 		echo $(( $lackpgs + $nr_hugepgs )) > /proc/sys/vm/nr_hugepages
 		if [ $? -ne 0 ]; then
 			echo "Please run this test as root"
-			exit 1
+			exit $ksft_skip
 		fi
 		while read name size unit; do
 			if [ "$name" = "HugePages_Free:" ]; then
diff --git a/tools/testing/selftests/vm/userfaultfd.c b/tools/testing/selftests/vm/userfaultfd.c
index de2f9ec8a87f..7b8171e3128a 100644
--- a/tools/testing/selftests/vm/userfaultfd.c
+++ b/tools/testing/selftests/vm/userfaultfd.c
@@ -69,6 +69,8 @@
 #include <setjmp.h>
 #include <stdbool.h>
 
+#include "../kselftest.h"
+
 #ifdef __NR_userfaultfd
 
 static unsigned long nr_cpus, nr_pages, nr_pages_per_cpu, page_size;
@@ -1322,7 +1324,7 @@ int main(int argc, char **argv)
 int main(void)
 {
 	printf("skip: Skipping userfaultfd test (missing __NR_userfaultfd)\n");
-	return 0;
+	return KSFT_SKIP;
 }
 
 #endif /* __NR_userfaultfd */
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
