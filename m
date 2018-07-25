From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Tue, 24 Jul 2018 23:57:25 -0300
Subject: [PATCH] selftests: kselftest: Remove outdated comment
Message-ID: <20180725025725.4214-1-bauerman@linux.ibm.com>

Commit 3c07aaef6598 ("selftests: kselftest: change KSFT_SKIP=4 instead of
KSFT_PASS") reverted commit 11867a77eb85 ("selftests: kselftest framework:
change skip exit code to 0") but missed removing the comment which that
commit added, so do that now.

Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
---
 tools/testing/selftests/kselftest.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 15e6b75fc3a5..a3edb2c8e43d 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -19,7 +19,6 @@
 #define KSFT_FAIL  1
 #define KSFT_XFAIL 2
 #define KSFT_XPASS 3
-/* Treat skip as pass */
 #define KSFT_SKIP  4
 
 /* counters */

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
