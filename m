From: shuah at kernel.org (shuah)
Date: Thu, 30 May 2019 08:28:27 -0600
Subject: [PATCH v5 1/3] powerpc: Fix vDSO clock_getres()
In-Reply-To: <20190528120446.48911-2-vincenzo.frascino@arm.com>
References: <20190528120446.48911-1-vincenzo.frascino@arm.com>
 <20190528120446.48911-2-vincenzo.frascino@arm.com>
Message-ID: <d4c2380d-1811-18f3-51a3-10bd3782b9de@kernel.org>

On 5/28/19 6:04 AM, Vincenzo Frascino wrote:
> clock_getres in the vDSO library has to preserve the same behaviour
> of posix_get_hrtimer_res().
> 
> In particular, posix_get_hrtimer_res() does:
>      sec = 0;
>      ns = hrtimer_resolution;
> and hrtimer_resolution depends on the enablement of the high
> resolution timers that can happen either at compile or at run time.
> 
> Fix the powerpc vdso implementation of clock_getres keeping a copy of
> hrtimer_resolution in vdso data and using that directly.
> 
> Fixes: a7f290dad32e ("[PATCH] powerpc: Merge vdso's and add vdso support
> to 32 bits kernel")
> Cc: stable at vger.kernel.org
> Cc: Benjamin Herrenschmidt <benh at kernel.crashing.org>
> Cc: Paul Mackerras <paulus at samba.org>
> Cc: Michael Ellerman <mpe at ellerman.id.au>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
> Reviewed-by: Christophe Leroy <christophe.leroy at c-s.fr>
> ---
> 
> Note: This patch is independent from the others in this series, hence it
> can be merged singularly by the powerpc maintainers.
> 

Acked-by: Shuah Khan <skhan at linuxfoundation.org>

thanks,
-- Shuah
