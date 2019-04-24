From: keescook at chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 16:12:33 -0700
Subject: [PATCH v2 4/8] selftests: Add plan line and fix result line syntax
In-Reply-To: <20190424231237.14776-1-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
Message-ID: <20190424231237.14776-5-keescook@chromium.org>

The TAP version 13 spec requires a "plan" line, which has been missing.
Since we always know how many tests we're going to run, emit the count on
the plan line. This also fixes the result lines to remove the "1.." prefix
which is against spec, and to mark skips with the correct "# SKIP" suffix.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest.h         |  4 ++--
 tools/testing/selftests/kselftest/runner.sh | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 47e1d995c182..9f4147a6fdbc 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -111,7 +111,7 @@ static inline void ksft_test_result_skip(const char *msg, ...)
 	ksft_cnt.ksft_xskip++;
 
 	va_start(args, msg);
-	printf("ok %d # skip ", ksft_test_num());
+	printf("not ok %d # SKIP ", ksft_test_num());
 	vprintf(msg, args);
 	va_end(args);
 }
@@ -172,7 +172,7 @@ static inline int ksft_exit_skip(const char *msg, ...)
 		va_list args;
 
 		va_start(args, msg);
-		printf("1..%d # Skipped: ", ksft_test_num());
+		printf("not ok %d # SKIP ", ksft_test_num());
 		vprintf(msg, args);
 		va_end(args);
 	} else {
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index f12b0a631273..e0621974e01e 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -20,15 +20,15 @@ run_one()
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
@@ -39,6 +39,8 @@ run_many()
 	echo "TAP version 13"
 	DIR=$(basename "$PWD")
 	test_num=0
+	total=$(echo "$@" | wc -w)
+	echo "1..$total"
 	for TEST in "$@"; do
 		BASENAME_TEST=$(basename $TEST)
 		test_num=$(( test_num + 1 ))
-- 
2.17.1
