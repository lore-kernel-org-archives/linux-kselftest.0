From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Thu, 14 Jun 2018 17:29:35 -0600
Subject: [PATCH] selftests: zram: return Kselftest Skip code for skipped tests
Message-ID: <20180614232935.24702-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614232935.fbiIuALrNCQwsOM-FRca7tBRl3giMCkTb4L-5keFoDw@z>

When zram test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as
a fail by the Kselftest framework. This leads to false negative result
even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/zram/zram.sh     | 5 ++++-
 tools/testing/selftests/zram/zram_lib.sh | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/zram/zram.sh b/tools/testing/selftests/zram/zram.sh
index 754de7da426a..232e958ec454 100755
--- a/tools/testing/selftests/zram/zram.sh
+++ b/tools/testing/selftests/zram/zram.sh
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: GPL-2.0
 TCID="zram.sh"
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 . ./zram_lib.sh
 
 run_zram () {
@@ -24,5 +27,5 @@ elif [ -b /dev/zram0 ]; then
 else
 	echo "$TCID : No zram.ko module or /dev/zram0 device file not found"
 	echo "$TCID : CONFIG_ZRAM is not set"
-	exit 1
+	exit $ksft_skip
 fi
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index f6a9c73e7a44..9e73a4fb9b0a 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -18,6 +18,9 @@ MODULE=0
 dev_makeswap=-1
 dev_mounted=-1
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 trap INT
 
 check_prereqs()
@@ -27,7 +30,7 @@ check_prereqs()
 
 	if [ $uid -ne 0 ]; then
 		echo $msg must be run as root >&2
-		exit 0
+		exit $ksft_skip
 	fi
 }
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
