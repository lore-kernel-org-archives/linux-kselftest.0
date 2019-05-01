From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 30 Apr 2019 21:35:17 -0400
Subject: [RFC][PATCH v2] ftrace/x86: Emulate call function while
 updating in breakpoint handler
In-Reply-To: <20190430175334.423821c0@gandalf.local.home>
References: <20190428133826.3e142cfd@oasis.local.home>
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
Message-ID: <20190430213517.7bcfaf8e@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190501013517.u9c6DZQwv83J27e39rTpS1ANr9IhNhQBgRubeuo3Ex8@z>

On Tue, 30 Apr 2019 17:53:34 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> +	if (ftrace_location(ip)) {
> +		/* A breakpoint at the beginning of the function was hit */
> +		if (in_nmi()) {
> +			/* NMIs have their own trampoline */
> +			this_cpu_write(ftrace_bp_call_nmi_return, (void *)ip + MCOUNT_INSN_SIZE);
> +			regs->ip = (unsigned long) ftrace_emulate_call_nmi;
> +			return 1;
> +		}
> +		this_cpu_write(ftrace_bp_call_return, (void *)ip + MCOUNT_INSN_SIZE);
> +		if (regs->flags & X86_EFLAGS_IF) {
> +			regs->flags &= ~X86_EFLAGS_IF;
> +			regs->ip = (unsigned long) ftrace_emulate_call_irqoff;
> +			/* Tell lockdep here we are enabling interrupts */
> +			trace_hardirqs_on();

This isn't good enough. The return from interrupt does call lockdep
saying interrupts are disabled. Need to add the lockdep tracking in the
asm as well.

Probably easier to move it from inline asm to ftrace_X.S and use the
lockdep TRACE_ON/OFF macros.

-- Steve




> +		} else {
> +			regs->ip = (unsigned long) ftrace_emulate_call_irqon;
> +		}
> +		return 1;
> +	} else if (is_ftrace_caller(ip)) {
> +		/* An ftrace trampoline is being updated */
> +		if (!ftrace_update_func_call) {
> +			/* If it's a jump, just need to skip it */
> +			regs->ip += MCOUNT_INSN_SIZE -1;
> +			return 1;
> +		}
> +		if (in_nmi()) {
> +			/* NMIs have their own trampoline */
> +			this_cpu_write(ftrace_bp_call_nmi_return, (void *)ip + MCOUNT_INSN_SIZE);
> +			regs->ip = (unsigned long) ftrace_emulate_call_update_nmi;
> +			return 1;
> +		}
> +		this_cpu_write(ftrace_bp_call_return, (void *)ip + MCOUNT_INSN_SIZE);
> +		if (regs->flags & X86_EFLAGS_IF) {
> +			regs->flags &= ~X86_EFLAGS_IF;
> +			regs->ip = (unsigned long) ftrace_emulate_call_update_irqoff;
> +			trace_hardirqs_on();
> +		} else {
> +			regs->ip = (unsigned long) ftrace_emulate_call_update_irqon;
> +		}
> +		return 1;
> +	}
>  
> -	return 1;
> +	return 0;
>  }
