From: avagin@virtuozzo.com (Andrey Vagin)
Date: Mon, 1 Oct 2018 23:20:47 +0000
Subject: [RFC 00/20] ns: Introduce Time Namespace
In-Reply-To: <alpine.DEB.2.21.1809272335430.8118@nanos.tec.linutronix.de>
References: <20180919205037.9574-1-dima@arista.com>
 <874lej6nny.fsf@xmission.com> <20180924205119.GA14833@outlook.office365.com>
 <874leezh8n.fsf@xmission.com> <20180925014150.GA6302@outlook.office365.com>
 <87zhw4rwiq.fsf@xmission.com>
 <alpine.DEB.2.21.1809272247270.8118@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809272335430.8118@nanos.tec.linutronix.de>
Message-ID: <20181001232033.GA31324@outlook.office365.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181001232047.z9SZ22Ybrn0uP3c2W8ToF-xSpVP_SN2g1InJ5nn48MY@z>

On Thu, Sep 27, 2018@11:41:49PM +0200, Thomas Gleixner wrote:
> On Thu, 27 Sep 2018, Thomas Gleixner wrote:
> > Add time skew via NTP/PTP into the picture and you might have to adjust
> > timers as well, because you need to guarantee that they are not expiring
> > early.
> > 
> > I haven't looked through Dimitry's patches yet, but I don't see how this
> > can work at all without introducing subtle issues all over the place.
> 
> And just a quick scan tells me that this is broken. Timers will expire
> early or late. The latter is acceptible to some extent, but larger delays
> might come with surprise. Expiring early is an absolute nono.

Do you mean that we have to adjust all timers after changing offset for
CLOCK_MONOTONIC or CLOCK_BOOTTIME? Our idea is that offsets for
monotonic and boot times will be set immediately after creating a time
namespace before using any timers.

It is interesting to think what a use-case for changing these offsets
after creating timers. It may be useful for testing needs. A user sets a
timer in an hour and then change a clock offset forward and check that a
test application handles the timer properly.

> 
> Thanks,
> 
> 	tglx
> 
