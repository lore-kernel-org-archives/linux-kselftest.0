From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:21 -0600
Subject: [PATCH 17/24] selftests: locking: add Makefile for locking test
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-17-shuah@kernel.org>

Add Makefile for locking test.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/locking/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 tools/testing/selftests/locking/Makefile

diff --git a/tools/testing/selftests/locking/Makefile b/tools/testing/selftests/locking/Makefile
new file mode 100644
index 000000000000..e168a2e34bc2
--- /dev/null
+++ b/tools/testing/selftests/locking/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for locking/ww_mutx selftests
+
+# No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
+all:
+
+TEST_PROGS := ww_mutex.sh
+
+include ../lib.mk
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
