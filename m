From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 1 May 2019 15:13:30 -0400
Subject: [RFC][PATCH] ftrace/x86: Emulate call function while updating
 in breakpoint handler
In-Reply-To: <CAHk-=wjCoycqdVjvWkkFnVRQS9fHEzdmiAG4uUV8B04xv7ZVwA@mail.gmail.com>
References: <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
 <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <CAHk-=wjJ8D74+FDcXGL65Q9aB0cc7B4vr2s2rS6V4d4a3hU-1Q@mail.gmail.com>
 <20190501131117.GW2623@hirez.programming.kicks-ass.net>
 <CAHk-=wjCoycqdVjvWkkFnVRQS9fHEzdmiAG4uUV8B04xv7ZVwA@mail.gmail.com>
Message-ID: <20190501151330.023cc620@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501191330.XxXxOVWFpLC5gGQeoZXNq5FRAn2PaIMi2kNrVip2mYY@z>

On Wed, 1 May 2019 12:03:52 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, May 1, 2019@6:11 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Here goes, compile tested only...  
> 
> Ugh, two different threads. This has the same bug (same source) as the
> one Steven posted:
> 
> > --- a/arch/x86/entry/entry_32.S
> > +++ b/arch/x86/entry/entry_32.S
> > @@ -1479,6 +1479,13 @@ ENTRY(int3)
> >         ASM_CLAC
> >         pushl   $-1                             # mark this as an int
> >
> > +       testl   $SEGMENT_RPL_MASK, PT_CS(%esp)
> > +       jnz     .Lfrom_usermode_no_gap
> > +       .rept 6
> > +       pushl   5*4(%esp)
> > +       .endr
> > +.Lfrom_usermode_no_gap:  
> 
> This will corrupt things horribly if you still use vm86 mode. Checking
> CS RPL is simply not correct.

I never tested the 32 bit version of this. And we could just not
implement it (I don't think there's live kernel patching for it
either).

But this doesn't make it any worse than my version, because under the
full testing of my patch with the trampolines, I would easily crash the
32 bit version. That was one reason I made my last patch only support 64
bit.

Under light load, 32 bit works, but when I stress it (running perf and
ftrace together) it blows up. Could be an NMI issue.

-- Steve
