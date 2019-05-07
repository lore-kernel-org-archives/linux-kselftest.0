From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 12:25:10 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507112513.11297412@gandalf.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <20190507112513.11297412@gandalf.local.home>
Message-ID: <20190507122510.0dd37cc8@gandalf.local.home>

On Tue, 7 May 2019 11:25:13 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> Note, if you really are adamant on your solution, I can write them up,
> test them, and get them out for this merge window. I really want a
> solution for the int3 emulate calls, as there is a real bug here that
> they fix.

Thinking about this more, as my real motivation for getting this in
(for this merge window), is to fix the live kernel patching bug. We
only need to implement int3 call emulation for x86_64. We don't need to
implement it for 32bit. The ftrace code can continue to just make it a
nop. Live kernel patching does not support x86_32, and the only issue
that happens on 32bit when we do a nop when converting a call to call,
is that we might lose a trace. But that's been the case since this
started, and not a critical issue. But with live kernel patching,
losing a trace could crash the machine.

As I need to mark all this for stable, I'm going to look into just
implementing this for x86_64. Then we can continue the debate about
how to do this for x86_32 if we care about loss traces. But we don't
need to commit to anything yet.

-- Steve
