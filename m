From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Tue, 30 Apr 2019 09:06:01 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190430135602.GD2589@hirez.programming.kicks-ass.net>
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
Message-ID: <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>

On Tue, Apr 30, 2019 at 6:56 AM Peter Zijlstra <peterz at infradead.org> wrote:
>
> On Mon, Apr 29, 2019 at 01:07:33PM -0700, Linus Torvalds wrote:
> >
> > We still have that sti sysexit in the 32-bit code.
>
> We also have both: "STI; HLT" and "STI; MWAIT" where we rely on the STI
> shadow.

I guess the good news is that in all cases we really only ever protect
against a very unlikely race, and if the race happens it's not
actually fatal.

Yes, if we get an NMI and then an interrupt in between the "st;hlt" we
might wait for the next interrupt and get a (potentially fairly
horrible) latency issue. I guess that with maximal luck it might be a
one-shot timer and not get re-armed, but it sounds very very very
unlikely.

Googling around, I actually find a patch from Avi Kivity from back in
2010 for this exact issue, apparently because kvm got this case wrong
and somebody hit it. The patch never made it upstream exactly because
kvm could be fixed and people decided that most real hardware didn't
have the issue in the first place.

In the discussion I found, Peter Anvin tried to get confirmation from
AMD engineers about this too, but I don't see any resolution.

Realistically, I don't think you can hit the problem in practice. The
only way to hit that incredibly small race of "one instruction, *both*
NMI and interrupts" is to have a lot of interrupts going all at the
same time, but that will also then solve the latency problem, so the
very act of triggering it will also fix it.

I don't see any case where it's really bad. The "sti sysexit" race is
similar, just about latency of user space signal reporting (and
perhaps any pending TIF_WORK_xyz flags).

So maybe we don't care deeply about the sti shadow. It's a potential
latecy problem when broken, but not a huge issue. And for the
instruction rewriting hack, moving to "push+sti+ret" also makes a lost
sti shadow just a "possibly odd stack frame visibility" issue rather
than anything deeply fatal.

We can probably just write it off as "some old CPU's (and a smattering
or very rare and not relevant new ones) have potential but unlikely
latency issues because of a historical CPU mis-design - don't do perf
on them".

                Linus
