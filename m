From: peterz at infradead.org (Peter Zijlstra)
Date: Wed, 1 May 2019 21:03:48 +0200
Subject: [RFC][PATCH] ftrace/x86: Emulate call function while updating in
 breakpoint handler
In-Reply-To: <20190501145824.08aed43a@gandalf.local.home>
References: <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <CAHk-=wjJ8D74+FDcXGL65Q9aB0cc7B4vr2s2rS6V4d4a3hU-1Q@mail.gmail.com>
 <20190501131117.GW2623@hirez.programming.kicks-ass.net>
 <20190501145824.08aed43a@gandalf.local.home>
Message-ID: <20190501190348.GT7905@worktop.programming.kicks-ass.net>

On Wed, May 01, 2019 at 02:58:24PM -0400, Steven Rostedt wrote:
> > +	if (ftrace_location(ip)) {
> > +		int3_emulate_call(regs, ftrace_update_func_call);
> 
> Should be:
> 
> 		int3_emulate_call(regs, (unsigned long)ftrace_regs_caller);

Ah, I lost the plot a little there.

> > +		return 1;
> > +	} else if (is_ftrace_caller(ip)) {
> > +		if (!ftrace_update_func_call) {
> > +			int3_emulate_jmp(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);
> 
> I see what you did here, but I think:
> 
> 			int3_emulate_jmp(regs, ip + CALL_INSN_SIZE);
> 
> looks better. But that said, we could in the beginning do:
> 
> 	ip = regs->ip - INT3_INSN_SIZE;
> 
> instead of
> 
> 	ip = regs->ip - 1;
> 
> I made these updates and posted them to Linus.

I was actually considering:

static inline void int3_emulate_nop(struct pt_regs *regs, unsigned long size)
{
	int3_emulate_jmp(regs, regs->ip - INT3_INSN_SIZE + size);
}

And then the above becomes:

	int3_emulate_nop(regs, CALL_INSN_SIZE);

Hmm?
