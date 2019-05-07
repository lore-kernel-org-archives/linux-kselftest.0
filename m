From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 7 May 2019 11:25:13 -0400
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
Message-ID: <20190507112513.11297412@gandalf.local.home>

On Tue, 7 May 2019 11:12:27 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> I don't look at Peter's patch and think "this is the solution for int3
> emulate calls". I see Peter's patch as "Thanks God, we are finally
> getting rid of the cause of all theses work around hacks all over the
> place! and oh by the way, we can easily implement int3 call emulation
> because of it".

Note, if you really are adamant on your solution, I can write them up,
test them, and get them out for this merge window. I really want a
solution for the int3 emulate calls, as there is a real bug here that
they fix.

But I will say, I still prefer Peter's solution. Maybe in the future we
can revisit it again.

-- Steve
