From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 7 May 2019 11:51:03 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
References: <20190506145745.17c59596@gandalf.local.home>
 <CAHk-=witfFBW2O5v6g--FmqnAFsMkKNLosTFfWyaoJ7euQF8kQ@mail.gmail.com>
 <20190506162915.380993f9@gandalf.local.home>
 <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
 <20190506174511.2f8b696b@gandalf.local.home>
 <CAHk-=wj3R_s0RTJOmTBNaUPhu4fz2shNBUr4M6Ej65UYSNCs-g@mail.gmail.com>
 <20190506210416.2489a659@oasis.local.home>
 <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
 <20190506215353.14a8ef78@oasis.local.home>
 <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
Message-ID: <20190507095103.GP2606@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507095103.XrFD7ucv0xbJ3oYX9bdKoReEz84utr65rzThJ4W5Its@z>

On Mon, May 06, 2019@07:22:06PM -0700, Linus Torvalds wrote:
> We do *not* have very strict guarantees for D$-vs-I$ coherency on x86,
> but we *do* have very strict guarantees for D$-vs-D$ coherency. And so
> we could use the D$ coherency to give us atomicity guarantees for
> loading and storing the instruction offset for instruction emulation,
> in ways we can *not* use the D$-to-I$ guarantees and just executing it
> directly.
> 
> So while we still need those nasty IPI's to guarantee the D$-vs-I$
> coherency in the "big picture" model and to get the serialization with
> the actual 'int3' exception right, we *could* just do all the other
> parts of the instruction emulation using the D$ coherency.
> 
> So we could do the actual "call offset" write with a single atomic
> 4-byte locked cycle (just use "xchg" to write - it's always locked).
> And similarly we could do the call offset *read* with a single locked
> cycle (cmpxchg with a 0 value, for example). It would be atomic even
> if it crosses a cacheline boundary.

Very 'soon', x86 will start to #AC if you do unaligned LOCK prefixed
instructions. The problem is that while aligned LOCK instructions can do
the atomicity with the coherency protocol, unaligned (esp, line or page
boundary crossing ones) needs that bus-lock thing the SDM talks about.

For giggles, write yourself a while(1) loop that XCHGs across a
page-boundary and see what it does to the rest of the system.

So _please_, do not rely on unaligned atomic ops. We really want them to
do the way of the Dodo.
