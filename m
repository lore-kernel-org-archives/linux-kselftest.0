From: zohar at linux.ibm.com (Mimi Zohar)
Date: Thu, 14 Mar 2019 14:41:09 -0400
Subject: [PATCH v4 1/8] selftests/kexec: move the IMA kexec_load selftest to
 selftests/kexec
In-Reply-To: <1552588876-28481-1-git-send-email-zohar@linux.ibm.com>
References: <1552588876-28481-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1552588876-28481-2-git-send-email-zohar@linux.ibm.com>

As requested move the existing kexec_load selftest and subsequent kexec
tests to the selftests/kexec directory.

Suggested-by: Dave Young <dyoung at redhat.com>
Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/Makefile                 |  2 +-
 tools/testing/selftests/ima/Makefile             | 11 -----
 tools/testing/selftests/ima/config               |  4 --
 tools/testing/selftests/ima/test_kexec_load.sh   | 54 ------------------------
 tools/testing/selftests/kexec/Makefile           | 11 +++++
 tools/testing/selftests/kexec/config             |  4 ++
 tools/testing/selftests/kexec/test_kexec_load.sh | 54 ++++++++++++++++++++++++
 7 files changed, 70 insertions(+), 70 deletions(-)
 delete mode 100644 tools/testing/selftests/ima/Makefile
 delete mode 100644 tools/testing/selftests/ima/config
 delete mode 100755 tools/testing/selftests/ima/test_kexec_load.sh
 create mode 100644 tools/testing/selftests/kexec/Makefile
 create mode 100644 tools/testing/selftests/kexec/config
 create mode 100755 tools/testing/selftests/kexec/test_kexec_load.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 1a2bd15c5b6e..6da1e32d2b99 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -14,11 +14,11 @@ TARGETS += firmware
 TARGETS += ftrace
 TARGETS += futex
 TARGETS += gpio
-TARGETS += ima
 TARGETS += intel_pstate
 TARGETS += ipc
 TARGETS += ir
 TARGETS += kcmp
+TARGETS += kexec
 TARGETS += kvm
 TARGETS += lib
 TARGETS += membarrier
diff --git a/tools/testing/selftests/ima/Makefile b/tools/testing/selftests/ima/Makefile
deleted file mode 100644
index 0b3adf5444b6..000000000000
--- a/tools/testing/selftests/ima/Makefile
+++ /dev/null
@@ -1,11 +0,0 @@
-# Makefile for kexec_load
-
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
-
-ifeq ($(ARCH),x86)
-TEST_PROGS := test_kexec_load.sh
-
-include ../lib.mk
-
-endif
diff --git a/tools/testing/selftests/ima/config b/tools/testing/selftests/ima/config
deleted file mode 100644
index 6bc86d4d9bb4..000000000000
--- a/tools/testing/selftests/ima/config
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_IMA_APPRAISE
-CONFIG_IMA_ARCH_POLICY
-CONFIG_SECURITYFS
-CONFIG_KEXEC_VERIFY_SIG
diff --git a/tools/testing/selftests/ima/test_kexec_load.sh b/tools/testing/selftests/ima/test_kexec_load.sh
deleted file mode 100755
index 1c10093fb526..000000000000
--- a/tools/testing/selftests/ima/test_kexec_load.sh
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0+
-# Loading a kernel image via the kexec_load syscall should fail
-# when the kerne is CONFIG_KEXEC_VERIFY_SIG enabled and the system
-# is booted in secureboot mode.
-
-TEST="$0"
-EFIVARFS="/sys/firmware/efi/efivars"
-rc=0
-
-# Kselftest framework requirement - SKIP code is 4.
-ksft_skip=4
-
-# kexec requires root privileges
-if [ $UID != 0 ]; then
-	echo "$TEST: must be run as root" >&2
-	exit $ksft_skip
-fi
-
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
-
-# kexec_load should fail in secure boot mode
-KERNEL_IMAGE="/boot/vmlinuz-`uname -r`"
-kexec -l $KERNEL_IMAGE &>> /dev/null
-if [ $? == 0 ]; then
-	kexec -u
-	if [ "$secureboot" == "1" ]; then
-		echo "$TEST: kexec_load succeeded [FAIL]"
-		rc=1
-	else
-		echo "$TEST: kexec_load succeeded [PASS]"
-	fi
-else
-	if [ "$secureboot" == "1" ]; then
-		echo "$TEST: kexec_load failed [PASS]"
-	else
-		echo "$TEST: kexec_load failed [FAIL]"
-		rc=1
-	fi
-fi
-
-exit $rc
diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
new file mode 100644
index 000000000000..0b3adf5444b6
--- /dev/null
+++ b/tools/testing/selftests/kexec/Makefile
@@ -0,0 +1,11 @@
+# Makefile for kexec_load
+
+uname_M := $(shell uname -m 2>/dev/null || echo not)
+ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+
+ifeq ($(ARCH),x86)
+TEST_PROGS := test_kexec_load.sh
+
+include ../lib.mk
+
+endif
diff --git a/tools/testing/selftests/kexec/config b/tools/testing/selftests/kexec/config
new file mode 100644
index 000000000000..6bc86d4d9bb4
--- /dev/null
+++ b/tools/testing/selftests/kexec/config
@@ -0,0 +1,4 @@
+CONFIG_IMA_APPRAISE
+CONFIG_IMA_ARCH_POLICY
+CONFIG_SECURITYFS
+CONFIG_KEXEC_VERIFY_SIG
diff --git a/tools/testing/selftests/kexec/test_kexec_load.sh b/tools/testing/selftests/kexec/test_kexec_load.sh
new file mode 100755
index 000000000000..1c10093fb526
--- /dev/null
+++ b/tools/testing/selftests/kexec/test_kexec_load.sh
@@ -0,0 +1,54 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0+
+# Loading a kernel image via the kexec_load syscall should fail
+# when the kerne is CONFIG_KEXEC_VERIFY_SIG enabled and the system
+# is booted in secureboot mode.
+
+TEST="$0"
+EFIVARFS="/sys/firmware/efi/efivars"
+rc=0
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+# kexec requires root privileges
+if [ $UID != 0 ]; then
+	echo "$TEST: must be run as root" >&2
+	exit $ksft_skip
+fi
+
+# Make sure that efivars is mounted in the normal location
+if ! grep -q "^\S\+ $EFIVARFS efivarfs" /proc/mounts; then
+	echo "$TEST: efivars is not mounted on $EFIVARFS" >&2
+	exit $ksft_skip
+fi
+
+# Get secureboot mode
+file="$EFIVARFS/SecureBoot-*"
+if [ ! -e $file ]; then
+	echo "$TEST: unknown secureboot mode" >&2
+	exit $ksft_skip
+fi
+secureboot=`hexdump $file | awk '{print substr($4,length($4),1)}'`
+
+# kexec_load should fail in secure boot mode
+KERNEL_IMAGE="/boot/vmlinuz-`uname -r`"
+kexec -l $KERNEL_IMAGE &>> /dev/null
+if [ $? == 0 ]; then
+	kexec -u
+	if [ "$secureboot" == "1" ]; then
+		echo "$TEST: kexec_load succeeded [FAIL]"
+		rc=1
+	else
+		echo "$TEST: kexec_load succeeded [PASS]"
+	fi
+else
+	if [ "$secureboot" == "1" ]; then
+		echo "$TEST: kexec_load failed [PASS]"
+	else
+		echo "$TEST: kexec_load failed [FAIL]"
+		rc=1
+	fi
+fi
+
+exit $rc
-- 
2.7.5
