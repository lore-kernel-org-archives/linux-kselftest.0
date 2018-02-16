From: labbott@redhat.com (Laura Abbott)
Date: Thu, 15 Feb 2018 17:24:44 -0800
Subject: [PATCH 1/2] selftests: ion: Remove some prints
In-Reply-To: <20180216012445.17264-1-labbott@redhat.com>
References: <20180216012445.17264-1-labbott@redhat.com>
Message-ID: <20180216012445.17264-2-labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180216012444.JNVWarAl4BBXJtrC5olYI-mV1r4pbyx9nCWuoIUN_jU@z>


There's no need to print messages each time we alloc and free. Remove them.

Signed-off-by: Laura Abbott <labbott at redhat.com>
---
 tools/testing/selftests/android/ion/ionutils.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/android/ion/ionutils.c b/tools/testing/selftests/android/ion/ionutils.c
index ce69c14f51fa..7d1d37c4ef6a 100644
--- a/tools/testing/selftests/android/ion/ionutils.c
+++ b/tools/testing/selftests/android/ion/ionutils.c
@@ -80,11 +80,6 @@ int ion_export_buffer_fd(struct ion_buffer_info *ion_info)
 	heap_id = MAX_HEAP_COUNT + 1;
 	for (i = 0; i < query.cnt; i++) {
 		if (heap_data[i].type == ion_info->heap_type) {
-			printf("--------------------------------------\n");
-			printf("heap type: %d\n", heap_data[i].type);
-			printf("  heap id: %d\n", heap_data[i].heap_id);
-			printf("heap name: %s\n", heap_data[i].name);
-			printf("--------------------------------------\n");
 			heap_id = heap_data[i].heap_id;
 			break;
 		}
@@ -204,7 +199,6 @@ void ion_close_buffer_fd(struct ion_buffer_info *ion_info)
 		/* Finally, close the client fd */
 		if (ion_info->ionfd > 0)
 			close(ion_info->ionfd);
-		printf("<%s>: buffer release successfully....\n", __func__);
 	}
 }
 
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
