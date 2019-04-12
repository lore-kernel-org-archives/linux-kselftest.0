From: mbenes@suse.cz (Miroslav Benes)
Date: Fri, 12 Apr 2019 09:03:04 +0200 (CEST)
Subject: [PATCH] selftests: livepatch use TEST_PROGS for test shell scripts
In-Reply-To: <20190412011823.26884-1-shuah@kernel.org>
References: <20190412011823.26884-1-shuah@kernel.org>
Message-ID: <alpine.LSU.2.21.1904120901490.773@pobox.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412070304.Sk5-2OP8OWL_IR7igb3LynIzfrYnJhkI9Wsu-0pYIWk@z>

On Thu, 11 Apr 2019, Shuah Khan wrote:

> TEST_PROGS variable is for test shell scripts and common clean target
> in lib.mk doesn't touch them. TEST_GEN_PROGS are removed by it.
> 
> Fix it to use TEST_PROGS for test shell scripts and TEST_PROGS_EXTENDED
> for common functions.sh.
> 
> Signed-off-by: Shuah Khan <shuah at kernel.org>
> ---
>  tools/testing/selftests/livepatch/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
> index af4aee79bebb..fd405402c3ff 100644
> --- a/tools/testing/selftests/livepatch/Makefile
> +++ b/tools/testing/selftests/livepatch/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -TEST_GEN_PROGS := \
> +TEST_PROGS_EXTENDED := functions.sh
> +TEST_PROGS := \
>  	test-livepatch.sh \
>  	test-callbacks.sh \
>  	test-shadow-vars.sh

Hi Shuah,

thanks for the patch. We have already something similar queued in our git 
tree. See 
https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/commit/?h=for-5.1/upstream-fixes&id=abfe3c4560684864f66641438fee3075de098e89

It is missing TEST_PROGS_EXTENDED though. Should we add it?

Miroslav
