From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:05 -0600
Subject: [PATCH 01/24] selftests: android: ion: return Kselftest Skip code for
 skipped tests
Message-ID: <20180505011328.32078-1-shuah@kernel.org>

When ion test is skipped because of unmet dependencies and/or unsupported
configuration, it returns 0 which is treated as a pass by the Kselftest
framework. This leads to false positive result even when the test could
not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/android/ion/ion_test.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/android/ion/ion_test.sh b/tools/testing/selftests/android/ion/ion_test.sh
index a1aff506f5e6..69e676cfc94e 100755
--- a/tools/testing/selftests/android/ion/ion_test.sh
+++ b/tools/testing/selftests/android/ion/ion_test.sh
@@ -4,6 +4,9 @@ heapsize=4096
 TCID="ion_test.sh"
 errcode=0
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 run_test()
 {
 	heaptype=$1
@@ -25,7 +28,7 @@ check_root()
 	uid=$(id -u)
 	if [ $uid -ne 0 ]; then
 		echo $TCID: must be run as root >&2
-		exit 0
+		exit $ksft_skip
 	fi
 }
 
@@ -35,7 +38,7 @@ check_device()
 	if [ ! -e $DEVICE ]; then
 		echo $TCID: No $DEVICE device found >&2
 		echo $TCID: May be CONFIG_ION is not set >&2
-		exit 0
+		exit $ksft_skip
 	fi
 }
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
