From: sean.j.christopherson@intel.com (Sean Christopherson)
Date: Mon, 29 Apr 2019 15:08:15 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wjyyKDv-WZLXZbVD=V05p2X7eg74z2SpR4TQTxN9JLq4Q@mail.gmail.com>
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
Message-ID: <20190429220814.GF31379@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429220815.DAoelM3vSwtPxaf1pu6zMfIIa7rwH8wbnFoJeX2S9BY@z>

On Mon, Apr 29, 2019@01:16:10PM -0700, Linus Torvalds wrote:
> On Mon, Apr 29, 2019 at 12:02 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > If nmi were to break it, it would be a cpu bug. I'm pretty sure I've
> > seen the "shadow stops even nmi" documented for some uarch, but as
> > mentioned it's not necessarily the only way to guarantee the shadow.
> 
> In fact, the documentation is simply the official Intel instruction
> docs for "STI":
> 
>     The IF flag and the STI and CLI instructions do not prohibit the
>     generation of exceptions and NMI interrupts. NMI interrupts (and
>     SMIs) may be blocked for one macroinstruction following an STI.
> 
> note the "may be blocked". As mentioned, that's just one option for
> not having NMI break the STI shadow guarantee, but it's clearly one
> that Intel has done at times, and clearly even documents as having
> done so.
> 
> There is absolutely no question that the sti shadow is real, and that
> people have depended on it for _decades_. It would be a horrible
> errata if the shadow can just be made to go away by randomly getting
> an NMI or SMI.

FWIW, Lakemont (Quark) doesn't block NMI/SMI in the STI shadow, but I'm
not sure that counters the "horrible errata" statement ;-).  SMI+RSM saves
and restores STI blocking in that case, but AFAICT NMI has no such
protection and will effectively break the shadow on its IRET.

All other (modern) Intel uArchs block NMI in the shadow and also enforce
STI_BLOCKING==0 when injecting an NMI via VM-Enter, i.e. prevent a VMM
from breaking the shadow so long as the VMM preserves the shadow info.

KVM is generally ok with respect to STI blocking, but ancient versions
didn't migrate STI blocking and there's currently a hole where
single-stepping a guest (from host userspace) could drop STI_BLOCKING
if a different VM-Exit occurs between the single-step #DB VM-Exit and the
instruction in the shadow.  Though "don't do that" may be a reasonable
answer in that case.
