From: liuxiaozhou@bytedance.com (Xiaozhou Liu)
Date: Fri, 21 Dec 2018 17:35:11 +0800
Subject: [PATCH bpf-next] selftests/bpf: fix error printing in test_devmap()
Message-ID: <20181221093512.117777-1-liuxiaozhou@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181221093511.R9YLqaKPl_moDKP_VVSB6_5_uKdfh_dWWIwYviAFsIU@z>

As a simple fix, just print the correct map type.

Signed-off-by: Xiaozhou Liu <liuxiaozhou at bytedance.com>
---
 tools/testing/selftests/bpf/test_maps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
index 9c79ee017df3..e2b9eee37187 100644
--- a/tools/testing/selftests/bpf/test_maps.c
+++ b/tools/testing/selftests/bpf/test_maps.c
@@ -510,7 +510,7 @@ static void test_devmap(int task, void *data)
 	fd = bpf_create_map(BPF_MAP_TYPE_DEVMAP, sizeof(key), sizeof(value),
 			    2, 0);
 	if (fd < 0) {
-		printf("Failed to create arraymap '%s'!\n", strerror(errno));
+		printf("Failed to create devmap '%s'!\n", strerror(errno));
 		exit(1);
 	}
 
-- 
2.11.0
