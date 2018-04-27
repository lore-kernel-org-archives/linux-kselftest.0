From: jeffrin at rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Fri, 27 Apr 2018 20:58:26 +0530
Subject: possible BUG: selftest about raw_skew failed
In-Reply-To: <20180427074130.GN20050@localhost>
References: <CAG=yYwmQb-zuq3V9muu=xXsRGa3s1A=fFgz-XJchCiFd+GYUYQ@mail.gmail.com>
 <alpine.DEB.2.21.1804262327480.1596@nanos.tec.linutronix.de>
 <20180427074130.GN20050@localhost>
Message-ID: <CAG=yYwmfZXYTQfqGr1_b69nw2au9B+ftF9KdXmmhm-3CdfTXjg@mail.gmail.com>

i think may be  systemd-timesyncd  was running.
anyway currently the status is as follows...

$systemctl status systemd-timesyncd.service
● systemd-timesyncd.service - Network Time Synchronization
   Loaded: loaded (/lib/systemd/system/systemd-timesyncd.service;
enabled; vendor preset: enabled)
   Active: active (running) since Fri 2018-04-27 19:26:16 IST; 1h 11min ago
     Docs: man:systemd-timesyncd.service(8)
 Main PID: 514 (systemd-timesyn)
   Status: "Synchronized to time server 123.108.200.124:123
(0.debian.pool.ntp.org)."
    Tasks: 2 (limit: 4382)
   Memory: 1.8M
   CGroup: /system.slice/systemd-timesyncd.service
           └─514 /lib/systemd/systemd-timesyncd
$

The test in the latest run show  "PASS"
see below...

selftests: raw_skew
========================================
Estimating clock drift: 26.836(est) 26.838(act) [OK]
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..0
ok 1..7 selftests: raw_skew [PASS]



On Fri, Apr 27, 2018 at 1:11 PM, Miroslav Lichvar <mlichvar at redhat.com> wrote:
> On Thu, Apr 26, 2018 at 11:28:29PM +0200, Thomas Gleixner wrote:
>> On Sat, 21 Apr 2018, Jeffrin Thalakkottoor wrote:
>> > selftests: raw_skew
>> > ========================================
>> > WARNING: ADJ_OFFSET in progress, this will cause inaccurate results
>> > Estimating clock drift: 17.910(est) 16.820(act) [FAILED]
>
> Was ntpd, systemd-timesyncd, or some other NTP/PTP daemon running
> shortly before or during the test?
>
> The warning indicates that the clock was slewed by adjtime() or
> adjtimex(), which makes the measurement of the frequency less accurate
> and the test may fail.
>
> Maybe this test and other tests that measure the frequency of the
> system clock should be modified to SKIP when adjtimex() returns a
> non-zero offset (or the frequency changes during the test)?
>
> --
> Miroslav Lichvar



-- 
software engineer
rajagiri school of engineering and technology
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
