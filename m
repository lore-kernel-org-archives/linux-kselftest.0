From: luto at kernel.org (Andy Lutomirski)
Date: Thu, 7 Mar 2019 10:09:51 -0800
Subject: [PATCH] selftests/x86: Support Atom for syscall_arg_fault test
In-Reply-To: <1551947140-22166-1-git-send-email-bo.tong@intel.com>
References: <1551947140-22166-1-git-send-email-bo.tong@intel.com>
Message-ID: <CALCETrXvs1thKLHgnHOe94o1kAunxTSw8k-v9_GgoodB=R9M5g@mail.gmail.com>

On Thu, Mar 7, 2019 at 12:22 AM Tong Bo <bo.tong at intel.com> wrote:
>
> Atom-based CPUs trigger stack fault when invoke 32-bit SYSENTER instruction
> with invalid register values. So we also need sigbus handling in this case.
>
> Following is assembly when the fault expception happens.
>
> (gdb) disassemble $eip
> Dump of assembler code for function __kernel_vsyscall:
>    0xf7fd8fe0 <+0>:     push   %ecx
>    0xf7fd8fe1 <+1>:     push   %edx
>    0xf7fd8fe2 <+2>:     push   %ebp
>    0xf7fd8fe3 <+3>:     mov    %esp,%ebp
>    0xf7fd8fe5 <+5>:     sysenter
>    0xf7fd8fe7 <+7>:     int    $0x80
> => 0xf7fd8fe9 <+9>:     pop    %ebp
>    0xf7fd8fea <+10>:    pop    %edx
>    0xf7fd8feb <+11>:    pop    %ecx
>    0xf7fd8fec <+12>:    ret
> End of assembler dump.
>
> Accroding to Intel SDM, this could also be a Stack Segment Fault(#SS, 12),
> except a normal Page Fault(#PF, 14).

Really?  What is in the SS register that makes a stack segment fault
possible?  Is it because we're overflowing ESP?  Would a value like -5
instead of -1 in the register change things?

Anyway, I'm okay with the patch, but I think that you should improve
the comment:

> -       sethandler(SIGSEGV, sigsegv, SA_ONSTACK);
> +       sethandler(SIGSEGV, sigsegv_or_sigbus, SA_ONSTACK);
> +       /* Atom CPUs may trigger sigbus for below SYSENTER exception case */
> +       sethandler(SIGBUS, sigsegv_or_sigbus, SA_ONSTACK);

How about "The actual exception can vary.  On Atom CPUs, we get #SS
instead of #PF when the vDSO fails to access the stack when ESP is too
close to 2^32, and #SS causes SIGBUS".

--Andy
