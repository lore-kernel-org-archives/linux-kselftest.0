From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Tue, 13 Feb 2018 14:44:38 -0700
Subject: [PATCH] selftests: vm: update .gitignore with new test
Message-ID: <20180213214438.21771-1-shuahkh@osg.samsung.com>

Update .gitignore with new test.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/vm/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/vm/.gitignore b/tools/testing/selftests/vm/.gitignore
index 63c94d776e89..342c7bc9dc8c 100644
--- a/tools/testing/selftests/vm/.gitignore
+++ b/tools/testing/selftests/vm/.gitignore
@@ -11,3 +11,4 @@ mlock-intersect-test
 mlock-random-test
 virtual_address_range
 gup_benchmark
+va_128TBswitch
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
