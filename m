From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 23:21:58 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
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
Message-ID: <20190506232158.13c9123b@oasis.local.home>

On Mon, 6 May 2019 20:05:24 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:


> It would emulate the call that has had its first byte overwritten by
> 'int3'. Without doing any lookups of what it was supposed to change
> the call to, because it simply depends on what the rewriting code is
> doing on another CPU (or on the same CPU - it wouldn't care).

OK, so this is just about what to have it call.

> 
> So no need to look up anything, not at int3 time, and not at return
> time. It would just emulate the instruction atomically, with no state,
> and no need to look up what the 'ip' instruction is at the time.
> 
> It could literally just use a single flag: "is ftrace updating call
> instructions". Add another flag for the "I'm nop'ing out call
> instructions" so that it knows to emulate a jump-over instead. That's
> it.

Well we have that, and we have to look up the record regardless to know
if this was a ftrace int3 or not (the ftrace_location(ip) does that).
And the record has a counter to # of attached callers. Zero being to
turn it into a nop.

Note, if we are going from nop to call or call to nop, it would need to
read the offset to see if it is a nop (don't want to call with the nop
offset)

> 
> Because all the actual *values* would be entirely be determined by the
> actual rewriting that is going on independently of the 'int3'
> exception.

But still, we need to emulate the call, which requires pushing the
return code back onto the stack. I believe that part is the part we are
struggling with.

-- Steve
