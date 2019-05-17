From: bo.tong at intel.com (Tong, Bo)
Date: Fri, 17 May 2019 07:02:14 +0000
Subject: [PATCH v3] selftests/x86: Support Atom for syscall_arg_fault test
In-Reply-To: <263afb6f-48dc-fbe7-5b13-13ce3f322ecc@kernel.org>
References: <1555657855-31855-1-git-send-email-bo.tong@intel.com>
 <263afb6f-48dc-fbe7-5b13-13ce3f322ecc@kernel.org>
Message-ID: <D6542591582C6645851595B3517A02963F16F195@shsmsx102.ccr.corp.intel.com>

Is this patch going to be merged? Or still any blocking issue there?

Thanks,
Bo

-----Original Message-----
From: shuah [mailto:shuah at kernel.org] 
Sent: Friday, April 19, 2019 10:05 PM
To: Tong, Bo <bo.tong at intel.com>; luto at kernel.org; x86 at kernel.org
Cc: linux-kselftest at vger.kernel.org; linux-kernel at vger.kernel.org; skhan at linuxfoundation.org; shuah at kernel.org
Subject: Re: [PATCH v3] selftests/x86: Support Atom for syscall_arg_fault test

On 4/19/19 1:10 AM, Tong Bo wrote:
> Atom-based CPUs trigger stack fault when invoke 32-bit SYSENTER 
> instruction with invalid register values. So we also need SIGBUS handling in this case.
> 
> Following is assembly when the fault exception happens.
> 
> (gdb) disassemble $eip
> Dump of assembler code for function __kernel_vsyscall:
>     0xf7fd8fe0 <+0>:     push   %ecx
>     0xf7fd8fe1 <+1>:     push   %edx
>     0xf7fd8fe2 <+2>:     push   %ebp
>     0xf7fd8fe3 <+3>:     mov    %esp,%ebp
>     0xf7fd8fe5 <+5>:     sysenter
>     0xf7fd8fe7 <+7>:     int    $0x80
> => 0xf7fd8fe9 <+9>:     pop    %ebp
>     0xf7fd8fea <+10>:    pop    %edx
>     0xf7fd8feb <+11>:    pop    %ecx
>     0xf7fd8fec <+12>:    ret
> End of assembler dump.
> 
> According to Intel SDM, this could also be a Stack Segment Fault(#SS, 
> 12), except a normal Page Fault(#PF, 14). Especially, in section 6.9 
> of Vol.3A, both stack and page faults are within the 10th(lowest 
> priority) class, and as it said, "exceptions within each class are 
> implementation-dependent and may vary from processor to processor". 
> It's expected for processors like Intel Atom to trigger stack 
> fault(SIGBUS), while we get page fault(SIGSEGV) from common Core processors.
> 
> Signed-off-by: Tong Bo <bo.tong at intel.com>
> Acked-by: Andy Lutomirski <luto at kernel.org>
> ---
>   tools/testing/selftests/x86/syscall_arg_fault.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/syscall_arg_fault.c 
> b/tools/testing/selftests/x86/syscall_arg_fault.c
> index 7db4fc9..d2548401 100644
> --- a/tools/testing/selftests/x86/syscall_arg_fault.c
> +++ b/tools/testing/selftests/x86/syscall_arg_fault.c
> @@ -43,7 +43,7 @@ static sigjmp_buf jmpbuf;
>   
>   static volatile sig_atomic_t n_errs;
>   
> -static void sigsegv(int sig, siginfo_t *info, void *ctx_void)
> +static void sigsegv_or_sigbus(int sig, siginfo_t *info, void 
> +*ctx_void)
>   {
>   	ucontext_t *ctx = (ucontext_t*)ctx_void;
>   
> @@ -73,7 +73,13 @@ int main()
>   	if (sigaltstack(&stack, NULL) != 0)
>   		err(1, "sigaltstack");
>   
> -	sethandler(SIGSEGV, sigsegv, SA_ONSTACK);
> +	sethandler(SIGSEGV, sigsegv_or_sigbus, SA_ONSTACK);
> +	/*
> +	 * The actual exception can vary.  On Atom CPUs, we get #SS
> +	 * instead of #PF when the vDSO fails to access the stack when
> +	 * ESP is too close to 2^32, and #SS causes SIGBUS.
> +	 */
> +	sethandler(SIGBUS, sigsegv_or_sigbus, SA_ONSTACK);
>   	sethandler(SIGILL, sigill, SA_ONSTACK);
>   
>   	/*
> 

In case there is a dependency on x86 tree, here is my Ack

Acked-by: Shuah Khan <skhan at linuxfoundation.org>

thanks,
-- Shuah
