From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Tue, 30 Apr 2019 18:58:08 -0700
Subject: [RFC][PATCH v2] ftrace/x86: Emulate call function while updating
 in breakpoint handler
In-Reply-To: <20190430213517.7bcfaf8e@oasis.local.home>
References: <20190428133826.3e142cfd@oasis.local.home>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
 <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <20190430175334.423821c0@gandalf.local.home>
 <20190430213517.7bcfaf8e@oasis.local.home>
Message-ID: <CAHk-=whpS92oz-FkzaVdTEXVMre1NQioiLfqyEYYkmrVoVvgzw@mail.gmail.com>

On Tue, Apr 30, 2019 at 6:35 PM Steven Rostedt <rostedt at goodmis.org> wrote:
>
>
> Probably easier to move it from inline asm to ftrace_X.S and use the
> lockdep TRACE_ON/OFF macros.

Yeah, that should clean up the percpu stuff too since we have helper
macros for it for *.S files anyway.

I only did the asm() in C because it made the "look, something like
this" patch simpler to test (and it made it easy to check the
generated asm file). Not because it was a good idea ;)

                 Linus
