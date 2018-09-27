From: tglx at linutronix.de (Thomas Gleixner)
Date: Thu, 27 Sep 2018 23:41:49 +0200 (CEST)
Subject: [RFC 00/20] ns: Introduce Time Namespace
In-Reply-To: <alpine.DEB.2.21.1809272247270.8118@nanos.tec.linutronix.de>
References: <20180919205037.9574-1-dima@arista.com>
 <874lej6nny.fsf@xmission.com> <20180924205119.GA14833@outlook.office365.com>
 <874leezh8n.fsf@xmission.com> <20180925014150.GA6302@outlook.office365.com>
 <87zhw4rwiq.fsf@xmission.com>
 <alpine.DEB.2.21.1809272247270.8118@nanos.tec.linutronix.de>
Message-ID: <alpine.DEB.2.21.1809272335430.8118@nanos.tec.linutronix.de>

On Thu, 27 Sep 2018, Thomas Gleixner wrote:
> Add time skew via NTP/PTP into the picture and you might have to adjust
> timers as well, because you need to guarantee that they are not expiring
> early.
> 
> I haven't looked through Dimitry's patches yet, but I don't see how this
> can work at all without introducing subtle issues all over the place.

And just a quick scan tells me that this is broken. Timers will expire
early or late. The latter is acceptible to some extent, but larger delays
might come with surprise. Expiring early is an absolute nono.

Thanks,

	tglx
