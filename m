From: cyphar at cyphar.com (Aleksa Sarai)
Date: Sat, 3 Nov 2018 18:02:53 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181102091658.1bc979a4@gandalf.local.home>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
Message-ID: <20181103070253.ajrqzs5xu2vf5stu@yavin>

On 2018-11-02, Steven Rostedt <rostedt at goodmis.org> wrote:
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
> 
> The reason it is difficult, is that you need to maintain state between
> the entry of a function and the exit for each task and callback that is
> registered. Hence, it's a 3x tuple (function stack, task, callbacks).
> And this must be maintained with preemption. A task may sleep for
> minutes, and the state needs to be retained.
> 
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

I was playing with a toy version of this using the existing kretprobe
architecture (by borrowing the shadow stack concept of storing the
stack_addr() -- though it's actually stored inside the existing
kretprobe_instance and thus doesn't need separate push-pop code).

The rewriting of kretprobe_trampoline in the stack unwinder *works* on
x86 now except for the regs handling (the current function is still
incorrectly shown as kretprobe_trampoline). This is actually a general
bug in ftrace as well, because (for instance) while the unwinder calls
into ftrace_graph_ret_addr() while walking up the stack this isn't used
to correct regs->ip in perf_callchain_kernel(). I think this is the
cause of the bug in ftrace-graph (if you switch to the "frame" unwinder
you might be able to see it more clearly) -- but when trying to fix it
I'm having trouble figuring out what retp should be (stack_addr(regs)
doesn't give the right result for some reason).

I will try to fix it up and attach it, but if you're already working on
a prototype the unifies all the users that works too. The patch I have
at the moment duplicates each of the key ftrace_graph_return_addr
invocations with a matching kretprobe_return_addr (though there's only
three of these).

-- 
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181103/56058ea4/attachment.sig>
