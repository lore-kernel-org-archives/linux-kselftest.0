From: peterz at infradead.org (Peter Zijlstra)
Date: Tue, 30 Apr 2019 12:40:26 +0200
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=wjXHfVkrO6ftk9FGtAbpCsaEBa+tGrC8qjV6RUJHu+pCg@mail.gmail.com>
References: <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=wjyyKDv-WZLXZbVD=V05p2X7eg74z2SpR4TQTxN9JLq4Q@mail.gmail.com>
 <20190429220814.GF31379@linux.intel.com>
 <CAHk-=whpq2=f2LdB-nc52Rd=iZkUH-N-r8OTqEfo+4UaJc7piA@mail.gmail.com>
 <20190430000846.GG31379@linux.intel.com>
 <20190430004504.GH31379@linux.intel.com>
 <CAHk-=wjXHfVkrO6ftk9FGtAbpCsaEBa+tGrC8qjV6RUJHu+pCg@mail.gmail.com>
Message-ID: <20190430104026.GQ2623@hirez.programming.kicks-ass.net>

On Mon, Apr 29, 2019 at 07:26:02PM -0700, Linus Torvalds wrote:
> On Mon, Apr 29, 2019 at 5:45 PM Sean Christopherson
> <sean.j.christopherson at intel.com> wrote:
> >
> > On Mon, Apr 29, 2019 at 05:08:46PM -0700, Sean Christopherson wrote:
> > >
> > > It's 486 based, but either way I suspect the answer is "yes".  IIRC,
> > > Knights Corner, a.k.a. Larrabee, also had funkiness around SMM and that
> > > was based on P54C, though I'm struggling to recall exactly what the
> > > Larrabee weirdness was.
> >
> > Aha!  Found an ancient comment that explicitly states P5 does not block
> > NMI/SMI in the STI shadow, while P6 does block NMI/SMI.
> 
> Ok, so the STI shadow really wouldn't be reliable on those machines. Scary.
> 
> Of course, the good news is that hopefully nobody has them any more,
> and if they do, they presumably don't use fancy NMI profiling etc, so
> any actual NMI's are probably relegated purely to largely rare and
> effectively fatal errors anyway (ie memory parity errors).

We do have KNC perf support, if that chip has 'issues'...

Outside of that, we only do perf from P6 onwards. With P4 support being
in dubious shape, because it's massively weird and 'nobody' still has
those machines.
