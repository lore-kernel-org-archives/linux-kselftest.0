From: luto at amacapital.net (Andy Lutomirski)
Date: Fri, 3 May 2019 15:55:12 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wiA-WbrFrDs-kOfJZMXy4zMo9-SZfk=7B-GfmBJ866naw@mail.gmail.com>
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
Message-ID: <2962A4E4-3B9F-4195-9C6D-9932809D98F9@amacapital.net>



> On May 3, 2019, at 2:46 PM, Linus Torvalds <torvalds at linux-foundation.org> wrote:
> 
>> On Fri, May 3, 2019 at 12:24 PM Steven Rostedt <rostedt at goodmis.org> wrote:
>> 
>> The problem with this approach is that it would require doing the same
>> for x86_64, as the int3 C code is the same for both. And that may be a
>> bit more difficult on the x86_64 side because it's all done with a
>> simple flag in the idtentry macro to add the gap.
> 
> That argument is weakened by the fact that we have to do _other_
> things differently on 32-bit and 64-bit anyway.
> 
> So we might as well have a "on 32-bit, the call emulation needs to
> move the pt_regs to make space" special case in the call emulation
> code. It's very easy to explain why.
> 
> And then we'd limit the special case to where it matters (with a big
> comment about what's going on), rather than adding random special case
> handling to random _other_ places.

If we do this, it should IMO look like this:

struct pt_regs *change_kernel_stack_pointer(struct pt_regs *, unsigned long new_sp);

And that helper should be used on both variants.

But I think this will end up worse than the version where the entry code fixes it up.  This is because, if the C code moves pt_regs, then we need some way to pass the new pointer back to the asm.  We will also have a much harder time with runtime sanity checks.  In the model where the C code merely updates regs->sp, it’s very easy to compare sp and &regs to check for overlap, but it’s much harder to tell whether memmoveing it is going to overwrite something important.  And we have to worry about whether there’s some other code that assumes that pt_regs stays put.

So my intuition is that the pure asm fixup will result is more maintainable code.
