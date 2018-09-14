From: alexey.skidanov@intel.com (Alexey Skidanov)
Date: Fri, 14 Sep 2018 12:46:58 +0300
Subject: [PATCH] Fix compilation error
Message-ID: <1536918418-5016-1-git-send-email-alexey.skidanov@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180914094658.p59r9iZK1JbgQgCuzrkqJWtD7m6vNaKR735YmV5nsdo@z>

ionmap_test compilation failed because there is no dma_buf.h on any of
include paths. Moreover, it's better to use the dma_buf.h file of
kernel under test and not the currently running one.

To fix this, add new target to the Makefile, installing Kernel headers
for user space and direct compiler to look for dma_buf.h file there.

Signed-off-by: Alexey Skidanov <alexey.skidanov at intel.com>
---
 tools/testing/selftests/android/ion/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
index e036952..a4aac0e 100644
--- a/tools/testing/selftests/android/ion/Makefile
+++ b/tools/testing/selftests/android/ion/Makefile
@@ -1,10 +1,14 @@
 
-INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/
+INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../uapi/include
 CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
 TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
 
-all: $(TEST_GEN_FILES)
+all: usr_headers $(TEST_GEN_FILES)
+
+usr_headers:
+	cd ../../../../../
+	make headers_install INSTALL_HDR_PATH=./uapi
 
 $(TEST_GEN_FILES): ipcsocket.c ionutils.c
 
-- 
2.7.4
