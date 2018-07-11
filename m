From: lizhijian at cn.fujitsu.com (Li Zhijian)
Date: Wed, 11 Jul 2018 10:08:00 +0800
Subject: [PATCH v2] selftests/android: initialize heap_type to avoid compiling
 warning
Message-ID: <1531274880-9375-1-git-send-email-lizhijian@cn.fujitsu.com>

root at vm-lkp-nex04-8G-7 ~/linux-v4.18-rc2/tools/testing/selftests/android# make
make[1]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
make[1]: Entering directory '/root/linux-v4.18-rc2/tools/testing/selftests/android/ion'
gcc  -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/ -Wall -O2 -g    ionapp_export.c ipcsocket.c ionutils.c   -o ionapp_export
ionapp_export.c: In function 'main':
ionapp_export.c:91:2: warning: 'heap_type' may be used uninitialized in
this function [-Wmaybe-uninitialized]
  printf("heap_type: %ld, heap_size: %ld\n", heap_type, heap_size);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CC: Shuah Khan <shuah at kernel.org>
CC: Pintu Agarwal <pintu.ping at gmail.com>
Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/android/ion/ionapp_export.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/android/ion/ionapp_export.c b/tools/testing/selftests/android/ion/ionapp_export.c
index a944e72..b5fa0a2 100644
--- a/tools/testing/selftests/android/ion/ionapp_export.c
+++ b/tools/testing/selftests/android/ion/ionapp_export.c
@@ -51,6 +51,7 @@ int main(int argc, char *argv[])
 
 	heap_size = 0;
 	flags = 0;
+	heap_type = ION_HEAP_TYPE_SYSTEM;
 
 	while ((opt = getopt(argc, argv, "hi:s:")) != -1) {
 		switch (opt) {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
