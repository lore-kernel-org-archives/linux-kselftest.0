From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Wed, 20 Mar 2019 11:26:41 +0530
Subject: [PATCH v2] selftest/timers: Remove duplicate header
In-Reply-To: <20190306162252.GA3221@jordon-HP-15-Notebook-PC>
References: <20190306162252.GA3221@jordon-HP-15-Notebook-PC>
Message-ID: <CAFqt6zbqc6PX8QFXz1yFq5yEV7S-+8kafEppkLMDHaH8frBaXQ@mail.gmail.com>

On Wed, Mar 6, 2019 at 9:48 PM Souptick Joarder <jrdr.linux at gmail.com> wrote:
>
> From: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
>
> Remove duplicate header which is included twice.
>
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> ---
> v2: Corrected format.

Any comment on this patch ?

>
>  tools/testing/selftests/timers/skew_consistency.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/timers/skew_consistency.c b/tools/testing/selftests/timers/skew_consistency.c
> index 022b711..8066be9 100644
> --- a/tools/testing/selftests/timers/skew_consistency.c
> +++ b/tools/testing/selftests/timers/skew_consistency.c
> @@ -32,7 +32,6 @@
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <fcntl.h>
> -#include <stdlib.h>
>  #include <string.h>
>  #include <sys/wait.h>
>  #include "../kselftest.h"
> --
> 1.9.1
>
