From: jpoimboe at redhat.com (Josh Poimboeuf)
Date: Wed, 8 May 2019 13:48:48 -0500
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190508153907.GM2589@hirez.programming.kicks-ass.net>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.721269814@infradead.org>
 <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
Message-ID: <20190508184848.qerg3flv3ej3xsev@treble>

On Wed, May 08, 2019 at 05:39:07PM +0200, Peter Zijlstra wrote:
> On Wed, May 08, 2019 at 07:42:48AM -0500, Josh Poimboeuf wrote:
> > On Wed, May 08, 2019 at 02:04:16PM +0200, Peter Zijlstra wrote:
> 
> > > Do the x86_64 variants also want some ORC annotation?
> > 
> > Maybe so.  Though it looks like regs->ip isn't saved.  The saved
> > registers might need to be tweaked.  I'll need to look into it.
> 
> What all these sites do (and maybe we should look at unifying them
> somehow) is turn a CALL frame (aka RET-IP) into an exception frame (aka
> pt_regs).
> 
> So regs->ip will be the return address (which is fixed up to be the CALL
> address in the handler).

But from what I can tell, trampoline_handler() hard-codes regs->ip to
point to kretprobe_trampoline(), and the original return address is
placed in regs->sp.

Masami, is there a reason why regs->ip doesn't have the original return
address and regs->sp doesn't have the original SP?  I think that would
help the unwinder understand things.

-- 
Josh
