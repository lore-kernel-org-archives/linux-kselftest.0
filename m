From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Fri, 3 May 2019 16:07:59 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190503184919.2b7ef242@gandalf.local.home>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg@mail.gmail.com>
 <20190503152405.2d741af8@gandalf.local.home>
 <CAHk-=wiA-WbrFrDs-kOfJZMXy4zMo9-SZfk=7B-GfmBJ866naw@mail.gmail.com>
 <20190503184919.2b7ef242@gandalf.local.home>
Message-ID: <CAHk-=wh2vPLvsGBi6JtmEYeqHxB5UpTzHDjY5JsWG=YR0Lypzw@mail.gmail.com>

On Fri, May 3, 2019 at 3:49 PM Steven Rostedt <rostedt at goodmis.org> wrote:
>
> You are saying that we have a do_int3() for user space int3, and
> do_kernel_int3() for kernel space. That would need to be done in asm
> for both, because having x86_64 call do_int3() for kernel and
> user would be interesting.

The clean/simple way is to just do this

 - x86-32 does the special asm for the kernel_do_int3(), case and
calls user_do_int3 otherwise.

 - x86-64 doesn't care, and just calls "do_int3()".

We have a trivial helper function like

    dotraplinkage void notrace do_int3(struct pt_regs *regs, long error_code)
    {
        if (user_mode(regs))
                user_int3(regs);
        else
                WARN_ON_ONCE(kernel_int3(regs) != regs);
    }

which adds that warning just for debug purposes.

Then we make the rule be that user_int3() does the normal stuff, and
kernel_int3() returns the pt_regs it was passed in.

Easy-peasy, there is absolutely no difference between x86-64 and
x86-32 here except for the trivial case that x86-32 does its thing at
the asm layer, which is what allows "kernel_int3()" to move pt_regs
around by a small amount.

Now, the _real_ difference is when you do the "call_emulate()" case,
which will have to do something like this

    static struct pt_regs *emulate_call(struct pt_regs *regs, unsigned
long return, unsigned long target)
    {
    #ifdef CONFIG_X86_32
            /* BIG comment about how we need to move pt_regs to make
room and to update the return 'sp' */
            struct pt_regs *new = (void *)regs - 4;
            unsigned long *sp = (unsigned long *)(new + 1);
            memmove(new, regs, sizeof(*regs));
            regs = new;
    #else
            unsigned long *sp = regs->sp;
            regs->sp -= 4;
    #endif
            *sp = value;
            regs->ip = target;
            return regs;
    }

but look, the above isn't that complicated, is it? And notice how the
subtle pt_regs movement is exactly where it needs to be and nowhere
else.

And what's the cost of all of this? NOTHING. The x86-32 entry code has
to do the test for kernel space anyway, and *all* it does now is to
call "kernel_int3" for the kernel case after having made a bit of
extra room on the stack so that you *can* move pt_regs around (maybe
people want to pop things too? It would work as well).

See what I mean by "localized to the cases the need it"?

              Linus
