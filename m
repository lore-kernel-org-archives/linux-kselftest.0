From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 20:05:24 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506225819.11756974@oasis.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
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
Message-ID:
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507030524.IxMJJj0E8xTvINyCEU3I_SxYvtaAjPOT4n2NXMd-P8s@z>

On Mon, May 6, 2019@7:58 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> > Notice? We'd not even have to look up any values.  We'd literally just
> > do something like
> >
> >         int offset = locked_atomic_read(ip+1);
> >         return int3_emulate_call(ip, ip+5+offset);
> >
> > and it would be *atomic* with respect to whatever other user that
> > updates the instruction, as long as they update the offset with a
> > "xchg" instruction.
>
> Honestly, I'm not really sure what you are trying to do here.
>
> Are you talking about making the update to the code in the int3
> handler?

No. The above would be pretty much the entirely of the the ftrace_int3_handler.

It would emulate the call that has had its first byte overwritten by
'int3'. Without doing any lookups of what it was supposed to change
the call to, because it simply depends on what the rewriting code is
doing on another CPU (or on the same CPU - it wouldn't care).

So no need to look up anything, not at int3 time, and not at return
time. It would just emulate the instruction atomically, with no state,
and no need to look up what the 'ip' instruction is at the time.

It could literally just use a single flag: "is ftrace updating call
instructions". Add another flag for the "I'm nop'ing out call
instructions" so that it knows to emulate a jump-over instead. That's
it.

Because all the actual *values* would be entirely be determined by the
actual rewriting that is going on independently of the 'int3'
exception.

                   Linus
