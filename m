From: ahiliation at gmail.com (Jeffrin Jose T)
Date: Thu, 21 Jun 2018 22:30:20 +0530
Subject: [PATCH] selftests: bpf: notification about privilege required to run
 test_kmod.sh testing script
Message-ID: <20180621170020.9073-1-ahiliation@gmail.com>

The test_kmod.sh script require root privilege for the successful
execution of the test.

This patch is to notify the user about the privilege the script
demands for the successful execution of the test.

Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>
---
 tools/testing/selftests/bpf/test_kmod.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
index 35669ccd4d23..378ccc512ad3 100755
--- a/tools/testing/selftests/bpf/test_kmod.sh
+++ b/tools/testing/selftests/bpf/test_kmod.sh
@@ -1,6 +1,15 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+msg="skip all tests:"
+if [ "$(id -u)" != "0" ]; then
+    echo $msg please run this as root >&2
+    exit $ksft_skip
+fi
+
 SRC_TREE=../../../../
 
 test_run()
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
