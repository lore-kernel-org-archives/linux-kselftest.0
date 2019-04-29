From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 29 Apr 2019 16:30:43 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wgbC-wiSrdDYAh1ORF4EKmecY+MkNsJBF=BWf4W1bXXgA@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <CAHk-=wjm93jLtVxTX4HZs6K4k1Wqh3ujjmapqaYtcibVk_YnzQ@mail.gmail.com>
 <20190429150724.6e501d27@gandalf.local.home>
 <CAHk-=wgbC-wiSrdDYAh1ORF4EKmecY+MkNsJBF=BWf4W1bXXgA@mail.gmail.com>
Message-ID: <20190429163043.535f4272@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429203043.ue7FjF-fTnu2MG0dB1BiBWQ04INoeBI_DqnFkxl_nkM@z>

On Mon, 29 Apr 2019 13:06:17 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, Apr 29, 2019@12:07 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > Are you suggesting that I rewrite the code to do it one function at a
> > time? This has always been batch mode. This is not something new. The
> > function tracer has been around longer than the text poke code.  
> 
> Only do the 'call' instructions one at a time. Why would you change
> _existing_ code?

The function tracing is a call instruction.

On boot:

<function_X>:
	nop
	blah
	blah

After a callback to function tracing is called:

<function_X>
	call custom_trampoline
	blah
	blah


If we have two functions to that function added:

<function_X>
	call iterator_trampoline
	blah
	blah

The update from "call custom_trampoline" to "call iterator_trampoline"
is where we have an issue.

We could make this a special case where we do this one at a time, but
currently the code is all the same looking at tables to determine to
what to do. Which is one of three:

 1) change nop to call function
 2) change call function to nop
 3) update call function to another call function

#3 is where we have an issue. But if we want this to be different, we
would need to change the code significantly, and know that we are only
updating calls to calls. Which would take a bit of accounting to see if
that's the change that is being made.

This thread started about that #3 operation causing a call to be missed
because we turn it into a nop while we make the transition, where in
reality it needs to be a call to one of the two functions in the
transition.

-- Steve
