From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 15:06:30 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
Message-ID:
 <CAHk-=wjAQaowLHBrXs1M5K-Nr-eVQMt0K8oyCuWxKTvP9k=qqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429220630.XHqWGdx76rtFaOG8vo86zdUKcKJMfnDnZJJWwGggbyw@z>

On Mon, Apr 29, 2019@11:57 AM Andy Lutomirski <luto@kernel.org> wrote:
> >
> > Otherwise you could never trust the whole sti shadow thing - and it very much is part of the architecture.
>
> Is this documented somewhere?

Btw, if you really don't trust the sti shadow despite it going all the
way back to the 8086, then you could instead make the irqoff code do

        push %gs:bp_call_return
        push %gs:bp_call_target
        sti
        ret

which just keeps interrupts explicitly disabled over the whole use of
the percpu data.

The actual "ret" instruction doesn't matter, it's not going to change
in this model (where the code isn't dynamically generated or changed).
So I claim that it will still be protected by the sti shadow, but when
written that way it doesn't actually matter, and you could reschedule
immediately after the sti (getting an interrupt there might make the
stack frame look odd, but it doesn't really affect anything else)

                  Linus
