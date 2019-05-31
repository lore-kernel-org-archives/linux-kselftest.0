From: arnd at arndb.de (Arnd Bergmann)
Date: Fri, 31 May 2019 10:16:32 +0200
Subject: [PATCH v6 01/19] kernel: Standardize vdso_datapage
In-Reply-To: <20190530141531.43462-2-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-2-vincenzo.frascino@arm.com>
Message-ID: <CAK8P3a3EnvkLND2RJdZtEY64PhK5g0sbbuytQro=f0cPur2g9g@mail.gmail.com>

On Thu, May 30, 2019 at 4:15 PM Vincenzo Frascino
<vincenzo.frascino at arm.com> wrote:

> + * vdso_data will be accessed by 64 bit and compat code at the same time
> + * so we should be careful before modifying this structure.
> + */
> +struct vdso_data {
> +       u32                     seq;
> +
> +       s32                     clock_mode;
> +       u64                     cycle_last;
> +       u64                     mask;
> +       u32                     mult;
> +       u32                     shift;
> +
> +       struct vdso_timestamp   basetime[VDSO_BASES];
> +
> +       s32                     tz_minuteswest;
> +       s32                     tz_dsttime;
> +       u32                     hrtimer_res;
> +};

The structure contains four padding bytes at the end, which is
something we try to avoid, at least if this ends up being used as
an ABI. Maybe add "u32 __unused" at the end?

     Arnd
