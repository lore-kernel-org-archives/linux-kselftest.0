From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 11:22:51 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
Message-ID:
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429182251.DhGqoD2n5wFF0MDoaYPpwNrEZ3C-p25VcvjlySUxXJs@z>

On Mon, Apr 29, 2019 at 11:06 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
> It does *not* emulate the "call" in the BP handler itself, instead if
> replace the %ip (the same way all the other BP handlers replace the
> %ip) with a code sequence that just does
>
>         push %gs:bp_call_return
>         jmp *%gs:bp_call_target
>
> after having filled in those per-cpu things.

Note that if you read the patch, you'll see that my explanation
glossed over the "what if an interrupt happens" part. Which is handled
by having two handlers, one for "interrupts were already disabled" and
one for "interrupts were enabled, so I disabled them before entering
the handler".

The second handler does the same push/jmp sequence, but has a "sti"
before the jmp. Because of the one-instruction sti shadow, interrupts
won't actually be enabled until after the jmp instruction has
completed, and thus the "push/jmp" is atomic wrt regular interrupts.

It's not safe wrt NMI, of course, but since NMI won't be rescheduling,
and since any SMP IPI won't be punching through that sequence anyway,
it's still atomic wrt _another_ text_poke() attempt coming in and
re-using the bp_call_return/tyarget slots.

So yeah, it's not "one-liner" trivial, but it's not like it's
complicated either, and it actually matches the existing "call this
code to emulate the replaced instruction". So I'd much rather have a
couple of tens of lines of code here that still acts pretty much
exactly like all the other rewriting does, rather than play subtle
games with the entry stack frame.

Finally: there might be other situations where you want to have this
kind of "pseudo-atomic" replacement sequence, so I think while it's a
hack specific to emulating a "call" instruction, I don't think it is
conceptually limited to just that case.

                 Linus
