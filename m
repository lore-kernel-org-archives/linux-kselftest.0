From: bauerman@linux.ibm.com (Thiago Jung Bauermann)
Date: Wed, 16 Jan 2019 20:52:03 -0200
Subject: [PATCH,RESEND] selftests: add TPM 2.0 tests
In-Reply-To: <20190116213102.25268-1-jarkko.sakkinen@linux.intel.com>
References: <20190116213102.25268-1-jarkko.sakkinen@linux.intel.com>
Message-ID: <87r2dcqkq4.fsf@morokweng.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190116225203.keM8cf4lo__GhTwVUwET-Y7RO4pZOSRK3rO44QtoZeg@z>


Hello,

Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com> writes:

> Added the tests that I've been using for testing TPM 2.0 functionality
> for long time but have out-of-tree so far residing in
>
> https://github.com/jsakkine-intel/tpm2-scripts
>
> Cc: Tadeusz Struk <tadeusz.struk at intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen at linux.intel.com>
> Acked-By: Joey Pabalinas <joeypabalinas at gmail.com>
> ---
>  tools/testing/selftests/Makefile           |   1 +
>  tools/testing/selftests/tpm2/Makefile      |   3 +
>  tools/testing/selftests/tpm2/test_smoke.sh |   4 +
>  tools/testing/selftests/tpm2/test_space.sh |   4 +
>  tools/testing/selftests/tpm2/tpm2.py       | 696 +++++++++++++++++++++
>  tools/testing/selftests/tpm2/tpm2_tests.py | 227 +++++++
>  6 files changed, 935 insertions(+)
>  create mode 100644 tools/testing/selftests/tpm2/Makefile
>  create mode 100755 tools/testing/selftests/tpm2/test_smoke.sh
>  create mode 100755 tools/testing/selftests/tpm2/test_space.sh
>  create mode 100644 tools/testing/selftests/tpm2/tpm2.py
>  create mode 100644 tools/testing/selftests/tpm2/tpm2_tests.py
>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 1a2bd15c5b6e..e4556132cbc4 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -47,6 +47,7 @@ TARGETS += sysctl
>  ifneq (1, $(quicktest))
>  TARGETS += timers
>  endif
> +TARGETS += tpm

This should be tpm2, right?

>  TARGETS += user
>  TARGETS += vm
>  TARGETS += x86

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
