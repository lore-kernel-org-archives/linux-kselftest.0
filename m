From: shuah at kernel.org (shuah)
Date: Tue, 26 Feb 2019 18:59:48 -0700
Subject: [PATCH v2 5/5] selftests/ima: loading kernel modules
In-Reply-To: <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-6-git-send-email-zohar@linux.ibm.com>
Message-ID: <19d494c6-ecb1-b884-2d23-5f556b3ec05b@kernel.org>

On 2/26/19 4:27 PM, Mimi Zohar wrote:
> While the appended kernel module signature can be verified, when loading
> a kernel module via either the init_module or the finit_module syscall,
> verifying the IMA signature requires access to the file descriptor,
> which is only available via the finit_module syscall.  As "modprobe"
> does not provide a flag allowing the syscall - init_module or
> finit_module - to be specified, this patch does not load a kernel
> module.
> 
> This test simply verifies that on secure boot enabled systems with
> "CONFIG_IMA_ARCH_POLICY" configured, that at least an appended kernel
> module signature or an IMA signature is required based on the Kconfig
> and the runtime IMA policy.
> 
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> ---
>   tools/testing/selftests/ima/Makefile              |  2 +-
>   tools/testing/selftests/ima/test_kernel_module.sh | 96 +++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 1 deletion(-)
>   create mode 100755 tools/testing/selftests/ima/test_kernel_module.sh
> 
> diff --git a/tools/testing/selftests/ima/Makefile b/tools/testing/selftests/ima/Makefile
> index 049c83c9426c..ef5201ff0bea 100644
> --- a/tools/testing/selftests/ima/Makefile
> +++ b/tools/testing/selftests/ima/Makefile
> @@ -4,7 +4,7 @@ uname_M := $(shell uname -m 2>/dev/null || echo not)
>   ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
>   
>   ifeq ($(ARCH),x86)
> -TEST_PROGS := test_kexec_load.sh test_kexec_file_load.sh
> +TEST_PROGS := test_kexec_load.sh test_kexec_file_load.sh test_kernel_module.sh
>   TEST_FILES := common_lib.sh
>   
>   include ../lib.mk
> diff --git a/tools/testing/selftests/ima/test_kernel_module.sh b/tools/testing/selftests/ima/test_kernel_module.sh
> new file mode 100755
> index 000000000000..4009e1b60b03
> --- /dev/null
> +++ b/tools/testing/selftests/ima/test_kernel_module.sh
> @@ -0,0 +1,96 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later

Same here

# SPDX-License-Identifier: GPL-2.0

> +#
> +# On secure boot enabled systems with "CONFIG_IMA_ARCH_POLICY" configured,
> +# this test verifies that at least an appended kernel module signature or
> +# an IMA signature is required.  It does not attempt to load a kernel module.
> +
> +TEST="KERNEL_MODULE"
> +. ./common_lib.sh
> +
> +trap "{ rm -f $IKCONFIG ; }" EXIT
> +
> +# Some of the IMA builtin policies may require the kernel modules to
> +# be signed, but these policy rules may be replaced with a custom
> +# policy.  Only CONFIG_IMA_APPRAISE_REQUIRE_MODULE_SIGS persists after
> +# loading a custom policy.  Check if it is enabled, before reading the
> +# IMA runtime sysfs policy file.
> +# Return 1 for IMA signature required and 0 for not required.
> +is_ima_sig_required()
> +{
> +	local ret=0
> +
> +	kconfig_enabled "CONFIG_IMA_APPRAISE_REQUIRE_MODULE_SIGS=y" \
> +		"IMA kernel module signature required"
> +	if [ $? -eq 1 ]; then
> +		log_info "IMA kernel module signature required"
> +		return 1
> +	fi
> +
> +	# The architecture specific or a custom policy may require the
> +	# kernel module to be signed.  Policy rules are walked sequentially.
> +	# As a result, a policy rule may be defined, but might not necessarily
> +	# be used.  This test assumes if a policy rule is specified, that is
> +	# the intent.
> +	if [ $ima_read_policy -eq 1 ]; then
> +		check_ima_policy "appraise" "func=MODULE_CHECK" \
> +			"appraise_type=imasig"
> +		ret=$?
> +		[ $ret -eq 1 ] && log_info "IMA signature required";
> +	fi
> +	return $ret
> +}
> +
> +# loading kernel modules requires root privileges
> +if [ $(id -ru) -ne 0 ]; then
> +	log_skip "requires root privileges"
> +fi
> +
> +# Are appended signatures required?
> +if [ -e /sys/module/module/parameters/sig_enforce ]; then
> +	sig_enforce=$(cat /sys/module/module/parameters/sig_enforce)
> +	if [ $sig_enforce = "Y" ]; then
> +		log_pass "appended kernel module signature required"
> +	fi
> +fi
> +
> +get_secureboot_mode
> +if [ $? -eq 0 ]; then
> +	log_skip "secure boot not enabled"
> +fi
> +
> +# get the kernel config
> +get_kconfig
> +

get_kconfig() will be good candidate as a kselftest common
function. Is that possible?

> +# Determine which kernel config options are enabled
> +kconfig_enabled "CONFIG_IMA_ARCH_POLICY=y" \
> +	"architecture specific policy enabled"
> +arch_policy=$?
> +
> +kconfig_enabled "CONFIG_MODULE_SIG=y" \
> +	"appended kernel modules signature enabled"
> +appended_sig_enabled=$?
> +
> +kconfig_enabled "CONFIG_IMA_READ_POLICY=y" "reading IMA policy permitted"
> +ima_read_policy=$?
> +
> +is_ima_sig_required
> +ima_sig_required=$?
> +
> +if [ $arch_policy -eq 0 ]; then
> +	log_skip "architecture specific policy not enabled"
> +fi
> +
> +if [ $appended_sig_enabled -eq 1 ]; then
> +	log_fail "appended kernel module signature enabled, but not required"
> +fi
> +
> +if [ $ima_sig_required -eq 1 ]; then
> +	log_pass "IMA kernel module signature required"
> +fi
> +
> +if [ $ima_read_policy -eq 1 ]; then
> +	log_fail "IMA kernel module signature not required"
> +else
> +	log_skip "reading IMA policy not permitted"
> +fi
> 

thanks,
-- Shuah
