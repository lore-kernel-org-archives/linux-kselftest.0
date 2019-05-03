From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 3 May 2019 11:29:59 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502195052.0af473cf@gandalf.local.home>
References: <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
Message-ID: <20190503092959.GB2623@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503092959.2pFllVzEy2z7TdFn8_1Et8rgvzIHyAAk7h5gna_eJtI@z>

On Thu, May 02, 2019@07:50:52PM -0400, Steven Rostedt wrote:
> On Thu, 2 May 2019 19:31:29 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > Digging a little further, I pinpointed it out to being kretprobes. The
> > problem I believe is the use of kernel_stack_pointer() which does some
> > magic on x86_32. kretprobes uses this to hijack the return address of
> > the function (much like the function graph tracer does). I do have code
> > that would allow kretprobes to use the function graph tracer instead,
> > but that's still in progress (almost done!). But still, we should not
> > have this break the use of kernel_stack_pointer() either.
> > 
> > Adding some printks in that code, it looks to be returning "&regs->sp"
> > which I think we changed.
> >
> 
> This appears to fix it!
> 
> -- Steve
> 
> diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
> index 4b8ee05dd6ad..600ead178bf4 100644
> --- a/arch/x86/kernel/ptrace.c
> +++ b/arch/x86/kernel/ptrace.c
> @@ -171,8 +171,12 @@ unsigned long kernel_stack_pointer(struct pt_regs *regs)
>  	unsigned long sp = (unsigned long)&regs->sp;
>  	u32 *prev_esp;
>  
> -	if (context == (sp & ~(THREAD_SIZE - 1)))
> +	if (context == (sp & ~(THREAD_SIZE - 1))) {
> +		/* int3 code adds a gap */
> +		if (sp == regs->sp - 5*4)
> +			return regs->sp;
>  		return sp;
> +	}
>  
>  	prev_esp = (u32 *)(context);
>  	if (*prev_esp)

OMG, WTF, ARGH... That code is fsck'ing horrible. I'd almost argue to
always do the INT3 thing, just to avoid games like that.

That said; for normal traps &regs->sp is indeed the previous context --
if it doesn't fall off the stack. Your hack detects the regular INT3
frame. Howver if regs->sp has been modified (int3_emulate_push, for
example) your detectoring comes unstuck.

Now, it is rather unlikely these two code paths interact, but just to be
safe, something like so might be more reliable:


diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 4b8ee05dd6ad..aceaad0cc9a9 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -163,6 +163,9 @@ static inline bool invalid_selector(u16 value)
  * stack pointer we fall back to regs as stack if no previous stack
  * exists.
  *
+ * There is a special case for INT3, there we construct a full pt_regs
+ * environment. We can detect this case by a high bit in regs->cs
+ *
  * This is valid only for kernel mode traps.
  */
 unsigned long kernel_stack_pointer(struct pt_regs *regs)
@@ -171,6 +174,9 @@ unsigned long kernel_stack_pointer(struct pt_regs *regs)
 	unsigned long sp = (unsigned long)&regs->sp;
 	u32 *prev_esp;
 
+	if (regs->__csh & (1 << 13)) /* test CS_FROM_INT3 */
+		return regs->sp;
+
 	if (context == (sp & ~(THREAD_SIZE - 1)))
 		return sp;
 
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -388,6 +388,7 @@
 
 #define CS_FROM_ENTRY_STACK	(1 << 31)
 #define CS_FROM_USER_CR3	(1 << 30)
+#define CS_FROM_INT3		(1 << 29)
 
 .macro SWITCH_TO_KERNEL_STACK
 
@@ -1515,6 +1516,9 @@ ENTRY(int3)
 
 	add	$16, 12(%esp) # point sp back at the previous context
 
+	andl	$0x0000ffff, 4(%esp)
+	orl	$CS_FROM_INT3, 4(%esp)
+
 	pushl	$-1				# orig_eax; mark as interrupt
 
 	SAVE_ALL
