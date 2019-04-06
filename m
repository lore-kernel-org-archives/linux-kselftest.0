From: pvorel@suse.cz (Petr Vorel)
Date: Sat,  6 Apr 2019 23:49:15 +0200
Subject: [RFC PATCH 2/2] selftest/kexec: Use kselftest shell API
In-Reply-To: <20190406214915.16914-1-pvorel@suse.cz>
References: <20190406214915.16914-1-pvorel@suse.cz>
Message-ID: <20190406214915.16914-3-pvorel@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190406214915.zIMioANco_9v6gdbKKld2_i9kB_3xYzFyIqBuFGsPKw@z>

using kselftest.sh helpers + minor not related changes in kexec
(i.e. remove executable bit from kexec library as not needed
for library).

Signed-off-by: Petr Vorel <pvorel at suse.cz>
---
Why removed VERBOSE: I don't know, if someone really needs tests to be
quiet, he can just redirect to /dev/null.
---
 .../selftests/kexec/kexec_common_lib.sh       | 74 +++++--------------
 .../selftests/kexec/test_kexec_file_load.sh   | 53 ++++++-------
 .../selftests/kexec/test_kexec_load.sh        | 20 ++---
 3 files changed, 52 insertions(+), 95 deletions(-)
 mode change 100755 => 100644 tools/testing/selftests/kexec/kexec_common_lib.sh

diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
old mode 100755
new mode 100644
index 43017cfe88f7..08ecfe62c9fc
--- a/tools/testing/selftests/kexec/kexec_common_lib.sh
+++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
@@ -1,39 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
-#
-# Kselftest framework defines: ksft_pass=0, ksft_fail=1, ksft_skip=4
+
+. $(dirname $0)/../kselftest.sh
 
 VERBOSE="${VERBOSE:-1}"
 IKCONFIG="/tmp/config-`uname -r`"
 KERNEL_IMAGE="/boot/vmlinuz-`uname -r`"
 SECURITYFS=$(grep "securityfs" /proc/mounts | awk '{print $2}')
 
-log_info()
-{
-	[ $VERBOSE -ne 0 ] && echo "[INFO] $1"
-}
-
-# The ksefltest framework requirement returns 0 for PASS.
-log_pass()
-{
-	[ $VERBOSE -ne 0 ] && echo "$1 [PASS]"
-	exit 0
-}
-
-# The ksefltest framework requirement returns 1 for FAIL.
-log_fail()
-{
-	[ $VERBOSE -ne 0 ] && echo "$1 [FAIL]"
-	exit 1
-}
-
-# The ksefltest framework requirement returns 4 for SKIP.
-log_skip()
-{
-	[ $VERBOSE -ne 0 ] && echo "$1"
-	exit 4
-}
-
 # Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
 # (Based on kdump-lib.sh)
 get_efivarfs_secureboot_mode()
@@ -46,8 +20,8 @@ get_efivarfs_secureboot_mode()
 
 	# Make sure that efivar_fs is mounted in the normal location
 	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
-		log_info "efivars is not mounted on $efivarfs"
-		return 0;
+		ksft_info "efivars is not mounted on $efivarfs"
+		return 0
 	fi
 	secure_boot_file=$(find "$efivarfs" -name SecureBoot-* 2>/dev/null)
 	setup_mode_file=$(find "$efivarfs" -name SetupMode-* 2>/dev/null)
@@ -58,11 +32,11 @@ get_efivarfs_secureboot_mode()
 			"$setup_mode_file"|cut -d' ' -f 5)
 
 		if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
-			log_info "secure boot mode enabled (CONFIG_EFIVAR_FS)"
-			return 1;
+			ksft_info "secure boot mode enabled (CONFIG_EFIVAR_FS)"
+			return 1
 		fi
 	fi
-	return 0;
+	return 0
 }
 
 get_efi_var_secureboot_mode()
@@ -73,9 +47,8 @@ get_efi_var_secureboot_mode()
 	local secureboot_mode
 	local setup_mode
 
