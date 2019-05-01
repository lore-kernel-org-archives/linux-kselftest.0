From: jikos@kernel.org (Jiri Kosina)
Date: Wed, 1 May 2019 21:33:28 +0200 (CEST)
Subject: [RFC][PATCH] ftrace/x86: Emulate call function while updating
 in breakpoint handler
In-Reply-To: <20190501151330.023cc620@gandalf.local.home>
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
 <20190501151330.023cc620@gandalf.local.home>
Message-ID: <nycvar.YFH.7.76.1905012132100.9803@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501193328.WXGv_oEu2MTqib8oq9eZkMjouncddr22g_QBsc2U9CE@z>

On Wed, 1 May 2019, Steven Rostedt wrote:

> I never tested the 32 bit version of this. And we could just not
> implement it (I don't think there's live kernel patching for it
> either).

That's correct, there is no livepatching on x86_32 (and no plans for 
it). CONFIG_LIVEPATCH is not available for 32bit builds at all.

-- 
Jiri Kosina
SUSE Labs
