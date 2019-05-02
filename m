From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 2 May 2019 20:18:11 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
Message-ID: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502181811.sh3ueHCyaQ5uDSpe66ts4Rl7oQvfu5xpvv1Ycr-dL7U@z>

On Thu, May 02, 2019@11:02:40AM -0700, Linus Torvalds wrote:
> On Thu, May 2, 2019@9:21 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > TL;DR, on x86_32 kernel->kernel IRET frames are only 3 entries and do
> > not include ESP/SS, so not only wasn't regs->sp setup, if you changed it
> > it wouldn't be effective and corrupt random stack state.
> 
> Indeed, the 32-bit case for same-RPL exceptions/iret is entirely
> different, and I'd forgotten about that.
> 
> And honestly, this makes the 32-bit case much worse. Now the entry
> stack modifications of int3 suddenly affect not just the entry, but
> every exit too.

We could fix this by not using the common exit path on int3; not sure we
want to go there, but that is an option.

> This is _exactly_ the kind of subtle kernel entry/exit code I wanted
> us to avoid.
> 
> And while your code looks kind of ok, it's subtly buggy. This sequence:
> 
> +       pushl   %eax
> +       movl    %esp, %eax
> +
> +       movl    4*4(%eax), %esp         # restore (modified) regs->sp
> +
> +       /* rebuild IRET frame */
> +       pushl   3*4(%eax)               # flags
> +       pushl   2*4(%eax)               # cs
> +       pushl   1*4(%eax)               # ip
> +
> +       andl    $0x0000ffff, 4(%esp)    # clear high CS bits
> +
> +       movl    (%eax), %eax            # restore eax
> 
> looks very wrong to me. When you do that "restore (modified)
> regs->sp", isn't that now resetting %esp to the point where %eax now
> points below the stack? So if we get an NMI in this sequence, that
> will overwrite the parts you are trying to copy from?

ARGH; I knew it was too pretty :/ Yes, something like what you suggest
will be needed, I'll go look at that once my brain recovers a bit from
staring at entry code all day.
