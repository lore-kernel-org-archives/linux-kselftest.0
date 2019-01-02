From: colin.king at canonical.com (Colin King)
Date: Wed,  2 Jan 2019 09:54:03 +0000
Subject: [PATCH][next] x86/mpx/selftests: fix spelling mistake "succeded" ->
 "succeeded"
Message-ID: <20190102095403.513-1-colin.king@canonical.com>

From: Colin Ian King <colin.king at canonical.com>

There is a spelling mistake eprintf error message, fix it.

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/x86/mpx-mini-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mpx-mini-test.c b/tools/testing/selftests/x86/mpx-mini-test.c
index 50f7e9272481..bf1bb15b6fbe 100644
--- a/tools/testing/selftests/x86/mpx-mini-test.c
+++ b/tools/testing/selftests/x86/mpx-mini-test.c
@@ -1503,7 +1503,7 @@ void check_mpx_insns_and_tables(void)
 		exit(20);
 	}
 	if (successes != total_nr_tests) {
-		eprintf("ERROR: succeded fewer than number of tries (%d != %d)\n",
+		eprintf("ERROR: succeeded fewer than number of tries (%d != %d)\n",
 				successes, total_nr_tests);
 		exit(21);
 	}
-- 
2.19.1
