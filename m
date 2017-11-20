From: elfring@users.sourceforge.net (SF Markus Elfring)
Date: Mon, 20 Nov 2017 22:25:44 +0100
Subject: [Linux-kselftest-mirror] [PATCH] selftest: sync: Use common error
 handling code in sync_file_info()
Message-ID: <219c366b-d753-e65b-b021-6d4a584588d0@users.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171120212544.7MiauwlbYMYsKJGwIsYU4eOTVsHrycNTgi1TLQuMsak@z>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Nov 2017 22:20:37 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring at users.sourceforge.net>
---
 tools/testing/selftests/sync/sync.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/sync/sync.c b/tools/testing/selftests/sync/sync.c
index f3d599f249b9..d0d55377f6f8 100644
--- a/tools/testing/selftests/sync/sync.c
+++ b/tools/testing/selftests/sync/sync.c
@@ -92,10 +92,8 @@ static struct sync_file_info *sync_file_info(int fd)
 		return NULL;
 
 	err = ioctl(fd, SYNC_IOC_FILE_INFO, info);
-	if (err < 0) {
-		free(info);
-		return NULL;
-	}
+	if (err < 0)
+		goto free_info;
 
 	num_fences = info->num_fences;
 
@@ -104,22 +102,23 @@ static struct sync_file_info *sync_file_info(int fd)
 		info->num_fences = num_fences;
 
 		fence_info = calloc(num_fences, sizeof(*fence_info));
-		if (!fence_info) {
-			free(info);
-			return NULL;
-		}
+		if (!fence_info)
+			goto free_info;
 
 		info->sync_fence_info = (uint64_t)fence_info;
 
 		err = ioctl(fd, SYNC_IOC_FILE_INFO, info);
 		if (err < 0) {
 			free(fence_info);
-			free(info);
-			return NULL;
+			goto free_info;
 		}
 	}
 
 	return info;
+
+free_info:
+	free(info);
+	return NULL;
 }
 
 static void sync_file_info_free(struct sync_file_info *info)
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
