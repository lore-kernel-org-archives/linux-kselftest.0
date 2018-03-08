From: anders.roxell@linaro.org (Anders Roxell)
Date: Thu,  8 Mar 2018 14:48:45 +0100
Subject: [PATCH] selftests/android/ion: fix heap_type may be uninitialized
Message-ID: <20180308134845.32409-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180308134845.vMIHwx2EScJzaBa8jVdA-G8dcnjHtPd6SnTBbC1O4wI@z>

gcc warns that 'heap_type' is not initialized if we don't come through
any of the two 'case' statesments before:

ionapp_export.c:91:2: warning: ‘heap_type’ may be used uninitialized in
this function [-Wmaybe-uninitialized]
  printf("heap_type: %ld, heap_size: %ld\n", heap_type, heap_size);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the current code, we initialize the heap_type to -1 before the 'case'
statements. We also change the print_usage function to state that
heap_type and heap_size isn't optional, they are mandatory.

Fixes: 47a18c42d992 ("android/ion: userspace test utility for ion buffer sharing")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 .../testing/selftests/android/ion/ionapp_export.c  | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/android/ion/ionapp_export.c b/tools/testing/selftests/android/ion/ionapp_export.c
index a944e72621a9..b42f803e9d2a 100644
--- a/tools/testing/selftests/android/ion/ionapp_export.c
+++ b/tools/testing/selftests/android/ion/ionapp_export.c
@@ -31,16 +31,24 @@
 
 void print_usage(int argc, char *argv[])
 {
-	printf("Usage: %s [-h <help>] [-i <heap id>] [-s <size in bytes>]\n",
+	printf("Usage: %s [-h <help>] -i <heap id> -s <size in bytes>\n",
 		argv[0]);
 }
 
+void heap_type_error_text(void)
+{
+	printf("heap_type must be specified\n");
+	printf("  need to specify -i <heap_type>\n");
+	printf("  supported heap types 0 or 1\n");
+}
+
 int main(int argc, char *argv[])
 {
 	int opt, ret, status, heapid;
 	int sockfd, client_fd, shared_fd;
 	unsigned char *map_buf;
-	unsigned long map_len, heap_type, heap_size, flags;
+	unsigned long map_len, heap_size, flags;
+	long heap_type;
 	struct ion_buffer_info info;
 	struct socket_info skinfo;
 
@@ -50,6 +58,7 @@ int main(int argc, char *argv[])
 	}
 
 	heap_size = 0;
+	heap_type = -1;
 	flags = 0;
 
 	while ((opt = getopt(argc, argv, "hi:s:")) != -1) {
@@ -68,7 +77,8 @@ int main(int argc, char *argv[])
 				heap_type = ION_HEAP_TYPE_SYSTEM_CONTIG;
 				break;
 			default:
-				printf("ERROR: heap type not supported\n");
+				heap_type_error_text();
+				print_usage(argc, argv);
 				exit(1);
 			}
 			break;
@@ -82,8 +92,15 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	if (heap_type < 0) {
+		heap_type_error_text();
+		print_usage(argc, argv);
+		exit(1);
+	}
+
 	if (heap_size <= 0) {
 		printf("heap_size cannot be 0\n");
+		printf("  need to specify -s <heap_size>\n");
 		print_usage(argc, argv);
 		exit(1);
 	}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
