From: sean.j.christopherson@intel.com (Sean Christopherson)
Date: Mon, 29 Apr 2019 17:45:04 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190430000846.GG31379@linux.intel.com>
References: <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=wjyyKDv-WZLXZbVD=V05p2X7eg74z2SpR4TQTxN9JLq4Q@mail.gmail.com>
 <20190429220814.GF31379@linux.intel.com>
 <CAHk-=whpq2=f2LdB-nc52Rd=iZkUH-N-r8OTqEfo+4UaJc7piA@mail.gmail.com>
 <20190430000846.GG31379@linux.intel.com>
Message-ID: <20190430004504.GH31379@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190430004504.wQP1sLN29PFeGIXpuGtG1bpcbDxher1RvSV5dCsXZkk@z>

On Mon, Apr 29, 2019@05:08:46PM -0700, Sean Christopherson wrote:
> On Mon, Apr 29, 2019@03:22:09PM -0700, Linus Torvalds wrote:
> > On Mon, Apr 29, 2019 at 3:08 PM Sean Christopherson
> > <sean.j.christopherson@intel.com> wrote:
> > >
> > > FWIW, Lakemont (Quark) doesn't block NMI/SMI in the STI shadow, but I'm
> > > not sure that counters the "horrible errata" statement ;-).  SMI+RSM saves
> > > and restores STI blocking in that case, but AFAICT NMI has no such
> > > protection and will effectively break the shadow on its IRET.
> > 
> > Ugh. I can't say I care deeply about Quark (ie never seemed to go
> > anywhere), but it's odd. I thought it was based on a Pentium core (or
> > i486+?). Are you saying those didn't do it either?
> 
> It's 486 based, but either way I suspect the answer is "yes".  IIRC,
> Knights Corner, a.k.a. Larrabee, also had funkiness around SMM and that
> was based on P54C, though I'm struggling to recall exactly what the
> Larrabee weirdness was.

Aha!  Found an ancient comment that explicitly states P5 does not block
NMI/SMI in the STI shadow, while P6 does block NMI/SMI.
