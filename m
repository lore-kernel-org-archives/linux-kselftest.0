From: zohar at linux.ibm.com (Mimi Zohar)
Date: Wed, 03 Apr 2019 10:06:09 -0400
Subject: [PATCH] selftests/kexec: update get_secureboot_mode
In-Reply-To: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <1554300369.7309.59.camel@linux.ibm.com>

The get_secureboot_mode() function unnecessarily requires both
CONFIG_EFIVAR_FS and CONFIG_EFI_VARS to be enabled to determine if the
system is booted in secure boot mode.  On some systems the old EFI
variable support is not enabled or, possibly, even implemented.

This patch first checks the efivars filesystem for the SecureBoot and
SetupMode flags, but falls back to using the old EFI variable support.

The "secure_boot_file" and "setup_mode_file" couldn't be quoted due to
globbing.  This patch also removes the globbing.

Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
---
 tools/testing/selftests/kexec/kexec_common_lib.sh | 87 +++++++++++++++++------
 1 file changed, 67 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
index b7ac8f3fa025..4d3ff08bdb81 100755
--- a/tools/testing/selftests/kexec/kexec_common_lib.sh
+++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
@@ -35,6 +35,64 @@ log_skip()
 }
 
 # Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
+# (Based on kdump-lib.sh)
+get_efivarfs_secureboot_mode()
+{
+	local efivarfs="/sys/firmware/efi/efivars"
+	local secure_boot_file=""
+	local setup_mode_file=""
+	local secureboot_mode=0
+	local setup_mode=0
+
+	# Make sure that efivar_fs is mounted in the normal location
+	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
+		log_info "efivars is not mounted on $efivarfs"
+		return 0;
+	fi
+	secure_boot_file=$(find "$efivarfs" -name SecureBoot-* 2>/dev/null)
+	setup_mode_file=$(find "$efivarfs" -name SetupMode-* 2>/dev/null)
+	if [ -f "$secure_boot_file" ] && [ -f "$setup_mode_file" ]; then
+		secureboot_mode=$(hexdump -v -e '/1 "%d\ "' \
+			"$secure_boot_file"|cut -d' ' -f 5)
+		setup_mode=$(hexdump -v -e '/1 "%d\ "' \
+			"$setup_mode_file"|cut -d' ' -f 5)
+
+		if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
+			log_info "secure boot mode enabled (efivar_fs)"
+			return 1;
+		fi
+	fi
+	return 0;
+}
+
+get_efi_var_secureboot_mode()
+{
+	local efi_vars="/sys/firmware/efi/vars"
+	local secure_boot_file=""
+	local setup_mode_file=""
+	local secureboot_mode=0
+	local setup_mode=0
+
+	if [ ! -d "$efi_vars" ]; then
+		log_skip "efi_vars is not enabled\n"
+		return 0;
+	fi
+	secure_boot_file=$(find "$efi_vars" -name SecureBoot-* 2>/dev/null)
+	setup_mode_file=$(find "$efi_vars" -name SetupMode-* 2>/dev/null)
+	if [ -f "$secure_boot_file/data" ] && \
+	   [ -f "$setup_mode_file/data" ]; then
+		secureboot_mode=`od -An -t u1 "$secure_boot_file/data"`
+		setup_mode=`od -An -t u1 "$setup_mode_file/data"`
+
+		if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
+			log_info "secure boot mode enabled (efi_var)"
+			return 1;
+		fi
+	fi
+	return 0;
+}
+
+# Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
 # The secure boot mode can be accessed either as the last integer
 # of "od -An -t u1 /sys/firmware/efi/efivars/SecureBoot-*" or from
 # "od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data".  The efi
@@ -42,32 +100,21 @@ log_skip()
 # Return 1 for SecureBoot mode enabled and SetupMode mode disabled.
 get_secureboot_mode()
 {
-	local efivarfs="/sys/firmware/efi/efivars"
-	local secure_boot_file="$efivarfs/../vars/SecureBoot-*/data"
-	local setup_mode_file="$efivarfs/../vars/SetupMode-*/data"
 	local secureboot_mode=0
-	local setup_mode=0
 
-	# Make sure that efivars is mounted in the normal location
-	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
-		log_skip "efivars is not mounted on $efivarfs"
-	fi
+	get_efivarfs_secureboot_mode
+	secureboot_mode=$?
 
-	# Due to globbing, quoting "secure_boot_file" and "setup_mode_file"
-	# is not possible.  (Todo: initialize variables using find or ls.)
-	if [ ! -e $secure_boot_file ] || [ ! -e $setup_mode_file ]; then
-		log_skip "unknown secureboot/setup mode"
+	# fallback to using the efi_var files
+	if [ $secureboot_mode -eq 0 ]; then
+		get_efi_var_secureboot_mode
+		secureboot_mode=$?
 	fi
 
-	secureboot_mode=`od -An -t u1 $secure_boot_file`
-	setup_mode=`od -An -t u1 $setup_mode_file`
-
-	if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
-		log_info "secure boot mode enabled"
-		return 1;
+	if [ $secureboot_mode -eq 0 ]; then
+		log_info "secure boot mode not enabled"
 	fi
-	log_info "secure boot mode not enabled"
-	return 0;
+	return $secureboot_mode;
 }
 
 require_root_privileges()
-- 
2.7.5
