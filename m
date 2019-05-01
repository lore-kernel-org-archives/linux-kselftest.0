From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 1 May 2019 21:41:32 +0200
Subject: [RFC][PATCH] ftrace/x86: Emulate call function while updating in
 breakpoint handler
In-Reply-To: <nycvar.YFH.7.76.1905012132100.9803@cbobk.fhfr.pm>
References: <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <CAHk-=wjJ8D74+FDcXGL65Q9aB0cc7B4vr2s2rS6V4d4a3hU-1Q@mail.gmail.com>
 <20190501131117.GW2623@hirez.programming.kicks-ass.net>
 <CAHk-=wjCoycqdVjvWkkFnVRQS9fHEzdmiAG4uUV8B04xv7ZVwA@mail.gmail.com>
 <20190501151330.023cc620@gandalf.local.home>
 <nycvar.YFH.7.76.1905012132100.9803@cbobk.fhfr.pm>
Message-ID: <20190501194132.GX7905@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501194132.1mk18RKtqIn_ZX568Gw-lbzRbLb56fX2PI-NkbMiTtk@z>

On Wed, May 01, 2019@09:33:28PM +0200, Jiri Kosina wrote:
> On Wed, 1 May 2019, Steven Rostedt wrote:
> 
> > I never tested the 32 bit version of this. And we could just not
> > implement it (I don't think there's live kernel patching for it
> > either).
> 
> That's correct, there is no livepatching on x86_32 (and no plans for 
> it). CONFIG_LIVEPATCH is not available for 32bit builds at all.

We still want this for static_call(), even on 32bit.
