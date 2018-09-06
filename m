From: Lei.Yang@windriver.com (Lei Yang)
Date: Thu, 6 Sep 2018 13:47:23 +0800
Subject: [PATCH v2] cgroup: kselftests: add test_core to .gitignore
Message-ID: <1536212843-3774-1-git-send-email-Lei.Yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180906054723.D5zBA_JYXVyxKnUMqlnu5LMfaz1pINPF5yPoSrdKsHE@z>

Update .gitignore file.

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
