From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 19 Apr 2018 12:28:25 +0200
Subject: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing new
 tests
In-Reply-To: <20180417084631.11242-1-anders.roxell@linaro.org>
References: <20180417084631.11242-1-anders.roxell@linaro.org>
Message-ID: <20180419102825.2990-1-anders.roxell@linaro.org>

Add a description that the kernel headers should be used as far as it is
possible and then the system headers.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index e80850eefe13..3bf371a938d0 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -151,6 +151,11 @@ Contributing new tests (details)
    TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
    test.
 
+ * First use the headers inside the kernel source and/or git repo, and then the
+   system headers.  Headers for the kernel release as opposed to headers
+   installed by the distro on the system should be the primary focus to be able
+   to find regressions.
+
 Test Harness
 ============
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
