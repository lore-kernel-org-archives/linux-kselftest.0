From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 3 Oct 2018 07:25:35 +0200 (CEST)
Subject: Setting monotonic time?
In-Reply-To: <87in2jskew.fsf@xmission.com>
References: <20180919205037.9574-1-dima@arista.com>
 <874lej6nny.fsf@xmission.com> <20180924205119.GA14833@outlook.office365.com>
 <874leezh8n.fsf@xmission.com> <20180925014150.GA6302@outlook.office365.com>
 <87zhw4rwiq.fsf@xmission.com>
 <alpine.DEB.2.21.1809272247270.8118@nanos.tec.linutronix.de>
 <87mus1ftb9.fsf@xmission.com>
 <alpine.DEB.2.21.1809282023350.1432@nanos.tec.linutronix.de>
 <877ej2xc23.fsf_-_@xmission.com>
 <alpine.DEB.2.21.1810012047520.32062@nanos.tec.linutronix.de>
 <CAK8P3a2zTqrCGURE3XVpn3_w6C4R5O+cq8TdtbyKCMGyRk9_jw@mail.gmail.com>
 <alpine.DEB.2.21.1810022205080.1435@nanos.tec.linutronix.de>
 <87in2jskew.fsf@xmission.com>
Message-ID: <alpine.DEB.2.21.1810030711520.1435@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181003052535.EocFpt6KZqYhdlqQ6SZYHiHVS-3Fd78gyTO-63bJSxY@z>

On Wed, 3 Oct 2018, Eric W. Biederman wrote:
> Direct access to hardware/drivers and not through an abstraction like
> the vfs (an abstraction over block devices) can legitimately be handled
> by hotplug events.  I unplug one keyboard I plug in another.
> 
> I don't know if the input layer is more of a general abstraction
> or more of a hardware device.  I have not dug into it but my guess
> is abstraction from what I have heard.
> 
> The scary difficulty here is if after restart input is reporting times
> in CLOCK_MONOTONIC and the applications in the namespace are talking
> about times in CLOCK_MONOTONIC_SYNC.  Then there is an issue.  As even
> with a fixed offset the times don't match up.
> 
> So a time namespace absolutely needs to do is figure out how to deal
> with all of the kernel interfaces reporting times and figure out how to
> report them in the current time namespace.

So you want to talk to Arnd who is leading the y2038 effort. He knowns how
many and which interfaces are involved aside of the obvious core timer
ones. It's quite an amount and the problem is that you really need to do
that at the interface level, because many of those time stamps are taken in
contexts which are completely oblivious of name spaces. Ditto for timeouts
and similar things which are handed in through these interfaces.

Thanks,

	tglx
