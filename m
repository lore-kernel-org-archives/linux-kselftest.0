From: bo.tong at intel.com (Tong, Bo)
Date: Fri, 8 Mar 2019 14:20:07 +0000
Subject: [PATCH] selftests/x86: Support Atom for syscall_arg_fault test
In-Reply-To: <CALCETrXvs1thKLHgnHOe94o1kAunxTSw8k-v9_GgoodB=R9M5g@mail.gmail.com>
References: <1551947140-22166-1-git-send-email-bo.tong@intel.com>
 <CALCETrXvs1thKLHgnHOe94o1kAunxTSw8k-v9_GgoodB=R9M5g@mail.gmail.com>
Message-ID: <D6542591582C6645851595B3517A02963F14D73E@shsmsx102.ccr.corp.intel.com>

Hi, Andy

Thanks for your review and comments.

Yes, ESP is overflowed when we try to get 4 bytes from this reg, (i.e. 0xfffffff+4 exceeds the 32-bit bounds) at sysenter_entry.
If we change it with another value, like -5, Atom will trigger the same exception as Core processor. 

And, I appreciate your revised comments on the change and I'll update my patch later.

I'll share our detailed analysis on this issue for your reference.


From our experiment on various x86 platforms and debugging on our Broxton based platform, we strongly suspect Intel Atom® and Core® CPUs might trigger different exceptions when the same illegal memory access happens. As a result, kernel triggers different signals. In this case, we got SIGBUS on Atom, and SIGSEGV on Core.

1) Experiments
a) This case passed on desktop with Core based CPU (i3-7100), while failed on our Atom (Broxton) based platform with the same Linux image and the same test binary.
b) This case passed on desktop with Core based CPU (i7-7567U), while failed on our Atom (Apollo Lake) based platform with almost the same Android image and the same test binary.

2) Debugging
a) From GDB dump, we got the instructions when the signal is triggered:
Catchpoint 2 (signal SIGSEGV), 0xf7fd8fe9 in __kernel_vsyscall ()
(gdb) disassemble $eip
Dump of assembler code for function __kernel_vsyscall:
   0xf7fd8fe0 <+0>:     push   %ecx
   0xf7fd8fe1 <+1>:     push   %edx
   0xf7fd8fe2 <+2>:     push   %ebp
   0xf7fd8fe3 <+3>:     mov    %esp,%ebp
   0xf7fd8fe5 <+5>:     sysenter
   0xf7fd8fe7 <+7>:     int    $0x80
=> 0xf7fd8fe9 <+9>:     pop    %ebp                     // Case stopped here
   0xf7fd8fea <+10>:    pop    %edx
   0xf7fd8feb <+11>:    pop    %ecx
There is an article to explain what happened there: http://articles.manugarg.com/systemcallinlinux2_6.html 
Initiation: c processes (or C library on their behalf) call __kernel_vsyscall to execute system calls. Address of __kernel_vsyscall is not fixed. Kernel passes this address to userland processes using AT_SYSINFO elf parameter. AT_ elf parameters, a.k.a. elf auxiliary vectors, are loaded on the process stack at the time of startup, along with the process arguments and the environment variables. 
After moving to this address, registers %ecx, %edx and %ebp are saved on the user stack and %esp is copied to %ebp before executing sysenter. This %ebp later helps kernel in restoring userland stack back. After executing sysenter instruction, processor starts execution at sysenter_entry. 
b) From kernel code, we could get more details when this memory violation happened and as a result a signal was triggered:
i. For the sysenter instruction,  the test case is 32bit, and our kernel is 64bit, so it goes to arch/x86/entry/entry_64_compact.S:
ENTRY(entry_SYSENTER_compat)
   pushq   %rbp                    /* pt_regs->sp (stashed in bp) */
   …
call    do_fast_syscall_32
ii. Then it goes to arch/x86/entry/common/c: do_fast_syscall_32:
unsigned long landing_pad = (unsigned long)current->mm->context.vdso +
                vdso_image_32.sym_int80_landing_pad;

        /*
         * SYSENTER loses EIP, and even SYSCALL32 needs us to skip forward
         * so that 'regs->ip -= 2' lands back on an int $0x80 instruction.
         * Fix it up.
         */
        regs->ip = landing_pad;

        enter_from_user_mode();

        local_irq_enable();

        /* Fetch EBP from where the vDSO stashed it. */
        if (
#ifdef CONFIG_X86_64
                /*
                 * Micro-optimization: the pointer we're following is explicitly
                 * 32 bits, so it can't be out of range.
                 */
                __get_user(*(u32 *)&regs->bp,
                            (u32 __user __force *)(unsigned long)(u32)regs->sp)
#else
	....
The #rbp (%ebp) in user space is copied to regs->sp, and above code shows it wants to get 4 bytes data from regs->sp.
It is supposed that # rbp points to no-mapping space, following with memory fault, and SIGSEGV(or maybe SIGBUS) will be triggered.

3) Summary
When this issue happens, this could also be a Stack Segment Fault(#SS, 12), except a normal Page Fault(#PF, 14).
As above shows, this case changes stack %esp to 0xffff ffff, then pop stack content out, this makes invalid stack access – (0xffff ffff + 4) exceeds 32 bits limit
Especially, in section 6.9 of Vol.3A, both stack and page faults are within the 10th(lowest priority) class, and as it said, "exceptions within each class are implementation-dependent and may vary from processor to processor". It's expected for processors like Intel Atom to trigger stack fault(sigbus), while we get page fault(sigsegv) from common Core processors.


Thanks,
Bo

-----Original Message-----
From: Andy Lutomirski [mailto:luto at kernel.org] 
Sent: Friday, March 8, 2019 2:10 AM
To: Tong, Bo <bo.tong at intel.com>
Cc: Shuah Khan <shuah at kernel.org>; Andrew Lutomirski <luto at kernel.org>; open list:KERNEL SELFTEST FRAMEWORK <linux-kselftest at vger.kernel.org>; LKML <linux-kernel at vger.kernel.org>
Subject: Re: [PATCH] selftests/x86: Support Atom for syscall_arg_fault test

On Thu, Mar 7, 2019 at 12:22 AM Tong Bo <bo.tong at intel.com> wrote:
>
> Atom-based CPUs trigger stack fault when invoke 32-bit SYSENTER 
> instruction with invalid register values. So we also need sigbus handling in this case.
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
> According to Intel SDM, this could also be a Stack Segment Fault(#SS, 
> 12), except a normal Page Fault(#PF, 14).

Really?  What is in the SS register that makes a stack segment fault possible?  Is it because we're overflowing ESP?  Would a value like -5 instead of -1 in the register change things?

Anyway, I'm okay with the patch, but I think that you should improve the comment:

> -       sethandler(SIGSEGV, sigsegv, SA_ONSTACK);
> +       sethandler(SIGSEGV, sigsegv_or_sigbus, SA_ONSTACK);
> +       /* Atom CPUs may trigger sigbus for below SYSENTER exception case */
> +       sethandler(SIGBUS, sigsegv_or_sigbus, SA_ONSTACK);

How about "The actual exception can vary.  On Atom CPUs, we get #SS instead of #PF when the vDSO fails to access the stack when ESP is too close to 2^32, and #SS causes SIGBUS".

--Andy
