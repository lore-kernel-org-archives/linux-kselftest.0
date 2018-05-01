From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Tue,  1 May 2018 16:54:39 -0600
Subject: [PATCH 7/7] selftests: kselftest: change KSFT_SKIP=4 instead of
 KSFT_PASS
In-Reply-To: <cover.1525212671.git.shuah@kernel.org>
References: <cover.1525212671.git.shuah@kernel.org>
Message-ID:
 <16ce561ed5b34d1066d2e9de747ccdf0550078e7.1525212671.git.shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180501225439.kHoI83cUCA5NPUjBxBrihZZK4TW2J_0Hk7LKcaI8gn8@z>

KSFT_SKIP points to KSFT_PASS resulting in reporting skipped tests as
Passed, when test programs exit with KSFT_SKIP or call ksft_exit_skip().
If tests are skipped because of unmet dependencies and/or unsupported
configuration, reporting them as passed leads to too many false positives.

Fix it to return a skip code of 4 to clearly differentiate the skipped
tests.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/kselftest.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 1b9d8ecdebce..15e6b75fc3a5 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -20,7 +20,7 @@
 #define KSFT_XFAIL 2
 #define KSFT_XPASS 3
 /* Treat skip as pass */
-#define KSFT_SKIP  KSFT_PASS
+#define KSFT_SKIP  4
 
 /* counters */
 struct ksft_count {
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
