From: alex.shi at linux.alibaba.com (Alex Shi)
Date: Wed, 15 May 2019 17:07:02 +0800
Subject: [PATCH 1/3] kselftest/cgroup: fix unexcepted testing failure on
 test_memcontrol
Message-ID: <20190515090704.56929-1-alex.shi@linux.alibaba.com>

The cgroup testing relys on the root cgroup's subtree_control setting,
If the 'memory' controller isn't set, all test cases will be failed
as following:

$ sudo ./test_memcontrol
not ok 1 test_memcg_subtree_control
not ok 2 test_memcg_current
ok 3 # skip test_memcg_min
not ok 4 test_memcg_low
not ok 5 test_memcg_high
not ok 6 test_memcg_max
not ok 7 test_memcg_oom_events
ok 8 # skip test_memcg_swap_max
not ok 9 test_memcg_sock
not ok 10 test_memcg_oom_group_leaf_events
not ok 11 test_memcg_oom_group_parent_events
not ok 12 test_memcg_oom_group_score_events

To correct this unexcepted failure, this patch write the 'memory' to
subtree_control of root to get a right result.

Signed-off-by: Alex Shi <alex.shi at linux.alibaba.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Roman Gushchin <guro at fb.com>
Cc: Tejun Heo <tj at kernel.org>
Cc: Mike Rapoport <rppt at linux.vnet.ibm.com>
Cc: Jay Kamat <jgkamat at fb.com>
Cc: linux-kselftest at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
---
 tools/testing/selftests/cgroup/test_memcontrol.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 6f339882a6ca..73612d604a2a 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -1205,6 +1205,10 @@ int main(int argc, char **argv)
 	if (cg_read_strstr(root, "cgroup.controllers", "memory"))
 		ksft_exit_skip("memory controller isn't available\n");
 
+	if (cg_read_strstr(root, "cgroup.subtree_control", "memory"))
+	    if (cg_write(root, "cgroup.subtree_control", "+memory"))
+		ksft_exit_skip("Failed to set root memory controller\n");
+
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
-- 
2.19.1.856.g8858448bb
