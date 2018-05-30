From: ahiliation@gmail.com (Jeffrin Jose T)
Date: Thu, 31 May 2018 03:33:39 +0530
Subject: [RESEND PATCH] selftests: intel_pstate: notification about privilege
 required to run intel_pstate testing script
Message-ID: <20180530220339.6107-1-ahiliation@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180530220339.KDKSbXbYqjKAPvf67XmILqsVJ6G33CUq-6viRssDBGs@z>

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
index 8576f6564307..e7008f614ad7 100755
--- a/tools/testing/selftests/intel_pstate/run.sh
+++ b/tools/testing/selftests/intel_pstate/run.sh
@@ -38,6 +38,12 @@ if ! uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ | grep -q x86; then
 	exit $ksft_skip
 fi
 
+msg="skip all tests:"
+if [ $UID != 0 ] && [ $EVALUATE_ONLY == 0 ]; then
+    echo $msg please run this as root >&2
+    exit $ksft_skip
+fi
+
 max_cpus=$(($(nproc)-1))
 
 function run_test () {
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
