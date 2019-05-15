From: alex.shi@linux.alibaba.com (Alex Shi)
Date: Wed, 15 May 2019 17:07:04 +0800
Subject: [PATCH 3/3] kselftest/cgroup: fix incorrect test_core skip
In-Reply-To: <20190515090704.56929-1-alex.shi@linux.alibaba.com>
References: <20190515090704.56929-1-alex.shi@linux.alibaba.com>
Message-ID: <20190515090704.56929-3-alex.shi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190515090704.L_H339U1pindp0MllNgoK-cJkhsIGBB8na1_C8WDWFQ@z>

The test_core will skip the
test_cgcore_no_internal_process_constraint_on_threads test case if the
'cpu' controller missing in root's subtree_control. In fact we need to
set the 'cpu' in subtree_control, then the testing is meaningful.

./test_core
...
ok 4 # skip test_cgcore_no_internal_process_constraint_on_threads
...

Signed-off-by: Alex Shi <alex.shi at linux.alibaba.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Tejun Heo <tj at kernel.org>
Cc: Roman Gushchin <guro at fb.com>
Cc: Claudio Zumbo <claudioz at fb.com>
Cc: Claudio <claudiozumbo at gmail.com>
Cc: linux-kselftest at vger.kernel.org
Cc: linux-kernel at vger.kernel.org
---
 tools/testing/selftests/cgroup/test_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index b1a570d7c557..2ffc3e07d98d 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -198,7 +198,7 @@ static int test_cgcore_no_internal_process_constraint_on_threads(const char *roo
 	char *parent = NULL, *child = NULL;
 
 	if (cg_read_strstr(root, "cgroup.controllers", "cpu") ||
-	    cg_read_strstr(root, "cgroup.subtree_control", "cpu")) {
+	    cg_write(root, "cgroup.subtree_control", "+cpu")) {
 		ret = KSFT_SKIP;
 		goto cleanup;
 	}
-- 
2.19.1.856.g8858448bb
