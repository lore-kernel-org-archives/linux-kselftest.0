From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Fri, 3 May 2019 16:16:58 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <2962A4E4-3B9F-4195-9C6D-9932809D98F9@amacapital.net>
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
 <2962A4E4-3B9F-4195-9C6D-9932809D98F9@amacapital.net>
Message-ID:
 <CAHk-=wjZDhwStWvioV7totCnZfp74bqH0y1UJxkmFfdLg48wDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503231658.rrdGE_UHurKtwffEBOplhwbxcGxvrBap0rlphYloY0I@z>

On Fri, May 3, 2019@3:55 PM Andy Lutomirski <luto@amacapital.net> wrote:
>
> But I think this will end up worse than the version where the entry code fixes it up.  This is because, if the C code moves pt_regs, then we need some way to pass the new pointer back to the asm.

What? I already posted that code. Let me quote it again:

Message-ID: <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg at mail.gmail.com>

        # args: pt_regs pointer (no error code for int3)
        movl %esp,%eax
        # allocate a bit of extra room on the stack, so that
        # 'kernel_int3' can move the pt_regs
        subl $8,%esp
        call kernel_int3
        movl %eax,%esp

It's that easy (this is with the assumption that we've already applied
the "standalone simple int3" case, but I think the above might work
even with the current code model, just the "call do_int3" needs to
have the kernel/not-kernel distinction and do the above for the kernel
case)

That's *MUCH* easier than your code to move entries around on the
stack just as you return, and has the advantage of not changing any
C-visible layout.

The C interface looks like this

    /* Note: on x86-32, we can move 'regs' around for push/pop emulation */
    struct pt_regs *kernel_int3(struct pt_regs *regs)
    {
        ..
        .. need to pass regs to emulation functions
        .. and call emulation needs to return it
        ..
        return regs;
    }

and I just posted as a response to Stephen the *trivial* do_int3()
wrapper (so that x86-64 doesn't need to care), and the *trivial* code
to actually emulate a call instruction.

And when I say "trivial", I obviously mean "totally untested and
probably buggy", but it sure seems *simple*.,

Notice? Simple and minimal changes to entry code that only affect
int3, and nothing else.

                 Linus
