From: luto at kernel.org (Andy Lutomirski)
Date: Thu, 14 Mar 2019 12:55:37 -0700
Subject: [PATCH v2] selftests/x86: Support Atom for syscall_arg_fault test
In-Reply-To: <1552056945-29139-1-git-send-email-bo.tong@intel.com>
References: <1552056945-29139-1-git-send-email-bo.tong@intel.com>
Message-ID: <CALCETrWpWJgM2dJnB1d7-YJUCye4KwMta3grqsSEgKDvGqD1=g@mail.gmail.com>

On Fri, Mar 8, 2019 at 6:52 AM Tong Bo <bo.tong at intel.com> wrote:
>
> Atom-based CPUs trigger stack fault when invoke 32-bit SYSENTER instruction
> with invalid register values. So we also need SIGBUS handling in this case.
>
> Following is assembly when the fault exception happens.
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
> According to Intel SDM, this could also be a Stack Segment Fault(#SS, 12),
> except a normal Page Fault(#PF, 14). Especially, in section 6.9 of Vol.3A,
> both stack and page faults are within the 10th(lowest priority) class, and
> as it said, "exceptions within each class are implementation-dependent and
> may vary from processor to processor". It's expected for processors like
> Intel Atom to trigger stack fault(SIGBUS), while we get page fault(SIGSEGV)
> from common Core processors.

Acked-by: Andy Lutomirski <luto at kernel.org>

but:

> -       sethandler(SIGSEGV, sigsegv, SA_ONSTACK);
> +       sethandler(SIGSEGV, sigsegv_or_sigbus, SA_ONSTACK);
> +       /* The actual exception can vary.  On Atom CPUs, we get #SS

Can whoever commits this fix the comment formatting?  That should be:

/*
 * first line here

--Andy
