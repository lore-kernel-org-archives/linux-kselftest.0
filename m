From: shuah at kernel.org (Shuah Khan)
Date: Thu, 23 Aug 2018 11:05:05 -0600
Subject: [PATCH] selftests: android: move config up a level
In-Reply-To: <20180821161003.16737-1-anders.roxell@linaro.org>
References: <20180821161003.16737-1-anders.roxell@linaro.org>
Message-ID: <11b89e1a-1543-5774-13f8-e004c8fc46ef@kernel.org>

Hi Anders,

On 08/21/2018 10:10 AM, Anders Roxell wrote:
> 'make kselftest-merge' assumes that the config files for the tests are
> located under the 'main' test dir, like tools/testing/selftests/android/
> and not in a subdir to android.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  Documentation/dev-tools/kselftest.rst            | 2 +-
>  tools/testing/selftests/android/{ion => }/config | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename tools/testing/selftests/android/{ion => }/config (100%)

Please split this patch into two with the Doc change into as a separate
patch.

> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 6f653acea248..dad1bb8711e2 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -159,7 +159,7 @@ Contributing new tests (details)
>   * If a test needs specific kernel config options enabled, add a config file in
>     the test directory to enable them.
>  
> -   e.g: tools/testing/selftests/android/ion/config
> +   e.g: tools/testing/selftests/android/config
>  
>  Test Harness
>  ============
> diff --git a/tools/testing/selftests/android/ion/config b/tools/testing/selftests/android/config
> similarity index 100%
> rename from tools/testing/selftests/android/ion/config
> rename to tools/testing/selftests/android/config
> 

thanks,
-- Shuah
