From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:08 -0600
Subject: [PATCH 04/24] selftests: cpufreq: return Kselftest Skip code for
 skipped tests
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-4-shuah@kernel.org>

When cpufreq test is skipped because of unmet dependencies and/or
unsupported configuration, it exits with error which is treated as
a fail by the Kselftest framework. This leads to false negative
result even when the test could not be run.

Change it to return kselftest skip code when a test gets skipped to
clearly report that the test could not be run.

Kselftest framework SKIP code is 4 and the framework prints appropriate
messages to indicate that the test is skipped.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/cpufreq/main.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cpufreq/main.sh b/tools/testing/selftests/cpufreq/main.sh
index d83922de9d89..31f8c9a76c5f 100755
--- a/tools/testing/selftests/cpufreq/main.sh
+++ b/tools/testing/selftests/cpufreq/main.sh
@@ -13,6 +13,9 @@ SYSFS=
 CPUROOT=
 CPUFREQROOT=
 
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
 helpme()
 {
 	printf "Usage: $0 [-h] [-todg args]
@@ -38,7 +41,7 @@ prerequisite()
 
 	if [ $UID != 0 ]; then
 		echo $msg must be run as root >&2
-		exit 2
+		exit $ksft_skip
 	fi
 
 	taskset -p 01 $$
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
