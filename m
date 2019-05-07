From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 18:34:59 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506210416.2489a659@oasis.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
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
Message-ID: <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>

On Mon, May 6, 2019 at 6:04 PM Steven Rostedt <rostedt at goodmis.org> wrote:
>
> That iterator does something special for each individual record. All
> 40,000 of them.

.. yes, but the 'int3' only happens for *one* of them at a time.

Why would it bother with the other 39,999 calls?

You could easily just look up the record at the int3 time, and just
use the record. Exactly the same way you use the one-at-a-time ones.

Instead, you emulate a fake call to a function that *wouldn't* get
called, which now does the lookup there. That's the part I don't get.
Why are you emulating something else than what you'd be rewriting?

             Linus
