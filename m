From: shuah at kernel.org (shuah)
Date: Thu, 30 May 2019 08:29:38 -0600
Subject: [PATCH v5 2/3] s390: Fix vDSO clock_getres()
In-Reply-To: <20190528120446.48911-3-vincenzo.frascino@arm.com>
References: <20190528120446.48911-1-vincenzo.frascino@arm.com>
 <20190528120446.48911-3-vincenzo.frascino@arm.com>
Message-ID: <dbcf69ff-1fe7-3a2e-5940-11fed052d45e@kernel.org>

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
> Fix the s390 vdso implementation of clock_getres keeping a copy of
> hrtimer_resolution in vdso data and using that directly.
> 
> Cc: Martin Schwidefsky <schwidefsky at de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens at de.ibm.com>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino at arm.com>
> Acked-by: Martin Schwidefsky <schwidefsky at de.ibm.com>
> ---
> 
> Note: This patch is independent from the others in this series, hence it
> can be merged singularly by the s390 maintainers.
> 

Acked-by: Shuah Khan <skhan at linuxfoundation.org>

thanks,
-- Shuah
