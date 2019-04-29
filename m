From: rostedt@goodmis.org (Steven Rostedt)
Date: Mon, 29 Apr 2019 15:07:24 -0400
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wjm93jLtVxTX4HZs6K4k1Wqh3ujjmapqaYtcibVk_YnzQ@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <20190429145250.1a5da6ed@gandalf.local.home>
 <CAHk-=wjm93jLtVxTX4HZs6K4k1Wqh3ujjmapqaYtcibVk_YnzQ@mail.gmail.com>
Message-ID: <20190429150724.6e501d27@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429190724.MZc--zRcFTWz1hmwv3NJERtVB-7KGFp0cWiYSaFoAYk@z>

On Mon, 29 Apr 2019 11:59:04 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I really don't care. Just do what I suggested, and if you have numbers to
> show problems, then maybe I'll care.
> 

Are you suggesting that I rewrite the code to do it one function at a
time? This has always been batch mode. This is not something new. The
function tracer has been around longer than the text poke code.

> Right now you're just making excuses for this. I described the solution
> months ago, now I've written a patch, if that's not good enough then we can
> just skip this all entirely.
> 
> Honestly, if you need to rewrite tens of thousands of calls, maybe you're
> doing something wrong?
> 

 # cd /sys/kernel/debug/tracing
 # cat available_filter_functions | wc -l
 45856
 # cat enabled_functions | wc -l
 0
 # echo function > current_tracer
 # cat enabled_functions | wc -l
 45856

There, I just enabled 45,856 function call sites in one shot!

How else do you want to update them? Every function in the kernel has a
nop, that turns into a call to the ftrace_handler, if I add another
user of that code, it will change each one as well.

-- Steve
