From: shuah at kernel.org (shuah)
Date: Thu, 25 Apr 2019 10:36:24 -0600
Subject: [PATCH v2 7/8] selftests: Remove KSFT_TAP_LEVEL
In-Reply-To: <20190424231237.14776-8-keescook@chromium.org>
References: <20190424231237.14776-1-keescook@chromium.org>
 <20190424231237.14776-8-keescook@chromium.org>
Message-ID: <1ca5ee52-ab07-9142-2e45-44df1e94276e@kernel.org>

On 4/24/19 5:12 PM, Kees Cook wrote:
> Since sub-testing can now be detected by indentation level, this removes
> KSFT_TAP_LEVEL so that subtests report their TAP header for later parsing.
> 
> Signed-off-by: Kees Cook <keescook at chromium.org>
> ---
>   tools/testing/selftests/Makefile            | 6 ------
>   tools/testing/selftests/kselftest/runner.sh | 1 -
>   2 files changed, 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 64699f59b95f..9f05448e5e4b 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -86,12 +86,6 @@ else
>   	endif
>   endif
>   
> -# KSFT_TAP_LEVEL is used from KSFT framework to prevent nested TAP header
> -# printing from tests. Applicable to run_tests case where run_tests adds
> -# TAP header prior running tests and when a test program invokes another
> -# with system() call. Export it here to cover override RUN_TESTS defines.
> -export KSFT_TAP_LEVEL=`echo 1`
> -
>   # Prepare for headers install
>   top_srcdir ?= ../../..
>   include $(top_srcdir)/scripts/subarch.include
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index b9f74e5a2ee5..eff3ee303d0d 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -2,7 +2,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   #
>   # Runs a set of tests in a given subdirectory.
> -export KSFT_TAP_LEVEL=1
>   export skip_rc=4
>   export logfile=/dev/stdout
>   export per_test_logging=
> 

Does this take into ksft_print_header() getenv logic to avoid printing
TAP headers from tests when they fork? e.g timers tests do that a lot.

thanks,
-- Shuah
