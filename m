From: anders.roxell at linaro.org (Anders Roxell)
Date: Tue, 21 Aug 2018 18:10:03 +0200
Subject: [PATCH] selftests: android: move config up a level
Message-ID: <20180821161003.16737-1-anders.roxell@linaro.org>

'make kselftest-merge' assumes that the config files for the tests are
located under the 'main' test dir, like tools/testing/selftests/android/
and not in a subdir to android.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 Documentation/dev-tools/kselftest.rst            | 2 +-
 tools/testing/selftests/android/{ion => }/config | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/android/{ion => }/config (100%)

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
diff --git a/tools/testing/selftests/android/ion/config b/tools/testing/selftests/android/config
similarity index 100%
rename from tools/testing/selftests/android/ion/config
rename to tools/testing/selftests/android/config
-- 
2.18.0
