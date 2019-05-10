From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Fri, 10 May 2019 12:21:03 +0900
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190509174316.pzuakeu657g3fnlm@home.goodmis.org>
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
 <20190509174316.pzuakeu657g3fnlm@home.goodmis.org>
Message-ID: <20190510122103.5a7bc5416b7af96b27d4fab4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190510032103.5l2pplOV1fxGiMqlEQQUvJcYOvEpYDYmqBbyPkina6Y@z>

On Thu, 9 May 2019 13:43:16 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Thu, May 09, 2019@09:20:06AM -0700, Andy Lutomirski wrote:
> > > +END(call_to_exception_trampoline)
> > > --- a/arch/x86/kernel/kprobes/core.c
> > > +++ b/arch/x86/kernel/kprobes/core.c
> > > @@ -731,29 +731,8 @@ asm(
> > >    ".global kretprobe_trampoline\n"
> > >    ".type kretprobe_trampoline, @function\n"
> > >    "kretprobe_trampoline:\n"
> > > -    /* We don't bother saving the ss register */
> > > -#ifdef CONFIG_X86_64
> > > -    "    pushq %rsp\n"
> > > -    "    pushfq\n"
> > > -    SAVE_REGS_STRING
> > > -    "    movq %rsp, %rdi\n"
> > > -    "    call trampoline_handler\n"
> > > -    /* Replace saved sp with true return address. */
> > > -    "    movq %rax, 19*8(%rsp)\n"
> > > -    RESTORE_REGS_STRING
> > > -    "    popfq\n"
> > > -#else
> > > -    "    pushl %esp\n"
> > > -    "    pushfl\n"
> > > -    SAVE_REGS_STRING
> > > -    "    movl %esp, %eax\n"
> > > -    "    call trampoline_handler\n"
> > > -    /* Replace saved sp with true return address. */
> > > -    "    movl %eax, 15*4(%esp)\n"
> > > -    RESTORE_REGS_STRING
> > > -    "    popfl\n"
> > > -#endif
> > > -    "    ret\n"
> > > +    "push trampoline_handler\n"
> > > +    "jmp call_to_exception_trampoline\n"
> > >    ".size kretprobe_trampoline, .-kretprobe_trampoline\n"
> > > );
> > 
> > 
> > Potentially minor nit: you’re doing popfl, but you’re not doing TRACE_IRQ_whatever.  This makes me think that you should either add the tracing (ugh!) or you should maybe just skip the popfl.
> 
> 
> Note, kprobes (and ftrace for that matter) are not saving flags for
> interrupts, but because it must not modify the sign, zero and carry flags.

Yes, optprobe also has to save and restore the flags.
Above trampline is for kretprobe, which is placed at the function return, so
we don't have to care about flags.

Thanks,
-- 
Masami Hiramatsu <mhiramat at kernel.org>
