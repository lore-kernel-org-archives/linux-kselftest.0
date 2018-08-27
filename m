From: shuah at kernel.org (Shuah Khan)
Date: Mon, 27 Aug 2018 11:57:58 -0600
Subject: [PATCH] doc: dev-tools: kselftest.rst: update config file location
In-Reply-To: <20180824124744.9842-1-anders.roxell@linaro.org>
References: <20180824124744.9842-1-anders.roxell@linaro.org>
Message-ID: <55c84596-0e12-0211-dbee-9eddb9a0ab28@kernel.org>

On 08/24/2018 06:47 AM, Anders Roxell wrote:
> Config fragment files should be placed in
> tools/testing/selftests/<testdir>/config
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  Documentation/dev-tools/kselftest.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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
> 

Jo Jon,

This patch looks good. Here is my Ack for it go through doc tree.

Acked-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

thanks,
-- Shuah
