From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 30 Apr 2019 09:44:45 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190430104648.GR2623@hirez.programming.kicks-ass.net>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <20190430104648.GR2623@hirez.programming.kicks-ass.net>
Message-ID: <20190430094445.13e61f41@gandalf.local.home>

On Tue, 30 Apr 2019 12:46:48 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> On Mon, Apr 29, 2019 at 02:52:50PM -0400, Steven Rostedt wrote:
> > On Mon, 29 Apr 2019 11:06:58 -0700
> > Linus Torvalds <torvalds at linux-foundation.org> wrote:
> >   
> > > +void replace_call(void *addr, const void *opcode, size_t len, void *target)
> > > +{
> > > +	bp_int3_call_target = target;
> > > +	bp_int3_call_return = addr + len;
> > > +	bp_int3_handler_irqoff = emulate_call_irqoff;
> > > +	text_poke_bp(addr, opcode, len, emulate_call_irqon);
> > > +}  
> > 
> > Note, the function tracer does not use text poke. It does it in batch
> > mode. It can update over 40,000 calls in one go:  
> 
> Note that Daniel is adding batch stuff to text_poke(), because
> jump_label/static_key stuffs also end up wanting to change more than one
> site at a time and IPI spraying the machine for every single instance is
> hurting.
> 
> So ideally ftrace would start to use the 'normal' code when that
> happens.

Sure, but that's a completely different issue. We would need to solve
the 'emulate' call for batch mode first.

-- Steve
