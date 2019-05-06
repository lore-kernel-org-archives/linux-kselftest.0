From: peterz@infradead.org (Peter Zijlstra)
Date: Mon, 6 May 2019 16:22:54 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
References: <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
Message-ID: <20190506142254.GG2650@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506142254.o1tVYOhqMfAdp_Mq1jtiXqrymioPoH1kpdsPymNydWM@z>

On Mon, May 06, 2019@10:19:51AM +0200, Peter Zijlstra wrote:
> +.Lfrom_usermode_no_fixup_\@:
> +.endm
> +
> +.macro IRET_FRAME
> +
> +	/* orig_eax is already POP'ed when we're here */
> +
> +	testl $CS_FROM_KERNEL, 1*4(%esp)
> +	jz .Lfinished_frame_\@
> +
> +	pushl %eax
> +

>From there..

> +	lea 10*4(%esp), %eax	# address of <previous context>
> +	cmpl %eax, 4*4(%esp)	# if ->sp is unmodified
> +	jnz .Lmodified_sp_do_fixup_\@
> +
> +	/*
> +	 * Fast path; regs->sp wasn't modified, reuse the original IRET frame.
> +	 */
> +	pop %eax
> +	add $6*4, %esp
> +	jmp .Lfinished_frame_\@;
> +
> +.Lmodified_sp_do_fixup_\@:

... until here, needs to go, it is buggy. While a clever idea, it looses
updates to regs->ip and ->flags.

> +
> +	/*
> +	 * Reconstruct the 3 entry IRET frame right after the (modified)
> +	 * regs->sp without lowering %esp in between, such that an NMI in the
> +	 * middle doesn't scribble our stack.
> +	 */
> +	pushl	%ecx
> +	movl	5*4(%esp), %eax		# (modified) regs->sp
> +
> +	movl	4*4(%esp), %ecx		# flags
> +	movl	%ecx, -4(%eax)
> +
> +	movl	3*4(%esp), %ecx		# cs
> +	andl	$0x0000ffff, %ecx
> +	movl	%ecx, -8(%eax)
> +
> +	movl	2*4(%esp), %ecx		# ip
> +	movl	%ecx, -12(%eax)
> +
> +	movl	1*4(%esp), %ecx		# eax
> +	movl	%ecx, -16(%eax)
> +
> +	popl	%ecx
> +	lea	-16(%eax), %esp
> +	popl	%eax
> +
> +.Lfinished_frame_\@:
> +.endm
