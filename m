From: shuah@kernel.org (Shuah Khan)
Date: Fri, 21 Sep 2018 16:48:09 -0600
Subject: [PATCH v3] membarrier_test: work in progress
In-Reply-To: <20180903021223.8216-1-rafael.tinoco@linaro.org>
References: <1a86c3c5-66f5-24d8-4fcc-367302ecec35@kernel.org>
 <20180903021223.8216-1-rafael.tinoco@linaro.org>
Message-ID: <51f15a4f-4cc1-da5e-d601-c74ea1185f23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180921224809.NTzN4XHb6NRp1XyTHTPRump7d1yzu0YVDvyAYtTHI_s@z>

Hi Rafael,

Thanks for the patch. Comments below.

On 09/02/2018 08:12 PM, Rafael David Tinoco wrote:
> Shuah,
> 
> This is a draft only. I will remove summary from the top, run checkers,
> etc. Im thinking in replacing membarrier_test entirely with this code
> (compatible to existing one). Right now, this code:
> 
>  - allows each test to succeed, fail or be skipped independently
>  - allows each test to be tested even when not supported (force option)
>  - considers false negatives and false positives on every case
>  - can be extended easily
> 
> Right now, just to show as an example, it gives us:
> 
> TAP version 13
> ok 1 sys_membarrier(): cmd_query succeeded.
> ok 2 sys_membarrier(): bad_cmd failed as expected.
> ok 3 sys_membarrier(): cmd_with_flags_set failed as expected.
> ok 4 sys_membarrier(): cmd_global succeeded.
> Pass 4 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
> 1..4
> 
> Are you okay with such move ? Only big TODO here is adding all covered
> tests in the test array (easy move), testing all combinations with all
> supported kernel versions (lab already ready) and suggesting it to you,
> replacing membarrier_test.c.
> 
> PS: This is pretty close to how a LTP test would be, using their new
> API, but, since it addresses your concerns and seems like a
> simple/clean, code, I decided to suggest it as a replacement here (and
> it also fixes the issue with this test and LTS kernels).
> ---
>  tools/testing/selftests/membarrier/Makefile   |   2 +-
>  .../selftests/membarrier/membarrier_test2.c   | 180 ++++++++++++++++++
>  2 files changed, 181 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/membarrier/membarrier_test2.c
> 
> diff --git a/tools/testing/selftests/membarrier/Makefile b/tools/testing/selftests/membarrier/Makefile
> index 02845532b059..3d44d4cd3a9d 100644
> --- a/tools/testing/selftests/membarrier/Makefile
> +++ b/tools/testing/selftests/membarrier/Makefile
> @@ -1,6 +1,6 @@
>  CFLAGS += -g -I../../../../usr/include/
>  
> -TEST_GEN_PROGS := membarrier_test
> +TEST_GEN_PROGS := membarrier_test membarrier_test2
>  
>  include ../lib.mk
>  
> diff --git a/tools/testing/selftests/membarrier/membarrier_test2.c b/tools/testing/selftests/membarrier/membarrier_test2.c
> new file mode 100644
> index 000000000000..8fa1be6156fb
> --- /dev/null
> +++ b/tools/testing/selftests/membarrier/membarrier_test2.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +#include <linux/membarrier.h>
> +#include <syscall.h>
> +#include <stdio.h>
> +#include <errno.h>
> +#include <string.h>
> +
> +#include "../kselftest.h"
> +/*
> +	MEMBARRIER_CMD_QUERY
> +		returns membarrier_cmd with supported features
> +	MEMBARRIER_CMD_GLOBAL
> +		returns 0
> +		EINVAL = if nohz_full is enabled
> +	MEMBARRIER_CMD_GLOBAL_EXPEDITED
> +		returns 0
> +	MEMBARRIER_CMD_REGISTER_GLOBAL_EXPEDITED
> +		returns 0
> +	MEMBARRIER_CMD_PRIVATE_EXPEDITED
> +		returns 0
> +		EINVAL = if CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE is not enabled
> +		EPERM  = if process did not register for PRIVATE_EXPEDITED
> +	MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED
> +		returns 0
> +		EINVAL = if CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE is not enabled
> +	MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE
> +		returns 0
> +		EINVAL = if CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE is not enabled
> +		EPERM = if process did not register for PRIVATE_EXPEDITED
> +	MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE
> +		returns 0
> +		EINVAL = if CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE is not enabled
> +*/
> +
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +
> +struct memb_tests {
> +	char testname[80];
> +	int command;
> +	int flags;
> +	int exp_ret;
> +	int exp_errno;
> +	int supported;
> +	int force;
> +};
> +
> +struct memb_tests mbt[] = {
> +	{
> +	 .testname = "bad_cmd\0",
> +	 .command = -1,
> +	 .exp_ret = -1,
> +	 .exp_errno = EINVAL,
> +	 .supported = 1,
> +	 },
> +	{
> +	 .testname = "cmd_with_flags_set\0",
> +	 .command = MEMBARRIER_CMD_QUERY,
> +	 .flags = 1,
> +	 .exp_ret = -1,
> +	 .exp_errno = EINVAL,
> +	 .supported = 1,
> +	 },
> +	{
> +	 .testname = "cmd_global\0",
> +	 .command = MEMBARRIER_CMD_GLOBAL,
> +	 .flags = 0,
> +	 .exp_ret = 0,
> +	 },
> +};
> +
> +static void info_passed_ok(struct memb_tests test)
> +{
> +	ksft_test_result_pass("sys_membarrier(): %s succeeded.\n",
> +			test.testname);
> +}
> +

Why do we need to add new routines for these conditions. Why can't handle
these strings in array. For example you can define an array of strings for

passed unexpectedly etc. and the pass the string to appropriate ksft_* interface
instead of adding of these routines. Also it is hard to review the code this way.
I would like to see the changes made to membarrier_test.c instead of adding a new
file.

I do like the direction though.

thanks,
-- Shuah
