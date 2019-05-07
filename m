From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Tue, 7 May 2019 07:57:22 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <48BDF7B6-252B-4D29-9116-844363010BC0@amacapital.net>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
 <20190506215353.14a8ef78@oasis.local.home>
 <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
 <48BDF7B6-252B-4D29-9116-844363010BC0@amacapital.net>
Message-ID: <CAHk-=wjMFRZ7bX4NFc1+=Sy5NDHh=8rAvK-JBqB+HySM1W-Nbg@mail.gmail.com>

On Tue, May 7, 2019 at 7:48 AM Andy Lutomirski <luto at amacapital.net> wrote:
>
> IOW I think your trick only works if the old and new states are CALL, but we don’t know that until we’ve looked up the record, at which point we can just use the result of the lookup.

It would indeed only work for call instructions. I was thinking we'd
know that because we only ever batch up call instructions, though.

But it doesn't matter. I was looking at the ftrace code because I
thought there was some subtle timing bug or race or similar. But it
turned out my "memmove()" was the problem. See the patch I just sent
out.

               Linus
