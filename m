From: shuah at kernel.org (Shuah Khan)
Date: Mon, 30 Jul 2018 17:32:30 -0600
Subject: [PATCH] selftests: membarrier: fix test by checking supported
 commands
In-Reply-To: <20180730160543.19056-1-rafael.tinoco@linaro.org>
References: <20180730160543.19056-1-rafael.tinoco@linaro.org>
Message-ID: <9edf8459-aea1-c59e-5d73-112e986777e1@kernel.org>

Hi Rafael,

On 07/30/2018 10:05 AM, Rafael David Tinoco wrote:
> Makes membarrier_test compatible with older kernels (LTS) by checking if
> the membarrier features exist before running the tests.
> 
> Link: https://bugs.linaro.org/show_bug.cgi?id=3771
> Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> Cc: <stable at vger.kernel.org> #v4.17
> ---
>  .../selftests/membarrier/membarrier_test.c    | 69 +++++++++++--------
>  1 file changed, 41 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
> index 6793f8ecc8e7..b96caa096e2f 100644
> --- a/tools/testing/selftests/membarrier/membarrier_test.c
> +++ b/tools/testing/selftests/membarrier/membarrier_test.c
> @@ -225,7 +225,14 @@ static int test_membarrier_global_expedited_success(void)
>  
>  static int test_membarrier(void)
>  {
> -	int status;
> +	int supported, status;
> +
> +	supported = sys_membarrier(MEMBARRIER_CMD_QUERY, 0);
> +	if (supported < 0) {
> +		ksft_test_result_fail(
> +			"sys_membarrier() failed to query supported cmds\n");
> +		return supported;
> +	}
>  

ksft_exit_skip() is the right interface to use here. If feature isn't supported,
it should exit skip as opposed fail.

>  	status = test_membarrier_cmd_fail();
>  	if (status)
> @@ -236,21 +243,22 @@ static int test_membarrier(void)
>  	status = test_membarrier_global_success();
>  	if (status)
>  		return status;
> -	status = test_membarrier_private_expedited_fail();
> -	if (status)
> -		return status;
> -	status = test_membarrier_register_private_expedited_success();
> -	if (status)
> -		return status;
> -	status = test_membarrier_private_expedited_success();
> -	if (status)
> -		return status;
> -	status = sys_membarrier(MEMBARRIER_CMD_QUERY, 0);
> -	if (status < 0) {
> -		ksft_test_result_fail("sys_membarrier() failed\n");
> -		return status;
> +
> +	/* commit 22e4ebb975822833b083533035233d128b30e98f added this feature */
> +	if (supported & MEMBARRIER_CMD_PRIVATE_EXPEDITED) {
> +		status = test_membarrier_private_expedited_fail();
> +		if (status)
> +			return status;
> +		status = test_membarrier_register_private_expedited_success();
> +		if (status)
> +			return status;
> +		status = test_membarrier_private_expedited_success();
> +		if (status)
> +			return status;
>  	}
> -	if (status & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE) {
> +
> +	/* commit 70216e18e519a54a2f13569e8caff99a092a92d6 added this feature */
> +	if (supported & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE) {
>  		status = test_membarrier_private_expedited_sync_core_fail();
>  		if (status)
>  			return status;
> @@ -261,19 +269,24 @@ static int test_membarrier(void)
>  		if (status)
>  			return status;
>  	}
> -	/*
> -	 * It is valid to send a global membarrier from a non-registered
> -	 * process.
> -	 */
> -	status = test_membarrier_global_expedited_success();
> -	if (status)
> -		return status;
> -	status = test_membarrier_register_global_expedited_success();
> -	if (status)
> -		return status;
> -	status = test_membarrier_global_expedited_success();
> -	if (status)
> -		return status;
> +
> +	/* commit c5f58bd58f432be5d92df33c5458e0bcbee3aadf added this feature */
> +	if (supported & MEMBARRIER_CMD_GLOBAL_EXPEDITED) {
> +		/*
> +		 * It is valid to send a global membarrier from a non-registered
> +		 * process.
> +		 */
> +		status = test_membarrier_global_expedited_success();
> +		if (status)
> +			return status;
> +		status = test_membarrier_register_global_expedited_success();
> +		if (status)
> +			return status;
> +		status = test_membarrier_global_expedited_success();
> +		if (status)
> +			return status;
> +	}
> +
>  	return 0;
>  }
>  
> 

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
