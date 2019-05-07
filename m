From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 6 May 2019 21:53:53 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
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
Message-ID: <20190506215353.14a8ef78@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507015353.IoG_8FDzOO7A3GXOU1hfRaz99k27SRhCiIVbEhFOni0@z>

On Mon, 6 May 2019 18:34:59 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, May 6, 2019@6:04 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > That iterator does something special for each individual record. All
> > 40,000 of them.  
> 
> .. yes, but the 'int3' only happens for *one* of them at a time.
> 
> Why would it bother with the other 39,999 calls?
> 
> You could easily just look up the record at the int3 time, and just
> use the record. Exactly the same way you use the one-at-a-time ones.
> 
> Instead, you emulate a fake call to a function that *wouldn't* get
> called, which now does the lookup there. That's the part I don't get.
> Why are you emulating something else than what you'd be rewriting?
>

Ah, now I see what you are saying. Yes, I could pass in what it is
suppose to call. But I was trying to use the same code for all the
alternative solutions we were passing around, and this became the
"default" case that would work with any int3_emulate_call
implementation we came up with.

That is, if we call ftrace_regs_caller() for any scenario it should
work. Even if the call was suppose to be a nop, because in that case,
all the ftrace_ops registered in the iterator would refuse to have
their handler be called for that function.

I sent you a single patch, but that was really just a diff of several
applied patches against your unmodified tree. The last patch implements
the ftrace code. And I had it this way because it should work for any
of the implementations.

I could modify it so that it picks what function to call when the int3
is triggered. I think all the solutions we are down to allow that now.
Some of the early ideas had me call one function for all int3s due to
trampolines and such.

Also, I figured just calling ftrace_regs_caller() was simpler then
having that int3 handler do the hash look ups to determine what handler
it needs to call.

-- Steve
