From: alex.shi@linux.alibaba.com (Alex Shi)
Date: Mon, 20 May 2019 11:01:39 +0800
Subject: [PATCH v2 2/3] kselftest/cgroup: fix unexpected testing failure on
 test_core
In-Reply-To: <20190520030140.203605-1-alex.shi@linux.alibaba.com>
References: <20190520030140.203605-1-alex.shi@linux.alibaba.com>
Message-ID: <20190520030140.203605-3-alex.shi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520030139.iOcIMK4mw4OaPp2qLs8GyuFpNJWIPfpX1YIGLfRzEjo@z>

The cgroup testing relys on the root cgroup's subtree_control setting,
If the 'memory' controller isn't set, some test cases will be failed
as following:

$sudo  ./test_core
not ok 1 test_cgcore_internal_process_constraint
ok 2 test_cgcore_top_down_constraint_enable
not ok 3 test_cgcore_top_down_constraint_disable
...

To correct this unexpected failure, this patch write the 'memory' to
subtree_control of root to get a right result.

Signed-off-by: Alex Shi <alex.shi at linux.alibaba.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Tejun Heo <tj at kernel.org>
Cc: Roman Gushchin <guro at fb.com>
Cc: Claudio Zumbo <claudioz at fb.com>
Cc: Claudio <claudiozumbo at gmail.com>
Cc: linux-kselftest at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
Reviewed-by: Roman Gushchin <guro at fb.com>
---
 tools/testing/selftests/cgroup/test_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index be59f9c34ea2..b1a570d7c557 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -376,6 +376,11 @@ int main(int argc, char *argv[])
 
 	if (cg_find_unified_root(root, sizeof(root)))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
+
+	if (cg_read_strstr(root, "cgroup.subtree_control", "memory"))
+	    if (cg_write(root, "cgroup.subtree_control", "+memory"))
+		ksft_exit_skip("Failed to set root memory controller\n");
+
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		switch (tests[i].fn(root)) {
 		case KSFT_PASS:
-- 
2.19.1.856.g8858448bb