-	if [ ! -d "$efi_vars" ]; then
-		log_skip "efi_vars is not enabled\n"
-	fi
+	[ -d "$efi_vars" ] || ksft_skip "efi_vars is not enabled"
+
 	secure_boot_file=$(find "$efi_vars" -name SecureBoot-* 2>/dev/null)
 	setup_mode_file=$(find "$efi_vars" -name SetupMode-* 2>/dev/null)
 	if [ -f "$secure_boot_file/data" ] && \
@@ -84,11 +57,11 @@ get_efi_var_secureboot_mode()
 		setup_mode=`od -An -t u1 "$setup_mode_file/data"`
 
 		if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
-			log_info "secure boot mode enabled (CONFIG_EFI_VARS)"
-			return 1;
+			ksft_info "secure boot mode enabled (CONFIG_EFI_VARS)"
+			return 1
 		fi
 	fi
-	return 0;
+	return 0
 }
 
 # Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
@@ -111,16 +84,9 @@ get_secureboot_mode()
 	fi
 
 	if [ $secureboot_mode -eq 0 ]; then
-		log_info "secure boot mode not enabled"
-	fi
-	return $secureboot_mode;
-}
-
-require_root_privileges()
-{
-	if [ $(id -ru) -ne 0 ]; then
-		log_skip "requires root privileges"
+		ksft_info "secure boot mode not enabled"
 	fi
+	return $secureboot_mode
 }
 
 # Look for config option in Kconfig file.
@@ -132,7 +98,7 @@ kconfig_enabled()
 
 	grep -E -q $config $IKCONFIG
 	if [ $? -eq 0 ]; then
-		log_info "$msg"
+		ksft_info "$msg"
 		return 1
 	fi
 	return 0
@@ -160,17 +126,17 @@ get_kconfig()
 
 	local extract_ikconfig="$module_dir/source/scripts/extract-ikconfig"
 	if [ ! -f $extract_ikconfig ]; then
-		log_skip "extract-ikconfig not found"
+		ksft_skip "extract-ikconfig not found"
 	fi
 
 	$extract_ikconfig $KERNEL_IMAGE > $IKCONFIG 2>/dev/null
 	if [ $? -eq 1 ]; then
 		if [ ! -f $configs_module ]; then
-			log_skip "CONFIG_IKCONFIG not enabled"
+			ksft_skip "CONFIG_IKCONFIG not enabled"
 		fi
 		$extract_ikconfig $configs_module > $IKCONFIG
 		if [ $? -eq 1 ]; then
-			log_skip "CONFIG_IKCONFIG not enabled"
+			ksft_skip "CONFIG_IKCONFIG not enabled"
 		fi
 	fi
 	return 1
@@ -185,7 +151,7 @@ mount_securityfs()
 	fi
 
 	if [ ! -d "$SECURITYFS" ]; then
-		log_fail "$SECURITYFS :securityfs is not mounted"
+		ksft_fail "$SECURITYFS :securityfs is not mounted"
 	fi
 }
 
@@ -204,7 +170,7 @@ check_ima_policy()
 
 	local ima_policy=$SECURITYFS/ima/policy
 	if [ ! -e $ima_policy ]; then
-		log_fail "$ima_policy not found"
+		ksft_fail "$ima_policy not found"
 	fi
 
 	if [ -n $keypair2 ]; then
diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index fa7c24e8eefb..7e41dd4a5a63 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -10,8 +10,7 @@
 # built with CONFIG_IKCONFIG enabled and either CONFIG_IKCONFIG_PROC
 # enabled or access to the extract-ikconfig script.
 
-TEST="KEXEC_FILE_LOAD"
-. ./kexec_common_lib.sh
+. $(dirname $0)/kexec_common_lib.sh
 
 trap "{ rm -f $IKCONFIG ; }" EXIT
 
@@ -28,7 +27,7 @@ is_ima_sig_required()
 	kconfig_enabled "CONFIG_IMA_APPRAISE_REQUIRE_KEXEC_SIGS=y" \
 		"IMA kernel image signature required"
 	if [ $? -eq 1 ]; then
-		log_info "IMA signature required"
+		ksft_info "IMA signature required"
 		return 1
 	fi
 
