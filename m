From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 15:06:57 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506174511.2f8b696b@gandalf.local.home>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
 <20190506174511.2f8b696b@gandalf.local.home>
Message-ID:
 <CAHk-=wj3R_s0RTJOmTBNaUPhu4fz2shNBUr4M6Ej65UYSNCs-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506220657.nvJtTEit2LoySEBhNkGKZCAr1sFLnpanJmPNQQRPJRI@z>

On Mon, May 6, 2019@2:45 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> To do that we would need to rewrite the logic to update each of those
> 40,000 calls one at a time, or group them together to what gets
> changed.

Stephen, YOU ARE NOT LISTENING.

You are already fixing the value of the call in the instruction as
part of the instruction rewriting.

When you do things like this:

        unsigned long ip = (unsigned long)(&ftrace_call);
        unsigned char *new;
        int ret;

        new = ftrace_call_replace(ip, (unsigned long)func);
        ret = update_ftrace_func(ip, new);

you have already decided to rewrite the instruction with one single
fixed call target: "func".

I'm just saying that you should ALWAYS use the same call target in the
int3 emulation.

Instead, you hardcode something else than what you are AT THE SAME
TIME rewriting the instruction with.

See what I'm saying?

You already save off the "ip" of the instruction you modify in
update_ftrace_func(). I'm just saying that you should *also* save off
the actual target of the call, and use *THAT*.

So that the int3 emulation and the instruction rewriting *match*.

What you do now makes no sense. You're modifing the code with one
thing (the "func" argument in update_ftrace_func), so if your
modification completed, that's what you'll actually *run*. But you're
then _emulating_ doing somethiing completely different, not using
"func" at all there.

So let me say one more time: how can it *possibly* make sense to
emulate something else than you are changing the instruction to read?

Are you finally understanding what craziness I'm talking about?

Stop with the "there could be thousands of targets" arguyment. The
"call" instruction THAT YOU ARE REWRITING has exactly one target.
There aren't 40,000 of them. x86 does not have that kind of "call"
instruction that randomly calls 40k different functions. You are
replacing FIVE BYTES of memory, and the emulation you do should
emulate those FIVE BYTES.

See?

Why are you emulating something different than what you are rewriting?

                    Linus
