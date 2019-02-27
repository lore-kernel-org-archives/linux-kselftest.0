From: shuah at kernel.org (shuah)
Date: Tue, 26 Feb 2019 18:54:46 -0700
Subject: [PATCH v2 4/5] selftests/ima: kexec_file_load syscall test
In-Reply-To: <1551223620-11586-5-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-5-git-send-email-zohar@linux.ibm.com>
Message-ID: <e61083af-1d8b-3f6d-ccc3-35e99b3ea94e@kernel.org>

On 2/26/19 4:26 PM, Mimi Zohar wrote:
> The kernel can be configured to verify PE signed kernel images, IMA
> kernel image signatures, both types of signatures, or none.  This test
> verifies only properly signed kernel images are loaded into memory,
> based on the kernel configuration and runtime policies.
> 
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> ---
>   tools/testing/selftests/ima/Makefile               |   2 +-
>   tools/testing/selftests/ima/common_lib.sh          |  97 ++++++++++
>   .../testing/selftests/ima/test_kexec_file_load.sh  | 195 +++++++++++++++++++++
>   tools/testing/selftests/ima/test_kexec_load.sh     |   1 -
>   4 files changed, 293 insertions(+), 2 deletions(-)
>   create mode 100755 tools/testing/selftests/ima/test_kexec_file_load.sh
> 
> diff --git a/tools/testing/selftests/ima/Makefile b/tools/testing/selftests/ima/Makefile
> index 46b9e04d2737..049c83c9426c 100644
> --- a/tools/testing/selftests/ima/Makefile
> +++ b/tools/testing/selftests/ima/Makefile
> @@ -4,7 +4,7 @@ uname_M := $(shell uname -m 2>/dev/null || echo not)
>   ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
>   
>   ifeq ($(ARCH),x86)
> -TEST_PROGS := test_kexec_load.sh
> +TEST_PROGS := test_kexec_load.sh test_kexec_file_load.sh
>   TEST_FILES := common_lib.sh
>   
>   include ../lib.mk
> diff --git a/tools/testing/selftests/ima/common_lib.sh b/tools/testing/selftests/ima/common_lib.sh
> index c6d04006281d..24091f29bd09 100755
> --- a/tools/testing/selftests/ima/common_lib.sh
> +++ b/tools/testing/selftests/ima/common_lib.sh
> @@ -4,6 +4,9 @@
>   # Kselftest framework defines: ksft_pass=0, ksft_fail=1, ksft_skip=4
>   
>   VERBOSE="${VERBOSE:-1}"
> +IKCONFIG="/tmp/config-`uname -r`"
> +KERNEL_IMAGE="/boot/vmlinuz-`uname -r`"
> +SECURITYFS=$(grep "securityfs" /proc/mounts | awk '{print $2}')
>   
>   log_info()
>   {
> @@ -55,3 +58,97 @@ get_secureboot_mode()
>   
>   	return $ret
>   }
> +
> +# Look for config option in Kconfig file.
> +# Return 1 for found and 0 for not found.
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
> +
> +# Make sure that securityfs is mounted
> +mount_securityfs()
> +{
> +	if [ -z $SECURITYFS ]; then
> +		SECURITYFS=/sys/kernel/security
> +		mount -t securityfs security $SECURITYFS
> +	fi
> +
> +	if [ ! -d "$SECURITYFS" ]; then
> +		log_fail "$SECURITYFS :securityfs is not mounted"
> +	fi
> +}
> +
> +# The policy rule format is an "action" followed by key-value pairs.  This
> +# function supports up to two key-value pairs, in any order.
> +# For example: action func=<keyword> [appraise_type=<type>]
> +# Return 1 for found and 0 for not found.
> +check_ima_policy()
> +{
> +	local action=$1
> +	local keypair1="$2"
> +	local keypair2="$3"
> +
> +	mount_securityfs
> +
> +	local ima_policy=$SECURITYFS/ima/policy
> +	if [ ! -e $ima_policy ]; then
> +		log_fail "$ima_policy not found"
> +	fi
> +
> +	if [ -n $keypair2 ]; then
> +		grep -e "^$action.*$keypair1" "$ima_policy" | \
> +			grep -q -e "$keypair2"
> +	else
> +		grep -q -e "^$action.*$keypair1" "$ima_policy"
> +	fi
> +
> +	[ $? -eq 0 ] && ret=1 || ret=0
> +        return $ret
> +}
> diff --git a/tools/testing/selftests/ima/test_kexec_file_load.sh b/tools/testing/selftests/ima/test_kexec_file_load.sh
> new file mode 100755
> index 000000000000..e08c7e6cf28c
> --- /dev/null
> +++ b/tools/testing/selftests/ima/test_kexec_file_load.sh
> @@ -0,0 +1,195 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#

Same here

# SPDX-License-Identifier: GPL-2.0

thanks,
-- Shuah
