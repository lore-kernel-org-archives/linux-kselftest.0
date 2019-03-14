From: zohar at linux.ibm.com (Mimi Zohar)
Date: Thu, 14 Mar 2019 14:41:11 -0400
Subject: [PATCH v4 3/8] selftests/kexec: define a set of common functions
In-Reply-To: <1552588876-28481-1-git-send-email-zohar@linux.ibm.com>
References: <1552588876-28481-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552588876-28481-4-git-send-email-zohar@linux.ibm.com>

Define, update and move get_secureboot_mode() to a common file for use
by other tests.

Updated to check both the efivar SecureBoot-$(UUID) and
SetupMode-$(UUID), based on Dave Young's review.

Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
Reviewed-by: Petr Vorel <pvorel at suse.cz>
Cc: Dave Young <dyoung at redhat.com>
---
 tools/testing/selftests/kexec/Makefile            |  1 +
 tools/testing/selftests/kexec/kexec_common_lib.sh | 38 +++++++++++++++++++++++
 tools/testing/selftests/kexec/test_kexec_load.sh  | 17 ++--------
 3 files changed, 42 insertions(+), 14 deletions(-)
 create mode 100755 tools/testing/selftests/kexec/kexec_common_lib.sh

diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
index 0b3adf5444b6..1a795861040b 100644
--- a/tools/testing/selftests/kexec/Makefile
+++ b/tools/testing/selftests/kexec/Makefile
@@ -5,6 +5,7 @@ ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 ifeq ($(ARCH),x86)
 TEST_PROGS := test_kexec_load.sh
+TEST_FILES := kexec_common_lib.sh
 
 include ../lib.mk
 
diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
new file mode 100755
index 000000000000..05376be6a6f7
--- /dev/null
+++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
@@ -0,0 +1,38 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
+# The secure boot mode can be accessed either as the last integer
+# of "od -An -t u1 /sys/firmware/efi/efivars/SecureBoot-*" or from
+# "od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data".  The efi
+# SetupMode can be similarly accessed.
+# Return 1 for SecureBoot mode enabled and SetupMode mode disabled.
+get_secureboot_mode()
+{
+	local efivarfs="/sys/firmware/efi/efivars"
+	local secure_boot_file="$efivarfs/../vars/SecureBoot-*/data"
+	local setup_mode_file="$efivarfs/../vars/SetupMode-*/data"
+	local secureboot_mode=0
+	local setup_mode=0
+
+	# Make sure that efivars is mounted in the normal location
+	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
+		log_skip "efivars is not mounted on $efivarfs"
+	fi
+
+	# Due to globbing, quoting "secure_boot_file" and "setup_mode_file"
+	# is not possible.  (Todo: initialize variables using find or ls.)
+	if [ ! -e $secure_boot_file ] || [ ! -e $setup_mode_file ]; then
+		log_skip "unknown secureboot/setup mode"
+	fi
+
+	secureboot_mode=`od -An -t u1 $secure_boot_file`
+	setup_mode=`od -An -t u1 $setup_mode_file`
+
+	if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
+		log_info "secure boot mode enabled"
+		return 1;
+	fi
+	log_info "secure boot mode not enabled"
+	return 0;
+}
diff --git a/tools/testing/selftests/kexec/test_kexec_load.sh b/tools/testing/selftests/kexec/test_kexec_load.sh
index 82a01a4d5c8d..86625c3f1e5d 100755
--- a/tools/testing/selftests/kexec/test_kexec_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_load.sh
@@ -5,7 +5,7 @@
 # is booted in secureboot mode.
 
 TEST="$0"
-EFIVARFS="/sys/firmware/efi/efivars"
+. ./kexec_common_lib.sh
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
