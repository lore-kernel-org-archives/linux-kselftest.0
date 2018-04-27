From: mlichvar at redhat.com (Miroslav Lichvar)
Date: Fri, 27 Apr 2018 09:41:30 +0200
Subject: possible BUG: selftest about raw_skew failed
In-Reply-To: <alpine.DEB.2.21.1804262327480.1596@nanos.tec.linutronix.de>
References: <CAG=yYwmQb-zuq3V9muu=xXsRGa3s1A=fFgz-XJchCiFd+GYUYQ@mail.gmail.com>
 <alpine.DEB.2.21.1804262327480.1596@nanos.tec.linutronix.de>
Message-ID: <20180427074130.GN20050@localhost>

On Thu, Apr 26, 2018 at 11:28:29PM +0200, Thomas Gleixner wrote:
> On Sat, 21 Apr 2018, Jeffrin Thalakkottoor wrote:
> > selftests: raw_skew
> > ========================================
> > WARNING: ADJ_OFFSET in progress, this will cause inaccurate results
> > Estimating clock drift: 17.910(est) 16.820(act) [FAILED]

Was ntpd, systemd-timesyncd, or some other NTP/PTP daemon running
shortly before or during the test?

The warning indicates that the clock was slewed by adjtime() or
adjtimex(), which makes the measurement of the frequency less accurate
and the test may fail.

Maybe this test and other tests that measure the frequency of the
system clock should be modified to SKIP when adjtimex() returns a
non-zero offset (or the frequency changes during the test)? 

-- 
Miroslav Lichvar
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
