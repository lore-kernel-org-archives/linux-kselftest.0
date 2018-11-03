From: rostedt@goodmis.org (Steven Rostedt)
Date: Sat, 3 Nov 2018 13:33:29 -0400
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
Message-ID: <20181103133329.2160bfd7@vmware.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181103173329.Hi-cMIEm2d1ac4_R-tSn9_8Dqp0hBhPyTC4IxwBMxE0@z>

On Sat, 3 Nov 2018 13:30:21 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

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
> 
> That way we only need to register a function to the return handler and
> it will be called, without worrying about making trampolines. There
> will just be a single trampoline that handles all the work.

And since the most common case is a single function to call, instead of
using a count, we can take advantage that kernel functions are negative
numbers and do:

	[original_return_address]
	[function_A]

	----

	long count;

	count = pop_shadow_stack();
	if (count < 0) {
		func = (void *)count;
		func();
	} else {
		for (i = 0; i < count; i++) {
			[...]

The unwinder will just need to know how to handle all this :-)

-- Steve
