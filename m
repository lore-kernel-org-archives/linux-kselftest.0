From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri, 24 Aug 2018 14:47:44 +0200
Subject: [PATCH] doc: dev-tools: kselftest.rst: update config file location
Message-ID: <20180824124744.9842-1-anders.roxell@linaro.org>

Config fragment files should be placed in
tools/testing/selftests/<testdir>/config

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 Documentation/dev-tools/kselftest.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 6f653acea248..dad1bb8711e2 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -159,7 +159,7 @@ Contributing new tests (details)
  * If a test needs specific kernel config options enabled, add a config file in
    the test directory to enable them.
 
-   e.g: tools/testing/selftests/android/ion/config
+   e.g: tools/testing/selftests/android/config
 
 Test Harness
 ============
-- 
2.11.0
