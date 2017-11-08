From: Lei.Yang at windriver.com (Lei Yang)
Date: Wed, 8 Nov 2017 13:24:10 +0800
Subject: [Linux-kselftest-mirror] [PATCH] selftests: kselftest.h: fix
	compilation errors
Message-ID: <20171108052410.14616-1-Lei.Yang@windriver.com>

In next branch, Various build failed with:

In file included from membarrier_test.c:8:0:
../kselftest.h: In function ‘ksft_print_header’:
../kselftest.h:61:3: error: expected ‘)’ before ‘printf’
   printf("TAP version 13\n");
   ^
../kselftest.h:62:1: error: expected expression before ‘}’ token
 }
 ^

Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
---
 tools/testing/selftests/kselftest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index d6732ba312ef..acc98a5c3d73 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -57,7 +57,7 @@ static inline int ksft_get_error_cnt(void) { return ksft_cnt.ksft_error; }
 
 static inline void ksft_print_header(void)
 {
-	if (!(getenv("KSFT_TAP_LEVEL"))
+	if (!(getenv("KSFT_TAP_LEVEL")))
 		printf("TAP version 13\n");
 }
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
