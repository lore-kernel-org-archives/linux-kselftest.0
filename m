From: peterz at infradead.org (Peter Zijlstra)
Date: Tue, 7 May 2019 18:34:40 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
References: <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
 <20190506215353.14a8ef78@oasis.local.home>
 <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
 <20190506225819.11756974@oasis.local.home>
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
 <20190506232158.13c9123b@oasis.local.home>
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
 <CAHk-=wg2_okyU8mpkGCUrudgfg8YmNetSD8=scNbOkN+imqZdQ@mail.gmail.com>
 <20190507111227.1d4268d7@gandalf.local.home>
 <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
Message-ID: <20190507163440.GV2606@hirez.programming.kicks-ass.net>

On Tue, May 07, 2019 at 08:31:14AM -0700, Linus Torvalds wrote:
> The reality is that changing something fundamental like the kernel
> stack at this point for an architecture that will not change in the
> future is silly.

In my eyes it makes sense because i386 is a minority architecture at
this point, and 'nobody' wants to care about how its different if they
don't have to.

> The reality is that Peter's patch is much bigger than mine, because it
> needed a lot of other changes *because* it did that change.

Yes, I change the way stack layout works on i386, and yes that affects a
lot of code. _However_ all of that code is now more like x86_64 than it
was.

Earlier you said that kernel_stack_pointer() was a horrible thing; and
most/all the code that I ended up touching was similarly horrible.

Would you consider my approach later on, under the guise of unification?
We can work on it for a while, and make sure all the iffy bits are
sorted, no need to rush?
