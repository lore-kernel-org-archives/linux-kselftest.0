From: arnd at arndb.de (Arnd Bergmann)
Date: Mon, 3 Jun 2019 19:07:34 +0200
Subject: [PATCH v6 17/19] mips: Add support for generic vDSO
In-Reply-To: <200c39f5-3bff-cacb-57c9-e11c57df70f5@android.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-18-vincenzo.frascino@arm.com>
 <CAK8P3a29QXCP8nw7po06GeYEGvJ_y2GxjAvswFk3=Y6YCjbdDg@mail.gmail.com>
 <200c39f5-3bff-cacb-57c9-e11c57df70f5@android.com>
Message-ID: <CAK8P3a24SFh1eeYpkU1xWL4_2j5_7ieejwuBZW1m3G6biKSK4g@mail.gmail.com>

On Mon, Jun 3, 2019 at 4:54 PM Mark Salyzyn <salyzyn at android.com> wrote:
> On 05/31/2019 01:34 AM, Arnd Bergmann wrote:
> > On Thu, May 30, 2019 at 4:16 PM Vincenzo Frascino
> > <vincenzo.frascino at arm.com> wrote:
> >
> >> --- a/arch/mips/vdso/vdso.lds.S
> >> +++ b/arch/mips/vdso/vdso.lds.S
> >> @@ -99,6 +99,10 @@ VERSION
> >>          global:
> >>                  __vdso_clock_gettime;
> >>                  __vdso_gettimeofday;
> >> +               __vdso_clock_getres;
> >> +#if _MIPS_SIM != _MIPS_SIM_ABI64
> >> +               __vdso_clock_gettime64;
> >> +#endif
> >>   #endif
> >>          local: *;
> >>          };
> > Same comment as for the corresponding arm change: I'd leave the ABI
> > changes to a separate patch, and probably not add __vdso_clock_getres
> > at all.
>
> Removing this would break ABI (would it really, it just replaces the
> syscall ... so it is more of a user space expectation)? already present
> in arm64 before this series.

What I meant is that we should only keep clock_getres() in the vdso
for architectures that already have it, to keep the ABI unchanged,
but not add it to new ones.

At the moment, arm64, nds32, ppc, riscv and s390 have clock_getres,
while arm, mips, sparc, and x86 don't.

Also: on 32-bit architectures with 64-bit time_t, the series only adds
clock_gettime()., not clock_getres(), so user space should stop
assuming it's there.

        Arnd
