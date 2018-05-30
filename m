From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Wed, 30 May 2018 11:34:08 -0600
Subject: [PATCH] selftests: lib: fix prime_numbers module search and skip logic
Message-ID: <20180530173408.11736-1-shuah@kernel.org>

prime_numbers modules search and skip logic removes the module instead
of searching for it. Fix it.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib/prime_numbers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib/prime_numbers.sh b/tools/testing/selftests/lib/prime_numbers.sh
index 76602d4b050f..78e7483c8d60 100755
--- a/tools/testing/selftests/lib/prime_numbers.sh
+++ b/tools/testing/selftests/lib/prime_numbers.sh
@@ -5,7 +5,7 @@
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
-if ! /sbin/modprobe -q -r prime_numbers; then
+if ! /sbin/modprobe -q -n prime_numbers; then
 	echo "prime_numbers: module prime_numbers is not found [SKIP]"
 	exit $ksft_skip
 fi
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
