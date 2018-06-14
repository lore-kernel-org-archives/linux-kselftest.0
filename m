From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Wed, 13 Jun 2018 21:15:13 -0600
Subject: [PATCH] selftests: user: return Kselftest Skip code for skipped tests
Message-ID: <20180614031513.9402-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614031513.wasr1rvnw8fHn7f3pSkAKhFI9vdMZBWIdqntRx3C5AY@z>

When user test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as
a fail by the Kselftest framework. This leads to false negative result
even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run. Add an explicit check
for module presence and return skip code if module isn't present.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/user/test_user_copy.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/user/test_user_copy.sh b/tools/testing/selftests/user/test_user_copy.sh
index d60506fc77f8..f9b31a57439b 100755
--- a/tools/testing/selftests/user/test_user_copy.sh
+++ b/tools/testing/selftests/user/test_user_copy.sh
@@ -2,6 +2,13 @@
 # SPDX-License-Identifier: GPL-2.0
 # Runs copy_to/from_user infrastructure using test_user_copy kernel module
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+if ! /sbin/modprobe -q -n test_user_copy; then
+	echo "user: module test_user_copy is not found [SKIP]"
+	exit $ksft_skip
+fi
 if /sbin/modprobe -q test_user_copy; then
 	/sbin/modprobe -q -r test_user_copy
 	echo "user_copy: ok"
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
