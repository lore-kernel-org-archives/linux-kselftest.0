From: rostedt at goodmis.org (Steven Rostedt)
Date: Wed, 1 May 2019 14:58:24 -0400
Subject: [RFC][PATCH] ftrace/x86: Emulate call function while updating
 in breakpoint handler
In-Reply-To: <20190501131117.GW2623@hirez.programming.kicks-ass.net>
References: <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
 <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <CAHk-=wjJ8D74+FDcXGL65Q9aB0cc7B4vr2s2rS6V4d4a3hU-1Q@mail.gmail.com>
 <20190501131117.GW2623@hirez.programming.kicks-ass.net>
Message-ID: <20190501145824.08aed43a@gandalf.local.home>

On Wed, 1 May 2019 15:11:17 +0200
Peter Zijlstra <peterz at infradead.org> wrote:

> On Tue, Apr 30, 2019 at 11:33:21AM -0700, Linus Torvalds wrote:
> > Anyway, since Andy really likes the entry code change, can we have
> > that patch in parallel and judge the difference that way? Iirc, that
> > was x86-64 specific too.  
> 
> Here goes, compile tested only...
> 
> It obviously needs a self-test, but that shoulnd't be too hard to
> arrange.
> 

I was able to get it applied (with slight tweaking) but it then
crashed. But that was due to incorrect updates in the
ftrace_int3_handler().

> ---
>  arch/x86/entry/entry_32.S            |  7 +++++++
>  arch/x86/entry/entry_64.S            | 14 ++++++++++++--
>  arch/x86/include/asm/text-patching.h | 20 ++++++++++++++++++++
>  arch/x86/kernel/ftrace.c             | 24 +++++++++++++++++++-----
>  4 files changed, 58 insertions(+), 7 deletions(-)


>  #endif /* _ASM_X86_TEXT_PATCHING_H */
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index ef49517f6bb2..90d319687d7e 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -29,6 +29,7 @@
>  #include <asm/kprobes.h>
>  #include <asm/ftrace.h>
>  #include <asm/nops.h>
> +#include <asm/text-patching.h>
>  
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  
> @@ -231,6 +232,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec,
> unsigned long old_addr, }
>  
>  static unsigned long ftrace_update_func;
> +static unsigned long ftrace_update_func_call;
>  
>  static int update_ftrace_func(unsigned long ip, void *new)
>  {
> @@ -259,6 +261,8 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  	unsigned char *new;
>  	int ret;
>  
> +	ftrace_update_func_call = (unsigned long)func;
> +
>  	new = ftrace_call_replace(ip, (unsigned long)func);
>  	ret = update_ftrace_func(ip, new);
>  
> @@ -295,12 +299,19 @@ int ftrace_int3_handler(struct pt_regs *regs)
>  		return 0;
>  
>  	ip = regs->ip - 1;
> -	if (!ftrace_location(ip) && !is_ftrace_caller(ip))
> -		return 0;
> -
> -	regs->ip += MCOUNT_INSN_SIZE - 1;
> +	if (ftrace_location(ip)) {
> +		int3_emulate_call(regs, ftrace_update_func_call);

Should be:

		int3_emulate_call(regs, (unsigned long)ftrace_regs_caller);

> +		return 1;
> +	} else if (is_ftrace_caller(ip)) {
> +		if (!ftrace_update_func_call) {
> +			int3_emulate_jmp(regs, regs->ip - INT3_INSN_SIZE + CALL_INSN_SIZE);

I see what you did here, but I think:

			int3_emulate_jmp(regs, ip + CALL_INSN_SIZE);

looks better. But that said, we could in the beginning do:

	ip = regs->ip - INT3_INSN_SIZE;

instead of

	ip = regs->ip - 1;

I made these updates and posted them to Linus.

-- Steve


> +			return 1;
> +		}
> +		int3_emulate_call(regs, ftrace_update_func_call);
> +		return 1;
> +	}
>  
> -	return 1;
> +	return 0;
>  }
>  NOKPROBE_SYMBOL(ftrace_int3_handler);
>  
> @@ -859,6 +870,8 @@ void arch_ftrace_update_trampoline(struct
> ftrace_ops *ops) 
>  	func = ftrace_ops_get_func(ops);
>  
> +	ftrace_update_func_call = (unsigned long)func;
> +
>  	/* Do a safe modify in case the trampoline is executing */
>  	new = ftrace_call_replace(ip, (unsigned long)func);
>  	ret = update_ftrace_func(ip, new);
> @@ -960,6 +973,7 @@ static int ftrace_mod_jmp(unsigned long ip, void
> *func) {
>  	unsigned char *new;
>  
> +	ftrace_update_func_call = 0UL;
>  	new = ftrace_jmp_replace(ip, (unsigned long)func);
>  
>  	return update_ftrace_func(ip, new);
