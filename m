From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Fri, 3 May 2019 14:46:11 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190503152405.2d741af8@gandalf.local.home>
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
Message-ID:
 <CAHk-=wiA-WbrFrDs-kOfJZMXy4zMo9-SZfk=7B-GfmBJ866naw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503214611.Mfb5RahWfj3tT5nJ7VJgxb_UjeYYLni4aJG-ztICSN0@z>

On Fri, May 3, 2019@12:24 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> The problem with this approach is that it would require doing the same
> for x86_64, as the int3 C code is the same for both. And that may be a
> bit more difficult on the x86_64 side because it's all done with a
> simple flag in the idtentry macro to add the gap.

That argument is weakened by the fact that we have to do _other_
things differently on 32-bit and 64-bit anyway.

So we might as well have a "on 32-bit, the call emulation needs to
move the pt_regs to make space" special case in the call emulation
code. It's very easy to explain why.

And then we'd limit the special case to where it matters (with a big
comment about what's going on), rather than adding random special case
handling to random _other_ places.

Having to add s magic special case to "kernel_stack_pointer() is
certainly not obvious. Neither is adding magic special cases to system
call exit paths etc.

This has been why I've been arguing against the entry code changes.
Exactly because they tend to have these kind of odd cascading effects.
The entry code is fragile not just because it's a complex hardware
interface, but also because we know about those complex hardware
interfaces in random other places.

I'd much rather have the code that does special things be in one
place, and be the place that *needs* to do the special thing. If we
copy the pt_regs around when we do the "call" emulation, it's *really*
easy to explain *exactly* what we're doing and why in *exactly* that
one context where we are doing it. And it won't affect anything else,
and our existing code that looks at pt_regs will work both before and
after.

Would it need a #ifdef CONFIG_X86_32 around it because it's not needed
on x86-64? Sure. But that #ifdef would be right there, and the comment
that explains why the pt_regs need to be moved would also make it very
obvious why it is only needed for x86-32.

There's a lot of advantages to keeping your problems localized,
instead of letting your random hacks escape and become problems for
other, entirely unrelated, code.

                Linus
