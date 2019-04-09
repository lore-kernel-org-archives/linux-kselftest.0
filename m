From: keescook@chromium.org (Kees Cook)
Date: Tue,  9 Apr 2019 16:55:55 -0700
Subject: [PATCH 5/6] selftests/runner: Distinguish between missing and
 non-executable
In-Reply-To: <20190409235556.3967-1-keescook@chromium.org>
References: <20190409235556.3967-1-keescook@chromium.org>
Message-ID: <20190409235556.3967-6-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190409235555.X1YY_J2I0Ai4xPtWPQjroyxJyJFkwnrroez6lICv6QE@z>

If a test was missing (e.g. wrong architecture, etc), the test runner
would incorrectly claim the test was non-executable. This adds an
existence check to report correctly.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest/runner.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 7f8d6b127693..5793660dbe3f 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -17,7 +17,12 @@ run_one()
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
