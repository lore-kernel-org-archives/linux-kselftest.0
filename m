From: peterz at infradead.org (Peter Zijlstra)
Date: Sat, 27 Apr 2019 12:26:57 +0200
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190427100639.15074-4-nstange@suse.de>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
Message-ID: <20190427102657.GF2623@hirez.programming.kicks-ass.net>

On Sat, Apr 27, 2019 at 12:06:38PM +0200, Nicolai Stange wrote:
> ftrace_int3_handler()'s context is different from the interrupted call
> instruction's one, obviously. In order to be able to emulate the call
> within the original context, make ftrace_int3_handler() set its iret
> frame's ->ip to some helper stub. Upon return from the trap, this stub will
> then mimic the call by pushing the the return address onto the stack and
> issuing a jmp to the target address. As describe above, the jmp target
> will be either of ftrace_ops_list_func() or ftrace_regs_caller(). Provide
> one such stub implementation for each of the two cases.

Yuck; I'd much rather we get that static_call() stuff sorted such that
text_poke() and poke_int3_handler() can do CALL emulation.

Given all the back and forth, I think the solution where we shift
pt_regs a bit to allow the emulated PUSH is a viable solution; eg. I
think we collectively hated it least.
