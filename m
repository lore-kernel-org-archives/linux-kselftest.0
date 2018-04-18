From: shuah at kernel.org (Shuah Khan)
Date: Wed, 18 Apr 2018 08:54:36 -0600
Subject: [PATCH 2/2] selftests/filesystems: remove Makefile warning
In-Reply-To: <20180418075256.300-2-anders.roxell@linaro.org>
References: <20180418075256.300-1-anders.roxell@linaro.org>
 <20180418075256.300-2-anders.roxell@linaro.org>
Message-ID: <21de28f0-41c2-feac-1fec-63a2d76a2398@kernel.org>

On 04/18/2018 01:52 AM, Anders Roxell wrote:
> When overriding the 'clean' target make throws up warnings:
> Makefile:9: warning: overriding recipe for target 'clean'
> ../lib.mk:98: warning: ignoring old recipe for target 'clean'
> 
> In current code we change from TEST_PROGS to TEST_GEN_PROGS and that
> does that we can remove the target 'clean' and 'all'.
> 
> Fixes: 10924bc64487 ("selftests: move dnotify_test from Documentation/filesystems")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/filesystems/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
> index 427a401aae5c..a55ac3ac09ad 100644
> --- a/tools/testing/selftests/filesystems/Makefile
> +++ b/tools/testing/selftests/filesystems/Makefile
> @@ -1,9 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -TEST_PROGS := dnotify_test devpts_pts
> +TEST_GEN_PROGS := dnotify_test devpts_pts
>  CFLAGS += -I../../../../usr/include/
> -all: $(TEST_PROGS)
>  
>  include ../lib.mk
> -
> -clean:
> -	rm -fr $(TEST_PROGS)
> 

Hi Anders,

Michael sent in a patch to fix the problem already. It is in linux-kselftest fixes
branch for 4.17-rc2

Classifying dnotify_test to TEST_GEN_PROGS_EXTENDED as Michael is the correct way
to handle this problem. It allows the test to be built and installed and it won't
be run in the main kselftest run.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
