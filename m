From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 22:58:19 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
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
Message-ID: <20190506225819.11756974@oasis.local.home>

On Mon, 6 May 2019 19:22:06 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> Notice? We'd not even have to look up any values.  We'd literally just
> do something like
> 
>         int offset = locked_atomic_read(ip+1);
>         return int3_emulate_call(ip, ip+5+offset);
> 
> and it would be *atomic* with respect to whatever other user that
> updates the instruction, as long as they update the offset with a
> "xchg" instruction.

Honestly, I'm not really sure what you are trying to do here.

Are you talking about making the update to the code in the int3
handler? And then just returning back to the regs->ip and executing the
new call (not really emulating).

-- Steve
