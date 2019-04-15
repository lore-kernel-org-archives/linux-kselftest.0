From: pmladek at suse.com (Petr Mladek)
Date: Mon, 15 Apr 2019 14:42:55 +0200
Subject: [PATCH] selftests: livepatch use TEST_PROGS for test shell scripts
In-Reply-To: <alpine.LSU.2.21.1904121535100.773@pobox.suse.cz>
References: <20190412011823.26884-1-shuah@kernel.org>
 <alpine.LSU.2.21.1904120901490.773@pobox.suse.cz>
 <8967c9aa-7eb1-7e6d-a371-f29a2be24c84@kernel.org>
 <alpine.LSU.2.21.1904121535100.773@pobox.suse.cz>
Message-ID: <20190415124255.hcraeeiu5xoziber@pathway.suse.cz>

On Fri 2019-04-12 15:37:37, Miroslav Benes wrote:
> From: Miroslav Benes <mbenes at suse.cz>
> Date: Fri, 12 Apr 2019 15:31:42 +0200
> Subject: [PATCH] selftests/livepatch: Add functions.sh to TEST_PROGS_EXTENDED
> 
> Add functions.sh to TEST_PROGS_EXTENDED so that it is installed along
> with the rest of the selftests and they can be run.
> 
> Originally-by: Shuah Khan <shuah at kernel.org>
> Signed-off-by: Miroslav Benes <mbenes at suse.cz>
> ---
>  tools/testing/selftests/livepatch/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
> index 114f43e2081a..fd405402c3ff 100644
> --- a/tools/testing/selftests/livepatch/Makefile
> +++ b/tools/testing/selftests/livepatch/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +TEST_PROGS_EXTENDED := functions.sh
>  TEST_PROGS := \
>  	test-livepatch.sh \
>  	test-callbacks.sh \
> -- 
> 2.21.0

The patch has been committed into the branch for-5.1/upstream-fixes.

Best Regards,
Petr
