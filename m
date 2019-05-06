From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 13:44:52 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
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
 <CAHk-=wi5KBWUOvM94aTOPnoJ5L_aQG=vgLQ4SxxZDeQD0pF2tQ@mail.gmail.com>
Message-ID:
 <CAHk-=wgsi+FQN6bnued8K4KQ2fF53k0JW4TUY+q0XOJyiULXmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506204452.jsiHSVcZfwL6QCQV4pkJKkCDErdGXXBb8AzUwA6DESU@z>

On Mon, May 6, 2019 at 1:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What *can* make sense is "Oh, I'm emulating a call, but I know that
> call will be rewritten, so let me emulate the call and then
> short-circuit the emulation immediately".

That made no sense. The end should have been "and then short-circuit
the _rewriting_ immediately" of course.

The "emulate a call" is just to make the "struct pt_regs" state look
like it would have after the call. The "short circuit the rewriting"
part is the thing that then rewrites the actual instruction based on
that pt_regs state.

                 Linus
