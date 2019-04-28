From: rostedt at goodmis.org (Steven Rostedt)
Date: Sun, 28 Apr 2019 13:38:26 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190427102657.GF2623@hirez.programming.kicks-ass.net>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
Message-ID: <20190428133826.3e142cfd@oasis.local.home>


[ Added Linus ]

On Sat, 27 Apr 2019 12:26:57 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> On Sat, Apr 27, 2019 at 12:06:38PM +0200, Nicolai Stange wrote:
> > ftrace_int3_handler()'s context is different from the interrupted call
> > instruction's one, obviously. In order to be able to emulate the call
> > within the original context, make ftrace_int3_handler() set its iret
> > frame's ->ip to some helper stub. Upon return from the trap, this stub will
> > then mimic the call by pushing the the return address onto the stack and
> > issuing a jmp to the target address. As describe above, the jmp target
> > will be either of ftrace_ops_list_func() or ftrace_regs_caller(). Provide
> > one such stub implementation for each of the two cases.  
> 
> Yuck; I'd much rather we get that static_call() stuff sorted such that
> text_poke() and poke_int3_handler() can do CALL emulation.
> 
> Given all the back and forth, I think the solution where we shift
> pt_regs a bit to allow the emulated PUSH is a viable solution; eg. I
> think we collectively hated it least.

Note, this use case is slightly different than the static calls but has
the same issue.  That issue is that we need a way to simulate a "call"
function from int3, and there's no good way to handle that case right
now.

The static call needs to modify the call sight but make the call still
work from int3 context.

This use case is similar, but the issue is with a "bug" in the function
tracing implementation, that has become an issue with live kernel
patching which is built on top of it.

The issue is this:

For optimization reasons, if there's only a single user of a function
it gets its own trampoline that sets up the call to its callback and
calls that callback directly:


<function being traced>
  call custom trampoline


<custom trampoline>
   save regs to call C code
   call custom_callback
   restore regs
   ret

If more than one callback is attached to that function, then we need to
call the iterator that loops through all registered callbacks of the
function tracer and checks their hashes to see if they want to trace
this function or not.

<function being traced>
  call iterator_trampoline

<iterator_trampoline>
  save regs to call C code
  call iterator
  restore regs
  ret

What happens in that transition? We add an "int3" at the function being
traced, and change:

  call custom_trampoline

to

  call iterator_trampoline

But if the function being traced is executed during this transition,
the int3 just makes it act like a nop and returns pass the call.

For tracing this is a bug because we just missed a function that should
be traced. For live kernel patching, this could be more devastating
because the original "buggy" patched function is called, and this could
cause subtle problems.

If we can add a slot to the int3 handler, that we can use to emulate a
call, (perhaps add another slot to pt_regs structure, call it link
register)

It would make it easier to solve both this and the static call problems.

-- Steve