@@ -41,7 +40,7 @@ is_ima_sig_required()
 		check_ima_policy "appraise" "func=KEXEC_KERNEL_CHECK" \
 			"appraise_type=imasig"
 		ret=$?
-		[ $ret -eq 1 ] && log_info "IMA signature required";
+		[ $ret -eq 1 ] && ksft_info "IMA signature required"
 	fi
 	return $ret
 }
@@ -50,14 +49,14 @@ is_ima_sig_required()
 # Return 1 for PE signature found and 0 for not found.
 check_for_pesig()
 {
-	which pesign > /dev/null 2>&1 || log_skip "pesign not found"
+	which pesign > /dev/null 2>&1 || ksft_skip "pesign not found"
 
 	pesign -i $KERNEL_IMAGE --show-signature | grep -q "No signatures"
 	local ret=$?
 	if [ $ret -eq 1 ]; then
-		log_info "kexec kernel image PE signed"
+		ksft_info "kexec kernel image PE signed"
 	else
-		log_info "kexec kernel image not PE signed"
+		ksft_info "kexec kernel image not PE signed"
 	fi
 	return $ret
 }
@@ -70,16 +69,16 @@ check_for_imasig()
 
 	which getfattr > /dev/null 2>&1
 	if [ $?	-eq 1 ]; then
-		log_skip "getfattr not found"
+		ksft_skip "getfattr not found"
 	fi
 
 	line=$(getfattr -n security.ima -e hex --absolute-names $KERNEL_IMAGE 2>&1)
 	echo $line | grep -q "security.ima=0x03"
 	if [ $? -eq 0 ]; then
 		ret=1
-		log_info "kexec kernel image IMA signed"
+		ksft_info "kexec kernel image IMA signed"
 	else
-		log_info "kexec kernel image not IMA signed"
+		ksft_info "kexec kernel image not IMA signed"
 	fi
 	return $ret
 }
@@ -99,73 +98,69 @@ kexec_file_load_test()
 		# policy, make sure either an IMA or PE signature exists.
 		if [ $secureboot -eq 1 ] && [ $arch_policy -eq 1 ] && \
 			[ $ima_signed -eq 0 ] && [ $pe_signed -eq 0 ]; then
-			log_fail "$succeed_msg (missing sig)"
+			ksft_fail "$succeed_msg (missing sig)"
 		fi
 
 		if [ $kexec_sig_required -eq 1 -o $pe_sig_required -eq 1 ] \
 		     && [ $pe_signed -eq 0 ]; then
-			log_fail "$succeed_msg (missing PE sig)"
+			ksft_fail "$succeed_msg (missing PE sig)"
 		fi
 
 		if [ $ima_sig_required -eq 1 ] && [ $ima_signed -eq 0 ]; then
-			log_fail "$succeed_msg (missing IMA sig)"
+			ksft_fail "$succeed_msg (missing IMA sig)"
 		fi
 
 		if [ $pe_sig_required -eq 0 ] && [ $ima_appraise -eq 1 ] \
 		    && [ $ima_sig_required -eq 0 ] && [ $ima_signed -eq 0 ] \
 	            && [ $ima_read_policy -eq 0 ]; then
-			log_fail "$succeed_msg (possibly missing IMA sig)"
+			ksft_fail "$succeed_msg (possibly missing IMA sig)"
 		fi
 
 		if [ $pe_sig_required -eq 0 ] && [ $ima_appraise -eq 0 ]; then
-			log_info "No signature verification required"
+			ksft_info "No signature verification required"
 		elif [ $pe_sig_required -eq 0 ] && [ $ima_appraise -eq 1 ] \
 		    && [ $ima_sig_required -eq 0 ] && [ $ima_signed -eq 0 ] \
 	            && [ $ima_read_policy -eq 1 ]; then
-			log_info "No signature verification required"
+			ksft_info "No signature verification required"
 		fi
 
-		log_pass "$succeed_msg"
+		ksft_pass "$succeed_msg"
 	fi
 
 	# Check the reason for the kexec_file_load failure
 	echo $line | grep -q "Required key not available"
 	if [ $? -eq 0 ]; then
 		if [ $platform_keyring -eq 0 ]; then
