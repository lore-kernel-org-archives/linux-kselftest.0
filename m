From: lizhijian at cn.fujitsu.com (Li Zhijian)
Date: Thu, 22 Feb 2018 10:34:02 +0800
Subject: [PATCH v2] selftests/bpf/test_maps: exit child process without error
 in ENOMEM case
Message-ID: <1519266842-29004-1-git-send-email-lizhijian@cn.fujitsu.com>

From: Li Zhijian <zhijianx.li at intel.com>

test_maps contains a series of stress tests, and previously it will break the
rest tests when it failed to alloc memory.
-----------------------
Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
Failed to create hashmap key=16 value=262144 'Cannot allocate memory'
Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
test_maps: test_maps.c:955: run_parallel: Assertion `status == 0' failed.
Aborted
not ok 1..3 selftests:  test_maps [FAIL]
-----------------------
after this patch, the rest tests will be continue when it occurs an ENOMEM failure

CC: Alexei Starovoitov <alexei.starovoitov at gmail.com>
CC: Philip Li <philip.li at intel.com>
Suggested-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Li Zhijian <zhijianx.li at intel.com>
---
 tools/testing/selftests/bpf/test_maps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
index 436c4c7..9e03a4c 100644
--- a/tools/testing/selftests/bpf/test_maps.c
+++ b/tools/testing/selftests/bpf/test_maps.c
@@ -126,6 +126,8 @@ static void test_hashmap_sizes(int task, void *data)
 			fd = bpf_create_map(BPF_MAP_TYPE_HASH, i, j,
 					    2, map_flags);
 			if (fd < 0) {
+				if (errno == ENOMEM)
+					return;
 				printf("Failed to create hashmap key=%d value=%d '%s'\n",
 				       i, j, strerror(errno));
 				exit(1);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
