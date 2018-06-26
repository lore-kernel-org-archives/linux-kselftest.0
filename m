From: shuah at kernel.org (Shuah Khan)
Date: Tue, 26 Jun 2018 12:22:28 -0600
Subject: [PATCH] selftests/net: Fix permissions for fib_tests.sh
In-Reply-To: <1529425232-25242-1-git-send-email-daniel.diaz@linaro.org>
References: <1529425232-25242-1-git-send-email-daniel.diaz@linaro.org>
Message-ID: <8f5b0575-2213-5f7a-5b08-7502f65a1d16@kernel.org>

On 06/19/2018 10:20 AM, Daniel Díaz wrote:
> fib_tests.sh became non-executable at some point. This is
> what happens:
>   selftests: net: fib_tests.sh: Warning: file fib_tests.sh is
>   not executable, correct this.
>   not ok 1..11 selftests: net: fib_tests.sh [FAIL]
> 
> Fixes: d69faad76584 ("selftests: fib_tests: Add prefix route tests with metric")
> 
> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> ---
>  tools/testing/selftests/net/fib_tests.sh | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 tools/testing/selftests/net/fib_tests.sh
> 
> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> old mode 100644
> new mode 100755
> 

Hi David,

Are you planning to pick this up for 4.18-rc3 or later?

Acked-by: Shuah Khan <shuah at kernel.org>

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
