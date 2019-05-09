From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 9 May 2019 13:37:42 -0400
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190509081431.GO2589@hirez.programming.kicks-ass.net>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.721269814@infradead.org>
 <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
 <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>
 <20190509081431.GO2589@hirez.programming.kicks-ass.net>
Message-ID: <20190509173741.pfvecznqdndihxzg@home.goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190509173742.M0jml3B1qHTFKgFm5zlVmcOpIa_l7Ss8Fj9ZzbcucHM@z>

On Thu, May 09, 2019@10:14:31AM +0200, Peter Zijlstra wrote:
> 
> Right; I already fixed that in my patch changing i386's pt_regs.
> 
> But what I'd love to do is something like the belwo patch, and make all
> the trampolines (very much including ftrace) use that. Such that we then
> only have 1 copy of this magic (well, 2 because x86_64 also needs an
> implementation of this of course).
> 
> Changing ftrace over to this would be a little more work but it can
> easily chain things a little to get its original context back:
> 
> ENTRY(ftrace_regs_caller)
> GLOBAL(ftrace_regs_func)
> 	push ftrace_stub
> 	push ftrace_regs_handler

Note, ftrace_stub is dynamically modified to remove any indirect calls.

> 	jmp call_to_exception_trampoline
> END(ftrace_regs_caller)
> 
> typedef void (*ftrace_func_t)(unsigned long, unsigned long, struct ftrace_op *, struct pt_regs *);
> 
> struct ftrace_regs_stack {
> 	ftrace_func_t func;
> 	unsigned long parent_ip;
> };
> 
> void ftrace_regs_handler(struct pr_regs *regs)
> {
> 	struct ftrace_regs_stack *st = (void *)regs->sp;
> 	ftrace_func_t func = st->func;
> 
> 	regs->sp += sizeof(long); /* pop func */
> 
> 	func(regs->ip, st->parent_ip, function_trace_op, regs);

I try very hard to limit all indirect function calls from the function tracing
path, as they do add noticeable overhead.

-- Steve

> }
> 
> Hmm? I didn't look into the function_graph thing, but I imagine it can
> be added without too much pain.
> 
