From: jpoimboe@redhat.com (Josh Poimboeuf)
Date: Wed, 8 May 2019 06:54:16 -0500
Subject: [PATCH 2/4] x86/kprobes: Fix frame pointer annotations
In-Reply-To: <20190508080612.721269814@infradead.org>
References: <20190508074901.982470324@infradead.org>
 <20190508080612.721269814@infradead.org>
Message-ID: <20190508115416.nblx7c2kocidpytm@treble>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190508115416.8XNBY4QV8TP9Y6A60mnYt5pFzuowfddgEts9hEh8IoY@z>

On Wed, May 08, 2019@09:49:03AM +0200, Peter Zijlstra wrote:
> The kprobe trampolines have a FRAME_POINTER annotation that makes no
> sense. It marks the frame in the middle of pt_regs, at the place of
> saving BP.
> 
> Change it to mark the pt_regs frame as per the ENCODE_FRAME_POINTER
> from the respective entry_*.S.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz at infradead.org>
> ---
>  arch/x86/kernel/kprobes/common.h |   32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> --- a/arch/x86/kernel/kprobes/common.h
> +++ b/arch/x86/kernel/kprobes/common.h
> @@ -6,14 +6,15 @@
>  
>  #include <asm/asm.h>
>  
> +#ifdef CONFIG_X86_64
> +
>  #ifdef CONFIG_FRAME_POINTER
> -# define SAVE_RBP_STRING "	push %" _ASM_BP "\n" \
> -			 "	mov  %" _ASM_SP ", %" _ASM_BP "\n"
> +#define ENCODE_FRAME_POINTER			\
> +	"	leaq 1(%rsp), %rbp\n"
>  #else
> -# define SAVE_RBP_STRING "	push %" _ASM_BP "\n"
> +#define ENCODE_FRAME_POINTER
>  #endif

> +#ifdef CONFIG_FRAME_POINTER
> +#define ENCODE_FRAME_POINTER			\
> +	"	movl %esp, %ebp\n"		\
> +	"	andl $0x7fffffff, %ebp\n"
> +#else
> +#define ENCODE_FRAME_POINTER
> +#endif

We should put these macros in a header file somewhere (including
stringified versions).

-- 
Josh
