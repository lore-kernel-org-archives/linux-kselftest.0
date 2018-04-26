From: john.stultz at linaro.org (John Stultz)
Date: Thu, 26 Apr 2018 14:33:11 -0700
Subject: possible BUG: selftest about raw_skew failed
In-Reply-To: <CAG=yYwmQb-zuq3V9muu=xXsRGa3s1A=fFgz-XJchCiFd+GYUYQ@mail.gmail.com>
References: <CAG=yYwmQb-zuq3V9muu=xXsRGa3s1A=fFgz-XJchCiFd+GYUYQ@mail.gmail.com>
Message-ID: <CALAqxLWphJvPe=v2T2ksjHnQP1Vu7+gZernEgFVXcx5kB+efsQ@mail.gmail.com>

On Sat, Apr 21, 2018 at 7:47 AM, Jeffrin Thalakkottoor
<jeffrin at rajagiritech.edu.in> wrote:
> hello,
>
> failure of a test in selftest:timers
>
> selftests: raw_skew
> ========================================
> WARNING: ADJ_OFFSET in progress, this will cause inaccurate results
> Estimating clock drift: 17.910(est) 16.820(act) [FAILED]

So you're ignoring the warning above. If an ADJ_OFFSET operation is
going on, ntpd (or something similar) is changing the clock, which
will kill the estimated drift calculation.

-john
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
