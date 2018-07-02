From: lizhijian at cn.fujitsu.com (Li Zhijian)
Date: Mon,  2 Jul 2018 11:53:53 +0800
Subject: [PATCH 2/3] selftests/android: initialize heap_type to avoid
 compiling warning
In-Reply-To: <1530503634-32241-2-git-send-email-lizhijian@cn.fujitsu.com>
References: <1530503634-32241-1-git-send-email-lizhijian@cn.fujitsu.com>
 <1530503634-32241-2-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <1530503634-32241-3-git-send-email-lizhijian@cn.fujitsu.com>

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
 tools/testing/selftests/android/ion/ionapp_export.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/android/ion/ionapp_export.c b/tools/testing/selftests/android/ion/ionapp_export.c
index a944e72..e3435c2 100644
--- a/tools/testing/selftests/android/ion/ionapp_export.c
+++ b/tools/testing/selftests/android/ion/ionapp_export.c
@@ -49,6 +49,7 @@ int main(int argc, char *argv[])
 		return -1;
 	}
 
+	heap_type = -1UL;
 	heap_size = 0;
 	flags = 0;
 
@@ -82,6 +83,12 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	if (heap_type == -1UL) {
+		printf("heap_type is invalid\n");
+		print_usage(argc, argv);
+		exit(1);
+	}
+
 	if (heap_size <= 0) {
 		printf("heap_size cannot be 0\n");
 		print_usage(argc, argv);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