-			log_pass "$failed_msg (-ENOKEY), $key_msg"
+			ksft_pass "$failed_msg (-ENOKEY), $key_msg"
 		else
-			log_pass "$failed_msg (-ENOKEY)"
+			ksft_pass "$failed_msg (-ENOKEY)"
 		fi
 	fi
 
 	if [ $kexec_sig_required -eq 1 -o $pe_sig_required -eq 1 ] \
 	     && [ $pe_signed -eq 0 ]; then
-		log_pass "$failed_msg (missing PE sig)"
+		ksft_pass "$failed_msg (missing PE sig)"
 	fi
 
 	if [ $ima_sig_required -eq 1 ] && [ $ima_signed -eq 0 ]; then
-		log_pass "$failed_msg (missing IMA sig)"
+		ksft_pass "$failed_msg (missing IMA sig)"
 	fi
 
 	if [ $pe_sig_required -eq 0 ] && [ $ima_appraise -eq 1 ] \
 	    && [ $ima_sig_required -eq 0 ] && [ $ima_read_policy -eq 0 ] \
 	    && [ $ima_signed -eq 0 ]; then
-		log_pass "$failed_msg (possibly missing IMA sig)"
+		ksft_pass "$failed_msg (possibly missing IMA sig)"
 	fi
 
-	log_pass "$failed_msg"
-	return 0
+	ksft_pass "$failed_msg"
 }
 
-# kexec requires root privileges
-require_root_privileges
-
-# get the kernel config
+ksft_require_root
 get_kconfig
 
 kconfig_enabled "CONFIG_KEXEC_FILE=y" "kexec_file_load is enabled"
 if [ $? -eq 0 ]; then
-	log_skip "kexec_file_load is not enabled"
+	ksft_skip "kexec_file_load is not enabled"
 fi
 
 # Determine which kernel config options are enabled
diff --git a/tools/testing/selftests/kexec/test_kexec_load.sh b/tools/testing/selftests/kexec/test_kexec_load.sh
index 49c6aa929137..c5d4eaff74c9 100755
--- a/tools/testing/selftests/kexec/test_kexec_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_load.sh
@@ -4,18 +4,14 @@
 # Prevent loading a kernel image via the kexec_load syscall when
 # signatures are required.  (Dependent on CONFIG_IMA_ARCH_POLICY.)
 
-TEST="$0"
-. ./kexec_common_lib.sh
+. $(dirname $0)/kexec_common_lib.sh
 
-# kexec requires root privileges
-require_root_privileges
-
-# get the kernel config
+ksft_require_root
 get_kconfig
 
 kconfig_enabled "CONFIG_KEXEC=y" "kexec_load is enabled"
 if [ $? -eq 0 ]; then
-	log_skip "kexec_load is not enabled"
+	ksft_skip "kexec_load is not enabled"
 fi
 
 kconfig_enabled "CONFIG_IMA_APPRAISE=y" "IMA enabled"
@@ -33,15 +29,15 @@ kexec --load $KERNEL_IMAGE > /dev/null 2>&1
 if [ $? -eq 0 ]; then
 	kexec --unload
 	if [ $secureboot -eq 1 ] && [ $arch_policy -eq 1 ]; then
-		log_fail "kexec_load succeeded"
+		ksft_fail "kexec_load succeeded"
 	elif [ $ima_appraise -eq 0 -o $arch_policy -eq 0 ]; then
-		log_info "Either IMA or the IMA arch policy is not enabled"
+		ksft_info "Either IMA or the IMA arch policy is not enabled"
 	fi
-	log_pass "kexec_load succeeded"
+	ksft_pass "kexec_load succeeded"
 else
 	if [ $secureboot -eq 1 ] && [ $arch_policy -eq 1 ] ; then
-		log_pass "kexec_load failed"
+		ksft_pass "kexec_load failed"
 	else
-		log_fail "kexec_load failed"
+		ksft_fail "kexec_load failed"
 	fi
 fi
-- 
2.20.1
