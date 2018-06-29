From: shuah at kernel.org (Shuah Khan)
Date: Fri, 29 Jun 2018 07:29:20 -0600
Subject: [PATCH v2] doc: dev-tools: kselftest.rst: update contributing new
 tests
In-Reply-To: <20180629125201.24025-1-anders.roxell@linaro.org>
References: <20180629100248.11560-1-anders.roxell@linaro.org>
 <20180629125201.24025-1-anders.roxell@linaro.org>
Message-ID: <4b826a04-63a7-ceb9-af8d-a83e2248a4bb@kernel.org>

On 06/29/2018 06:52 AM, Anders Roxell wrote:
> Add a description that kernel config options should be added into a
> config file that is placed next to the newly added test.
> 
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  Documentation/dev-tools/kselftest.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 3bf371a938d0..6f653acea248 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -156,6 +156,11 @@ Contributing new tests (details)
>     installed by the distro on the system should be the primary focus to be able
>     to find regressions.
>  
> + * If a test needs specific kernel config options enabled, add a config file in
> +   the test directory to enable them.
> +
> +   e.g: tools/testing/selftests/android/ion/config
> +
>  Test Harness
>  ============
>  
>
Thanks. Looks good to me.

Reviewed-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>


thanks,
-- Shuah


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
