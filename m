From: cyphar@cyphar.com (Aleksa Sarai)
Date: Sun, 4 Nov 2018 22:59:13 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181103070253.ajrqzs5xu2vf5stu@yavin>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181103070253.ajrqzs5xu2vf5stu@yavin>
Message-ID: <20181104115913.74l4yzecisvtt2j5@yavin>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181104115913.pjLo5YMOOm_IszG33aof67fIBoDa-ZtPDik1lPdjAVg@z>

On 2018-11-03, Aleksa Sarai <cyphar@cyphar.com> wrote:
> This is actually a general bug in ftrace as well, because (for
> instance) while the unwinder calls into ftrace_graph_ret_addr() while
> walking up the stack this isn't used to correct regs->ip in
> perf_callchain_kernel(). I think this is the cause of the bug in
> ftrace-graph (if you switch to the "frame" unwinder you might be able
> to see it more clearly) -- but when trying to fix it I'm having
> trouble figuring out what retp should be (stack_addr(regs) doesn't
> give the right result for some reason).

@Steven, @Masami: Can you verify whether this is an actual bug? The
snippet is like (arch/x86/events/core.c):

  void
  perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
  {
    /* ... */
	if (perf_callchain_store(entry, regs->ip))
		return;
	/* rest of unwind code */
  }

And it seems to me that there's an ftrace_graph_ret_addr missing here
(though I was having trouble figuring out what the right retp would be
in this context -- both stack_addr(regs) and &regs->sp appear to be
wrong when I was trying to get this to work with kretprobes -- while my
patch worked with all other kretprobe_trampoline cases in the unwinder).

The same issue is present in __save_stack_trace
(arch/x86/kernel/stacktrace.c). This is likely the only reason that --
as Steven said -- stacktraces wouldn't work with ftrace-graph (and thus
with the refactor both of you are discussing).

Thanks.

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181104/9a4eaf00/attachment.sig>
