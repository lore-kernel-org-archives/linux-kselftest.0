From: shuah@kernel.org (Shuah Khan)
Date: Mon, 27 Aug 2018 16:52:07 -0600
Subject: [PATCH v2] selftests: membarrier: fix test by checking supported
 commands
In-Reply-To: <20180809202157.21148-1-rafael.tinoco@linaro.org>
References: <9edf8459-aea1-c59e-5d73-112e986777e1@kernel.org>
 <20180809202157.21148-1-rafael.tinoco@linaro.org>
Message-ID: <1a86c3c5-66f5-24d8-4fcc-367302ecec35@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180827225207.IOPkkn8Mey4lcFwqe7QIgmB3L0tvoHNZabcR-sDc5_Y@z>

Hi Rafael,

Thanks for the ping.

On 08/09/2018 02:21 PM, Rafael David Tinoco wrote:
> Makes membarrier_test compatible with older kernels (LTS) by checking if
> the membarrier features exist before running the tests.
> 
> Link: https://bugs.linaro.org/show_bug.cgi?id=3771
> Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> Cc: <stable at vger.kernel.org> #v4.17
> ---
>  .../selftests/membarrier/membarrier_test.c    | 71 +++++++++++--------
>  1 file changed, 40 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
> index 6793f8ecc8e7..4dc263824bda 100644
> --- a/tools/testing/selftests/membarrier/membarrier_test.c
> +++ b/tools/testing/selftests/membarrier/membarrier_test.c
> @@ -223,7 +223,7 @@ static int test_membarrier_global_expedited_success(void)
>  	return 0;
>  }
>  
> -static int test_membarrier(void)
> +static int test_membarrier(int supported)
>  {
>  	int status;
>  
> @@ -236,21 +236,22 @@ static int test_membarrier(void)
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

Get rid of this comment.

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

This change moves several tests under this check. These should run to test
the case when MEMBARRIER_CMD_PRIVATE_EXPEDITED isn't supported. This change
reduces coverage.

> -	if (status & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE) {
> +
> +	/* commit 70216e18e519a54a2f13569e8caff99a092a92d6 added this feature */

Get rid of the above comment.

> +	if (supported & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE) {
>  		status = test_membarrier_private_expedited_sync_core_fail();
>  		if (status)
>  			return status;
> @@ -261,23 +262,28 @@ static int test_membarrier(void)
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

Get rid of the above comment.

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

There skip handling missing here. Without this the test result reports
pass which is incorrect.

If feature isn't supported, test should report that the feature test is
skipped not passed.

What I would like to see here is a skip for each individual test not one
skip for all 3 tests.

This applies to the if (supported & MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE)
case above.

When I run this test on 4.19 I see, 

TAP version 13
selftests: membarrier: membarrier_test
========================================
ok 1 sys_membarrier available
ok 2 sys membarrier invalid command test: command = -1, flags = 0, errno = 22. Failed as expected
ok 3 sys membarrier MEMBARRIER_CMD_QUERY invalid flags test: flags = 1, errno = 22. Failed as expected
ok 4 sys membarrier MEMBARRIER_CMD_GLOBAL test: flags = 0
ok 5 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failure test: flags = 0, errno = 1
ok 6 sys membarrier MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED test: flags = 0
ok 7 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED test: flags = 0
ok 8 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE not registered failure test: flags = 0, errno = 1
ok 9 sys membarrier MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE test: flags = 0
ok 10 sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE test: flags = 0
ok 11 sys membarrier MEMBARRIER_CMD_GLOBAL_EXPEDITED test: flags = 0
ok 12 sys membarrier MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED test: flags = 0
ok 13 sys membarrier MEMBARRIER_CMD_GLOBAL_EXPEDITED test: flags = 0
Pass 13 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..13
ok 1..1 selftests: membarrier: membarrier_test [PASS]

A total of 13 tests out of which, maybe 6 should be skips on 4.14. For example,
if MEMBARRIER_CMD_GLOBAL_EXPEDITED isn't supported, it should report that test
as a skip.

>  	return 0;
>  }
>  
> -static int test_membarrier_query(void)
> +static int test_membarrier_query(int *supported)
>  {
>  	int flags = 0, ret;
>  
> @@ -297,16 +303,19 @@ static int test_membarrier_query(void)
>  		ksft_exit_skip(
>  			"sys_membarrier unsupported: CMD_GLOBAL not found.\n");
>  
> +	*supported = ret;
>  	ksft_test_result_pass("sys_membarrier available\n");
>  	return 0;
>  }
>  
>  int main(int argc, char **argv)
>  {
> +	int supported;
> +
>  	ksft_print_header();
>  
> -	test_membarrier_query();
> -	test_membarrier();
> +	test_membarrier_query(&supported);
> +	test_membarrier(supported);
>  
>  	return ksft_exit_pass();
>  }
> 

thanks,
-- Shuah
