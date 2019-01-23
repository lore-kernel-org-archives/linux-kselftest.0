From: christophe.leroy at c-s.fr (Christophe Leroy)
Date: Wed, 23 Jan 2019 15:56:06 +0100
Subject: [PATCH] tools/testing/selftests/powerpc: Add Anton's null_syscall
 benchmark to the selftests
In-Reply-To: <20160927141016.6027-1-rui.teng@linux.vnet.ibm.com>
References: <20160927141016.6027-1-rui.teng@linux.vnet.ibm.com>
Message-ID: <2b98b303-d0d4-9f1d-9c47-fde0afb1306c@c-s.fr>



Le 27/09/2016 à 16:10, Rui Teng a écrit :
> From: Anton Blanchard <anton at au.ibm.com>
> 
> Pull in a version of Anton's null_syscall benchmark:
> http://ozlabs.org/~anton/junkcode/null_syscall.c
> Into tools/testing/selftests/powerpc/benchmarks.
> 
> Suggested-by: Michael Ellerman <mpe at ellerman.id.au>
> Signed-off-by: Anton Blanchard <anton at au.ibm.com>
> Signed-off-by: Rui Teng <rui.teng at linux.vnet.ibm.com>
> ---
>   .../testing/selftests/powerpc/benchmarks/Makefile  |   2 +-
>   .../selftests/powerpc/benchmarks/null_syscall.c    | 157 +++++++++++++++++++++
>   2 files changed, 158 insertions(+), 1 deletion(-)
>   create mode 100644 tools/testing/selftests/powerpc/benchmarks/null_syscall.c
> 

[...]

> +
> +static void do_null_syscall(unsigned long nr)
> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < nr; i++)
> +		getppid();
> +}
> +

Looks like getppid() performs a rcu_read_lock(). Is that what we want ?

Shouldn't we use getpid() instead for a lighter syscall ?

Christophe
