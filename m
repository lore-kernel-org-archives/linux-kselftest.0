From: nstange@suse.de (Nicolai Stange)
Date: Wed, 01 May 2019 10:26:32 +0200
Subject: [RFC][PATCH v2] ftrace/x86: Emulate call function while updating
 in breakpoint handler
In-Reply-To: <20190430175334.423821c0@gandalf.local.home> (Steven Rostedt's
 message of "Tue, 30 Apr 2019 17:53:34 -0400")
References: <20190428133826.3e142cfd@oasis.local.home>
 <CAHk-=wjphmrQXMfbw9j-tTzDvJ+Uc+asMHdFa=1_1xZoYVUC=g@mail.gmail.com>
 <CALCETrXvmZPHsfRVnW0AtyddfN-2zaCmWn+FsrF6XPTOFd_Jmw@mail.gmail.com>
 <CAHk-=whtt4K2f0KPtG-4Pykh3FK8UBOjD8jhXCUKB5nWDj_YRA@mail.gmail.com>
 <CALCETrWELBCK-kqX5FCEDVUy8kCT-yVu7m_7Dtn=GCsHY0Du5A@mail.gmail.com>
 <CAHk-=wgewK4eFhF3=0RNtk1KQjMANFH6oDE=8m=84RExn2gxhw@mail.gmail.com>
 <CAHk-=whay7eN6+2gZjY-ybRbkbcqAmgrLwwszzHx8ws3c=S-MA@mail.gmail.com>
 <CALCETrXzVU0Q7u1q=QFPaDr=aojjF5cjbOi9CxxXnp5GqTqsWA@mail.gmail.com>
 <CAHk-=wg1QPz0m+7jnVcjQgkySUQLzAXE8_PZARV-vWYK27LB=w@mail.gmail.com>
 <20190430135602.GD2589@hirez.programming.kicks-ass.net>
 <CAHk-=wg7vUGMRHyBsLig6qiPK0i4_BK3bRrTN+HHHziUGg1P_A@mail.gmail.com>
 <CALCETrXujRWxwkgAwB+8xja3N9H22t52AYBYM_mbrjKKZ624Eg@mail.gmail.com>
 <20190430130359.330e895b@gandalf.local.home>
 <20190430132024.0f03f5b8@gandalf.local.home>
 <20190430134913.4e29ce72@gandalf.local.home>
 <20190430175334.423821c0@gandalf.local.home>
Message-ID: <87muk6vavb.fsf@suse.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501082632.MqY4SbeY3n4ArPnsjaguCHjs27T-9MyOAmQKeKtKm7E@z>

Hi Steve,

many thanks for moving this forward!


Steven Rostedt <rostedt at goodmis.org> writes:

>
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index ef49517f6bb2..9160f5cc3b6d 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -17,6 +17,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/ftrace.h>
>  #include <linux/percpu.h>
> +#include <linux/frame.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
> @@ -232,6 +233,9 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>  
>  static unsigned long ftrace_update_func;
>  
> +/* Used within inline asm below */
> +unsigned long ftrace_update_func_call;
> +
>  static int update_ftrace_func(unsigned long ip, void *new)
>  {
>  	unsigned char old[MCOUNT_INSN_SIZE];
> @@ -259,6 +263,8 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>  	unsigned char *new;
>  	int ret;
>  
> +	ftrace_update_func_call = (unsigned long)func;
> +
>  	new = ftrace_call_replace(ip, (unsigned long)func);
>  	ret = update_ftrace_func(ip, new);
>  
> @@ -280,6 +286,125 @@ static nokprobe_inline int is_ftrace_caller(unsigned long ip)
>  	return 0;
>  }
>  
> +/*
> + * We need to handle the "call func1" -> "call func2" case.
> + * Just skipping the call is not sufficient as it will be like
> + * changing to "nop" first and then updating the call. But some
> + * users of ftrace require calls never to be missed.
> + *
> + * To emulate the call while converting the call site with a breakpoint,
> + * some trampolines are used along with per CPU buffers.
> + * There are three trampolines for the call sites and three trampolines
> + * for the updating of the call in ftrace trampoline. The three
> + * trampolines are:
> + *
> + * 1) Interrupts are enabled when the breakpoint is hit
> + * 2) Interrupts are disabled when the breakpoint is hit
> + * 3) The breakpoint was hit in an NMI
> + *
> + * As per CPU data is used, interrupts must be disabled to prevent them
> + * from corrupting the data. A separate NMI trampoline is used for the
> + * NMI case. If interrupts are already disabled, then the return path
> + * of where the breakpoint was hit (saved in the per CPU data) is pushed
> + * on the stack and then a jump to either the ftrace_caller (which will
> + * loop through all registered ftrace_ops handlers depending on the ip
> + * address), or if its a ftrace trampoline call update, it will call
> + * ftrace_update_func_call which will hold the call that should be
> + * called.
> + */
> +extern asmlinkage void ftrace_emulate_call_irqon(void);
> +extern asmlinkage void ftrace_emulate_call_irqoff(void);
> +extern asmlinkage void ftrace_emulate_call_nmi(void);
> +extern asmlinkage void ftrace_emulate_call_update_irqoff(void);
> +extern asmlinkage void ftrace_emulate_call_update_irqon(void);
> +extern asmlinkage void ftrace_emulate_call_update_nmi(void);
> +
> +static DEFINE_PER_CPU(void *, ftrace_bp_call_return);
> +static DEFINE_PER_CPU(void *, ftrace_bp_call_nmi_return);

