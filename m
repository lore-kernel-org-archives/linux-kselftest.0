From: peterz at infradead.org (Peter Zijlstra)
Date: Wed, 1 May 2019 21:17:16 +0200
Subject: [RFC][PATCH v3] ftrace/x86_64: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <CAHk-=wgMZJeMCW5MA25WFJZeYYWCOWr0nGaHhJ7kg+zsu5FY_A@mail.gmail.com>
References: <20190501113238.0ab3f9dd@gandalf.local.home>
 <CAHk-=wjvQxY4DvPrJ6haPgAa6b906h=MwZXO6G8OtiTGe=N7_w@mail.gmail.com>
 <20190501145200.6c095d7f@oasis.local.home>
 <CAHk-=wgMZJeMCW5MA25WFJZeYYWCOWr0nGaHhJ7kg+zsu5FY_A@mail.gmail.com>
Message-ID: <20190501191716.GV7905@worktop.programming.kicks-ass.net>

On Wed, May 01, 2019 at 11:59:05AM -0700, Linus Torvalds wrote:
> On Wed, May 1, 2019 at 11:52 AM Steven Rostedt <rostedt at goodmis.org> wrote:
> >
> > I got Peter's patch working. Here it is. What do you think?
> 
> I can tell from just looking at it for five seconds that at least the
> 32-bit case is buggy.
> 
> You can't look at CS(%rsp) without first also checking that you're not
> coming from vm86 mode.

Something like so then?

Index: linux-2.6/arch/x86/entry/entry_32.S
===================================================================
--- linux-2.6.orig/arch/x86/entry/entry_32.S
+++ linux-2.6/arch/x86/entry/entry_32.S
@@ -1479,6 +1479,10 @@ ENTRY(int3)
 	ASM_CLAC
 	pushl	$-1				# mark this as an int

+#ifdef CONFIG_VM86
+	testl	$X86_EFLAGS_VM, PT_EFLAGS(%esp)
+	jnz	.Lfrom_usermode_no_gap
+#endif
 	testl	$SEGMENT_RPL_MASK, PT_CS(%esp)
 	jnz	.Lfrom_usermode_no_gap
 	.rept 6
