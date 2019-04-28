From: luto@amacapital.net (Andy Lutomirski)
Date: Sun, 28 Apr 2019 10:41:10 -0700
Subject: [PATCH 1/4] x86/thread_info: introduce ->ftrace_int3_stack member
In-Reply-To: <20190427100639.15074-2-nstange@suse.de>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-2-nstange@suse.de>
Message-ID: <F6268634-96D3-4267-B739-6D375FAB26A8@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190428174110.vj9e5wf0m5_CVRs658OZUjNiM8s2HC8lh5lOzzkO4KE@z>


> On Apr 27, 2019,@3:06 AM, Nicolai Stange <nstange@suse.de> wrote:
> 
> Before actually rewriting an insn, x86' DYNAMIC_FTRACE  implementation
> places an int3 breakpoint on it. Currently, ftrace_int3_handler() simply
> treats the insn in question as nop and advances %rip past it.

How does this not crash all the time?

> An upcoming
> patch will improve this by making the int3 trap handler emulate the call
> insn. To this end, ftrace_int3_handler() will be made to change its iret
> frame's ->ip to some stub which will then mimic the function call in the
> original context.
> 
> Somehow the trapping ->ip address will have to get communicated from
> ftrace_int3_handler() to these stubs though.

Cute.  But this should get “ftrace” removed from the name, since it’s potentially more generally useful.  Josh wanted something like this for static_call.

> Note that at any given point
> in time, there can be at most four such call insn emulations pending:
> namely at most one per "process", "irq", "softirq" and "nmi" context.
> 

That’s quite an assumption. I think your list should also contain exception, exceptions nested inside that exception, and machine check, at the very least.  I’m also wondering why irq and softirq are treated separately.

All this makes me think that one of the other solutions we came up with last time we discussed this might be better.
