From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:22 -0600
Subject: [PATCH 18/24] selftests: locking: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-18-shuah@kernel.org>

When locking test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as
a fail by the Kselftest framework. This leads to false negative
result even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Added an explicit search for ww_mutex module and return skip code if
it isn't found to differentiate between the failure to load the module
condition and module not found condition.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/locking/ww_mutex.sh | 8 ++++++++
 1 file changed, 8 insertions(+)
 mode change 100644 => 100755 tools/testing/selftests/locking/ww_mutex.sh

diff --git a/tools/testing/selftests/locking/ww_mutex.sh b/tools/testing/selftests/locking/ww_mutex.sh
old mode 100644
new mode 100755
index 2c3d6b1878c2..91e4ac7566af
--- a/tools/testing/selftests/locking/ww_mutex.sh
+++ b/tools/testing/selftests/locking/ww_mutex.sh
@@ -1,6 +1,14 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 # Runs API tests for struct ww_mutex (Wait/Wound mutexes)
+if ! /sbin/modprobe -q -n test-ww_mutex; then
+	echo "ww_mutex: module test-ww_mutex is not found [SKIP]"
+	exit $ksft_skip
+fi
 
 if /sbin/modprobe -q test-ww_mutex; then
        /sbin/modprobe -q -r test-ww_mutex
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
