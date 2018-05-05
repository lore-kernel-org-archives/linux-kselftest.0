From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:23 -0600
Subject: [PATCH 19/24] selftests: media_tests: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-19-shuah@kernel.org>

When media_tests test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as a
fail by the Kselftest framework. This leads to false negative result
even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Change it to use ksft_exit_skip() when the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/media_tests/Makefile            | 3 ++-
 tools/testing/selftests/media_tests/media_device_open.c | 8 ++++----
 tools/testing/selftests/media_tests/media_device_test.c | 8 ++++----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/media_tests/Makefile b/tools/testing/selftests/media_tests/Makefile
index c82cec2497de..60826d7d37d4 100644
--- a/tools/testing/selftests/media_tests/Makefile
+++ b/tools/testing/selftests/media_tests/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+#
+CFLAGS += -I../ -I../../../../usr/include/
 TEST_GEN_PROGS := media_device_test media_device_open video_device_test
-all: $(TEST_GEN_PROGS)
 
 include ../lib.mk
diff --git a/tools/testing/selftests/media_tests/media_device_open.c b/tools/testing/selftests/media_tests/media_device_open.c
index a5ce5434bafd..93183a37b133 100644
--- a/tools/testing/selftests/media_tests/media_device_open.c
+++ b/tools/testing/selftests/media_tests/media_device_open.c
@@ -34,6 +34,8 @@
 #include <sys/stat.h>
 #include <linux/media.h>
 
+#include "../kselftest.h"
+
 int main(int argc, char **argv)
 {
 	int opt;
@@ -61,10 +63,8 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (getuid() != 0) {
-		printf("Please run the test as root - Exiting.\n");
-		exit(-1);
-	}
+	if (getuid() != 0)
+		ksft_exit_skip("Please run the test as root - Exiting.\n");
 
 	/* Open Media device and keep it open */
 	fd = open(media_device, O_RDWR);
diff --git a/tools/testing/selftests/media_tests/media_device_test.c b/tools/testing/selftests/media_tests/media_device_test.c
index 421a367e4bb3..a4c6ad18cb5c 100644
--- a/tools/testing/selftests/media_tests/media_device_test.c
+++ b/tools/testing/selftests/media_tests/media_device_test.c
@@ -39,6 +39,8 @@
 #include <time.h>
 #include <linux/media.h>
 
+#include "../kselftest.h"
+
 int main(int argc, char **argv)
 {
 	int opt;
@@ -66,10 +68,8 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (getuid() != 0) {
-		printf("Please run the test as root - Exiting.\n");
-		exit(-1);
-	}
+	if (getuid() != 0)
+		ksft_exit_skip("Please run the test as root - Exiting.\n");
 
 	/* Generate random number of interations */
 	srand((unsigned int) time(NULL));
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
