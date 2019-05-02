From: peterz at infradead.org (Peter Zijlstra)
Date: Thu, 2 May 2019 23:32:39 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg@mail.gmail.com>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <CAHk-=wh8bi5c_GkyjPtDAiaXaZRqtmhWs30usUvs4qK_F+c9tg@mail.gmail.com>
Message-ID: <20190502213239.GA2623@hirez.programming.kicks-ass.net>

On Thu, May 02, 2019 at 01:49:29PM -0700, Linus Torvalds wrote:

> We *could* also make this kernel-mode-only do_int3() be a special
> function, and do something like

I think I prefer the variant we have now. The int3_emulate_*() things
work uniformly and as expected on 32 and 64 bit (it would even work for
userspace if it weren't for SMAP).

So while the 32bit kernel entry is 'special' all the INT3 handlers can
uniformly prod at pt_regs in a natural way and have it work.

Making it special -- just for 32bit, seems like the wrong thing to me.