Andy mentioned #DB and #MC exceptions here:
https://lkml.kernel.org/r/C55DED25-C60D-4731-9A6B-92BDA8771766 at amacapital.net

I think that #DB won't be possible, provided the trampolines below get
tagged as NOKPROBE (do_int3() and ftrace_int3_handler() already have
it).

It's highly theoretic, but tracing do_machine_check() could clobber
ftrace_bp_call_return or ftrace_bp_call_nmi_return?


> +#ifdef CONFIG_SMP
> +#ifdef CONFIG_X86_64
> +# define BP_CALL_RETURN		"%gs:ftrace_bp_call_return"
> +# define BP_CALL_NMI_RETURN	"%gs:ftrace_bp_call_nmi_return"
> +#else
> +# define BP_CALL_RETURN		"%fs:ftrace_bp_call_return"
> +# define BP_CALL_NMI_RETURN	"%fs:ftrace_bp_call_nmi_return"
> +#endif
> +#else /* SMP */
> +# define BP_CALL_RETURN		"ftrace_bp_call_return"
> +# define BP_CALL_NMI_RETURN	"ftrace_bp_call_nmi_return"
> +#endif
> +
> +/* To hold the ftrace_caller address to push on the stack */
> +void *ftrace_caller_func = (void *)ftrace_caller;

The live patching ftrace_ops need ftrace_regs_caller.


> +
> +asm(
> +	".text\n"
> +
> +	/* Trampoline for function update with interrupts enabled */
> +	".global ftrace_emulate_call_irqoff\n"
> +	".type ftrace_emulate_call_irqoff, @function\n"
> +	"ftrace_emulate_call_irqoff:\n\t"
> +		"push "BP_CALL_RETURN"\n\t"
> +		"push ftrace_caller_func\n"
> +		"sti\n\t"
> +		"ret\n\t"
> +	".size ftrace_emulate_call_irqoff, .-ftrace_emulate_call_irqoff\n"
> +
> +	/* Trampoline for function update with interrupts disabled*/
> +	".global ftrace_emulate_call_irqon\n"

The naming is perhaps a bit confusing, i.e. "update with interrupts
disabled" vs. "irqon"... How about swapping irqoff<->irqon?

Thanks,

Nicolai


> +	".type ftrace_emulate_call_irqon, @function\n"
> +	"ftrace_emulate_call_irqon:\n\t"
> +		"push "BP_CALL_RETURN"\n\t"
> +		"push ftrace_caller_func\n"
> +		"ret\n\t"
> +	".size ftrace_emulate_call_irqon, .-ftrace_emulate_call_irqon\n"
> +
> +	/* Trampoline for function update in an NMI */
> +	".global ftrace_emulate_call_nmi\n"
> +	".type ftrace_emulate_call_nmi, @function\n"
> +	"ftrace_emulate_call_nmi:\n\t"
> +		"push "BP_CALL_NMI_RETURN"\n\t"
> +		"push ftrace_caller_func\n"
> +		"ret\n\t"
> +	".size ftrace_emulate_call_nmi, .-ftrace_emulate_call_nmi\n"
> +

-- 
SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton,
HRB 21284 (AG Nürnberg)
