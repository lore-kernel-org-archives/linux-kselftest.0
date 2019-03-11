From: zohar@linux.ibm.com (Mimi Zohar)
Date: Mon, 11 Mar 2019 07:41:09 -0400
Subject: [PATCH v3 3/7] selftests/ima: define common logging functions
In-Reply-To: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552304473-3966-4-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190311114109.njaP_k4Q5fkoMKljy2CCwdw-Gbw_loT1_70q-nim1oo@z>

Define log_info, log_pass, log_fail, and log_skip functions.

Suggested-by: Petr Vorel <pvorel at suse.cz>
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>
---
 tools/testing/selftests/ima/ima_common_lib.sh  | 31 ++++++++++++++++++++++++++
 tools/testing/selftests/ima/test_kexec_load.sh | 19 +++++-----------
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/ima/ima_common_lib.sh b/tools/testing/selftests/ima/ima_common_lib.sh
index 403666247b10..59482914ac19 100755
--- a/tools/testing/selftests/ima/ima_common_lib.sh
+++ b/tools/testing/selftests/ima/ima_common_lib.sh
@@ -1,5 +1,36 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
+#
+# Kselftest framework defines: ksft_pass=0, ksft_fail=1, ksft_skip=4
+
+VERBOSE="${VERBOSE:-1}"
+
+log_info()
+{
+	[ $VERBOSE -ne 0 ] && echo "[INFO] $1"
+}
+
+# The ksefltest framework requirement returns 0 for PASS.
+log_pass()
+{
+
+	[ $VERBOSE -ne 0 ] && echo "$1 [PASS]"
+	exit 0
+}
+
+# The ksefltest framework requirement returns 1 for FAIL.
+log_fail()
+{
+	[ $VERBOSE -ne 0 ] && echo "$1 [FAIL]"
+	exit 1
+}
+
+# The ksefltest framework requirement returns 4 for SKIP.
+log_skip()
+{
+	[ $VERBOSE -ne 0 ] && echo "$1"
+	exit 4
+}
 
 # Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
 # The secure boot mode can be accessed either as the last integer
diff --git a/tools/testing/selftests/ima/test_kexec_load.sh b/tools/testing/selftests/ima/test_kexec_load.sh
index e84139c1506b..99ab87b6c681 100755
--- a/tools/testing/selftests/ima/test_kexec_load.sh
+++ b/tools/testing/selftests/ima/test_kexec_load.sh
@@ -6,15 +6,10 @@
 
 TEST="$0"
 . ./ima_common_lib.sh
-rc=0
-
-# Kselftest framework requirement - SKIP code is 4.
-ksft_skip=4
 
 # kexec requires root privileges
 if [ $(id -ru) -ne 0 ]; then
-	echo "$TEST: requires root privileges" >&2
-	exit $ksft_skip
+	log_skip "requires root privileges"
 fi
 
 get_secureboot_mode
@@ -26,18 +21,14 @@ kexec --load $KERNEL_IMAGE 2>&1 > /dev/null
 if [ $? -eq 0 ]; then
 	kexec --unload
 	if [ $secureboot -eq 1 ]; then
-		echo "$TEST: kexec_load succeeded [FAIL]"
-		rc=1
+		log_fail "kexec_load succeeded"
 	else
-		echo "$TEST: kexec_load succeeded [PASS]"
+		log_pass "kexec_load succeeded"
 	fi
 else
 	if [ $secureboot -eq 1 ]; then
-		echo "$TEST: kexec_load failed [PASS]"
+		log_pass "kexec_load failed"
 	else
-		echo "$TEST: kexec_load failed [FAIL]"
-		rc=1
+		log_fail "kexec_load failed"
 	fi
 fi
-
-exit $rc
-- 
2.7.5
