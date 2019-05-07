From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 17:24:18 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507172159.5t3bm3mjkwagvite@treble>
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
 <20190507172159.5t3bm3mjkwagvite@treble>
Message-ID: <20190507172418.67ef6fc3@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507212418.IEldoPFQOAT9EPb4Az3R_MNIDZNoNUmXvSN1BHh6ekU@z>

On Tue, 7 May 2019 12:21:59 -0500
Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> regs->sp is *undefined* on x86-32.  We're damning our future selves to
> have to always remember to use that darn kernel_stack_pointer() helper
> for eternity just because of x86-32.

And there's been several times I forget that regs->sp can not be read
directly. Especially most of my bug reports are for x86_64 these days.
But when I had that seldom x86_32 one, and go debugging, I would print
out "regs->sp" and then the system would crash. And I spend some time
wondering why?

It's been a bane of mine for some time.


-- Steve
