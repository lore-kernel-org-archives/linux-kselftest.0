From: ahiliation@gmail.com (Jeffrin Jose T)
Date: Sat, 26 May 2018 22:31:35 +0530
Subject: [PATCH] selftests: intel_pstate: notification about privilege
 required to run intel_pstate testing script
Message-ID: <20180526170135.3340-1-ahiliation@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180526170135.2vngb6sFzgB6XsCwmW5-u59nc55le0w_LAYd-2bO_w8@z>

The intel_pstate related testing script need root level privileges
when trying to access certain file for the successful execution of
the script.But this is not the case always like when using evaluation
only mode, which only require user level privilege.

This patch is to notify the user about the privilege the script
demands for the successful execution of the test.

Signed-off-by: Jeffrin Jose T (Rajagiri SET) <ahiliation at gmail.com>
---
 tools/testing/selftests/intel_pstate/run.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
index 6ded61670f6d..4ddd389c2cb9 100755
--- a/tools/testing/selftests/intel_pstate/run.sh
+++ b/tools/testing/selftests/intel_pstate/run.sh
@@ -33,6 +33,12 @@ EVALUATE_ONLY=0
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
+msg="skip all tests:"
+if [ $UID != 0 ] && [ $EVALUATE_ONLY == 0 ]; then
+    echo $msg please run this as root >&2
+    exit $ksft_skip
+fi
+
 if ! uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ | grep -q x86; then
 	echo "$0 # Skipped: Test can only run on x86 architectures."
 	exit $ksft_skip
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
