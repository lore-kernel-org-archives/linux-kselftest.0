From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 12:46:11 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506145745.17c59596@gandalf.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
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
Message-ID: <CAHk-=witfFBW2O5v6g--FmqnAFsMkKNLosTFfWyaoJ7euQF8kQ@mail.gmail.com>

On Mon, May 6, 2019 at 11:57 AM Steven Rostedt <rostedt at goodmis.org> wrote:
>
> You should have waited another week to open that merge window ;-)

Hmm. I'm looking at it while the test builds happen, and since I don't
see what's wrong in the low-level entry code, I'm looking at the
ftrace code instead.

What's going on here?

               *pregs = int3_emulate_call(regs, (unsigned
long)ftrace_regs_caller);

that line makes no sense. Why would we emulate a call to
ftrace_regs_caller()? That function sets up a pt_regs, and then calls
ftrace_stub().

But we *have* pt_regs here already with the right values. Why isn't
this just a direct call to ftrace_stub() from within the int3 handler?

And the thing is, calling ftrace_regs_caller() looks wrong, because
that's not what happens for *real* mcount handling, which uses that
"create_trampoline()" to create the thing we're supposed to really
use?

Anyway, I simply don't understand the code, so I'm confused. But why
is the int3 emulation creating a call that doesn't seem to match what
the instruction that we're actually rewriting is supposed to do?

IOW, it looks to me like ftrace_int3_handler() is actually emulating
something different than what ftrace_modify_code() is actually
modifying the code to do!

Since the only caller of ftrace_modify_code() is update_ftrace_func(),
why is that function not just saving the target and we'd emulate the
call to that? Using anything else looks crazy?

But as mentioned, I just don't understand the ftrace logic. It looks
insane to me, and much more likely to be buggy than the very simple
entry code.

             Linus
