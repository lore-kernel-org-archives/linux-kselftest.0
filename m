From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:24 -0600
Subject: [PATCH 20/24] selftests: membarrier: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-20-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180505011324.fxd0Aj11efVlC-JFCaDhx7LfDffrhImWMpSCzqzyFNo@z>

When membarrier test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as a
fail by the Kselftest framework. This leads to false negative result
even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Change it to use ksft_exit_skip() when the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/membarrier/membarrier_test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
index 22bffd55a523..6793f8ecc8e7 100644
--- a/tools/testing/selftests/membarrier/membarrier_test.c
+++ b/tools/testing/selftests/membarrier/membarrier_test.c
@@ -293,10 +293,9 @@ static int test_membarrier_query(void)
 		}
 		ksft_exit_fail_msg("sys_membarrier() failed\n");
 	}
-	if (!(ret & MEMBARRIER_CMD_GLOBAL)) {
-		ksft_test_result_fail("sys_membarrier() CMD_GLOBAL query failed\n");
-		ksft_exit_fail_msg("sys_membarrier is not supported.\n");
-	}
+	if (!(ret & MEMBARRIER_CMD_GLOBAL))
+		ksft_exit_skip(
+			"sys_membarrier unsupported: CMD_GLOBAL not found.\n");
 
 	ksft_test_result_pass("sys_membarrier available\n");
 	return 0;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
