From: alakesh.haloi@gmail.com (Alakesh Haloi)
Date: Fri, 24 May 2019 01:20:41 +0000
Subject: [PATCH] selftests: kselftest: fix function return type
Message-ID:
 <20190524012041.GA75353@ip-172-31-44-144.us-west-2.compute.internal>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524012041.FKXE4G9VZ2IIplbSaVC9_JzRA_Otm8WcZ_DkDeXVEbs@z>

ksft_test_num function returns sum of unsigned ints and hence should
return unsigned int. This fixes the following compiler warning

In file included from sync_test.c:37:0:
../kselftest.h: In function ‘ksft_print_cnts’:
../kselftest.h:73:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  if (ksft_plan != ksft_test_num())
                ^~
Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>
---
 tools/testing/selftests/kselftest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index ec15c4f6af55..5a98c80e079e 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -35,7 +35,7 @@ struct ksft_count {
 static struct ksft_count ksft_cnt;
 static unsigned int ksft_plan;
 
-static inline int ksft_test_num(void)
+static inline unsigned int ksft_test_num(void)
 {
 	return ksft_cnt.ksft_pass + ksft_cnt.ksft_fail +
 		ksft_cnt.ksft_xfail + ksft_cnt.ksft_xpass +
-- 
2.17.1
