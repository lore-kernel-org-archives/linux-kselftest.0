From: catalin.marinas@arm.com (Catalin Marinas)
Date: Tue, 16 Apr 2019 17:24:33 +0100
Subject: [PATCH v2 1/5] arm64: Fix vDSO clock_getres()
In-Reply-To: <20190416161434.32691-2-vincenzo.frascino@arm.com>
References: <20190416161434.32691-1-vincenzo.frascino@arm.com>
 <20190416161434.32691-2-vincenzo.frascino@arm.com>
Message-ID: <20190416162432.GI28994@arrakis.emea.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416162433.h80oh_0CqU75owsBuwGA1QrEHaDMAGHy8JETmYN9XoI@z>

On Tue, Apr 16, 2019@05:14:30PM +0100, Vincenzo Frascino wrote:
> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
> index 2d419006ad43..5f5759d51c33 100644
> --- a/arch/arm64/kernel/vdso.c
> +++ b/arch/arm64/kernel/vdso.c
> @@ -245,6 +245,8 @@ void update_vsyscall(struct timekeeper *tk)
>  		vdso_data->cs_shift		= tk->tkr_mono.shift;
>  	}
>  
> +	vdso_data->hrtimer_res		= hrtimer_resolution;

This should be a WRITE_ONCE(), just in case.

> +
>  	smp_wmb();
>  	++vdso_data->tb_seq_count;
>  }
> diff --git a/arch/arm64/kernel/vdso/gettimeofday.S b/arch/arm64/kernel/vdso/gettimeofday.S
> index c39872a7b03c..e2e9dfe9ba4a 100644
> --- a/arch/arm64/kernel/vdso/gettimeofday.S
> +++ b/arch/arm64/kernel/vdso/gettimeofday.S
> @@ -296,32 +296,32 @@ ENDPROC(__kernel_clock_gettime)
>  /* int __kernel_clock_getres(clockid_t clock_id, struct timespec *res); */
>  ENTRY(__kernel_clock_getres)
>  	.cfi_startproc
> +	adr	vdso_data, _vdso_data
>  	cmp	w0, #CLOCK_REALTIME
>  	ccmp	w0, #CLOCK_MONOTONIC, #0x4, ne
>  	ccmp	w0, #CLOCK_MONOTONIC_RAW, #0x4, ne
> -	b.ne	1f
> +	b.ne	2f
>  
> -	ldr	x2, 5f
> -	b	2f
> -1:
> +1:	/* Get hrtimer_res */
> +	ldr	x2, [vdso_data, #CLOCK_REALTIME_RES]

And here we need an "ldr w2, ..." since hrtimer_res is u32.

With the above (which Will can fix up):

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
