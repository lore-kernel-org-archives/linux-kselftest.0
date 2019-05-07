From: peterz at infradead.org (Peter Zijlstra)
Date: Tue, 7 May 2019 19:38:29 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wiuue37opWK5QaQ9f6twqDZuSratdP-1bK6kD9-Az5WnA@mail.gmail.com>
References: <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
 <20190506225819.11756974@oasis.local.home>
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
 <20190506232158.13c9123b@oasis.local.home>
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
 <CAHk-=wg2_okyU8mpkGCUrudgfg8YmNetSD8=scNbOkN+imqZdQ@mail.gmail.com>
 <20190507111227.1d4268d7@gandalf.local.home>
 <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
 <20190507163440.GV2606@hirez.programming.kicks-ass.net>
 <CAHk-=wiuue37opWK5QaQ9f6twqDZuSratdP-1bK6kD9-Az5WnA@mail.gmail.com>
Message-ID: <20190507173829.GY2606@hirez.programming.kicks-ass.net>

On Tue, May 07, 2019 at 10:08:50AM -0700, Linus Torvalds wrote:
> On Tue, May 7, 2019 at 9:34 AM Peter Zijlstra <peterz at infradead.org> wrote:
> >
> > Would you consider my approach later on, under the guise of unification?
> 
> WHY?
> 
> The *only* advantage of your patch is that trivial "look up kernel stack" macro.
> 
> Seriously. There's absolutely nothing else.

The ftrace_regs_caller, the kprobe tramplines, the unwinder, they all
have 'funny' bits because pt_regs isn't 'right'.

> So the whole "let's clean up x86-32 to look like x86-64, which got
> things right" is to me a completely bogus argument. x86-64 got the
> "yes, push ss/sp unconditionally" part right, but got a lot of other
> things horribly wrong. So this is all just one small detail that
> differs, across two architectures that are similar but have very
> different warts.

It's a detail that leaks into the C code. Yes SWAPGS is horrible crap,
but C code doesn't much care. The partial pt_regs thing otoh comes up a
fair number of times.

Anyway; I think we're at the point where we'll have to agree to
disagree (or maybe slightly past it).
