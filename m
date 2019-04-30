From: rostedt at goodmis.org (Steven Rostedt)
Date: Tue, 30 Apr 2019 10:36:29 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190430142047.GF2589@hirez.programming.kicks-ass.net>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <20190430104648.GR2623@hirez.programming.kicks-ass.net>
 <20190430094445.13e61f41@gandalf.local.home>
 <20190430142047.GF2589@hirez.programming.kicks-ass.net>
Message-ID: <20190430103629.0899b3a8@gandalf.local.home>

On Tue, 30 Apr 2019 16:20:47 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> > 
> > Sure, but that's a completely different issue. We would need to solve
> > the 'emulate' call for batch mode first.  
> 
> I don't see a problem there; when INT3 happens; you bsearch() the batch
> array to find the one you hit, you frob that into the percpu variables
> and do the thing. Or am I loosing the plot again?

I may need to tweak Linus's patch slightly, but I may be able to get it
to work with the batch mode.

-- Steve
