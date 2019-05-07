From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 11:45:37 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <20190506162915.380993f9@gandalf.local.home>
 <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
 <20190506174511.2f8b696b@gandalf.local.home>
 <CAHk-=wj3R_s0RTJOmTBNaUPhu4fz2shNBUr4M6Ej65UYSNCs-g@mail.gmail.com>
 <20190506210416.2489a659@oasis.local.home>
 <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
 <20190506215353.14a8ef78@oasis.local.home>
 <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
 <20190506225819.11756974@oasis.local.home>
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
 <20190506232158.13c9123b@oasis.local.home>
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
 <CAHk-=wg2_okyU8mpkGCUrudgfg8YmNetSD8=scNbOkN+imqZdQ@mail.gmail.com>
 <20190507111227.1d4268d7@gandalf.local.home>
 <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
Message-ID: <20190507114537.48a863fa@gandalf.local.home>

On Tue, 7 May 2019 08:31:14 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> The reality is that changing something fundamental like the kernel
> stack at this point for an architecture that will not change in the
> future is silly.

x86_32 will no longer have updates, but will x86_64? And we will
constantly be adding more work around hacks to handle the difference of
the pt_regs in the future. I see Peter's patch easing that future pain.

> 
> The reality is that Peter's patch is much bigger than mine, because it
> needed a lot of other changes *because* it did that change.

It was much bigger because it removed a lot of the work around hacks.

But you are the "benevolent dictator", and I don't see me changing your
mind.

I'll go and implement it the way you like.

-- Steve
