From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:17 -0600
Subject: [PATCH 13/24] selftests: kmod: return Kselftest Skip code for skipped
 tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-13-shuah@kernel.org>

When kmod test is skipped because of unmet dependencies and/or unsupported
configuration, it returns 0 which is treated as a pass by the Kselftest
framework. This leads to false positive result even when the test could
not be run. It returns fail in some cases when test is skipped. Either way,
it is incorrect and incosnistent reporting.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/kmod/kmod.sh | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kmod/kmod.sh b/tools/testing/selftests/kmod/kmod.sh
index 7956ea3be667..0a76314b4414 100755
--- a/tools/testing/selftests/kmod/kmod.sh
+++ b/tools/testing/selftests/kmod/kmod.sh
@@ -62,13 +62,16 @@ ALL_TESTS="$ALL_TESTS 0007:5:1"
 ALL_TESTS="$ALL_TESTS 0008:150:1"
 ALL_TESTS="$ALL_TESTS 0009:150:1"
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 test_modprobe()
 {
        if [ ! -d $DIR ]; then
                echo "$0: $DIR not present" >&2
                echo "You must have the following enabled in your kernel:" >&2
                cat $TEST_DIR/config >&2
-               exit 1
+               exit $ksft_skip
        fi
 }
 
@@ -105,12 +108,12 @@ test_reqs()
 {
 	if ! which modprobe 2> /dev/null > /dev/null; then
 		echo "$0: You need modprobe installed" >&2
-		exit 1
+		exit $ksft_skip
 	fi
 
 	if ! which kmod 2> /dev/null > /dev/null; then
 		echo "$0: You need kmod installed" >&2
-		exit 1
+		exit $ksft_skip
 	fi
 
 	# kmod 19 has a bad bug where it returns 0 when modprobe
@@ -124,13 +127,13 @@ test_reqs()
 		echo "$0: You need at least kmod 20" >&2
 		echo "kmod <= 19 is buggy, for details see:" >&2
 		echo "http://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/libkmod/libkmod-module.c?id=fd44a98ae2eb5eb32161088954ab21e58e19dfc4" >&2
-		exit 1
+		exit $ksft_skip
 	fi
 
 	uid=$(id -u)
 	if [ $uid -ne 0 ]; then
 		echo $msg must be run as root >&2
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
