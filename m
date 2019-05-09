From: peterz at infradead.org (Peter Zijlstra)
Date: Thu, 9 May 2019 19:18:40 +0200
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <81170F0B-A2BB-4CD6-A1B5-5E7E0DDBC282@amacapital.net>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.721269814@infradead.org>
 <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
 <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>
 <20190509081431.GO2589@hirez.programming.kicks-ass.net>
 <81170F0B-A2BB-4CD6-A1B5-5E7E0DDBC282@amacapital.net>
Message-ID: <20190509171840.GZ2623@hirez.programming.kicks-ass.net>

On Thu, May 09, 2019 at 09:20:06AM -0700, Andy Lutomirski wrote:
> > +ENTRY(call_to_exception_trampoline)
> > +    /*
> > +     * On entry the stack looks like:
> > +     *
> > +     *   2*4(%esp) <previous context>
> > +     *   1*4(%esp) RET-IP
> > +     *   0*4(%esp) func
> > +     *
> > +     * transform this into:
> > +     *
> > +     *  19*4(%esp) <previous context>
> > +     *  18*4(%esp) gap / RET-IP
> > +     *  17*4(%esp) gap / func
> > +     *  16*4(%esp) ss
> > +     *  15*4(%esp) sp / <previous context>
> > +     *  14*4(%esp) flags
> > +     *  13*4(%esp) cs
> > +     *  12*4(%esp) ip / RET-IP
> > +     *  11*4(%esp) orig_eax
> > +     *  10*4(%esp) gs
> > +     *   9*4(%esp) fs
> > +     *   8*4(%esp) es
> > +     *   7*4(%esp) ds
> > +     *   6*4(%esp) eax
> > +     *   5*4(%esp) ebp
> > +     *   4*4(%esp) edi
> > +     *   3*4(%esp) esi
> > +     *   2*4(%esp) edx
> > +     *   1*4(%esp) ecx
> > +     *   0*4(%esp) ebx
> > +     */
> > +    pushl    %ss
> > +    pushl    %esp        # points at ss
> > +    addl    $3*4, (%esp)    #   point it at <previous context>
> > +    pushfl
> > +    pushl    %cs
> > +    pushl    5*4(%esp)    # RET-IP
> > +    subl    5, (%esp)    #   point at CALL instruction
> > +    pushl    $-1
> > +    pushl    %gs
> > +    pushl    %fs
> > +    pushl    %es
> > +    pushl    %ds
> > +    pushl    %eax
> > +    pushl    %ebp
> > +    pushl    %edi
> > +    pushl    %esi
> > +    pushl    %edx
> > +    pushl    %ecx
> > +    pushl    %ebx
> > +
> > +    ENCODE_FRAME_POINTER
> > +
> > +    movl    %esp, %eax    # 1st argument: pt_regs
> > +
> > +    movl    17*4(%esp), %ebx    # func
> > +    CALL_NOSPEC %ebx
> > +
> > +    movl    PT_OLDESP(%esp), %eax
> > +
> > +    movl    PT_EIP(%esp), %ecx
> > +    movl    %ecx, -1*4(%eax)
> > +
> > +    movl    PT_EFLAGS(%esp), %ecx
> > +    movl    %ecx, -2*4(%eax)
> > +
> > +    movl    PT_EAX(%esp), %ecx
> > +    movl    %ecx, -3*4(%eax)
> > +
> > +    popl    %ebx
> > +    popl    %ecx
> > +    popl    %edx
> > +    popl    %esi
> > +    popl    %edi
> > +    popl    %ebp
> > +
> > +    lea    -3*4(%eax), %esp
> > +    popl    %eax
> > +    popfl
> > +    ret
> > +END(call_to_exception_trampoline)

> Potentially minor nit: you’re doing popfl, but you’re not doing
> TRACE_IRQ_whatever.  This makes me think that you should either add
> the tracing (ugh!) or you should maybe just skip the popfl.

Yeah, so we really should not change flags I suppose. If this lives I'll
remove the popfl.
