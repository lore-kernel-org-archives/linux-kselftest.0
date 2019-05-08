From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Tue, 7 May 2019 21:50:52 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507172418.67ef6fc3@gandalf.local.home>
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
 <20190507172418.67ef6fc3@gandalf.local.home>
Message-ID:
 <CAHk-=wg5_fwx_-ybD9TLQE4rAUqtYzO2CAmpciWTkDn3dtKMOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508045052.vG-NUIKYYcc4_SwhOKj1tqdFt2jbX4gJudfhTXxfQqA@z>

On Tue, May 7, 2019@2:24 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> And there's been several times I forget that regs->sp can not be read
> directly. Especially most of my bug reports are for x86_64 these days.
> But when I had that seldom x86_32 one, and go debugging, I would print
> out "regs->sp" and then the system would crash. And I spend some time
> wondering why?
>
> It's been a bane of mine for some time.

Guys, I have basically a one-liner patch for your hangups.

It's called "rename 'sp' to 'user_sp' on x86-32".

Then we make the 'sp' field on x86-64 be a union, so that you can call
it user_sp or sp as you wish.

Yeah, it's really more than one line, because obviously the users will
need chaning, but honestly, that would be a _real_ cleanup. Make the
register match what it actually is.

And it doesn't mess up the stack frame, and it doesn't change the
entry code. It just reminds people that the entry is the USER stack
pointer.

Problem solved.

               Linus
