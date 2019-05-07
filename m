From: David.Laight@ACULAB.COM (David Laight)
Date: Tue, 7 May 2019 09:18:51 +0000
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190507085753.GO2606@hirez.programming.kicks-ass.net>
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
 <20190507085753.GO2606@hirez.programming.kicks-ass.net>
Message-ID: <b34aa38bdfe84263bc20b60761bf6005@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507091851.AgNpatVGXVBh15YIaVMK1-pHFADOU2GiXLW-BkguXZ0@z>

From: Peter Zijlstra
> Sent: 07 May 2019 09:58
...
> +	/*
> +	 * When we're here from kernel mode; the (exception) stack looks like:
> +	 *
> +	 * 4*4(%esp) - <previous context>
> +	 * 3*4(%esp) - flags
> +	 * 2*4(%esp) - cs
> +	 * 1*4(%esp) - ip
> +	 * 0*4(%esp) - orig_eax

Am I right in thinking that this is the only 'INT3' stack frame that
needs to be 'fiddled' with?
And that the 'emulate a call instruction' has verified that is the case??
So the %cs is always the kernel %cs.

If the 'call target' address is saved in a per-cpu location it ought
to be possible to get the code that returns from the INT3 with the
call target address (or zero) in %ax.
If non-zero, instead of 'pop %ax; iret' execute:
	xchg %eax, 4(%esp)   - swap function address and callers ip
	push 12(%esp)        - old flags
	mov  14(%esp),%eax   - callers address over flags
	popf                 - enables interrupts (etc)
	pop  %eax
	retf                 - Jump to called function and remove %cs

Nothing else needs to be moved.

	David

	

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
