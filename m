From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Mon, 29 Apr 2019 19:26:02 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <20190430004504.GH31379@linux.intel.com>
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
 <20190430004504.GH31379@linux.intel.com>
Message-ID: <CAHk-=wjXHfVkrO6ftk9FGtAbpCsaEBa+tGrC8qjV6RUJHu+pCg@mail.gmail.com>

On Mon, Apr 29, 2019 at 5:45 PM Sean Christopherson
<sean.j.christopherson at intel.com> wrote:
>
> On Mon, Apr 29, 2019 at 05:08:46PM -0700, Sean Christopherson wrote:
> >
> > It's 486 based, but either way I suspect the answer is "yes".  IIRC,
> > Knights Corner, a.k.a. Larrabee, also had funkiness around SMM and that
> > was based on P54C, though I'm struggling to recall exactly what the
> > Larrabee weirdness was.
>
> Aha!  Found an ancient comment that explicitly states P5 does not block
> NMI/SMI in the STI shadow, while P6 does block NMI/SMI.

Ok, so the STI shadow really wouldn't be reliable on those machines. Scary.

Of course, the good news is that hopefully nobody has them any more,
and if they do, they presumably don't use fancy NMI profiling etc, so
any actual NMI's are probably relegated purely to largely rare and
effectively fatal errors anyway (ie memory parity errors).

                     Linus
