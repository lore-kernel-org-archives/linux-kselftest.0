From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Tue, 7 May 2019 07:54:53 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
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
 <20190506225819.11756974@oasis.local.home>
 <CAHk-=wh4FCNBLe8OyDZt2Tr+k9JhhTsg3H8R4b55peKcf0b6eQ@mail.gmail.com>
 <20190506232158.13c9123b@oasis.local.home>
 <CAHk-=wi4vPg4pu6RvxQrUuBL4Vgwd2G2iaEJVVumny+cBOWMZw@mail.gmail.com>
Message-ID: <CAHk-=wg2_okyU8mpkGCUrudgfg8YmNetSD8=scNbOkN+imqZdQ@mail.gmail.com>

Duh.

I woke up this morning, realizing what was wrong with my patch.



On Mon, May 6, 2019 at 8:28 PM Linus Torvalds
<torvalds at linux-foundation.org> wrote:
>
> Yes. But I was looking at the ftrace parts because I didn't see the
> bug in the low-level x86 side, so...

There was nothing wrong in the *low-level* parts. There was one thing
wrong with the "in3_emulate_push()" code:

        memmove(new, regs, SAVED_KERNEL_REGS_SIZE);

which ends up calling an out-of-line function. One that is traced. One
that will recursively result in 'int3'. Which will fill up the stack
until you get a triple fault and reboot.

Stupid stupid.

Anyway, changing that to just copying things one word at a time makes
everything work. The attached patch boots with the whole ftrace test
thing.The only change is literally changing that memmove()  into

        /* Inlined "memmove()" of the pt_regs */
        unsigned long *p = (unsigned long *) new;
        int i = SAVED_KERNEL_REGS_SIZE / sizeof(unsigned long);
        do { *p = p[1]; p++; } while (--i);

which I'm not entirely proud of, but it sure is still simple.

And honestly, I absolutely despise PeterZ's patch. The notion that we
should suddenly say that "oh, the i386 kernel stack is odd" after 28
years of having that standard i386 stack is just crazy. And this:

 arch/x86/entry/entry_32.S            | 136 ++++++++++++++++++++++++++++-------
...
 12 files changed, 323 insertions(+), 140 deletions(-)


vs this:

 arch/x86/entry/entry_32.S            |  7 +++-
...
 6 files changed, 120 insertions(+), 13 deletions(-)

is still pretty damn conclusive. Not to mention that the simple
approach had a truly mindbogglingly simple solution with no actual
subtle changes anywhere else.

So I still claim that we should do my patch. Because it is SIMPLE.
It's straightforward, and I can explain every single line in it. Even
if I spent *way* too long until I realized that the "trivial"
memmove() wasn't so trivial.

                     Linus
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch.diff
Type: text/x-patch
Size: 8955 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190507/5e44bf1d/attachment.bin>
