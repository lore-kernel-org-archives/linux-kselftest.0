From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Thu, 18 Jan 2018 17:36:24 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: bpf: update .gitignore
	with missing generated files
Message-ID: <20180119003624.28395-1-shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180119003624.PYByhU9qP0659a_YWrNGubafLBE0tT6qu9PAMb36ZRk@z>

Update .gitignore with missing generated files.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/bpf/.gitignore | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 541d9d7fad5a..1e09d77f1948 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -3,3 +3,10 @@ test_maps
 test_lru_map
 test_lpm_map
 test_tag
+FEATURE-DUMP.libbpf
+fixdep
+test_align
+test_dev_cgroup
+test_progs
+test_verifier_log
+feature
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
