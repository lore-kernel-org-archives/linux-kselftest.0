From: keescook at chromium.org (Kees Cook)
Date: Tue,  9 Apr 2019 16:55:54 -0700
Subject: [PATCH 4/6] selftests/runner: Add plan line and fix result line syntax
In-Reply-To: <20190409235556.3967-1-keescook@chromium.org>
References: <20190409235556.3967-1-keescook@chromium.org>
Message-ID: <20190409235556.3967-5-keescook@chromium.org>

The TAP version 13 spec requires a "plan" line, which has been missing.
Since we always know how many tests we're going to run, emit the count on
the plan line. This also fixes the result lines to remove the "1.." prefix
which is against spec, and to mark skips with the correct "# SKIP" suffix.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest/runner.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 51139f42a6ca..7f8d6b127693 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -18,15 +18,15 @@ run_one()
 	echo "========================================"
 	if [ ! -x "$TEST" ]; then
 		echo "$TEST_HDR_MSG: Warning: file $TEST is not executable, correct this."
-		echo "not ok 1..$test_num $TEST_HDR_MSG [FAIL]"
+		echo "not ok $test_num $TEST_HDR_MSG"
 	else
 		cd `dirname $TEST` > /dev/null
 		(./$BASENAME_TEST >> "$logfile" 2>&1 &&
-		echo "ok 1..$test_num $TEST_HDR_MSG [PASS]") ||
+		echo "ok $test_num $TEST_HDR_MSG") ||
 		(if [ $? -eq $skip_rc ]; then	\
-			echo "not ok 1..$test_num $TEST_HDR_MSG [SKIP]"
+			echo "not ok $test_num $TEST_HDR_MSG # SKIP"
 		else
-			echo "not ok 1..$test_num $TEST_HDR_MSG [FAIL]"
+			echo "not ok $test_num $TEST_HDR_MSG"
 		fi)
 		cd - >/dev/null
 	fi
@@ -37,6 +37,8 @@ run_many()
 	echo "TAP version 13"
 	DIR=$(basename "$PWD")
 	test_num=0
+	total=$(echo "$@" | wc -w)
+	echo "1..$total"
 	for TEST in "$@"; do
 		test_num=$(( test_num + 1 ))
 		run_one "$DIR" "$TEST" "$test_num"
-- 
2.17.1
