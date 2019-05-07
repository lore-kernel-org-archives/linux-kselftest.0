From: peterz at infradead.org (Peter Zijlstra)
Date: Tue, 7 May 2019 15:32:00 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <f55e3c951aee4b5686201aaf282cc62b@AcuMS.aculab.com>
References: <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190507085753.GO2606@hirez.programming.kicks-ass.net>
 <b34aa38bdfe84263bc20b60761bf6005@AcuMS.aculab.com>
 <20190507113050.GR2606@hirez.programming.kicks-ass.net>
 <f55e3c951aee4b5686201aaf282cc62b@AcuMS.aculab.com>
Message-ID: <20190507133200.GP2623@hirez.programming.kicks-ass.net>

On Tue, May 07, 2019 at 12:57:15PM +0000, David Laight wrote:

> > Only the INT3 thing needs 'the gap', but the far bigger change here is
> > that kernel frames now have a complete pt_regs set and all sorts of
> > horrible crap can go away.
> 
> I'm not doubting that generating the 'five register' interrupt stack frame
> for faults in kernel space makes life simpler just suggesting that the
> 'emulated call' can be done by emulating the 'iret' rather than generating
> a gap in the stack.

The thing you suggested doesn't actually work, INT3 can nest.

> > For 32bit 'the gap' happens naturally when building a 5 entry frame. Yes
> > it is possible to build a 5 entry frame on top of the old 3 entry one,
> > but why bother...
> 
> Presumably there is 'horrid' code to generate the gap in 64bit mode?
> (less horrid than 32bit, but still horrid?)
> Or does it copy the entire pt_regs into a local stack frame and use
> that for the iret?

It's in the patch you replied to; it is so small you might have
overlooked it. It simply pushes another copy on top of what was already
there.

> I've just tried to parse the pseudo code for IRET in the intel docs.
> Does anyone find that readable?

No; it's abysmal.

> I wonder if you can force 32bit mode to do a stack switch 'iret'
> by doing something like a far jump to a different %cs ?

I don't think that'll work.
