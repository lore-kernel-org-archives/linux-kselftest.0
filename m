From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 1 May 2019 23:24:12 -0400
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <20190501203152.397154664@goodmis.org>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
Message-ID: <20190501232412.1196ef18@oasis.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502032412.cuq5KaC7Jo6y0qjGZsT_Iic5ez5WuwSOBpLmjPnyJjo@z>

On Wed, 01 May 2019 16:28:31 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
> index d309f30cf7af..50bbf4035baf 100644
> --- a/arch/x86/entry/entry_32.S
> +++ b/arch/x86/entry/entry_32.S
> @@ -1478,6 +1478,17 @@ ENTRY(int3)
>  	ASM_CLAC
>  	pushl	$-1				# mark this as an int
>  
> +#ifdef CONFIG_VM86
> +	testl	$X86_EFLAGS_VM, PT_EFLAGS(%esp)
> +	jnz	.Lfrom_usermode_no_gap
> +#endif
> +	testl	$SEGMENT_RPL_MASK, PT_CS(%esp)
> +	jnz	.Lfrom_usermode_no_gap
> +	.rept 6
> +	pushl	5*4(%esp)
> +	.endr
> +.Lfrom_usermode_no_gap:
> +
>  	SAVE_ALL switch_stacks=1
>  	ENCODE_FRAME_POINTER
>  	TRACE_IRQS_OFF

This failed to work on 32 bit at all (crashed and burned badly - triple
fault!). Looking at it I found one issue. This code is done before the
regs are saved, and PT_EFLAGS(%esp) and PT_CS(%esp) expect %esp to
contain them. I applied this patch against this but it didn't totally
fix the problems. It still constantly crashes (although, with this
update I can put in some printks to get some ideas). I haven't spent
too much time on it, but it looks like there's an issue with the
entry-stack that int3 switches to. I'm not sure its handling the copy
well.

-- Steve

diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index 50bbf4035baf..4f427285e421 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -1479,10 +1479,10 @@ ENTRY(int3)
 	pushl	$-1				# mark this as an int
 
 #ifdef CONFIG_VM86
-	testl	$X86_EFLAGS_VM, PT_EFLAGS(%esp)
+	testl	$X86_EFLAGS_VM, PT_EFLAGS-PT_ORIG_EAX(%esp)
 	jnz	.Lfrom_usermode_no_gap
 #endif
-	testl	$SEGMENT_RPL_MASK, PT_CS(%esp)
+	testl	$SEGMENT_RPL_MASK, PT_CS-PT_ORIG_EAX(%esp)
 	jnz	.Lfrom_usermode_no_gap
 	.rept 6
 	pushl	5*4(%esp)
