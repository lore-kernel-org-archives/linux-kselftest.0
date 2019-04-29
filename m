From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 13:20:05 -0700
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
Message-ID: <CAHk-=wiMG95TmkMm5AK7w73=mn+is8qnNztS7iJVfz23-A44Yg@mail.gmail.com>

On Mon, Apr 29, 2019 at 1:06 PM Linus Torvalds
<torvalds at linux-foundation.org> wrote:
>
> Only do the 'call' instructions one at a time. Why would you change
> _existing_ code?

Side note: if you want to, you can easily batch up rewriting 'call'
instructions to the same target using the exact same code. You just
need to change the int3 handler case to calculate the
bp_int3_call_return from the fixed one-time address to use sopmething
like

     this_cpu_write(bp_call_return, int3_address-1+bp_int3_call_size);

instead (and you'd need to also teach the function that there's not
just a single int3 live at a time)

                Linus
