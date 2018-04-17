From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 17 Apr 2018 10:46:31 +0200
Subject: [PATCH] doc: dev-tools: kselftest.rst: update contributing new tests
Message-ID: <20180417084631.11242-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180417084631.V9j4TqE32ReQfIoSbhfpkHFGYPup26J0-rbbQ9D6-is@z>

Add a description that the kernel headers should be used as far as it is
possible and then the system headers.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index e80850eefe13..27f08d6ba91c 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -151,6 +151,9 @@ Contributing new tests (details)
    TEST_FILES, TEST_GEN_FILES mean it is the file which is used by
    test.
 
+ * First use the headers inside the kernel, and then the system headers. The
+   internal headers should be the primary focus to be able to find regressions.
+
 Test Harness
 ============
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
