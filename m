From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 20:28:53 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506232158.13c9123b@oasis.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <20190506095631.6f71ad7c@gandalf.local.home>
 <CAHk-=wgw_Jmn1iJWanoSFb1QZn3mbTD_JEoMsWcWj5QPeyHZHA@mail.gmail.com>
 <20190506130643.62c35eeb@gandalf.local.home>
 <CAHk-=whesas+GDtHZks62wqXWXe4d_g3XJ359GX81qj=Fgs6qQ@mail.gmail.com>
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
Message-ID:
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507032853.bpKiUJFpmHS8xEL42sGsO2ArPHOwepHkJ5fyl2lxAME@z>

On Mon, May 6, 2019@8:22 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> But still, we need to emulate the call, which requires pushing the
> return code back onto the stack. I believe that part is the part we are
> struggling with.

Yes. But I was looking at the ftrace parts because I didn't see the
bug in the low-level x86 side, so...

The x86 int3 faulting code itself looks so *trivially* simple, and it
does work for the trivial test-case too. Which was what made me go
"Hmm, maybe there's timing or something".

But it could obviously also be that the trivial test-case is just too
trivial, and doesn't involve nmi etc etc.

               Linus
