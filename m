From: pvorel@suse.cz (Petr Vorel)
Date: Thu, 28 Feb 2019 23:20:39 +0100
Subject: [PATCH v2 4/5] selftests/ima: kexec_file_load syscall test
In-Reply-To: <1551223620-11586-5-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-5-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190228222039.GD20335@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228222039.iVxMfhK11HcdwbWyhEh-b791FEU27pl21x0nm6FGRgY@z>

Hi Mimi,

> The kernel can be configured to verify PE signed kernel images, IMA
> kernel image signatures, both types of signatures, or none.  This test
> verifies only properly signed kernel images are loaded into memory,
> based on the kernel configuration and runtime policies.

> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>

> --- a/tools/testing/selftests/ima/common_lib.sh
...
> +# Look for config option in Kconfig file.
> +# Return 1 for found and 0 for not found.
I'd revert the return value (for shell is 0 as ok),
but matter of preference.
> +kconfig_enabled()
> +{
> +	local config="$1"
> +	local msg="$2"
> +
> +        grep -E -q $config $IKCONFIG
> +        if [ $? -eq 0 ]; then
> +                log_info "$msg"
> +                return 1
> +        fi
> +        return 0
> +}
> +
> +# Attempt to get the kernel config first via proc, and then by
> +# extracting it from the kernel image or the configs.ko using
> +# scripts/extract-ikconfig.
> +# Return 1 for found and 0 for not found.
"and 0 for not found": This is not true as it uses log_skip which exits.
And you don't read this value anywhere.
> +get_kconfig()
> +{
> +	local proc_config="/proc/config.gz"
> +	local module_dir="/lib/modules/`uname -r`"
> +	local configs_module="$module_dir/kernel/kernel/configs.ko"
> +
> +	if [ ! -f $proc_config ]; then
> +		modprobe configs > /dev/null 2>&1
> +	fi
> +	if [ -f $proc_config ]; then
> +		cat $proc_config | gunzip > $IKCONFIG 2>/dev/null
> +		if [ $? -eq 0 ]; then
> +			return 1
> +		fi
> +	fi
> +
> +	local extract_ikconfig="$module_dir/source/scripts/extract-ikconfig"
> +	if [ ! -f $extract_ikconfig ]; then
> +		log_skip "extract-ikconfig not found"
> +	fi
> +
> +	$extract_ikconfig $KERNEL_IMAGE > $IKCONFIG 2>/dev/null
> +	if [ $? -eq 1 ]; then
> +		if [ ! -f $configs_module ]; then
> +			log_skip "CONFIG_IKCONFIG not enabled"
> +		fi
> +		$extract_ikconfig $configs_module > $IKCONFIG
> +		if [ $? -eq 1 ]; then
> +			log_skip "CONFIG_IKCONFIG not enabled"
> +		fi
> +	fi
> +	return 1
> +}


Kind regards,
Petr
