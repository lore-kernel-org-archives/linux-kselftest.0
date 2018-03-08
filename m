From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu,  8 Mar 2018 15:37:41 +0100
Subject: [PATCH] selftests/android/ion: Makefile: fix build error
Message-ID: <20180308143741.4415-1-anders.roxell@linaro.org>

Fails to build iomap_test.c due to missing include

gcc  -I. -I../../../../../drivers/staging/android/uapi/ -Wall -O2 -g
ionmap_test.c ipcsocket.c ionutils.c   -o ionmap_test
ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or
directory
 #include <linux/dma-buf.h>
                           ^
compilation terminated.
<builtin>: recipe for target 'ionmap_test' failed
make[2]: *** [ionmap_test] Error 1

In the current code, we add a new -I ../../../../../usr/include/ to the
INCLUDEDIR variable. Also add ionmap_test to the .gitignore file.

Fixes: ac93f7046a53 ("selftests: ion: Add simple test with the vgem driver")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/android/ion/.gitignore | 1 +
 tools/testing/selftests/android/ion/Makefile   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/android/ion/.gitignore b/tools/testing/selftests/android/ion/.gitignore
index 67e6f391b2a9..95e8f4561474 100644
--- a/tools/testing/selftests/android/ion/.gitignore
+++ b/tools/testing/selftests/android/ion/.gitignore
@@ -1,2 +1,3 @@
 ionapp_export
 ionapp_import
+ionmap_test
diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
index d23b6d537d8b..e03695287f76 100644
--- a/tools/testing/selftests/android/ion/Makefile
+++ b/tools/testing/selftests/android/ion/Makefile
@@ -1,5 +1,5 @@
 
-INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/
+INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/
 CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
 TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
