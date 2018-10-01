From: tglx at linutronix.de (Thomas Gleixner)
Date: Mon, 1 Oct 2018 20:52:41 +0200 (CEST)
Subject: Setting monotonic time?
In-Reply-To: <877ej2xc23.fsf_-_@xmission.com>
References: <20180919205037.9574-1-dima@arista.com>
 <874lej6nny.fsf@xmission.com> <20180924205119.GA14833@outlook.office365.com>
 <874leezh8n.fsf@xmission.com> <20180925014150.GA6302@outlook.office365.com>
 <87zhw4rwiq.fsf@xmission.com>
 <alpine.DEB.2.21.1809272247270.8118@nanos.tec.linutronix.de>
 <87mus1ftb9.fsf@xmission.com>
 <alpine.DEB.2.21.1809282023350.1432@nanos.tec.linutronix.de>
 <877ej2xc23.fsf_-_@xmission.com>
Message-ID: <alpine.DEB.2.21.1810012047520.32062@nanos.tec.linutronix.de>

On Mon, 1 Oct 2018, Eric W. Biederman wrote:
> In the context of process migration there is a simpler subproblem that I
> think it is worth exploring if we can do something about.
> 
> For a cluster of machines all running with synchronized
> clocks. CLOCK_REALTIME matches. CLOCK_MONOTNIC does not match between
> machines.   Not having a matching CLOCK_MONOTONIC prevents successful
> process migration between nodes in that cluster.
> 
> Would it be possible to allow setting CLOCK_MONOTONIC at the very
> beginning of time?  So that all of the nodes in a cluster can be in
> sync?
> 
> No change in skew just in offset for CLOCK_MONOTONIC.
> 
> There are also dragons involved in coordinating things so that
> CLOCK_MONOTONIC gets set before CLOCK_MONOTONIC gets used.  So I don't
> know if allowing CLOCK_MONOTONIC to be set would be practical but it
> seems work exploring all on it's own.

It's used very early on in the kernel, so that would be a major surprise
for many things including user space which has expectations on clock
monotonic.

It would be reasonably easy to add CLOCK_MONONOTIC_SYNC which can be set in
the way you described and then in name spaces make it possible to magically
map CLOCK_MONOTONIC to CLOCK_MONOTONIC_SYNC.

It still wouldn't allow to have different NTP/PTP time domains, but might
be a good start to address the main migration headaches.

Thanks,

	tglx
