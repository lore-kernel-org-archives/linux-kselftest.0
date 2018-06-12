From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Tue, 12 Jun 2018 17:48:07 -0600
Subject: [PATCH] selftests: static_keys: return Kselftest Skip code for
 skipped tests
Message-ID: <20180612234807.28967-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180612234807.wqwz8AzmS2fAHhWrxFfiLDtqM8q32jKftl5N3jNr0Kc@z>

When static_keys test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as a fail
by the Kselftest framework. This leads to false negative result even when
the test could not be run.

Change it to return kselftest skip code when a test gets skipped to clearly
report that the test could not be run.

Added an explicit searches for test_static_key_base and test_static_keys
modules and return skip code if they aren't found to differentiate between
the failure to load the module condition and module not found condition.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 .../selftests/static_keys/test_static_keys.sh       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/static_keys/test_static_keys.sh b/tools/testing/selftests/static_keys/test_static_keys.sh
index 24cff498b31a..fc9f8cde7d42 100755
--- a/tools/testing/selftests/static_keys/test_static_keys.sh
+++ b/tools/testing/selftests/static_keys/test_static_keys.sh
@@ -2,6 +2,19 @@
 # SPDX-License-Identifier: GPL-2.0
 # Runs static keys kernel module tests
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+if ! /sbin/modprobe -q -n test_static_key_base; then
+	echo "static_key: module test_static_key_base is not found [SKIP]"
+	exit $ksft_skip
+fi
+
+if ! /sbin/modprobe -q -n test_static_keys; then
+	echo "static_key: module test_static_keys is not found [SKIP]"
+	exit $ksft_skip
+fi
+
 if /sbin/modprobe -q test_static_key_base; then
 	if /sbin/modprobe -q test_static_keys; then
 		echo "static_key: ok"
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
