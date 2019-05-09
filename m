From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 9 May 2019 20:26:22 +0200
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190509173741.pfvecznqdndihxzg@home.goodmis.org>
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
Message-ID: <20190509182622.GB2623@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190509182622.mngmA25bTxhy3R7xNmCnVr8cjGCpP58Sof1I4mDB2jM@z>

On Thu, May 09, 2019@01:37:42PM -0400, Steven Rostedt wrote:
> On Thu, May 09, 2019@10:14:31AM +0200, Peter Zijlstra wrote:
> > 
> > Right; I already fixed that in my patch changing i386's pt_regs.
> > 
> > But what I'd love to do is something like the belwo patch, and make all
> > the trampolines (very much including ftrace) use that. Such that we then
> > only have 1 copy of this magic (well, 2 because x86_64 also needs an
> > implementation of this of course).
> > 
> > Changing ftrace over to this would be a little more work but it can
> > easily chain things a little to get its original context back:
> > 
> > ENTRY(ftrace_regs_caller)
> > GLOBAL(ftrace_regs_func)
> > 	push ftrace_stub
> > 	push ftrace_regs_handler
> 
> Note, ftrace_stub is dynamically modified to remove any indirect calls.

Yeah, I realized that a few hours after I send this out; as you might
have seen by the IRC chatter on this.

Still, maybe we can wrap the thing in a .macro and reuse things that
way. Because I really hate there are at least 3 (x2 for x86_64) copies
of this around.
