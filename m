From: Lei.Yang at windriver.com (Lei Yang)
Date: Wed, 5 Sep 2018 10:39:35 +0800
Subject: [PATCH] sysctl: kselftests: add test_core to .gitignore
Message-ID: <1536115175-10864-1-git-send-email-Lei.Yang@windriver.com>

Update .gitignore files.

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/cgroup/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/selftests/cgroup/.gitignore
index 95eb3a5..adacda5 100644
--- a/tools/testing/selftests/cgroup/.gitignore
+++ b/tools/testing/selftests/cgroup/.gitignore
@@ -1 +1,2 @@
 test_memcontrol
+test_core
-- 
1.9.1
