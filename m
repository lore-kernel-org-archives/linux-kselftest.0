From: luto@kernel.org (Andy Lutomirski)
Date: Mon, 29 Apr 2019 11:42:38 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
Message-ID:
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429184238.0n-i5HQT_RI7xQpsrzKCcGzqZjvcESoGuUbUD6nM6mg@z>

On Mon, Apr 29, 2019 at 11:29 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Apr 29, 2019 at 11:06 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> >
> > It does *not* emulate the "call" in the BP handler itself, instead if
> > replace the %ip (the same way all the other BP handlers replace the
> > %ip) with a code sequence that just does
> >
> >         push %gs:bp_call_return
> >         jmp *%gs:bp_call_target
> >
> > after having filled in those per-cpu things.
>
> Note that if you read the patch, you'll see that my explanation
> glossed over the "what if an interrupt happens" part. Which is handled
> by having two handlers, one for "interrupts were already disabled" and
> one for "interrupts were enabled, so I disabled them before entering
> the handler".

This is quite a cute solution.

>
> The second handler does the same push/jmp sequence, but has a "sti"
> before the jmp. Because of the one-instruction sti shadow, interrupts
> won't actually be enabled until after the jmp instruction has
> completed, and thus the "push/jmp" is atomic wrt regular interrupts.
>
> It's not safe wrt NMI, of course, but since NMI won't be rescheduling,
> and since any SMP IPI won't be punching through that sequence anyway,
> it's still atomic wrt _another_ text_poke() attempt coming in and
> re-using the bp_call_return/tyarget slots.

I'm less than 100% convinced about this argument.  Sure, an NMI right
there won't cause a problem.  But an NMI followed by an interrupt will
kill us if preemption is on.  I can think of three solutions:

1. Assume that all CPUs (and all relevant hypervisors!) either mask
NMIs in the STI shadow or return from NMIs with interrupts masked for
one instruction.  Ditto for MCE.  This seems too optimistic.

2. Put a fixup in the NMI handler and MCE handler: if the return
address is one of these magic jumps, clear IF and back up IP by one
byte.  This should *work*, but it's a bit ugly.

3. Use a different magic sequence:

push %gs:bp_call_return
int3

and have the int3 handler adjust regs->ip and regs->flags as appropriate.

I think I like #3 the best, even though it's twice as slow.

FWIW, kernel shadow stack patches will show up eventually, and none of
these approaches are compatible as is.  Perhaps the actual sequence
should be this, instead:

bp_int3_fixup_irqsoff:
  call 1f
1:
  int3

bp_int3_fixup_irqson:
  call 1f
1:
  int3

and the int3 handler will update the conventional return address *and*
the shadow return address.  Linus, what do you think about this
variant?

Finally, with my maintainer hat on: if anyone actually wants to merge
this thing, I want to see a test case, exercised regularly (every boot
in configured, perhaps) that actually *runs* this code.  Hitting it in
practice will be rare, and I want bugs to be caught.
