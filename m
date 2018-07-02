From: lizhijian at cn.fujitsu.com (Li Zhijian)
Date: Mon,  2 Jul 2018 11:53:52 +0800
Subject: [PATCH 1/3] selftests/android: fix compiling error
In-Reply-To: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <1530503634-32241-2-git-send-email-lizhijian@cn.fujitsu.com>

lizhijian at haswell-OptiPlex-9020:/home/lizj/linux/tools/testing/selftests/android/ion$ make
gcc  -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/ -Wall -O2 -g    ionapp_export.c ipcsocket.c ionutils.c   -o ionapp_export
gcc  -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/ -Wall -O2 -g    ionapp_import.c ipcsocket.c ionutils.c   -o ionapp_import
gcc  -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/ -Wall -O2 -g    ionmap_test.c ipcsocket.c ionutils.c   -o ionmap_test
ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or directory
compilation terminated.
<builtin>: recipe for target 'ionmap_test' failed
make: *** [ionmap_test] Error 1

It requires headers_install to $TOP/usr

CC: Shuah Khan <shuah at kernel.org>
CC: Pintu Agarwal <pintu.ping at gmail.com>
Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/android/ion/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
index e036952..9f83299 100644
--- a/tools/testing/selftests/android/ion/Makefile
+++ b/tools/testing/selftests/android/ion/Makefile
@@ -4,7 +4,10 @@ CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
 
 TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
 
-all: $(TEST_GEN_FILES)
+all: ../../../../../usr/include/linux/dma-buf.h $(TEST_GEN_FILES)
+
+../../../../../usr/include/linux/dma-buf.h:
+	make -C ../../../../../ headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../../usr
 
 $(TEST_GEN_FILES): ipcsocket.c ionutils.c
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
