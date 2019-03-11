From: zohar at linux.ibm.com (Mimi Zohar)
Date: Mon, 11 Mar 2019 07:41:07 -0400
Subject: [PATCH v3 1/7] selftests/ima: cleanup the kexec selftest
In-Reply-To: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552304473-3966-2-git-send-email-zohar@linux.ibm.com>

Remove the few bashisms and use the complete option name for clarity.

Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>
---
 tools/testing/selftests/ima/test_kexec_load.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/ima/test_kexec_load.sh b/tools/testing/selftests/ima/test_kexec_load.sh
index 1c10093fb526..36f3089ac225 100755
--- a/tools/testing/selftests/ima/test_kexec_load.sh
+++ b/tools/testing/selftests/ima/test_kexec_load.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
-# SPDX-License-Identifier: GPL-2.0+
+# SPDX-License-Identifier: GPL-2.0
 # Loading a kernel image via the kexec_load syscall should fail
-# when the kerne is CONFIG_KEXEC_VERIFY_SIG enabled and the system
+# when the kernel is CONFIG_KEXEC_VERIFY_SIG enabled and the system
 # is booted in secureboot mode.
 
 TEST="$0"
@@ -12,8 +12,8 @@ rc=0
 ksft_skip=4
 
 # kexec requires root privileges
-if [ $UID != 0 ]; then
-	echo "$TEST: must be run as root" >&2
+if [ $(id -ru) -ne 0 ]; then
+	echo "$TEST: requires root privileges" >&2
 	exit $ksft_skip
 fi
 
@@ -33,17 +33,17 @@ secureboot=`hexdump $file | awk '{print substr($4,length($4),1)}'`
 
 # kexec_load should fail in secure boot mode
 KERNEL_IMAGE="/boot/vmlinuz-`uname -r`"
-kexec -l $KERNEL_IMAGE &>> /dev/null
-if [ $? == 0 ]; then
-	kexec -u
-	if [ "$secureboot" == "1" ]; then
+kexec --load $KERNEL_IMAGE 2>&1 > /dev/null
+if [ $? -eq 0 ]; then
+	kexec --unload
+	if [ $secureboot -eq 1 ]; then
 		echo "$TEST: kexec_load succeeded [FAIL]"
 		rc=1
 	else
 		echo "$TEST: kexec_load succeeded [PASS]"
 	fi
 else
-	if [ "$secureboot" == "1" ]; then
+	if [ $secureboot -eq 1 ]; then
 		echo "$TEST: kexec_load failed [PASS]"
 	else
 		echo "$TEST: kexec_load failed [FAIL]"
-- 
2.7.5
