From: David.Laight@ACULAB.COM (David Laight)
Date: Tue, 7 May 2019 12:57:15 +0000
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507113050.GR2606@hirez.programming.kicks-ass.net>
References: <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190507085753.GO2606@hirez.programming.kicks-ass.net>
 <b34aa38bdfe84263bc20b60761bf6005@AcuMS.aculab.com>
 <20190507113050.GR2606@hirez.programming.kicks-ass.net>
Message-ID: <f55e3c951aee4b5686201aaf282cc62b@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507125715.v7jvboDyf_Gup7mF8bBNSF4pvH-GNRtpqB_KIz8RnLY@z>

From: Peter Zijlstra
> Sent: 07 May 2019 12:31
> To: David Laight
> On Tue, May 07, 2019@09:18:51AM +0000, David Laight wrote:
> > From: Peter Zijlstra
> > > Sent: 07 May 2019 09:58
> > ...
> > > +	/*
> > > +	 * When we're here from kernel mode; the (exception) stack looks like:
> > > +	 *
> > > +	 * 4*4(%esp) - <previous context>
> > > +	 * 3*4(%esp) - flags
> > > +	 * 2*4(%esp) - cs
> > > +	 * 1*4(%esp) - ip
> > > +	 * 0*4(%esp) - orig_eax
> >
> > Am I right in thinking that this is the only 'INT3' stack frame that
> > needs to be 'fiddled' with?
> > And that the 'emulate a call instruction' has verified that is the case??
> > So the %cs is always the kernel %cs.
> 
> Only the INT3 thing needs 'the gap', but the far bigger change here is
> that kernel frames now have a complete pt_regs set and all sorts of
> horrible crap can go away.

I'm not doubting that generating the 'five register' interrupt stack frame
for faults in kernel space makes life simpler just suggesting that the
'emulated call' can be done by emulating the 'iret' rather than generating
a gap in the stack.

> For 32bit 'the gap' happens naturally when building a 5 entry frame. Yes
> it is possible to build a 5 entry frame on top of the old 3 entry one,
> but why bother...

Presumably there is 'horrid' code to generate the gap in 64bit mode?
(less horrid than 32bit, but still horrid?)
Or does it copy the entire pt_regs into a local stack frame and use
that for the iret?

I've just tried to parse the pseudo code for IRET in the intel docs.
Does anyone find that readable?
I wonder if you can force 32bit mode to do a stack switch 'iret'
by doing something like a far jump to a different %cs ?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
