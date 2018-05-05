From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:25 -0600
Subject: [PATCH 21/24] selftests: memfd: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-21-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180505011325.kH7-6WSmFemnO79fi2qS-0vj73lY9gSCVHlEsucvbqg@z>

When memfd test is skipped because of unmet dependencies and/or unsupported
configuration, it returns non-zero value which is treated as a fail by the
Kselftest framework. This leads to false negative result even when the test
could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Added an explicit check for root user and return skip code.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/memfd/run_tests.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memfd/run_tests.sh b/tools/testing/selftests/memfd/run_tests.sh
index c2d41ed81b24..88dc206a69b7 100755
--- a/tools/testing/selftests/memfd/run_tests.sh
+++ b/tools/testing/selftests/memfd/run_tests.sh
@@ -1,6 +1,14 @@
 #!/bin/bash
 # please run as root
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+if [ $UID != 0 ]; then
+	echo "Please run this test as root"
+	exit $ksft_skip
+fi
+
 #
 # Normal tests requiring no special resources
 #
@@ -33,7 +41,7 @@ if [ -n "$freepgs" ] && [ $freepgs -lt $hpages_test ]; then
 	echo $(( $hpages_needed + $nr_hugepgs )) > /proc/sys/vm/nr_hugepages
 	if [ $? -ne 0 ]; then
 		echo "Please run this test as root"
-		exit 1
+		exit $ksft_skip
 	fi
 	while read name size unit; do
 		if [ "$name" = "HugePages_Free:" ]; then
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
