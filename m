From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri, 29 Jun 2018 12:02:48 +0200
Subject: [PATCH] doc: dev-tools: kselftest.rst: update contributing new tests
Message-ID: <20180629100248.11560-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180629100248.yjYesz1n7KnVu0Jz11hB66teQrTOh5FwtaSLEFfNSbc@z>

Add a description that kernel config options should be added into a
config file that is placed next to the newly added test.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 3bf371a938d0..4c546a35bd58 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -156,6 +156,9 @@ Contributing new tests (details)
    installed by the distro on the system should be the primary focus to be able
    to find regressions.
 
+ * If a new test needs specific kernel options, they should be enabled in
+   then config file in the same directory where the test is added.
+
 Test Harness
 ============
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
