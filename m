From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 15:22:09 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190429220814.GF31379@linux.intel.com>
References: <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=wjyyKDv-WZLXZbVD=V05p2X7eg74z2SpR4TQTxN9JLq4Q@mail.gmail.com>
 <20190429220814.GF31379@linux.intel.com>
Message-ID:
 <CAHk-=whpq2=f2LdB-nc52Rd=iZkUH-N-r8OTqEfo+4UaJc7piA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429222209.w4T7TM2mVqxxyXkxSP-7GHVTf5QKK9fGjEqkhiD3YmI@z>

On Mon, Apr 29, 2019 at 3:08 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> FWIW, Lakemont (Quark) doesn't block NMI/SMI in the STI shadow, but I'm
> not sure that counters the "horrible errata" statement ;-).  SMI+RSM saves
> and restores STI blocking in that case, but AFAICT NMI has no such
> protection and will effectively break the shadow on its IRET.

Ugh. I can't say I care deeply about Quark (ie never seemed to go
anywhere), but it's odd. I thought it was based on a Pentium core (or
i486+?). Are you saying those didn't do it either?

I have this dim memory about talking about this with some (AMD?)
engineer, and having an alternative approach for the sti shadow wrt
NMI - basically not checking interrupts in the instruction you return
to with 'iret'. I don't think it was even conditional on the "iret
from NMI", I think it was basically any iret also did the sti shadow
thing.

But I can find no actual paper to back that up, so this may be me just
making sh*t up.

> KVM is generally ok with respect to STI blocking, but ancient versions
> didn't migrate STI blocking and there's currently a hole where
> single-stepping a guest (from host userspace) could drop STI_BLOCKING
> if a different VM-Exit occurs between the single-step #DB VM-Exit and the
> instruction in the shadow.  Though "don't do that" may be a reasonable
> answer in that case.

I thought the sti shadow blocked the single-step exception too? I know
"mov->ss" does block debug interrupts too.

Or are you saying that it's some "single step by emulation" that just
miss setting the STI_BLOCKING flag?

                   Linus
