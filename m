From: tglx@linutronix.de (Thomas Gleixner)
Date: Tue, 2 Oct 2018 23:26:30 +0200 (CEST)
Subject: [RFC 00/20] ns: Introduce Time Namespace
In-Reply-To: <CAJwJo6a+WWpAxVAUuYt8TrCF+1a=BdoFQjU9vto0iiUN5vygsA@mail.gmail.com>
References: <20180919205037.9574-1-dima@arista.com>
 <874lej6nny.fsf@xmission.com> <20180924205119.GA14833@outlook.office365.com>
 <874leezh8n.fsf@xmission.com> <20180925014150.GA6302@outlook.office365.com>
 <87zhw4rwiq.fsf@xmission.com>
 <alpine.DEB.2.21.1809272247270.8118@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809272335430.8118@nanos.tec.linutronix.de>
 <20181001232033.GA31324@outlook.office365.com>
 <alpine.DEB.2.21.1810020811290.32062@nanos.tec.linutronix.de>
 <CAJwJo6a+WWpAxVAUuYt8TrCF+1a=BdoFQjU9vto0iiUN5vygsA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1810022310360.1435@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181002212630.TUDhKgM21gVJYYnOVuL-umDZEnSorzR7UaZhKcOolBE@z>

Dmitry,

On Tue, 2 Oct 2018, Dmitry Safonov wrote:
> On Tue, 2 Oct 2018@07:15, Thomas Gleixner <tglx@linutronix.de> wrote:
> > I explained that in detail in this thread, but it's not about the initial
> > setting of clock mono/boot before any timers have been armed.
> >
> > It's about setting the offset or clock realtime (via settimeofday) when
> > timers are already armed. Also having a entirely different time domain,
> > e.g. separate NTP adjustments, makes that necessary.
> 
> It looks like, there is a bit of misunderstanding each other:
> Andrei was talking about the current RFC version, where we haven't
> introduced offsets for clock realtime. While Thomas IIUC, is looking
> how-to expand time namespace over realtime.
>
> As CLOCK_REALTIME virtualization raises so many complex questions
> like a different length of the second or list of realtime timers in ns we
> haven't added any realization for it.
> 
> It seems like an initial introduction for timens can be expanded after to cover
> realtime clocks too. While it may seem incomplete, it solves issues for
> restoring/migration of real-world applications like nodejs, Oracle DB server
> which fails after being restored if there is a leap in monotonic time.

Well, yes. But you really have to think about the full picture. Just adding
part of the overall solution right now, just because it can be glued into
the code easily, is not the best approach IMO as it might result in
substantial rework of the whole thing sooner than later. I really don't
want to end up with something which is not extensible and has to be
supported forever.

Just for the record, the current approach with name space offsets for
monotonic is also prone to malfunction vs. timers, unless you can prevent
changing the offset _after_ the namespace has been set up and timers have
been armed. I admit, that I did not look close enough to verify that.

> While solving the mentioned issues, it doesn't bring overhead.
> (well, Andy noted that cmp for zero-offsets on vdso can be optimized too,
> which will be done in v1).
> 
> Thomas, thanks much for your input - now we know that we'll need to
> introduce list for timers in namespace when we'll add realtime clocks.
> Do you believe that CLOCK_MONOTONIC_SYNC would be an easier
> concept than offsets per-namespace?

Haven't thought it through. This was just an idea in reaction to Eric's
question whether setting clock monotonic might be feasible. But yes, it
might be worth to think about it.

I think you should really define the long term requirements for time
namespaces and perhaps set some limitations in functionality upfront.

Thanks,

	tglx
