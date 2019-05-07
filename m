From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Tue, 7 May 2019 08:31:14 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507111227.1d4268d7@gandalf.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <20190506145745.17c59596@gandalf.local.home>
 <CAHk-=witfFBW2O5v6g--FmqnAFsMkKNLosTFfWyaoJ7euQF8kQ@mail.gmail.com>
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
Message-ID:
 <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507153114.FqHCXNV3GnAVp0gUo4yDDV6PWQV_LZ7zQ-ZpKppqIiA@z>

On Tue, May 7, 2019@8:12 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>>
> Yes, band-aids are usually simpler than a proper fix.

What? No/.

My fix is the *proper* fix.

PeterZ's is the bandaid.

>             We have 28 years
> of hacks built on hacks. There's a lot of hacks in the C code to handle
> the differences between the crappy way x86_32 does pt_regs and the
> proper way x86_64 does them.

You're confusing "reality": with "your dream world". They are different.

The reality is that the i386 kernel stack is just how things work. End of story.

The reality is that changing something fundamental like the kernel
stack at this point for an architecture that will not change in the
future is silly.

The reality is that Peter's patch is much bigger than mine, because it
needed a lot of other changes *because* it did that change.

> To implement your way, we need to change how the int3 handler works.
> It will be the only exception handler having to return regs, otherwise
> it will crash.

What? That's what the patch *does*. It's trivial.  It is done.

                  Linus
