From: jrdr.linux at gmail.com (Souptick Joarder)
Date: Wed, 20 Mar 2019 11:27:52 +0530
Subject: [PATCH v2] selftest/gpio: Remove duplicate header
In-Reply-To: <20190306162018.GA3187@jordon-HP-15-Notebook-PC>
References: <20190306162018.GA3187@jordon-HP-15-Notebook-PC>
Message-ID: <CAFqt6zbwdPnkQ3YrrcELzAHuMFxvKsf=xg62Qj-056T03ThRQQ@mail.gmail.com>

On Wed, Mar 6, 2019 at 9:45 PM Souptick Joarder <jrdr.linux at gmail.com> wrote:
>
> From: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
>
> Remove duplicate header which are included twice.
>
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> ---
> v2: Corrected format.

Any comment on this patch ?

>
>  tools/testing/selftests/gpio/gpio-mockup-chardev.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> index aaa1e9f..d587c81 100644
> --- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> +++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> @@ -12,7 +12,6 @@
>  #include <unistd.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -#include <stdio.h>
>  #include <errno.h>
>  #include <string.h>
>  #include <fcntl.h>
> --
> 1.9.1
>
