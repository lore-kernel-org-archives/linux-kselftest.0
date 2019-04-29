From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 13:06:17 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190429150724.6e501d27@gandalf.local.home>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <CAHk-=wjm93jLtVxTX4HZs6K4k1Wqh3ujjmapqaYtcibVk_YnzQ@mail.gmail.com>
 <20190429150724.6e501d27@gandalf.local.home>
Message-ID:
 <CAHk-=wgbC-wiSrdDYAh1ORF4EKmecY+MkNsJBF=BWf4W1bXXgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429200617.xRrCpm7h1Z8xA_BcyQK7nFu8o63E1EaEacXRrnT8IKA@z>

On Mon, Apr 29, 2019@12:07 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Are you suggesting that I rewrite the code to do it one function at a
> time? This has always been batch mode. This is not something new. The
> function tracer has been around longer than the text poke code.

Only do the 'call' instructions one at a time. Why would you change
_existing_ code?

                 Linus
