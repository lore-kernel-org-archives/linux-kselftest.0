From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 2 May 2019 19:50:52 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190502193129.664c5b2e@gandalf.local.home>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
Message-ID: <20190502195052.0af473cf@gandalf.local.home>

On Thu, 2 May 2019 19:31:29 -0400
Steven Rostedt <rostedt at goodmis.org> wrote:

> Digging a little further, I pinpointed it out to being kretprobes. The
> problem I believe is the use of kernel_stack_pointer() which does some
> magic on x86_32. kretprobes uses this to hijack the return address of
> the function (much like the function graph tracer does). I do have code
> that would allow kretprobes to use the function graph tracer instead,
> but that's still in progress (almost done!). But still, we should not
> have this break the use of kernel_stack_pointer() either.
> 
> Adding some printks in that code, it looks to be returning "&regs->sp"
> which I think we changed.
>

This appears to fix it!

-- Steve

diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 4b8ee05dd6ad..600ead178bf4 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -171,8 +171,12 @@ unsigned long kernel_stack_pointer(struct pt_regs *regs)
 	unsigned long sp = (unsigned long)&regs->sp;
 	u32 *prev_esp;
 
-	if (context == (sp & ~(THREAD_SIZE - 1)))
+	if (context == (sp & ~(THREAD_SIZE - 1))) {
+		/* int3 code adds a gap */
+		if (sp == regs->sp - 5*4)
+			return regs->sp;
 		return sp;
+	}
 
 	prev_esp = (u32 *)(context);
 	if (*prev_esp)
