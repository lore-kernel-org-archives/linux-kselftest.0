From: luto at kernel.org (Andy Lutomirski)
Date: Mon, 29 Apr 2019 11:56:54 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
Message-ID: <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>

On Mon, Apr 29, 2019 at 11:53 AM Linus Torvalds
<torvalds at linux-foundation.org> wrote:
>
>
>
> On Mon, Apr 29, 2019, 11:42 Andy Lutomirski <luto at kernel.org> wrote:
>>
>>
>> I'm less than 100% convinced about this argument.  Sure, an NMI right
>> there won't cause a problem.  But an NMI followed by an interrupt will
>> kill us if preemption is on.  I can think of three solutions:
>
>
> No, because either the sti shadow disables nmi too (that's the case on some CPUs at least) or the iret from nmi does.
>
> Otherwise you could never trust the whole sti shadow thing - and it very much is part of the architecture.
>

Is this documented somewhere?  And do you actually believe that this
is true under KVM, Hyper-V, etc?  As I recall, Andrew Cooper dug in to
the way that VMX dealt with this stuff and concluded that the SDM was
blatantly wrong in many cases, which leads me to believe that Xen
HVM/PVH is the *only* hypervisor that gets it right.

Steven's point about batched updates is quite valid, though.  My
personal favorite solution to this whole mess is to rework the whole
thing so that the int3 handler simply returns and retries and to
replace the sync_core() broadcast with an SMI broadcast.  I don't know
whether this will actually work on real CPUs and on VMs and whether
it's going to crash various BIOSes out there.
