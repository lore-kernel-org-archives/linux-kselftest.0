From: jpoimboe@redhat.com (Josh Poimboeuf)
Date: Tue, 7 May 2019 12:56:55 -0500
Subject: [RFC][PATCH 1/3] x86_64: Add gap to int3 to allow for call
 emulation
In-Reply-To: <20190507174400.064350937@goodmis.org>
References: <20190507174227.673261270@goodmis.org>
 <20190507174400.064350937@goodmis.org>
Message-ID: <20190507175655.u3kcvedpfao4rchj@treble>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507175655.Tbi5T6S_A62pXOA4rwZ4qsEiszAx0kd4OGs64fsO-zA@z>

On Tue, May 07, 2019@01:42:28PM -0400, Steven Rostedt wrote:
> From: Josh Poimboeuf <jpoimboe at redhat.com>
> 
> To allow an int3 handler to emulate a call instruction, it must be able to
> push a return address onto the stack. Add a gap to the stack to allow the
> int3 handler to push the return address and change the return from int3 to
> jump straight to the emulated called function target.
> 
> Link: http://lkml.kernel.org/r/20181130183917.hxmti5josgq4clti at treble
> Link: http://lkml.kernel.org/r/20190502162133.GX2623 at hirez.programming.kicks-ass.net
> 
> [
>   Note, this is needed to allow Live Kernel Patching to not miss calling a
>   patched function when tracing is enabled. -- Steven Rostedt
> ]
> 
> Cc: stable at vger.kernel.org
> Fixes: b700e7f03df5 ("livepatch: kernel: add support for live patching")
> Signed-off-by: Josh Poimboeuf <jpoimboe at redhat.com>
> Signed-off-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> ---
>  arch/x86/entry/entry_64.S | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> index 1f0efdb7b629..00df6b135ab1 100644
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -879,7 +879,7 @@ apicinterrupt IRQ_WORK_VECTOR			irq_work_interrupt		smp_irq_work_interrupt
>   * @paranoid == 2 is special: the stub will never switch stacks.  This is for
>   * #DF: if the thread stack is somehow unusable, we'll still get a useful OOPS.
>   */
> -.macro idtentry sym do_sym has_error_code:req paranoid=0 shift_ist=-1
> +.macro idtentry sym do_sym has_error_code:req paranoid=0 shift_ist=-1 create_gap=0
>  ENTRY(\sym)
>  	UNWIND_HINT_IRET_REGS offset=\has_error_code*8
>  
> @@ -899,6 +899,20 @@ ENTRY(\sym)
>  	jnz	.Lfrom_usermode_switch_stack_\@
>  	.endif
>  
> +	.if \create_gap == 1
> +	/*
> +	 * If coming from kernel space, create a 6-word gap to allow the static
> +	 * call #BP handler to emulate a call instruction.

Might as well refer to it as the int3 handler, since that's what the
rest of the code calls it.  Also, no static calls yet :-)  So:

s/static call #BP handler/int3 handler/

-- 
Josh
