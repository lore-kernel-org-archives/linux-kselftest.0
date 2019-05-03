From: rostedt at goodmis.org (Steven Rostedt)
Date: Fri, 3 May 2019 15:24:05 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg@mail.gmail.com>
Message-ID: <20190503152405.2d741af8@gandalf.local.home>

On Thu, 2 May 2019 13:49:29 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> On Thu, May 2, 2019 at 1:22 PM Peter Zijlstra <peterz at infradead.org> wrote:
> >
> > Something like so; it boots; but I could've made some horrible mistake
> > (again).  
> 
> This actually looks much better to me.
> 
> Maybe it's more lines (I didn't check), but it's a lot simpler in that
> now the magic of the int3 stack doesn't get exposed to anything else.
> 
> We *could* also make this kernel-mode-only do_int3() be a special
> function, and do something like
> 
>         # args: pt_regs pointer (no error code for int3)
>         movl %esp,%eax
>         # allocate a bit of extra room on the stack, so that
> 'kernel_int3' can move the pt_regs
>         subl $8,%esp
>         call kernel_int3
>         movl %eax,%esp
> 
> and not do any stack switching magic in the asm code AT ALL. We'd do
> 
>     struct pt_regs *kernel_int3(struct pt_regs *regs)
>     {
>         ..
>         return regs;
>     }
> 
> and now you the rule for call emulation ends up being that you need to
> "memmove()" the ptregs up and down properly, and return the new
> pt_regs pointer.
> 
> Hmm? That would simplify the asm code further, but some people might
> find it objectionable?
> 

The problem with this approach is that it would require doing the same
for x86_64, as the int3 C code is the same for both. And that may be a
bit more difficult on the x86_64 side because it's all done with a
simple flag in the idtentry macro to add the gap.

-- Steve
