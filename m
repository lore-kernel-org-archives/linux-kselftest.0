From: pvorel at suse.cz (Petr Vorel)
Date: Fri, 5 Apr 2019 14:47:51 +0200
Subject: [PATCH] selftests/kexec: update get_secureboot_mode
In-Reply-To: <1554300369.7309.59.camel@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
 <1554300369.7309.59.camel@linux.ibm.com>
Message-ID: <20190405124751.GA26595@dell5510>

Hi Mimi,

Reviewed-by: Petr Vorel <pvorel at suse.cz>

Some minor comments below.

...
> diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
...
>  # Check efivar SecureBoot-$(the UUID) and SetupMode-$(the UUID).
> +# (Based on kdump-lib.sh)
> +get_efivarfs_secureboot_mode()
> +{
> +	local efivarfs="/sys/firmware/efi/efivars"
> +	local secure_boot_file=""
> +	local setup_mode_file=""
> +	local secureboot_mode=0
> +	local setup_mode=0
NOTE: variables does not need to be initialized (in both functions).
> +
> +	# Make sure that efivar_fs is mounted in the normal location
> +	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
> +		log_info "efivars is not mounted on $efivarfs"
> +		return 0;
> +	fi
> +	secure_boot_file=$(find "$efivarfs" -name SecureBoot-* 2>/dev/null)
> +	setup_mode_file=$(find "$efivarfs" -name SetupMode-* 2>/dev/null)
> +	if [ -f "$secure_boot_file" ] && [ -f "$setup_mode_file" ]; then
> +		secureboot_mode=$(hexdump -v -e '/1 "%d\ "' \
> +			"$secure_boot_file"|cut -d' ' -f 5)
> +		setup_mode=$(hexdump -v -e '/1 "%d\ "' \
> +			"$setup_mode_file"|cut -d' ' -f 5)
> +
> +		if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
> +			log_info "secure boot mode enabled (efivar_fs)"
Instead of efivar_fs maybe CONFIG_EFIVAR_FS or EFIVAR_FS?

> +			return 1;
> +		fi
> +	fi
> +	return 0;
> +}
> +
> +get_efi_var_secureboot_mode()
> +{
> +	local efi_vars="/sys/firmware/efi/vars"
> +	local secure_boot_file=""
> +	local setup_mode_file=""
> +	local secureboot_mode=0
> +	local setup_mode=0
> +
> +	if [ ! -d "$efi_vars" ]; then
> +		log_skip "efi_vars is not enabled\n"
> +		return 0;
Return is not needed (log_skip exits).
> +	fi
> +	secure_boot_file=$(find "$efi_vars" -name SecureBoot-* 2>/dev/null)
> +	setup_mode_file=$(find "$efi_vars" -name SetupMode-* 2>/dev/null)
> +	if [ -f "$secure_boot_file/data" ] && \
> +	   [ -f "$setup_mode_file/data" ]; then
> +		secureboot_mode=`od -An -t u1 "$secure_boot_file/data"`
> +		setup_mode=`od -An -t u1 "$setup_mode_file/data"`
> +
> +		if [ $secureboot_mode -eq 1 ] && [ $setup_mode -eq 0 ]; then
> +			log_info "secure boot mode enabled (efi_var)"
Instead of efi_var maybe CONFIG_EFI_VARS or EFI_VARS?

...

Kind regards,
Petr
