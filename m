From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Thu, 18 Jan 2018 17:35:53 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: vm: update .gitignore
	with missing generated file
Message-ID: <20180119003553.28331-1-shuahkh@osg.samsung.com>

Add missing generated file to .gitignore.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/vm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vm/.gitignore b/tools/testing/selftests/vm/.gitignore
index 1ca2ee4d15b9..63c94d776e89 100644
--- a/tools/testing/selftests/vm/.gitignore
+++ b/tools/testing/selftests/vm/.gitignore
@@ -10,3 +10,4 @@ userfaultfd
 mlock-intersect-test
 mlock-random-test
 virtual_address_range
+gup_benchmark
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
