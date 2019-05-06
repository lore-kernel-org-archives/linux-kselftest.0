From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 13:42:12 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506162915.380993f9@gandalf.local.home>
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
 <CAHk-=witfFBW2O5v6g--FmqnAFsMkKNLosTFfWyaoJ7euQF8kQ@mail.gmail.com>
 <20190506162915.380993f9@gandalf.local.home>
Message-ID:
 <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506204212.VY1jPTq4GdRSiI-48NpArpXJ7grKFGWrV_rcXPMhT_Y@z>

On Mon, May 6, 2019@1:29 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Because that call to ftrace_stub is also dynamic.

You're missing the point.

We are rewriting a single "cal" instruction to point to something.

The "int3" emulation should call THE SAME THING.

Right now it doesn't.

> Part of the code will change it to call the function needed directly.
>
> struct ftrace_ops my_ops {
>         .func = my_handler
> };
>
>         register_ftrace_function(&my_ops);
>
> Will change "call ftrace_stub" into "call my_handler"

But that's not what you're actually *doing*.

Instead, you're now _emulating_ calling ftrace_regs_caller, which will
call that ftrace_stub, which in turn will try to update the call site.

But that's insane. It's insane because

 - it's not even what your call rewriting is doing Why aren't you just
doing the emulation using the *SAME* target that you're rewriting the
actual call instruction with?

 - even if ftrace_regs_caller ends up being that same function, you'd
be better off just passing the "struct pt_regs" that you *ALREADY
HAVE* directly to ftrace_stub in the int3 handler, rather than create
*another* pt_regs stack

See? In that second case, why don't you just use "int3_emulate_call()"
to do the reguired 'struct pt_regs' updates, and then call
ftrace_stub() *with* that fixed-up pt_regs thing?

In other words, I think you should always do "int3_emulate_call()"
with the *exact* same address that the instruction you are rewriting
is using. There's no "three different cases". The only possible cases
are "am I rewriting a jump" or "am I rewriting a call".

There is no "am I rewriting a call to one address, and then emulating
it with a call to another address" case that makes sense.

What *can* make sense is "Oh, I'm emulating a call, but I know that
call will be rewritten, so let me emulate the call and then
short-circuit the emulation immediately".

But that is not what the ftrace code is doing. The ftrace code is
doing something odd and insane.

And no, your "explanation" makes no sense. Because it doesn't actually
touch on the fundamental insanity.

            Linus
