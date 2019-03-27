From: pvorel@suse.cz (Petr Vorel)
Date: Wed, 27 Mar 2019 12:45:00 +0100
Subject: [PATCH v5 4/9] selftests/kexec: define common logging functions
In-Reply-To: <1553607257-18906-5-git-send-email-zohar@linux.ibm.com>
References: <1553607257-18906-1-git-send-email-zohar@linux.ibm.com>
 <1553607257-18906-5-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190327114500.GA13687@dell5510>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190327114500.zIYj070eTQpnlv_UzIu2n3CFVst6hkBJob9rxnE8Zmk@z>

Hi, Mimi, Dave,

> diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
> index 05376be6a6f7..d108ac538f14 100755
> --- a/tools/testing/selftests/kexec/kexec_common_lib.sh
> +++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
> @@ -1,5 +1,36 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
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
Redundant new line.
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
...


Kind regards,
Petr
