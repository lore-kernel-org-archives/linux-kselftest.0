From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 1 May 2019 20:57:26 +0200
Subject: [RFC][PATCH v3] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
References: <20190501113238.0ab3f9dd@gandalf.local.home>
 <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
Message-ID: <20190501185726.GR7905@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501185726.VCRmZ7evLLjbPL_XVQfQOm6xxtETizz5kl7aMDrAh_I@z>

On Wed, May 01, 2019@11:01:07AM -0700, Linus Torvalds wrote:
> This looks sane to me, although I'm surprised that we didn't already
> have an annotation for the nonstandard stack frame for asm files. That
> probably would be cleaner in a separate commit, but I guess it doesn't
> matter.
> 
> Anyway, I'm willing to consider the entry code version if it looks a
> _lot_ simpler than this (so I'd like to see them side-by-side), but
> it's not like this looks all that complicated to me either.

So I posted one earlier today:

  https://lkml.kernel.org/r/20190501131117.GW2623 at hirez.programming.kicks-ass.net

it's about a 1/3rd the number of lines and has 32bit support. It also
provides all the bits required to implement static_call().

That is; I think I'm firmly in favour of the entry variant -- provided
it actually works of course.
