From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 18:06:12 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506201014.484e7b65@oasis.local.home>
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
 <CAHk-=wje38dbYFGNw0y==zd7Zo_4s2WOQjWaBDyr24RCdK2EPQ@mail.gmail.com>
 <20190506201014.484e7b65@oasis.local.home>
Message-ID:
 <CAHk-=whVLnVHhjU4=sdBSpP9eviqwv00xvtCDamdQkhDRA_EmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507010612.RSBZWwFxf71byZqF-VbL8q3wR8xKWJqi2aBSGhLykTM@z>

On Mon, May 6, 2019@5:10 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> But the CPU that was rewriting instructions does a run_sync() after
> removing the int3:
>
> static void run_sync(void)
> {
>         int enable_irqs;
>
>         /* No need to sync if there's only one CPU */
>         if (num_online_cpus() == 1)
>                 return;
>
>         enable_irqs = irqs_disabled();
>
>         /* We may be called with interrupts disabled (on bootup). */
>         if (enable_irqs)
>                 local_irq_enable();
>         on_each_cpu(do_sync_core, NULL, 1);
>         if (enable_irqs)
>                 local_irq_disable();
> }
>
> Which sends an IPI to all CPUs to make sure they no longer see the int3.

Duh. I have been looking back and forth in that file, and I was mixing
ftrace_modify_code_direct() (which only does a local sync) with
ftrace_modify_code() (which does run_sync()). The dangers of moving
around by searching for function names.

That file is a maze of several functions that are very similarly named
and do slightly different things.

But yes, I was looking at the "direct" sequence.

> I think you are missing the run_sync() which is the heavy hammer to
> make sure all CPUs are in sync. And this is done at each stage:
>
>         add int3
>         run_sync();
>         update call cite outside of int3
>         run_sync()
>         remove int3
>         run_sync()
>
> HPA said that the last run_sync() isn't needed, but I kept it because I
> wanted to make sure. Looks like your analysis shows that it is needed.

Absolutely. I think we could get rid of it, but yes, to then avoid the
race we'd need to be a lot more clever.

Yeah, with the three run_sunc() things, the races I thought it had can't happen.

             Linus
