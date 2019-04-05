From: guroan at gmail.com (Roman Gushchin)
Date: Fri,  5 Apr 2019 10:47:04 -0700
Subject: [PATCH v10 5/9] kselftests: cgroup: don't fail on cg_kill_all() error
 in cg_destroy()
In-Reply-To: <20190405174708.1010-1-guro@fb.com>
References: <20190405174708.1010-1-guro@fb.com>
Message-ID: <20190405174708.1010-6-guro@fb.com>

If the cgroup destruction races with an exit() of a belonging
process(es), cg_kill_all() may fail. It's not a good reason to make
cg_destroy() fail and leave the cgroup in place, potentially causing
next test runs to fail.

Signed-off-by: Roman Gushchin <guro at fb.com>
Cc: Shuah Khan <shuah at kernel.org>
Cc: Tejun Heo <tj at kernel.org>
Cc: kernel-team at fb.com
Cc: linux-kselftest at vger.kernel.org
---
 tools/testing/selftests/cgroup/cgroup_util.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index 14c9fe284806..eba06f94433b 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -227,9 +227,7 @@ int cg_destroy(const char *cgroup)
 retry:
 	ret = rmdir(cgroup);
 	if (ret && errno == EBUSY) {
-		ret = cg_killall(cgroup);
-		if (ret)
-			return ret;
+		cg_killall(cgroup);
 		usleep(100);
 		goto retry;
 	}
-- 
2.20.1
