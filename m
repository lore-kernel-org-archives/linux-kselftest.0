From: jrdr.linux@gmail.com (Souptick Joarder)
Date: Thu, 21 Mar 2019 18:16:19 +0530
Subject: [PATCH v2] selftest/rseq: Remove duplicate header
In-Reply-To: <20190306161650.GA3155@jordon-HP-15-Notebook-PC>
References: <20190306161650.GA3155@jordon-HP-15-Notebook-PC>
Message-ID:
 <CAFqt6zYvbi0pSndg_VVmE0EK6PW-T=d+b05EWOf2iqxkezOxGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190321124619.CiNfxbJN4CjQhJVKF_YPL-AXl0r4NBuf2Z_rXyBjU8Q@z>

On Wed, Mar 6, 2019@9:42 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> From: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
>
> Remove duplicate header which is included twice
>
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>
> Acked-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
> ---
> v2: Corrected format.

Any further comment on this ?
>
>  tools/testing/selftests/rseq/rseq.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
> index c72eb70..6c1126e7 100644
> --- a/tools/testing/selftests/rseq/rseq.h
> +++ b/tools/testing/selftests/rseq/rseq.h
> @@ -16,7 +16,6 @@
>  #include <errno.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -#include <sched.h>
>  #include <linux/rseq.h>
>
>  /*
> --
> 1.9.1
>
