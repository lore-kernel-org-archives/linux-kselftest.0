From: peterz at infradead.org (Peter Zijlstra)
Date: Tue, 7 May 2019 13:30:50 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <b34aa38bdfe84263bc20b60761bf6005@AcuMS.aculab.com>
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
Message-ID: <20190507113050.GR2606@hirez.programming.kicks-ass.net>

On Tue, May 07, 2019 at 09:18:51AM +0000, David Laight wrote:
> From: Peter Zijlstra
> > Sent: 07 May 2019 09:58
> ...
> > +	/*
> > +	 * When we're here from kernel mode; the (exception) stack looks like:
> > +	 *
> > +	 * 4*4(%esp) - <previous context>
> > +	 * 3*4(%esp) - flags
> > +	 * 2*4(%esp) - cs
> > +	 * 1*4(%esp) - ip
> > +	 * 0*4(%esp) - orig_eax
> 
> Am I right in thinking that this is the only 'INT3' stack frame that
> needs to be 'fiddled' with?
> And that the 'emulate a call instruction' has verified that is the case??
> So the %cs is always the kernel %cs.

Only the INT3 thing needs 'the gap', but the far bigger change here is
that kernel frames now have a complete pt_regs set and all sorts of
horrible crap can go away.

For 32bit 'the gap' happens naturally when building a 5 entry frame. Yes
it is possible to build a 5 entry frame on top of the old 3 entry one,
but why bother...
