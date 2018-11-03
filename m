From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Sat, 3 Nov 2018 22:23:29 +0900
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102091658.1bc979a4@gandalf.local.home>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
Message-ID: <20181103222329.4e2a4188d297724cbb4c9883@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181103132329.bWARN0YC4eNel7VybnwZOHCcIPE4C29EKFQbdqXBHlA@z>

On Fri, 2 Nov 2018 09:16:58 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 2 Nov 2018 17:59:32 +1100
> Aleksa Sarai <cyphar@cyphar.com> wrote:
> 
> > As an aside, I just tested with the frame unwinder and it isn't thrown
> > off-course by kretprobe_trampoline (though obviously the stack is still
> > wrong). So I think we just need to hook into the ORC unwinder to get it
> > to continue skipping up the stack, as well as add the rewriting code for
> > the stack traces (for all unwinders I guess -- though ideally we should
> 
> I agree that this is the right solution.
> 
> > do this without having to add the same code to every architecture).
> 
> True, and there's an art to consolidating the code between
> architectures.
> 
> I'm currently looking at function graph and seeing if I can consolidate
> it too. And I'm also trying to get multiple uses to hook into its
> infrastructure. I think I finally figured out a way to do so.

For supporting multiple users without any memory allocation, I think
each user should consume the shadow stack and store on it.
My old generic retstack implementation did that.

https://github.com/mhiramat/linux/commit/8804f76580cd863d555854b41b9c6df719f8087e

I hope this may give you any insites.
My idea is to generalize shadow stack, not func graph tracer, since
I don't like making kretprobe depends on func graph tracer, but only
the shadow stack.

> 
> The reason it is difficult, is that you need to maintain state between
> the entry of a function and the exit for each task and callback that is
> registered. Hence, it's a 3x tuple (function stack, task, callbacks).
> And this must be maintained with preemption. A task may sleep for
> minutes, and the state needs to be retained.

Would you mean preeempt_disable()? Anyway, we just need to increment index
atomically, don't we?

> The only state that must be retained is the function stack with the
> task, because if that gets out of sync, the system crashes. But the
> callback state can be removed.
> 
> Here's what is there now:
> 
>  When something is registered with the function graph tracer, every
>  task gets a shadowed stack. A hook is added to fork to add shadow
>  stacks to new tasks. Once a shadow stack is added to a task, that
>  shadow stack is never removed until the task exits.
> 
>  When the function is entered, the real return code is stored in the
>  shadow stack and the trampoline address is put in its place.
> 
>  On return, the trampoline is called, and it will pop off the return
>  code from the shadow stack and return to that.
> 
> The issue with multiple users, is that different users may want to
> trace different functions. On entry, the user could say it doesn't want
> to trace the current function, and the return part must not be called
> on exit. Keeping track of which user needs the return called is the
> tricky part.

So that I think only the "shadow stack" part should be generalized.

> 
> Here's what I plan on implementing:
> 
>  Along with a shadow stack, I was going to add a 4096 byte (one page)
>  array that holds 64 8 byte masks to every task as well. This will allow
>  64 simultaneous users (which is rather extreme). If we need to support
>  more, we could allocate another page for all tasks. The 8 byte mask
>  will represent each depth (allowing to do this for 64 function call
>  stack depth, which should also be enough).
> 
>  Each user will be assigned one of the masks. Each bit in the mask
>  represents the depth of the shadow stack. When a function is called,
>  each user registered with the function graph tracer will get called
>  (if they asked to be called for this function, via the ftrace_ops
>  hashes) and if they want to trace the function, then the bit is set in
>  the mask for that stack depth.
> 
>  When the function exits the function and we pop off the return code
>  from the shadow stack, we then look at all the bits set for the
>  corresponding users, and call their return callbacks, and ignore
>  anything that is not set.
> 

It sounds too complicated... why we don't just open the shadow stack for
each user? Of course it may requires a bit "repeat" unwind on the shadow
stack, but it is simple.

Thank you,

> When a user is unregistered, it the corresponding bits that represent
> it are cleared, and it the return callback will not be called. But the
> tasks being traced will still have their shadow stack to allow it to
> get back to normal.
> 
> I'll hopefully have a prototype ready by plumbers.
> 
> And this too will require each architecture to probably change. As a
> side project to this, I'm going to try to consolidate the function
> graph code among all the architectures as well. Not an easy task.
> 
> -- Steve


-- 
Masami Hiramatsu <mhiramat at kernel.org>
