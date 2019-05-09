From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 9 May 2019 14:36:29 -0400
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190509182622.GB2623@hirez.programming.kicks-ass.net>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.721269814@infradead.org>
 <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
 <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>
 <20190509081431.GO2589@hirez.programming.kicks-ass.net>
 <20190509173741.pfvecznqdndihxzg@home.goodmis.org>
 <20190509182622.GB2623@hirez.programming.kicks-ass.net>
Message-ID: <20190509143629.5c104011@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190509183629.nc0TwKTCEA0qfbu7VVxD8afpJK3w4KNFrKgg1k6ZRCw@z>

On Thu, 9 May 2019 20:26:22 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> Still, maybe we can wrap the thing in a .macro and reuse things that
> way. Because I really hate there are at least 3 (x2 for x86_64) copies
> of this around.

I'm good with something like this. Have a single place that does the
pt_regs saving would be great. Then I could separate ftrace_regs_caller
from ftrace_caller, and simplify them both, as I would only need to
make sure frame pointers still work for ftrace_caller, and
ftrace_regs_caller would depend on the macro to make sure it works.

-- Steve
