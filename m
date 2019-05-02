From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Thu, 2 May 2019 11:02:40 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502162133.GX2623@hirez.programming.kicks-ass.net>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
Message-ID: <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>

On Thu, May 2, 2019 at 9:21 AM Peter Zijlstra <peterz at infradead.org> wrote:
>
> TL;DR, on x86_32 kernel->kernel IRET frames are only 3 entries and do
> not include ESP/SS, so not only wasn't regs->sp setup, if you changed it
> it wouldn't be effective and corrupt random stack state.

Indeed, the 32-bit case for same-RPL exceptions/iret is entirely
different, and I'd forgotten about that.

And honestly, this makes the 32-bit case much worse. Now the entry
stack modifications of int3 suddenly affect not just the entry, but
every exit too.

This is _exactly_ the kind of subtle kernel entry/exit code I wanted
us to avoid.

And while your code looks kind of ok, it's subtly buggy. This sequence:

+       pushl   %eax
+       movl    %esp, %eax
+
+       movl    4*4(%eax), %esp         # restore (modified) regs->sp
+
+       /* rebuild IRET frame */
+       pushl   3*4(%eax)               # flags
+       pushl   2*4(%eax)               # cs
+       pushl   1*4(%eax)               # ip
+
+       andl    $0x0000ffff, 4(%esp)    # clear high CS bits
+
+       movl    (%eax), %eax            # restore eax

looks very wrong to me. When you do that "restore (modified)
regs->sp", isn't that now resetting %esp to the point where %eax now
points below the stack? So if we get an NMI in this sequence, that
will overwrite the parts you are trying to copy from?

Am I missing something? doesn't it need to be done something like

  pushl %eax
  pushl %ecx
  movl 20(%esp),%eax   # possibly modified regs->sp
  movl 16(%esp),%ecx   # flags
  movl %ecx,-4(%eax)
  movl 12(%esp),%ecx   # cs
  movl %ecx,-8(%eax)
  movl 8(%esp),%ecx   # ip
  movl %ecx, -12(%eax)
  movl 4(%esp),%ecx   # eax
  movl %ecx, -16(%eax)
  popl %ecx
  lea -16(%eax),%esp
  popl %eax

(NOTE NOTE NOTE I might have gotten the offsets and the direction of
the moves *completely* wrong, this is not a serious patch, it's meant
as a "something like this" thing!!)

But now I confused myself, and maybe I'm wrong.

                   Linus
