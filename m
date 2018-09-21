From: shuah@kernel.org (Shuah Khan)
Date: Fri, 21 Sep 2018 16:53:44 -0600
Subject: [PATCH v4] selftests: membarrier: reorganized test for LTS
 supportability
In-Reply-To: <20180903190457.27088-1-rafael.tinoco@linaro.org>
References: <1a86c3c5-66f5-24d8-4fcc-367302ecec35@kernel.org>
 <20180903190457.27088-1-rafael.tinoco@linaro.org>
Message-ID: <dcc20b51-3069-6854-3190-b8958e2f9b96@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180921225344.3kdkEPeTZDmm04s36x2gcZ8lR0zoAS8o1UPPZqDEtkM@z>

On 09/03/2018 01:04 PM, Rafael David Tinoco wrote:
> This commit re-organizes membarrier test, solving issues when testing
> LTS kernels. Now, the code:
> 
>  - always run the same amount of tests (even on older kernels).
>  - allows each test to succeed, fail or be skipped independently.
>  - allows testing features even when explicitly unsupported (force=1).
>  - able to consider different return codes for diff kernel versions.
>  - checks false positive/negative by checking ret code and errno.
>  - can be extended easily: to expand an array with commands.
> 
> Link: https://bugs.linaro.org/show_bug.cgi?id=3771
> Signed-off-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> ---
>  .../selftests/membarrier/membarrier_test.c    | 482 +++++++++---------
>  1 file changed, 241 insertions(+), 241 deletions(-)
> 
> diff --git a/tools/testing/selftests/membarrier/membarrier_test.c b/tools/testing/selftests/membarrier/membarrier_test.c
> index 6793f8ecc8e7..151bc8a944a3 100644
> --- a/tools/testing/selftests/membarrier/membarrier_test.c
> +++ b/tools/testing/selftests/membarrier/membarrier_test.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define _GNU_SOURCE
>  #include <linux/membarrier.h>
> +#include <sys/utsname.h>
>  #include <syscall.h>
>  #include <stdio.h>
>  #include <errno.h>
> @@ -8,305 +9,304 @@
>  
>  #include "../kselftest.h"
>  
> -static int sys_membarrier(int cmd, int flags)
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +#define KERNEL_VERSION(a, b, c) (((a) << 16) + ((b) << 8) + (c))
> +
> +struct memb_tests {
> +	char testname[80];
> +	int command;
> +	int flags;
> +	int exp_ret;
> +	int exp_errno;
> +	int enabled;
> +	int force;
> +	int force_exp_errno;
> +	int above;
> +	int bellow;
> +};
> +
> +struct memb_tests mbt[] = {
> +	{
> +	 .testname = "cmd_fail\0",
> +	 .command = -1,
> +	 .exp_ret = -1,
> +	 .exp_errno = EINVAL,
> +	 .enabled = 1,
> +	 },
> +	{
> +	 .testname = "cmd_flags_fail\0",
> +	 .command = MEMBARRIER_CMD_QUERY,
> +	 .flags = 1,
> +	 .exp_ret = -1,
> +	 .exp_errno = EINVAL,
> +	 .enabled = 1,
> +	 },
> +	{
> +	 .testname = "cmd_global_success\0",
> +	 .command = MEMBARRIER_CMD_GLOBAL,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +	/*
> +	 * PRIVATE EXPEDITED (forced)
> +	 */
> +	{
> +	 .testname = "cmd_private_expedited_fail\0",
> +	 .command = MEMBARRIER_CMD_PRIVATE_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = -1,
> +	 .exp_errno = EPERM,
> +	 .force = 1,
> +	 .force_exp_errno = EINVAL,
> +	 .bellow = KERNEL_VERSION(4, 10, 0),
> +	 },
> +	{
> +	 .testname = "cmd_private_expedited_fail\0",
> +	 .command = MEMBARRIER_CMD_PRIVATE_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = -1,
> +	 .exp_errno = EPERM,
> +	 .force = 1,
> +	 .force_exp_errno = EPERM,
> +	 .above = KERNEL_VERSION(4, 10, 0),
> +	 },
> +	{
> +	 .testname = "cmd_register_private_expedited_success\0",
> +	 .command = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 .force = 1,
> +	 .force_exp_errno = EINVAL,
> +	 },
> +	{
> +	 .testname = "cmd_private_expedited_success\0",
> +	 .command = MEMBARRIER_CMD_PRIVATE_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 .force = 1,
> +	 .force_exp_errno = EINVAL,
> +	 },
> +	 /*
> +	  * PRIVATE EXPEDITED SYNC CORE
> +	  */
> +	{
> +	 .testname = "cmd_private_expedited_sync_core_fail\0",
> +	 .command = MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE,
> +	 .flags = 0,
> +	 .exp_ret = -1,
> +	 .exp_errno = EPERM,
> +	 },
> +	{
> +	 .testname = "cmd_register_private_expedited_sync_core_success\0",
> +	 .command = MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +	{
> +	 .testname = "cmd_private_expedited_sync_core_success\0",
> +	 .command = MEMBARRIER_CMD_PRIVATE_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +	/*
> +	 * GLOBAL EXPEDITED
> +	 * global membarrier from a non-registered process is valid
> +	 */
> +	{
> +	 .testname = "cmd_global_expedited_success\0",
> +	 .command = MEMBARRIER_CMD_GLOBAL_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +	{
> +	 .testname = "cmd_register_global_expedited_success\0",
> +	 .command = MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +	{
> +	 .testname = "cmd_global_expedited_success\0",
> +	 .command = MEMBARRIER_CMD_GLOBAL_EXPEDITED,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +};
> +
> +static void
> +info_passed_ok(struct memb_tests test)
>  {
> -	return syscall(__NR_membarrier, cmd, flags);
> +	ksft_test_result_pass("sys_membarrier(): %s succeeded.\n",
> +			test.testname);
>  }
>  

Why do we need to add new routines for these conditions. Why can't handle
these strings in array. For example you can define an array of strings for

passed unexpectedly etc. and the pass the string to appropriate ksft_* interface
instead of adding of these routines. Also it is hard to review the code this way.

I do like the direction though. Also please run get_maintainer.pl and cc everybody
it suggests.

thanks,
-- Shuah
