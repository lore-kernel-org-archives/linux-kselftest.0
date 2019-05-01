From: torvalds at linux-foundation.org (Linus Torvalds)
Date: Wed, 1 May 2019 12:36:10 -0700
Subject: [RFC][PATCH v3] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <20190501191716.GV7905@worktop.programming.kicks-ass.net>
References: <20190501113238.0ab3f9dd@gandalf.local.home>
 <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
 <20190501145200.6c095d7f@oasis.local.home>
 <CAHk-=wgMZJeMCW5MA25WFJZeYYWCOWr0nGaHhJ7kg+zsu5FY_A@mail.gmail.com>
 <20190501191716.GV7905@worktop.programming.kicks-ass.net>
Message-ID: <CAHk-=whWOStbe8nAxuaovrmqsq_YW-rDFu1AkpgisaWMqdMibg@mail.gmail.com>

On Wed, May 1, 2019 at 12:17 PM Peter Zijlstra <peterz at infradead.org> wrote:
>
> Something like so then?

Yes, that looks correct.

We have those X86_EFLAGS_VM tests pretty randomly scattered around,
and I wish there was some cleaner model for this, but I also guess
that there's no point in worrying about the 32-bit code much.

                Linus
