From: luto@kernel.org (Andy Lutomirski)
Date: Tue, 30 Apr 2019 09:33:51 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
References: <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
 <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
Message-ID:
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430163351.MrA9Jm0MxRkZVVHHM1QmHfp-bFkkzopNx7tGSWrc9y8@z>

On Tue, Apr 30, 2019 at 9:06 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Apr 30, 2019@6:56 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
>
> Realistically, I don't think you can hit the problem in practice. The
> only way to hit that incredibly small race of "one instruction, *both*
> NMI and interrupts" is to have a lot of interrupts going all at the
> same time, but that will also then solve the latency problem, so the
> very act of triggering it will also fix it.
>
> I don't see any case where it's really bad. The "sti sysexit" race is
> similar, just about latency of user space signal reporting (and
> perhaps any pending TIF_WORK_xyz flags).

In the worst case, it actually kills the machine.  Last time I tracked
a bug like this down, I think the issue was that we got preempted
after the last TIF_ check, entered a VM, exited, context switched
back, and switched to user mode without noticing that there was a
ending KVM user return notifier.  This left us with bogus CPU state
and the machine exploded.

Linus, can I ask you to reconsider your opposition to Josh's other
approach of just shifting the stack on int3 entry?  I agree that it's
ugly, but the ugliness is easily manageable and fairly self-contained.
We add a little bit of complication to the entry asm (but it's not
like it's unprecedented -- the entry asm does all kinds of stack
rearrangement due to IST and PTI crap already), and we add an
int3_emulate_call(struct pt_regs *regs, unsigned long target) helper
that has appropriate assertions that the stack is okay and emulates
the call.  And that's it.

In contrast, your approach involves multiple asm trampolines, hash
tables, batching complications, and sti shadows.

As an additional argument, with the stack-shifting approach, it runs
on *every int3 from kernel mode*.  This means that we can do something
like this:

static bool int3_emulate_call_okay(struct pt_regs *regs)
{
    unsigned long available_stack = regs->sp - (unsigned long);
    return available_stack >= sizeof(long);
}

void do_int3(...) {
{
  WARN_ON_ONCE(!user_mode(regs) && !int3_emulate_call_okay(regs));
  ...;
}

static void int3_emulate_call(struct pt_regs *regs, unsigned long target)
{
  BUG_ON(user_mode(regs) || !int3_emulate_call_okey(regs));
  regs->sp -= sizeof(unsigned long);
  *(unsigned long *)regs->sp = target;
  /* CET SHSTK fixup goes here */
}

Obviously the CET SHSTK fixup might be rather nasty, but I suspect
it's a solvable problem.

A major benefit of this is that the entry asm nastiness will get
exercised all the time, and, if we screw it up, the warning will fire.
This is the basic principle behind why the entry stuff *works* these
days.  I've put a lot of effort into making sure that running kernels
with CONFIG_DEBUG_ENTRY and running the selftests actually exercises
the nasty cases.

--Andy
