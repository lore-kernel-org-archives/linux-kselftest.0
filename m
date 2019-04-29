From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 29 Apr 2019 14:52:50 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
Message-ID: <20190429145250.1a5da6ed@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429185250.156aEHjmpJXnYOkHkNmY7ixYBtwrrvlmSDXIOj_90J0@z>

On Mon, 29 Apr 2019 11:06:58 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> +void replace_call(void *addr, const void *opcode, size_t len, void *target)
> +{
> +	bp_int3_call_target = target;
> +	bp_int3_call_return = addr + len;
> +	bp_int3_handler_irqoff = emulate_call_irqoff;
> +	text_poke_bp(addr, opcode, len, emulate_call_irqon);
> +}

Note, the function tracer does not use text poke. It does it in batch
mode. It can update over 40,000 calls in one go:

	add int3 breakpoint to all 40,000 call sites.
	sync()
	change the last four bytes of each of those call sites
	sync()
	remove int3 from the 40,000 call site with new call.

It's a bit more intrusive than the static call updates we were
discussing before.

-- Steve
