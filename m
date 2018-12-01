From: alexandre.belloni@bootlin.com (Alexandre Belloni)
Date: Sat, 1 Dec 2018 10:55:51 +0100
Subject: [PATCH 1/4] selftests: timers: move PIE tests out of rtctest
In-Reply-To: <a304b6f1-11db-543b-2cb3-372f34dc7697@linaro.org>
References: <20180419125030.5076-1-alexandre.belloni@bootlin.com>
 <20180419125030.5076-2-alexandre.belloni@bootlin.com>
 <a304b6f1-11db-543b-2cb3-372f34dc7697@linaro.org>
Message-ID: <20181201095551.GN8952@piout.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181201095551.zg79qyYBSqDHFPDfGINfGuGXWPVNs_VjeARaAwwOC40@z>

Hello,

On 29/11/2018 17:57:05-0200, Rafael David Tinoco wrote:
> On 4/19/18 9:50 AM, Alexandre Belloni wrote:
> > Since commit 6610e0893b8bc ("RTC: Rework RTC code to use timerqueue for
> > events"), PIE are completely handled using hrtimers, without actually using
> > any underlying hardware RTC.
> > 
> > Move PIE testing out of rtctest. It still depends on the presence of an RTC
> > (to access the device file) but doesn't depend on it actually working.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni at bootlin.com>
> > ---
> >  tools/testing/selftests/timers/.gitignore |   1 +
> >  tools/testing/selftests/timers/Makefile   |   2 +-
> >  tools/testing/selftests/timers/rtcpie.c   | 132 ++++++++++++++++++++++
> >  tools/testing/selftests/timers/rtctest.c  |  83 +-------------
> >  4 files changed, 138 insertions(+), 80 deletions(-)
> >  create mode 100644 tools/testing/selftests/timers/rtcpie.c
> > 
> ...
> > +	/* The frequencies 128Hz, 256Hz, ... 8192Hz are only allowed for root. */
> > +	for (tmp=2; tmp<=64; tmp*=2) {
> > +
> > +		retval = ioctl(fd, RTC_IRQP_SET, tmp);
> > +		if (retval == -1) {
> > +			/* not all RTCs can change their periodic IRQ rate */
> > +			if (errno == EINVAL) {
> > +				fprintf(stderr,
> > +					"\n...Periodic IRQ rate is fixed\n");
> > +				goto done;
> > +			}
> > +			perror("RTC_IRQP_SET ioctl");
> > +			exit(errno);
> > +		}
> 
> Hello Alexandre,
> 
> In our tests, having failures under 64Hz is quite common in embedded
> systems with few number of CPUs/Cores:
> 
> --------
> root at bug3402:opt$ find /sys -name rtc0
> /sys/devices/platform/9010000.pl031/rtc/rtc0
> /sys/class/rtc/rtc0
> 
> selftests: timers: rtcpie
> Periodic IRQ rate is 1Hz.
> Counting 20 interrupts at:
> 2Hz:	 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
> 4Hz:	 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
> 8Hz:	 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
> 16Hz:	 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
> 32Hz:	 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
> 64Hz:	
> PIE delta error: 0.017697 should be close to 0.015625
> not ok 1..9 selftests: timers: rtcpie [FAIL]
> --------
> 
> Mainly because 64Hz gives us.. ~16ms in the test, and the variation
> being taken in consideration for an error, for this test, is 10%, which
> is ~1.6ms... pretty close to scheduler limit for lower number of CPUs in
> a functional testing environment.
> 

I would think that enabling HR timers would actually make things better,
not matter how many CPUs are in the system. At least, this was the case
for AT91.

> Would you mind if we change the default for up to 32Hz ? Or, do you have
> any other suggestion ?
> 

I must admit that the whole point of moving this test out of rtctest was
that I didn't want to maintain it. John is the one responsible for the
timers so he will have to take that decision.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
