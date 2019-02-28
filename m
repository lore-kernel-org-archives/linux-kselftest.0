From: pvorel at suse.cz (Petr Vorel)
Date: Thu, 28 Feb 2019 21:18:07 +0100
Subject: [PATCH v2 3/5] selftests/ima: define common logging functions
In-Reply-To: <1551223620-11586-4-git-send-email-zohar@linux.ibm.com>
References: <1551223620-11586-1-git-send-email-zohar@linux.ibm.com>
 <1551223620-11586-4-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190228201807.GB20335@dell5510>

Hi Mimi,

> Define log_info, log_pass, log_fail, and log_skip functions.

> Suggested-by: Petr Vorel <pvorel at suse.cz>
> Signed-off-by: Mimi Zohar <zohar at linux.ibm.com>
> ---
>  tools/testing/selftests/ima/common_lib.sh      | 43 +++++++++++++++++++++++---
>  tools/testing/selftests/ima/test_kexec_load.sh | 19 +++---------
>  2 files changed, 43 insertions(+), 19 deletions(-)

> diff --git a/tools/testing/selftests/ima/common_lib.sh b/tools/testing/selftests/ima/common_lib.sh
> index 5583ea74c14e..c6d04006281d 100755
> --- a/tools/testing/selftests/ima/common_lib.sh
> +++ b/tools/testing/selftests/ima/common_lib.sh
> @@ -1,5 +1,36 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Kselftest framework defines: ksft_pass=0, ksft_fail=1, ksft_skip=4
> +
> +VERBOSE="${VERBOSE:-1}"
> +
> +log_info()
> +{
> +	[ $VERBOSE -ne 0 ] && echo "[INFO] $1"
> +}
> +
> +# The ksefltest framework requirement returns 0 for PASS.
> +log_pass()
> +{
> +
> +	[ $VERBOSE -ne 0 ] && echo "$1 [PASS]"
> +	exit 0
> +}
> +
> +# The ksefltest framework requirement returns 1 for FAIL.
> +log_fail()
> +{
> +	[ $VERBOSE -ne 0 ] && echo "$1 [FAIL]"
> +	exit 1
> +}
> +
> +# The ksefltest framework requirement returns 4 for SKIP.
> +log_skip()
> +{
> +	[ $VERBOSE -ne 0 ] && echo "$1"
> +	exit 4
> +}
These might be good candidates for moving to selftest specific shell helper
library (for somebody who wants to do this work).

>  # The secure boot mode can be accessed either as the last integer
>  # of "od -An -t u1 /sys/firmware/efi/efivars/SecureBoot-*" or from
> @@ -8,17 +39,19 @@
>  get_secureboot_mode()
>  {
>  	local efivarfs="/sys/firmware/efi/efivars"
> +
>  	# Make sure that efivars is mounted in the normal location
>  	if ! grep -q "^\S\+ $efivarfs efivarfs" /proc/mounts; then
> -		echo "$TEST: efivars is not mounted on $efivarfs" >&2
> -		exit $ksft_skip
> +		log_skip "efivars is not mounted on $efivarfs"
>  	fi

>  	# Get secureboot mode
>  	local file="$efivarfs/../vars/SecureBoot-*/data"
>  	if [ ! -e $file ]; then
> -		echo "$TEST: unknown secureboot mode" >&2
> -		exit $ksft_skip
> +		log_skip "unknown secureboot mode"
>  	fi
> -	return `od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data`
> +	ret=`od -An -t u1 /sys/firmware/efi/vars/SecureBoot-*/data`
> +	[ $ret -eq 1 ] && log_info "secure boot mode enabled"
> +
> +	return $ret
>  }
> diff --git a/tools/testing/selftests/ima/test_kexec_load.sh b/tools/testing/selftests/ima/test_kexec_load.sh
> index 35934e0665f1..8b99017538ba 100755
> --- a/tools/testing/selftests/ima/test_kexec_load.sh
> +++ b/tools/testing/selftests/ima/test_kexec_load.sh
> @@ -6,15 +6,10 @@

>  TEST="$0"
>  . ./common_lib.sh
> -rc=0
> -
> -# Kselftest framework requirement - SKIP code is 4.
> -ksft_skip=4

>  # kexec requires root privileges
>  if [ $(id -ru) -ne 0 ]; then
> -	echo "$TEST: requires root privileges" >&2
> -	exit $ksft_skip
> +	log_skip "requires root privileges" >&2
You left here redirection to stderr.
+ again requiring root could be in helper library.
>  fi

>  get_secureboot_mode
> @@ -26,18 +21,14 @@ kexec --load $KERNEL_IMAGE 2>&1 > /dev/null
>  if [ $? -eq 0 ]; then
>  	kexec --unload
>  	if [ $secureboot -eq 1 ]; then
> -		echo "$TEST: kexec_load succeeded [FAIL]"
> -		rc=1
> +		log_fail "kexec_load succeeded"
>  	else
> -		echo "$TEST: kexec_load succeeded [PASS]"
> +		log_pass "kexec_load succeeded"
>  	fi
>  else
>  	if [ $secureboot -eq 1 ]; then
> -		echo "$TEST: kexec_load failed [PASS]"
> +		log_pass "kexec_load failed"
>  	else
> -		echo "$TEST: kexec_load failed [FAIL]"
> -		rc=1
> +		log_fail "kexec_load failed"
>  	fi
>  fi
> -
> -exit $rc


Kind regards,
Petr
