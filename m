From: cyphar@cyphar.com (Aleksa Sarai)
Date: Thu, 8 Nov 2018 18:46:12 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181106171501.59ccabbc@gandalf.local.home>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181103070253.ajrqzs5xu2vf5stu@yavin>
 <20181104115913.74l4yzecisvtt2j5@yavin>
 <20181106171501.59ccabbc@gandalf.local.home>
Message-ID: <20181108074612.ldy6rozdpsdps6bf@yavin>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108074612.z3YqD7MsbKf7vwF28o-LXEDbN6fEWTfRK2j6TTrVWR4@z>

On 2018-11-06, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Sun, 4 Nov 2018 22:59:13 +1100
> Aleksa Sarai <cyphar@cyphar.com> wrote:
> 
> > The same issue is present in __save_stack_trace
> > (arch/x86/kernel/stacktrace.c). This is likely the only reason that --
> > as Steven said -- stacktraces wouldn't work with ftrace-graph (and thus
> > with the refactor both of you are discussing).
> 
> By the way, I was playing with the the orc unwinder and stack traces
> from the function graph tracer return code, and got it working with the
> below patch. Caution, that patch also has a stack trace hardcoded in
> the return path of the function graph tracer, so you don't want to run
> function graph tracing without filtering.

Neat!

> diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
> index 169b3c44ee97..aaeca73218cc 100644
> --- a/kernel/trace/trace_functions_graph.c
> +++ b/kernel/trace/trace_functions_graph.c
> @@ -242,13 +242,16 @@ ftrace_pop_return_trace(struct ftrace_graph_ret *trace, unsigned long *ret,
>  	trace->calltime = current->ret_stack[index].calltime;
>  	trace->overrun = atomic_read(&current->trace_overrun);
>  	trace->depth = index;
> +
> +	trace_dump_stack(0);

Right, this works because save_stack is not being passed a pt_regs. But if
you pass a pt_regs (as happens with bpf_getstackid -- which is what
spawned this discussion) then the top-most entry of the stack will still
be a trampoline because there is no ftrace_graph_ret_addr call.

(I'm struggling with how to fix this -- I can't figure out what retp
should be if you have a pt_regs. ->sp doesn't appear to work -- it's off
by a few bytes.)

I will attach what I have at the moment to hopefully explain what the
issue I've found is (re-using the kretprobe architecture but with the
shadow-stack idea).

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181108/fa93e719/attachment.sig>
