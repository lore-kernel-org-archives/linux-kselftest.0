From: luto@kernel.org (Andy Lutomirski)
Date: Mon, 29 Apr 2019 12:24:23 -0700
Subject: [PATCH 3/4] x86/ftrace: make ftrace_int3_handler() not to skip
 fops invocation
In-Reply-To: <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
References: <20190427100639.15074-1-nstange@suse.de>
 <20190427100639.15074-4-nstange@suse.de>
 <20190427102657.GF2623@hirez.programming.kicks-ass.net>
 <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wh5OpheSU8Em_Q3Hg8qw_JtoijxOdPtHru6d+5K8TWM=A@mail.gmail.com>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
Message-ID:
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429192423.lPTTmVLNyqRIjS4-Lcwzp1Tej5wj2YVZDeUSFlF3bL0@z>

On Mon, Apr 29, 2019 at 12:13 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
>
> On Mon, Apr 29, 2019, 12:02 Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>
>>
>>
>> If nmi were to break it, it would be a cpu bug.
>
>
> Side note: we *already* depend on sti shadow working in other parts of the kernel, namely sti->iret.
>

Where?  STI; IRET would be nuts.

Before:

commit 4214a16b02971c60960afd675d03544e109e0d75
Author: Andy Lutomirski <luto at kernel.org>
Date:   Thu Apr 2 17:12:12 2015 -0700

    x86/asm/entry/64/compat: Use SYSRETL to return from compat mode SYSENTER

we did sti; sysxit, but, when we discussed this, I don't recall anyone
speaking up in favor of the safely of the old code.

Not to mention that the crash we'll get if we get an NMI and a
rescheduling interrupt in this path will be very, very hard to debug.
