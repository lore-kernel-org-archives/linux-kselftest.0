From: luto at kernel.org (Andy Lutomirski)
Date: Mon, 25 Jun 2018 08:40:37 -0700
Subject: test_syscall_vdso_32 [FAIL]
In-Reply-To: <0d78b5b4-710e-1b41-46e1-74003ca1381e@intel.com>
References: <0d78b5b4-710e-1b41-46e1-74003ca1381e@intel.com>
Message-ID: <CALCETrVLRmySnqpG+o-S9VGkx7uKFfLGeawyM7UDCRj_g7vs1g@mail.gmail.com>

On Mon, Jun 25, 2018 at 1:41 AM Li Zhijian <zhijianx.li at intel.com> wrote:
>
> Hi
>
> Intel 0Day noticed that test_syscall_vdso_32 failed since 8bb2610bc4967f19672444a7b0407367f1540028(x86/entry/64/compat: Preserve r8-r11 in int $0x80)
>
> 2018-06-25 14:23:00 make run_tests -C x86
> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-8bb2610bc4967f19672444a7b0407367f1540028/tools/testing/selftests/x86'
> gcc -m32 -o /usr/src/linux-selftests-x86_64-rhel-7.2-8bb2610bc4967f19672444a7b0407367f1540028/tools/testing/selftests/x86/test_syscall_vdso_32 -O2 -g -std=gnu99 -pthread -Wall -no-pie -DCAN_BUILD_32 -DCAN_BUILD_64 test_syscall_vdso.c thunks_32.S -lrt -ldl -lm
> TAP version 13
> selftests: test_syscall_vdso_32
> ========================================
> [RUN]   Executing 6-argument 32-bit syscall via VDSO
> [WARN]  Flags before=0000000000200ed7 id 0 00 o d i s z 0 a 0 p 1 c
> [WARN]  Flags  after=0000000000200606 id 0 00 d i 0 0 p 1
> [WARN]  Flags change=00000000000008d1 0 00 o s z 0 a 0 0 c
> [OK]    Arguments are preserved across syscall
> [NOTE]  R11 has changed:0000000000200606 - assuming clobbered by SYSRET insn
> [OK]    R8..R15 did not leak kernel data
> [RUN]   Executing 6-argument 32-bit syscall via INT 80
> [OK]    Arguments are preserved across syscall
> [FAIL]  R8 has changed:0000000000000000
> [FAIL]  R9 has changed:0000000000000000
> [FAIL]  R10 has changed:0000000000000000
> [FAIL]  R11 has changed:0000000000000000
> [RUN]   Executing 6-argument 32-bit syscall via VDSO
> [WARN]  Flags before=0000000000200ed7 id 0 00 o d i s z 0 a 0 p 1 c
> [WARN]  Flags  after=0000000000200606 id 0 00 d i 0 0 p 1
> [WARN]  Flags change=00000000000008d1 0 00 o s z 0 a 0 0 c
> [OK]    Arguments are preserved across syscall
> [NOTE]  R11 has changed:0000000000200606 - assuming clobbered by SYSRET insn
> [OK]    R8..R15 did not leak kernel data
> [RUN]   Executing 6-argument 32-bit syscall via INT 80
> [OK]    Arguments are preserved across syscall
> [FAIL]  R8 has changed:0000000000000000
> [FAIL]  R9 has changed:0000000000000000
> [FAIL]  R10 has changed:0000000000000000
> [FAIL]  R11 has changed:0000000000000000
> [RUN]   Running tests under ptrace
> not ok 1..1 selftests:  test_syscall_vdso_32 [FAIL]
> make: Leaving directory '/usr/src/linux-selftests-x86_64-rhel-7.2-8bb2610bc4967f19672444a7b0407367f1540028/tools/testing/selftests/x86'
>
> This commit changed the testcase expected behavior, but looks it doesn't work as expected.
> so want to consult whether 0Day missed something(special configurations) to this case ?
>
> if more details are needed, please let me know.

Can you double-check that you're running the tests on an updated
kernel?  The error you're getting makes it look like you've applied
the patch to selftests but not to the kernel.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
