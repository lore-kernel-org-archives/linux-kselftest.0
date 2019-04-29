From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 14:38:35 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190429163043.535f4272@gandalf.local.home>
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
Message-ID:
 <CAHk-=wjGquN7-kQCoa+LHCuiVTjefkk38qwaysd4wLLtoSZhpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429213835.H9RI3lHuBtYjnsymiZig7UigarAm-8vlXky08Yno_RU@z>

On Mon, Apr 29, 2019@1:30 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> The update from "call custom_trampoline" to "call iterator_trampoline"
> is where we have an issue.

So it has never worked. Just tell people that they have two chocies:

 - you do the careful rewriting, which takes more time

 - you do it by rewriting as nop and then back, which is what
historically has been done, and that is fast and simple, because
there's no need to be careful.

Really. I find your complaints completely incomprehensible. You've
never rewritten call instructions atomically before, and now you
complain about it being slightly more expensive to do it when I give
you the code? Yes it damn well will be slightly more expensive. Deal
with it.

Btw, once again - I several months ago also gave a suggestion on how
it could be done batch-mode by having lots of those small stubs and
just generating them dynamically.

You never wrote that code *EITHER*. It's been *months*.

So now I've written the non-batch-mode code for you, and you just
*complain* about it?

I'm done with this discussion. I'm totally fed up.

                 Linus
