From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Tue, 7 May 2019 10:08:50 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507163440.GV2606@hirez.programming.kicks-ass.net>
References: <CAHk-=whZwqzbu-=1r_j_cXfd=ta1q7RFCuneqBZfQQhS_P-BmQ@mail.gmail.com>
 <20190506215353.14a8ef78@oasis.local.home>
 <CAHk-=wjLXmOn=Cp=uOfO4gE01eN_-UcOUyrMTTw5-f_OfPO48Q@mail.gmail.com>
 <20190506225819.11756974@oasis.local.home>
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
 <20190506232158.13c9123b@oasis.local.home>
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
 <CAHk-=wg2_okyU8mpkGCUrudgfg8YmNetSD8=scNbOkN+imqZdQ@mail.gmail.com>
 <20190507111227.1d4268d7@gandalf.local.home>
 <CAHk-=wjYdj+vvV8uUA8eaUSxOhu=xuQxdo-dtM927j0-3hSkEw@mail.gmail.com>
 <20190507163440.GV2606@hirez.programming.kicks-ass.net>
Message-ID:
 <CAHk-=wiuue37opWK5QaQ9f6twqDZuSratdP-1bK6kD9-Az5WnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507170850.o8JPQUBBr8_6xCA57JJC3W4fE7LgVD9VPEQY4hXq7tg@z>

On Tue, May 7, 2019@9:34 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Would you consider my approach later on, under the guise of unification?

WHY?

The *only* advantage of your patch is that trivial "look up kernel stack" macro.

Seriously. There's absolutely nothing else.

Is that macro ugly? Yes. But it's directly explainable by just
pointing to the architecture documentation.

It's a one-liner hack.

And for that, you want to complicate the x86-32 entry and exit code?

Do we have different emulation for "push" on 32-bit and 64-bit? Yes.
But again, that's just how the hardware works. This is not some
"generic hw-independent code". This is literally emulating
instructions that care about instruction encoding and bit size
details, where there are certainly _similarities_ (and in the case of
'call', they look bit-identical), but it's also not like "same code"
is a big argument. That's why we have a helper function, to hide the
details.

I point to my diffstat once again. It's smaller, and I argue that it
is actually conceptually *simpler* to simply say "this is how the
architecture works".

And yes, I realize that I may be biased by the fact that I simply know
i386 so well, so to me it simply makes more sense to just work with
what the hardware gives us. The i386 exception model with the kernel
stack nesting is a *hell* of a lot simpler than the x86-64 one. The
fact is, x86-64 messed things up, and swapgs and friends are an
abomination against God.

So the whole "let's clean up x86-32 to look like x86-64, which got
things right" is to me a completely bogus argument. x86-64 got the
"yes, push ss/sp unconditionally" part right, but got a lot of other
things horribly wrong. So this is all just one small detail that
differs, across two architectures that are similar but have very
different warts.

But that diffstat is still hard, cold, unbiased data.

                    Linus
