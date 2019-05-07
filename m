From: jpoimboe@redhat.com (Josh Poimboeuf)
Date: Tue, 7 May 2019 14:14:12 -0500
Subject: [RFC][PATCH 2/3] x86_64: Allow breakpoints to emulate call
 functions
In-Reply-To: <20190507150153.7a5d376d@gandalf.local.home>
References: <20190507174227.673261270@goodmis.org>
 <20190507174400.219947724@goodmis.org>
 <20190507175342.fskdj2qidpao65qi@treble>
 <20190507150153.7a5d376d@gandalf.local.home>
Message-ID: <20190507191412.n4uhoyfwagagyfwi@treble>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507191412.1SJ97dmf1cmeRpaaL-qU9yhF56Pu3LhcI-tNCdCaHyg@z>

On Tue, May 07, 2019@03:01:53PM -0400, Steven Rostedt wrote:
> How's this?
> 
> -- Steve
> 
> From d29dc2e9e0275c9857932b80cebc01551b669efb Mon Sep 17 00:00:00 2001
> From: Peter Zijlstra <peterz at infradead.org>
> Date: Wed, 1 May 2019 15:11:17 +0200
> Subject: [PATCH] x86_64: Allow breakpoints to emulate call functions
> 
> In order to allow breakpoints to emulate call functions, they need to push
> the return address onto the stack. But because the breakpoint exception
> frame is added to the stack when the breakpoint is hit, there's no room to
> add the address onto the stack and return to the address of the emulated
> called funtion.

The 2nd sentence can probably be removed since it's technically no
longer true, thanks to the previous patch.

> This helper functions are added:

"These"

> 
>   int3_emulate_jmp(): changes the location of the regs->ip to return there.
> 
>  (The next two are only for x86_64)
>   int3_emulate_push(): to push the address onto the gap in the stack
>   int3_emulate_call(): push the return address and change regs->ip
> 
> Cc: Andy Lutomirski <luto at kernel.org>
> Cc: Nicolai Stange <nstange at suse.de>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Ingo Molnar <mingo at redhat.com>
> Cc: Borislav Petkov <bp at alien8.de>
> Cc: "H. Peter Anvin" <hpa at zytor.com>
> Cc: the arch/x86 maintainers <x86 at kernel.org>
> Cc: Josh Poimboeuf <jpoimboe at redhat.com>
> Cc: Jiri Kosina <jikos at kernel.org>
> Cc: Miroslav Benes <mbenes at suse.cz>
> Cc: Petr Mladek <pmladek at suse.com>
> Cc: Joe Lawrence <joe.lawrence at redhat.com>
> Cc: Shuah Khan <shuah at kernel.org>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk at oracle.com>
> Cc: Tim Chen <tim.c.chen at linux.intel.com>
> Cc: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
> Cc: Mimi Zohar <zohar at linux.ibm.com>
> Cc: Juergen Gross <jgross at suse.com>
> Cc: Nick Desaulniers <ndesaulniers at google.com>
> Cc: Nayna Jain <nayna at linux.ibm.com>
> Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
> Cc: Joerg Roedel <jroedel at suse.de>
> Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest at vger.kernel.org>
> Cc: stable at vger.kernel.org
> Fixes: b700e7f03df5 ("livepatch: kernel: add support for live patching")
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
> [ Modified to only work for x86_64 and added comment to int3_emulate_push() ]
> Signed-off-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> ---
>  arch/x86/include/asm/text-patching.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
> index e85ff65c43c3..05861cc08787 100644
> --- a/arch/x86/include/asm/text-patching.h
> +++ b/arch/x86/include/asm/text-patching.h
> @@ -39,4 +39,32 @@ extern int poke_int3_handler(struct pt_regs *regs);
>  extern void *text_poke_bp(void *addr, const void *opcode, size_t len, void *handler);
>  extern int after_bootmem;
>  
> +static inline void int3_emulate_jmp(struct pt_regs *regs, unsigned long ip)
> +{
> +	regs->ip = ip;
> +}
> +
> +#define INT3_INSN_SIZE 1
> +#define CALL_INSN_SIZE 5
> +
> +#ifdef CONFIG_X86_64
> +static inline void int3_emulate_push(struct pt_regs *regs, unsigned long val)
> +{
> +	/*
> +	 * The int3 handler in entry_64.S adds a gap between the
> +	 * stack where the break point happened, and the saving of
> +	 * pt_regs. We can extend the original stack because of
> +	 * this gap. See the idtentry macro's create_gap option.
> +	 */
> +	regs->sp -= sizeof(unsigned long);
> +	*(unsigned long *)regs->sp = val;

Looks good.

-- 
Josh
