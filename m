From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Sat, 11 May 2019 09:52:54 +0900
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190510123131.GU2589@hirez.programming.kicks-ass.net>
References: <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
 <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>
 <20190509081431.GO2589@hirez.programming.kicks-ass.net>
 <20190509230106.3551b08553440d125e437f66@kernel.org>
 <20190509171416.GY2623@hirez.programming.kicks-ass.net>
 <20190510135831.c4ad309c68fc254f819194fc@kernel.org>
 <20190510123131.GU2589@hirez.programming.kicks-ass.net>
Message-ID: <20190511095254.21d41a8db0d66669d51144cc@kernel.org>

On Fri, 10 May 2019 14:31:31 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> On Fri, May 10, 2019 at 01:58:31PM +0900, Masami Hiramatsu wrote:
> > On Thu, 9 May 2019 19:14:16 +0200
> > Peter Zijlstra <peterz at infradead.org> wrote:
> 
> > > Ideally also the optimized kprobe trampoline, but I've not managed to
> > > fully comprehend that one.
> > 
> > As you pointed in other reply, save/restore can be a macro, but
> > each trampoline code is slightly different. Optprobe template has
> > below parts
> > 
> > (jumped from probed address)
> > [store regs]
> > [setup function arguments (pt_regs and probed address)]
> > [handler call]
> > [restore regs]
> > [execute copied instruction]
> 
>  instruction_s_ ?

Yes.

> 
> The JMP to this trampoline is likely 5 bytes and could have clobbered
> multiple instructions, we'd then have to place them all here, and
> 
> > [jump back to probed address]
> 
> jump to after whatever instructions were clobbered by the JMP.

Right!

> > Note that there is a limitation that if it is optiomized probe, user
> > handler can not change regs->ip. (we can not use "ret" after executed
> > a copied instruction, which must run on same stack)
> 
> Changing regs->ip in this case is going to be massively dodgy indeed :-)
> But so would changing much else; changing stack layout would also be
> somewhat tricky.

Yes, so the stack must be same after [restore regs].

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
