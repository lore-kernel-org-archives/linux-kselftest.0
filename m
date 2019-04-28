From: rostedt at goodmis.org (Steven Rostedt)
Date: Sun, 28 Apr 2019 13:51:43 -0400
Subject: [PATCH 1/4] x86/thread_info: introduce ->ftrace_int3_stack member
In-Reply-To: <F6268634-96D3-4267-B739-6D375FAB26A8@amacapital.net>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-2-nstange@suse.de>
 <F6268634-96D3-4267-B739-6D375FAB26A8@amacapital.net>
Message-ID: <20190428135143.09d35bb6@oasis.local.home>

On Sun, 28 Apr 2019 10:41:10 -0700
Andy Lutomirski <luto at amacapital.net> wrote:


> > Note that at any given point
> > in time, there can be at most four such call insn emulations pending:
> > namely at most one per "process", "irq", "softirq" and "nmi" context.
> >   
> 
> That’s quite an assumption. I think your list should also contain
> exception, exceptions nested inside that exception, and machine
> check, at the very least.  I’m also wondering why irq and softirq are
> treated separately.

4 has usually been the context count we choose. But I guess in theory,
if we get exceptions then I could potentially be more.

As for irq vs softirq, an interrupt can preempt a softirq. Interrupts
are enabled while softirqs are running. When sofirqs run, softirqs are
disabled to prevent nested softirqs. But interrupts are enabled again,
and another interrupt may come in while a softirq is executing.

> 
> All this makes me think that one of the other solutions we came up
> with last time we discussed this might be better.

+100

Perhaps adding another slot into pt_regs that gets used by int3 to
store a slot to emulate a call on return?

-- Steve
