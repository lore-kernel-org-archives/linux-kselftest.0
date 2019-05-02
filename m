From: jikos@kernel.org (Jiri Kosina)
Date: Thu, 2 May 2019 21:28:53 +0200 (CEST)
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1905022101060.10635@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502192853.Jpao92lvZPUFcGkhOgPJqJu_GWjRyX5P_OfO1MN55_o@z>

On Thu, 2 May 2019, Linus Torvalds wrote:

> I forget: is #BP _only_ for the "int3" instruction? 

Hmm, according to 17.3.2 in vol 3 of SDM (and table 6-1 there), that 
indeed seems to be the case, so we should be fine.

> But if "int3 from kernel space" _only_ happens on actual "int3"
> instructions, then we really could just special-case that case. We'd
> know that %cr3 has been switched, we'd know that we don't need to do
> fsgs switching, we'd know we already have a good stack and percpu data
> etc set up.

That should indeed be doable, under the asumption that noone is doing any 
int3 games before we've switched away from entry trampoline.

I've briefly looked, and seems like we have proper notrace anotations for 
stackleak_erase(), which seems to be the only C (ftrace-able) code that's 
running on a trampoline (off-topic: where does PTI code make sure that we 
actually map this symbol into user pagetables in case we're not doing 
global mapping?).

-- 
Jiri Kosina
SUSE Labs
