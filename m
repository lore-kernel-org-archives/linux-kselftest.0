From: peterz at infradead.org (Peter Zijlstra)
Date: Mon, 13 May 2019 10:15:03 +0200
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190511095655.405147cde331cd1da539d0e8@kernel.org>
References: <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
 <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>
 <20190509081431.GO2589@hirez.programming.kicks-ass.net>
 <20190509230106.3551b08553440d125e437f66@kernel.org>
 <20190509171416.GY2623@hirez.programming.kicks-ass.net>
 <20190510135831.c4ad309c68fc254f819194fc@kernel.org>
 <20190510124054.GV2589@hirez.programming.kicks-ass.net>
 <20190511095655.405147cde331cd1da539d0e8@kernel.org>
Message-ID: <20190513081503.GK2623@hirez.programming.kicks-ass.net>

On Sat, May 11, 2019 at 09:56:55AM +0900, Masami Hiramatsu wrote:
> On Fri, 10 May 2019 14:40:54 +0200
> Peter Zijlstra <peterz at infradead.org> wrote:
> 
> > On Fri, May 10, 2019 at 01:58:31PM +0900, Masami Hiramatsu wrote:
> > > On Thu, 9 May 2019 19:14:16 +0200
> > > Peter Zijlstra <peterz at infradead.org> wrote:
> > > > > > --- a/arch/x86/kernel/kprobes/core.c
> > > > > > +++ b/arch/x86/kernel/kprobes/core.c
> > > > > > @@ -731,29 +731,8 @@ asm(
> > > > > >  	".global kretprobe_trampoline\n"
> > > > > >  	".type kretprobe_trampoline, @function\n"
> > > > > >  	"kretprobe_trampoline:\n"
> > 
> > > > > Here, we need a gap for storing ret-ip, because kretprobe_trampoline is
> > > > > the address which is returned from the target function. We have no 
> > > > > "ret-ip" here at this point. So something like
> > > > > 
> > > > > +	"push $0\n"	/* This is a gap, will be filled with real return address*/
> > > > 
> > > > The trampoline already provides a gap, trampoline_handler() will need to
> > > > use int3_emulate_push() if it wants to inject something on the return
> > > > stack.
> > > 
> > > I guess you mean the int3 case. This trampoline is used as a return destination.
> > 
> > > When the target function is called, kretprobe interrupts the first instruction,
> > > and replace the return address with this trampoline. When a "ret" instruction
> > > is done, it returns to this trampoline. Thus the stack frame start with
> > > previous context here. As you described above,
> > 
> > I would prefer to change that to inject an extra return address, instead
> > of replacing it. With the new exception stuff we can actually do that.
> > 
> > So on entry we then go from:
> > 
> > 	<previous context>
> > 	RET-IP
> > 
> > to
> > 
> > 	<previous context>
> > 	RET-IP
> > 	return-trampoline
> > 
> > So when the function returns, it falls into the trampoline instead.
> 
> Is that really possible? On x86-64, most parameters are passed by registers,
> but x86-32 (and x86-64 in rare case) some parameters can be passed by stack.
> If we change the stack layout in the function prologue, the code in
> function body can not access those parameters on stack.

Ooh, I see what you mean... yes that might be trouble indeed. Damn..
