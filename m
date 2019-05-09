From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 9 May 2019 10:20:30 +0900
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190508184848.qerg3flv3ej3xsev@treble>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.721269814@infradead.org>
 <20190508115416.nblx7c2kocidpytm@treble>
 <20190508120416.GL2589@hirez.programming.kicks-ass.net>
 <20190508124248.u5ukpbhnh4wpiccq@treble>
 <20190508153907.GM2589@hirez.programming.kicks-ass.net>
 <20190508184848.qerg3flv3ej3xsev@treble>
Message-ID: <20190509102030.dfa62e058f09d0d8cbdd6053@kernel.org>

Hi Josh,

On Wed, 8 May 2019 13:48:48 -0500
Josh Poimboeuf <jpoimboe at redhat.com> wrote:

> On Wed, May 08, 2019 at 05:39:07PM +0200, Peter Zijlstra wrote:
> > On Wed, May 08, 2019 at 07:42:48AM -0500, Josh Poimboeuf wrote:
> > > On Wed, May 08, 2019 at 02:04:16PM +0200, Peter Zijlstra wrote:
> > 
> > > > Do the x86_64 variants also want some ORC annotation?
> > > 
> > > Maybe so.  Though it looks like regs->ip isn't saved.  The saved
> > > registers might need to be tweaked.  I'll need to look into it.
> > 
> > What all these sites do (and maybe we should look at unifying them
> > somehow) is turn a CALL frame (aka RET-IP) into an exception frame (aka
> > pt_regs).
> > 
> > So regs->ip will be the return address (which is fixed up to be the CALL
> > address in the handler).
> 
> But from what I can tell, trampoline_handler() hard-codes regs->ip to
> point to kretprobe_trampoline(), and the original return address is
> placed in regs->sp.
> 
> Masami, is there a reason why regs->ip doesn't have the original return
> address and regs->sp doesn't have the original SP?  I think that would
> help the unwinder understand things.

Yes, for regs->ip, there is a histrical reason. Since previously, we had
an int3 at trampoline, so the user (kretprobe) handler expects that
regs->ip is trampoline address and ri->ret_addr is original return address.
It is better to check the other archs, but I think it is possible to
change the regs->ip to original return address, since no one cares such
"fixed address". :)

For the regs->sp, there are 2 reasons.

For x86-64, it's just for over-optimizing (reduce stack usage).
I think we can make a gap for putting return address, something like

	"kretprobe_trampoline:\n"
#ifdef CONFIG_X86_64
	"	pushq %rsp\n"	/* Make a gap for return address */
	"	pushq 0(%rsp)\n"	/* Copy original stack pointer */
	"	pushfq\n"
	SAVE_REGS_STRING
	"	movq %rsp, %rdi\n"
	"	call trampoline_handler\n"
	/* Push the true return address to the bottom */
	"	movq %rax, 20*8(%rsp)\n"
	RESTORE_REGS_STRING
	"	popfq\n"
	"	addq $8, %rsp\n"	/* Skip original stack pointer */

For i386 (x86-32), there is no other way to keep &regs->sp as
the original stack pointer. It has to be changed with this series,
maybe as same as x86-64.

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
