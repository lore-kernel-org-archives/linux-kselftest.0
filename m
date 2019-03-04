From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Mon, 4 Mar 2019 13:36:29 -0500 (EST)
Subject: [PATCH] selftest/rseq: Remove duplicate header
In-Reply-To: <20190304183827.GA6809@jordon-HP-15-Notebook-PC>
References: <20190304183827.GA6809@jordon-HP-15-Notebook-PC>
Message-ID: <2071300362.1006.1551724589542.JavaMail.zimbra@efficios.com>

----- On Mar 4, 2019, at 1:38 PM, Souptick Joarder jrdr.linux at gmail.com wrote:

> Remove duplicate header which is included twice
> 
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux at gmail.com>

Acked-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>


> ---
> tools/testing/selftests/rseq/rseq.h | 1 -
> 1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rseq/rseq.h
> b/tools/testing/selftests/rseq/rseq.h
> index c72eb70..6c1126e7 100644
> --- a/tools/testing/selftests/rseq/rseq.h
> +++ b/tools/testing/selftests/rseq/rseq.h
> @@ -16,7 +16,6 @@
> #include <errno.h>
> #include <stdio.h>
> #include <stdlib.h>
> -#include <sched.h>
> #include <linux/rseq.h>
> 
> /*
> --
> 1.9.1

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
