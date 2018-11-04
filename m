From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Sun, 4 Nov 2018 11:25:06 +0900
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181103133021.6676708c@vmware.local.home>
References: <20181101083551.3805-1-cyphar@cyphar.com>
 <20181101083551.3805-2-cyphar@cyphar.com>
 <20181101204720.6ed3fe37@vmware.local.home>
 <20181102050509.tw3dhvj5urudvtjl@yavin>
 <20181102065932.bdt4pubbrkvql4mp@yavin>
 <20181102091658.1bc979a4@gandalf.local.home>
 <20181102154325.bt6xoysl4xdl33wd@treble>
 <20181102121307.32e99414@gandalf.local.home>
 <20181103220012.55ecd97e671c43e4959c8b62@kernel.org>
 <20181103091341.3d32683e@vmware.local.home>
 <20181104013430.9d3e91b8ebbae7dcb6860ef1@kernel.org>
 <20181103133021.6676708c@vmware.local.home>
Message-ID: <20181104112506.77464e6750a1517865a29c9f@kernel.org>

On Sat, 3 Nov 2018 13:30:21 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Sun, 4 Nov 2018 01:34:30 +0900
> Masami Hiramatsu <mhiramat at kernel.org> wrote:
> > 
> > > I was thinking of a bitmask that represents the handlers, and use that
> > > to map which handler gets called for which shadow entry for a
> > > particular task.  
> > 
> > Hmm, I doubt that is too complicated and not scalable. I rather like to see
> > the open shadow entry...
> 
> It can scale and not too complex (I already played a little with it).
> But that said, I'm not committed to it, and using the shadow stack is
> also an interesting idea.
> 
> > 
> > entry: [[original_retaddr][function][modified_retaddr]]
> > 
> > So if there are many users on same function, the entries will be like this 
> > 
> > [[original_return_address][function][trampoline_A]]
> > [[trampline_A][function][trampoline_B]]
> > [[trampline_B][function][trampoline_C]]
> > 
> > And on the top of the stack, there is trampline_C instead of original_return_address.
> > In this case, return to trampoline_C(), it jumps back to trampline_B() and then
> > it jumps back to trampline_A(). And eventually it jumps back to
> > original_return_address.
> 
> Where are trampolines A, B, and C made? Do we also need to dynamically
> create them? If I register multiple function tracing ones, each one
> will need its own trampoline?
> 

No, I think tramplines are very limited. currently we will only have ftrace
and kretprobe trampolines.


> > This way, we don't need allocate another bitmap/pages for the shadow stack.
> > We only need a shadow stack for each task.
> > Also, unwinder can easily find the trampline_C from the shadow stack and restores
> > original_return_address. (of course trampline_A,B,C must be registered so that
> > search function can skip it.)
> 
> What I was thinking was to store a count and the functions to be called:
> 
> 
> 	[original_return_address]
> 	[function_A]
> 	[function_B]
> 	[function_C]
> 	[ 3 ]
> 
> Then the trampoline that processes the return codes for ftrace (and
> kretprobes and everyone else) can simply do:
> 
> 	count = pop_shadow_stack();
> 	for (i = 0; i < count; i++) {
> 		func = pop_shadow_stack();
> 		func(...);
> 	}
> 	return_address = pop_shadow_stack();

Ah, that's a good idea. I think we also have to store the called function
entry address with the number header, but basically I agree with you.

If we have a space to store a data with the function address, that is also
good to kretprobe. systemtap heavily uses "entry data" for saving some data
at function entry for exit handler.

> That way we only need to register a function to the return handler and
> it will be called, without worrying about making trampolines. There
> will just be a single trampoline that handles all the work.

OK, and could you make it independent from func graph tracer, so that
CONFIG_KPROBES=y but CONFIG_FUNCTION_GRAPH_TRACER=n kernel can support
kretprobes too.

Thank you,


-- 
Masami Hiramatsu <mhiramat at kernel.org>
