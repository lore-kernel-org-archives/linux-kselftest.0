From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri, 29 Jun 2018 14:52:01 +0200
Subject: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing new
 tests
In-Reply-To: <20180629100248.11560-1-anders.roxell@linaro.org>
References: <20180629100248.11560-1-anders.roxell@linaro.org>
Message-ID: <20180629125201.24025-1-anders.roxell@linaro.org>

Add a description that kernel config options should be added into a
config file that is placed next to the newly added test.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 3bf371a938d0..6f653acea248 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -156,6 +156,11 @@ Contributing new tests (details)
    installed by the distro on the system should be the primary focus to be able
    to find regressions.
 
+ * If a test needs specific kernel config options enabled, add a config file in
+   the test directory to enable them.
+
+   e.g: tools/testing/selftests/android/ion/config
+
 Test Harness
 ============
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
