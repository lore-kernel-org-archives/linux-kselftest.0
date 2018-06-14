From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 14 Jun 2018 11:57:08 +0200
Subject: [PATCH v2] selftests: sync: add config fragment for testing sync
 framework
Message-ID: <20180614095708.27645-1-anders.roxell@linaro.org>

From: Fathi Boudra <fathi.boudra at linaro.org>

Unless the software synchronization objects (CONFIG_SW_SYNC) is enabled,
the sync test will be skipped:

TAP version 13
1..0 # Skipped: Sync framework not supported by kernel

Add a config fragment file to be able to run "make kselftest-merge" to
enable relevant configuration required in order to run the sync test.

Signed-off-by: Fathi Boudra <fathi.boudra at linaro.org>
Link: https://lkml.org/lkml/2017/5/5/14
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/sync/config | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 tools/testing/selftests/sync/config

diff --git a/tools/testing/selftests/sync/config b/tools/testing/selftests/sync/config
new file mode 100644
index 000000000000..1ab7e8130db2
--- /dev/null
+++ b/tools/testing/selftests/sync/config
@@ -0,0 +1,4 @@
+CONFIG_STAGING=y
+CONFIG_ANDROID=y
+CONFIG_SYNC=y
+CONFIG_SW_SYNC=y
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
