From: rostedt at goodmis.org (Steven Rostedt)
Date: Mon, 29 Apr 2019 18:07:33 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wjGquN7-kQCoa+LHCuiVTjefkk38qwaysd4wLLtoSZhpg@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <CAHk-=wjm93jLtVxTX4HZs6K4k1Wqh3ujjmapqaYtcibVk_YnzQ@mail.gmail.com>
 <20190429150724.6e501d27@gandalf.local.home>
 <CAHk-=wgbC-wiSrdDYAh1ORF4EKmecY+MkNsJBF=BWf4W1bXXgA@mail.gmail.com>
 <20190429163043.535f4272@gandalf.local.home>
 <CAHk-=wjGquN7-kQCoa+LHCuiVTjefkk38qwaysd4wLLtoSZhpg@mail.gmail.com>
Message-ID: <20190429180733.3f25d8b9@gandalf.local.home>

On Mon, 29 Apr 2019 14:38:35 -0700
Linus Torvalds <torvalds at linux-foundation.org> wrote:

> On Mon, Apr 29, 2019 at 1:30 PM Steven Rostedt <rostedt at goodmis.org> wrote:
> >
> > The update from "call custom_trampoline" to "call iterator_trampoline"
> > is where we have an issue.  
> 
> So it has never worked. Just tell people that they have two chocies:

The custom call to iterator translation never worked. One option is to
always call the iterator, and just take the hit. There's another
solution to to make permanent updates that would handle the live
patching case, but not for the tracing case. It is more critical for
live patching than tracing (missed traced function is not as critical
as running buggy code unexpectedly). I could look to work on that
instead.

> 
>  - you do the careful rewriting, which takes more time

Which would be the method I said making the call to call a special case.

> 
>  - you do it by rewriting as nop and then back, which is what
> historically has been done, and that is fast and simple, because
> there's no need to be careful.

Except in the live kernel patching case where you just put back the
buggy function.

> 
> Really. I find your complaints completely incomprehensible. You've
> never rewritten call instructions atomically before, and now you
> complain about it being slightly more expensive to do it when I give
> you the code? Yes it damn well will be slightly more expensive. Deal
> with it.

I wasn't complaining about the expense of doing it that way. I was
stating that it would take more time to get it right as it as it would
require a different implementation for the call to call case.


> 
> Btw, once again - I several months ago also gave a suggestion on how
> it could be done batch-mode by having lots of those small stubs and
> just generating them dynamically.
> 
> You never wrote that code *EITHER*. It's been *months*.

Note, I wasn't the one writing the code back then either. I posted a
proof of concept for a similar topic (trace events) for the purpose of
bringing back the performance lost due to the retpolines (something
like 8% hit). Josh took the initiative to do that work, but I don't
remember ever getting to a consensus on a solution to that. Yes you had
given us ideas, but I remember people (like Andy) having concerns with
it. But because it was just an optimization change, and Josh had other
things to work on, that work just stalled.

But I just found out that the function tracing code has the same issue,
but this can cause real problems with live kernel patching. This is why
this patch set started.

> 
> So now I've written the non-batch-mode code for you, and you just
> *complain* about it?

Because this is a different story. The trace event code is updated one
at a time (there's patches out there to do it in batch). But this is
not trace events. This is function tracing which only does batching.


> 
> I'm done with this discussion. I'm totally fed up.
> 

Note, I wasn't writing this code anyway as I didn't have the time to. I
was helping others who took the initiative to do this work. But I guess
they didn't have time to move it forward either.

For the live kernel patching case, I'll start working on the permanent
changes, where once a function entry is changed, it can never be put
back. Then we wont have an issue with the live kernel patching case,
but only for tracing. But the worse thing there is you miss tracing
functions while an update is being made.

If Nicolai has time, perhaps he can try out the method you suggest and
see if we can move this forward.

-- Steve
