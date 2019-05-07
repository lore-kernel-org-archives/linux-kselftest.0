From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 7 May 2019 11:27:31 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507085753.GO2606@hirez.programming.kicks-ass.net>
References: <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190507085753.GO2606@hirez.programming.kicks-ass.net>
Message-ID: <20190507092731.GH2650@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507092731.2JGs2-sk5DQML_6_1wn_8zTZcWKMuqHka_radPsjrRw@z>

On Tue, May 07, 2019@10:57:53AM +0200, Peter Zijlstra wrote:
> diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
> index 9e4fa2484d10..28d8ba3b9add 100644
> --- a/arch/x86/kernel/kprobes/core.c
> +++ b/arch/x86/kernel/kprobes/core.c
> @@ -731,29 +731,27 @@ asm(
>  	".global kretprobe_trampoline\n"
>  	".type kretprobe_trampoline, @function\n"
>  	"kretprobe_trampoline:\n"
> -#ifdef CONFIG_X86_64
>  	/* We don't bother saving the ss register */
> +#ifdef CONFIG_X86_64
>  	"	pushq %rsp\n"
>  	"	pushfq\n"
>  	SAVE_REGS_STRING
>  	"	movq %rsp, %rdi\n"
>  	"	call trampoline_handler\n"
>  	/* Replace saved sp with true return address. */
> -	"	movq %rax, 152(%rsp)\n"
> +	"	movq %rax, 19*8(%rsp)\n"
>  	RESTORE_REGS_STRING
>  	"	popfq\n"
>  #else
> -	"	pushf\n"
> +	"	pushl %esp\n"
> +	"	pushfl\n"
>  	SAVE_REGS_STRING
>  	"	movl %esp, %eax\n"
>  	"	call trampoline_handler\n"
> -	/* Move flags to cs */
> -	"	movl 56(%esp), %edx\n"
> -	"	movl %edx, 52(%esp)\n"
> -	/* Replace saved flags with true return address. */
> -	"	movl %eax, 56(%esp)\n"
> +	/* Replace saved sp with true return address. */
> +	"	movl %eax, 15*4(%esp)\n"
>  	RESTORE_REGS_STRING
> -	"	popf\n"
> +	"	popfl\n"
>  #endif
>  	"	ret\n"
>  	".size kretprobe_trampoline, .-kretprobe_trampoline\n"

> diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
> index f14262952015..c1010207d036 100644
> --- a/arch/x86/kernel/kprobes/opt.c
> +++ b/arch/x86/kernel/kprobes/opt.c
> @@ -115,14 +115,15 @@ asm (
>  			"optprobe_template_call:\n"
>  			ASM_NOP5
>  			/* Move flags to rsp */
> -			"	movq 144(%rsp), %rdx\n"
> -			"	movq %rdx, 152(%rsp)\n"
> +			"	movq 18*8(%rsp), %rdx\n"
> +			"	movq %rdx, 19*8(%rsp)\n"
>  			RESTORE_REGS_STRING
>  			/* Skip flags entry */
>  			"	addq $8, %rsp\n"
>  			"	popfq\n"
>  #else /* CONFIG_X86_32 */
> -			"	pushf\n"
> +			"	pushl %esp\n"
> +			"	pushfl\n"
>  			SAVE_REGS_STRING
>  			"	movl %esp, %edx\n"
>  			".global optprobe_template_val\n"
> @@ -131,9 +132,13 @@ asm (
>  			".global optprobe_template_call\n"
>  			"optprobe_template_call:\n"
>  			ASM_NOP5
> +			/* Move flags into esp */
> +			"	movl 14*4(%esp), %edx\n"
> +			"	movl %edx, 15*4(%esp)\n"
>  			RESTORE_REGS_STRING
> -			"	addl $4, %esp\n"	/* skip cs */
> -			"	popf\n"
> +			/* Skip flags entry */
> +			"	addl $4, %esp\n"
> +			"	popfl\n"
>  #endif
>  			".global optprobe_template_end\n"
>  			"optprobe_template_end:\n"

FWIW, both these trampolines assume a kprobe will not
int3_emulate_{push/call}(), for both bitnesses.

But then; I'm thinking kprobes should be inspection only and not modify
things. So that might just be good enough.
