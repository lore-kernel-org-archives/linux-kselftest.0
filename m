From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Fri, 23 Feb 2018 15:11:38 -0700
Subject: [PATCH 3/5] selftests: Makefile set KSFT_TAP_LEVEL to prevent nested
 TAP headers
In-Reply-To: <cover.1519423340.git.shuahkh@osg.samsung.com>
References: <cover.1519423340.git.shuahkh@osg.samsung.com>
Message-ID: <98cdd2fff184b478e36038f3ef3578425ca644d8.1519423341.git.shuahkh@osg.samsung.com>

Export KSFT_TAP_LEVEL and add TAP Header echo to the run_kselftest.sh
script from emit_tests target handling.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 7442dfb73b7f..a41b4be28b9f 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -66,6 +66,12 @@ ifndef BUILD
   BUILD := $(shell pwd)
 endif
 
+# KSFT_TAP_LEVEL is used from KSFT framework to prevent nested TAP header
+# printing from tests. Applicable to run_tests case where run_tests adds
+# TAP header prior running tests and when a test program invokes another
+# with system() call. Export it here to cover override RUN_TESTS defines.
+export KSFT_TAP_LEVEL=`echo 1`
+
 export BUILD
 all:
 	@for TARGET in $(TARGETS); do		\
@@ -125,10 +131,12 @@ ifdef INSTALL_PATH
 	echo "else" >> $(ALL_SCRIPT)
 	echo "  OUTPUT=/dev/stdout" >> $(ALL_SCRIPT)
 	echo "fi" >> $(ALL_SCRIPT)
+	echo "export KSFT_TAP_LEVEL=`echo 1`" >> $(ALL_SCRIPT)
 
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
-		echo "echo ; echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
+		echo "echo ; echo TAP version 13" >> $(ALL_SCRIPT);	\
+		echo "echo Running tests in $$TARGET" >> $(ALL_SCRIPT); \
 		echo "echo ========================================" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
 		make -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
