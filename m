From: zohar at linux.ibm.com (Mimi Zohar)
Date: Mon, 08 Apr 2019 07:06:02 -0400
Subject: [RFC PATCH 1/2] selftests: Start shell API
In-Reply-To: <20190406214915.16914-2-pvorel@suse.cz>
References: <20190406214915.16914-1-pvorel@suse.cz>
 <20190406214915.16914-2-pvorel@suse.cz>
Message-ID: <1554721562.17244.29.camel@linux.ibm.com>

Hi Petr,

On Sat, 2019-04-06 at 23:49 +0200, Petr Vorel wrote:
> kselftest.sh is a beginning of shell API.
> ATM it's a stub (target could be as rich as LTP API), containing only:
> * exit codes
> * filling TEST variable
> * logging functions
> * requiring root function
> * add script directory into PATH
> 
> Inspired by kexec functions (with some cleanup)
> and LTP.
> 
> Signed-off-by: Petr Vorel <pvorel at suse.cz>
> ---
>  tools/testing/selftests/kselftest.sh | 53 ++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 tools/testing/selftests/kselftest.sh
> 
> diff --git a/tools/testing/selftests/kselftest.sh b/tools/testing/selftests/kselftest.sh
> new file mode 100644
> index 000000000000..519ec2707dd8
> --- /dev/null
> +++ b/tools/testing/selftests/kselftest.sh
> @@ -0,0 +1,53 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2019 Petr Vorel <pvorel at suse.cz>
> +
> +PATH="$(dirname $0):$PATH"
> +
> +KSFT_PASS=0
> +KSFT_FAIL=1
> +KSFT_XFAIL=2
> +KSFT_XPASS=3
> +KSFT_SKIP=4

The kexec tests only defined functions for PASS, FAIL, and SKIP.  What
is the difference between KSFT_FAIL and KSFT_XFAIL, and similarly
between KSFT_PASS and KSFT_XPASS?  Either here or above the functions
should be a comment.

> +
> +TEST=$(basename $0)
> +
> +ksft_info()
> +{
> +	echo "[INFO] $TEST: $1"
> +}


The "ksft_" prefix is good.

Mimi

> +ksft_pass()
> +{
> +	echo "[PASS] $TEST: $1"
> +	exit $KSFT_PASS
> +}
> +
> +ksft_fail()
> +{
> +	echo "[FAIL] $TEST: $1"
> +	exit $KSFT_FAIL
> +}
> +
> +ksft_xfail()
> +{
> +	echo "[FAIL] $TEST: $1"
> +	exit $KSFT_XFAIL
> +}

> +ksft_xpass()
> +{
> +	echo "[PASS] $TEST: $1"
> +	exit $KSFT_XPASS
> +}
> +
> +ksft_skip()
> +{
> +	echo "[SKIP] $TEST: $1"
> +	exit $KSFT_SKIP
> +}
> +
> +ksft_require_root()
> +{
> +	[ $(id -ru) -eq 0 ] || ksft_skip "requires root privileges"
> +}
