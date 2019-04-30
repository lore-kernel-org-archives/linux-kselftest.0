From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 30 Apr 2019 15:56:02 +0200
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
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
Message-ID: <20190430135602.GD2589@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430135602.wjZQq7bBaiGZGMNAsRLAU6uIBvbbM0BTUj6cwSusvg8@z>

On Mon, Apr 29, 2019@01:07:33PM -0700, Linus Torvalds wrote:
> On Mon, Apr 29, 2019@12:24 PM Andy Lutomirski <luto@kernel.org> wrote:
> > > Side note: we *already* depend on sti shadow working in other parts of the kernel, namely sti->iret.
> >
> > Where?  STI; IRET would be nuts.
> 
> Sorry, not 'sti;iret' but 'sti;sysexit'
> 
> > before commit 4214a16b02971c60960afd675d03544e109e0d75
> >     x86/asm/entry/64/compat: Use SYSRETL to return from compat mode SYSENTER
> >
> > we did sti; sysxit, but, when we discussed this, I don't recall anyone
> > speaking up in favor of the safely of the old code.
> 
> We still have that sti sysexit in the 32-bit code.

We also have both: "STI; HLT" and "STI; MWAIT" where we rely on the STI
shadow. Getting an NMI in between shouldn't hurt too much, but if that
in turn can lead to an actual interrupt happening, we're up some creek
without no paddle.

Most moden systems don't use either anymore though. As
mwait_idle_with_hints() relies on MWAIT ECX[0]=1 to allow MWAIT to wake
from pending interrupts.
