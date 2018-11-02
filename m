From: cyphar at cyphar.com (Aleksa Sarai)
Date: Fri, 2 Nov 2018 16:05:09 +1100
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181101204720.6ed3fe37@vmware.local.home>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
Message-ID: <20181102050509.tw3dhvj5urudvtjl@yavin>

On 2018-11-01, Steven Rostedt <rostedt at goodmis.org> wrote:
> On Thu,  1 Nov 2018 19:35:50 +1100
> Aleksa Sarai <cyphar at cyphar.com> wrote:
> > @@ -1834,6 +1853,11 @@ static int pre_handler_kretprobe(struct kprobe *p, struct pt_regs *regs)
> >  		ri->rp = rp;
> >  		ri->task = current;
> >  
> > +		trace.entries = &ri->entry.entries[0];
> > +		trace.max_entries = KRETPROBE_TRACE_SIZE;
> > +		save_stack_trace_regs(regs, &trace);
> > +		ri->entry.nr_entries = trace.nr_entries;
> > +
> 
> So basically your saving a copy of the stack trace for each probe, for
> something that may not ever be used?
> 
> This adds quite a lot of overhead for something not used often.
> 
> I think the real answer is to fix kretprobes (and I just checked, the
> return call of function graph tracer stack trace doesn't go past the
> return_to_handler function either. It's just that a stack trace was
> never done on the return side).
> 
> The more I look at this patch, the less I like it.

That's more than fair.

There's also an issue that Masami noted -- nested kretprobes don't give
you the full stack trace with this solution since the stack was already
overwritten. I think that the only real option is to fix the unwinder to
work in a kretprobe context -- which is what I'm looking at now.

Unfortunately, I'm having a lot of trouble understanding how the current
ftrace hooking works -- ORC has a couple of ftrace hooks that seem
reasonable on the surface but I don't understand (for instance) how
HAVE_FUNCTION_GRAPH_RET_ADDR_PTR *actually* works. Though your comment
appears to indicate that it doesn't work for stack traces?

For kretprobes I think it would be fairly easy to reconstruct what
landed you into a kretprobe_trampoline by walking the set of
kretprobe_instances (since all new ones are added to the head, you can
get the real return address in-order).

But I still have to figure out what is actually stopping the
save_stack_trace() unwinder that isn't stopping the show_stacks()
unwinder (though the show_stacks() code is more ... liberal with the
degree of certainty it has about the unwind).

Am I barking up the wrong tree?

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
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181102/da830d68/attachment.sig>
