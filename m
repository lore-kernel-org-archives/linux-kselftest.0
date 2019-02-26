From: mpe at ellerman.id.au (Michael Ellerman)
Date: Tue, 26 Feb 2019 12:48:47 +1100
Subject: [PATCH] tools: testing: selftests: Remove duplicate headers
In-Reply-To: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
References: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
Message-ID: <87tvgr1fr4.fsf@concordia.ellerman.id.au>

Souptick Joarder <jrdr.linux at gmail.com> writes:
> Remove duplicate headers which are included twice.
>
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> ---
...
>  tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -

I took this hunk via the powerpc tree.

> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> index 167135b..af1b802 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> @@ -11,7 +11,6 @@
>  #include <sys/wait.h>
>  #include <unistd.h>
>  #include <setjmp.h>
> -#include <signal.h>
>  
>  #include "ebb.h"


cheers
