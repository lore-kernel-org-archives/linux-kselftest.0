From: keescook at chromium.org (Kees Cook)
Date: Wed, 24 Apr 2019 16:12:34 -0700
Subject: [PATCH v2 5/8] selftests: Distinguish between missing and
 non-executable
In-Reply-To: <20190424231237.14776-1-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
Message-ID: <20190424231237.14776-6-keescook@chromium.org>

If a test was missing (e.g. wrong architecture, etc), the test runner
would incorrectly claim the test was non-executable. This adds an
existence check to report correctly.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest/runner.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index e0621974e01e..a66fb64e61e9 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -19,7 +19,12 @@ run_one()
 	echo "$TEST_HDR_MSG"
 	echo "========================================"
 	if [ ! -x "$TEST" ]; then
-		echo "$TEST_HDR_MSG: Warning: file $TEST is not executable, correct this."
+		echo -n "$TEST_HDR_MSG: Warning: file $TEST is "
+		if [ ! -e "$TEST" ]; then
+			echo "missing!"
+		else
+			echo "not executable, correct this."
+		fi
 		echo "not ok $test_num $TEST_HDR_MSG"
 	else
 		cd `dirname $TEST` > /dev/null
-- 
2.17.1
