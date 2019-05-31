From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 31 May 2019 10:34:59 +0200
Subject: [PATCH v6 17/19] mips: Add support for generic vDSO
In-Reply-To: <20190530141531.43462-18-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-18-vincenzo.frascino@arm.com>
Message-ID:
 <CAK8P3a29QXCP8nw7po06GeYEGvJ_y2GxjAvswFk3=Y6YCjbdDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190531083459.AGvE18vy0ul560ADpZGVYREbZNFLvZ278NSF2iqTYE4@z>

On Thu, May 30, 2019 at 4:16 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -99,6 +99,10 @@ VERSION
>         global:
>                 __vdso_clock_gettime;
>                 __vdso_gettimeofday;
> +               __vdso_clock_getres;
> +#if _MIPS_SIM != _MIPS_SIM_ABI64
> +               __vdso_clock_gettime64;
> +#endif
>  #endif
>         local: *;
>         };

Same comment as for the corresponding arm change: I'd leave the ABI
changes to a separate patch, and probably not add __vdso_clock_getres
at all.

Also, you seem to have a typo here:

> +notrace int __vdso_clock_gettime_time64(clockid_t clock,
> +                                struct __kernel_timespec *ts)
> +{
> +       return __cvdso_clock_gettime(clock, ts);
> +}

This should be __vdso_clock_gettime64, not __vdso_clock_gettime_time64 I think.

       Arnd
