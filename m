From: zohar@linux.ibm.com (Mimi Zohar)
Date: Tue, 26 Feb 2019 18:26:57 -0500
Subject: [PATCH v2 2/5] selftests/ima: define a set of common functions
In-Reply-To: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1551223620-11586-3-git-send-email-zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190226232657.RMqDbdakMfn2UkUbhjeBt3tVvd92tfdTW8Rz3y0mAtI@z>

Define, update and move get_secureboot_mode() to a common file for use
by other tests.

Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>
---
 tools/testing/selftests/ima/Makefile           |  1 +
 tools/testing/selftests/ima/common_lib.sh      | 24 ++++++++++++++++++++++++
 tools/testing/selftests/ima/test_kexec_load.sh | 17 +++--------------
 3 files changed, 28 insertions(+), 14 deletions(-)
 create mode 100755 tools/testing/selftests/ima/common_lib.sh

diff --git a/tools/testing/selftests/ima/Makefile b/tools/testing/selftests/ima/Makefile
index 0b3adf5444b6..46b9e04d2737 100644
--- a/tools/testing/selftests/ima/Makefile
+++ b/tools/testing/selftests/ima/Makefile
@@ -5,6 +5,7 @@ ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 ifeq ($(ARCH),x86)
 TEST_PROGS := test_kexec_load.sh
+TEST_FILES := common_lib.sh
 
 include ../lib.mk
 
diff --git a/tools/testing/selftests/ima/common_lib.sh b/tools/testing/selftests/ima/common_lib.sh
new file mode 100755
index 000000000000..5583ea74c14e
--- /dev/null
+++ b/tools/testing/selftests/ima/common_lib.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# The secure boot mode can be accessed either as the last integer
+# of "od -An -t u1 /sys/firmware/efi/efivars/SecureBoot-*" or from
+# "od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data".
+# Return 1 for SecureBoot mode enabled.
+get_secureboot_mode()
+{
+	local efivarfs="/sys/firmware/efi/efivars"
+	# Make sure that efivars is mounted in the normal location
+	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
+		echo "$TEST: efivars is not mounted on $efivarfs" >&2
+		exit $ksft_skip
+	fi
+
+	# Get secureboot mode
+	local file="$efivarfs/../vars/SecureBoot-*/data"
+	if [ ! -e $file ]; then
+		echo "$TEST: unknown secureboot mode" >&2
+		exit $ksft_skip
+	fi
+	return `od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data`
+}
diff --git a/tools/testing/selftests/ima/test_kexec_load.sh b/tools/testing/selftests/ima/test_kexec_load.sh
index 0345803e7bec..35934e0665f1 100755
--- a/tools/testing/selftests/ima/test_kexec_load.sh
+++ b/tools/testing/selftests/ima/test_kexec_load.sh
@@ -5,7 +5,7 @@
 # is booted in secureboot mode.
 
 TEST="$0"
-EFIVARFS="/sys/firmware/efi/efivars"
+. ./common_lib.sh
 rc=0
 
 # Kselftest framework requirement - SKIP code is 4.
@@ -17,19 +17,8 @@ if [ $(id -ru) -ne 0 ]; then
 	exit $ksft_skip
 fi
 
-# Make sure that efivars is mounted in the normal location
-if ! grep -q "^\S\+ $EFIVARFS efivarfs" /proc/mounts; then
-	echo "$TEST: efivars is not mounted on $EFIVARFS" >&2
-	exit $ksft_skip
-fi
-
-# Get secureboot mode
-file="$EFIVARFS/SecureBoot-*"
-if [ ! -e $file ]; then
-	echo "$TEST: unknown secureboot mode" >&2
-	exit $ksft_skip
-fi
-secureboot=`hexdump $file | awk '{print substr($4,length($4),1)}'`
+get_secureboot_mode
+secureboot=$?
 
 # kexec_load should fail in secure boot mode
 KERNEL_IMAGE="/boot/vmlinuz-`uname -r`"
-- 
2.7.5
