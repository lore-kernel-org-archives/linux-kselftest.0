From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Mon, 25 Jun 2018 11:11:22 +0530
Subject: qemu-system-x86_64: mov_ss_trap_64 PANIC: double fault,
 error_code: 0x0
Message-ID:
 <CA+G9fYu0E0fM+WaFim1WKup5BZvjtGZ_4ii5FhTUjNZEqaAuwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180625054122.4ifWeh3krtyxObYx3oVSD53OWawiSpLgBzdHifHMBtA@z>

Kselftest test case mov_ss_trap_64 is causing kernel panic on
qemu-system-x86_64 and PASS on real x86_64 hardware.

Test code snippet,
main() {
<>
      printf("[RUN]\tMOV SS; CS CS INT3\n");
      asm volatile ("mov %[ss], %%ss; .byte 0x2e, 0x2e; int3" :: [ss] "m" (ss));
<>
}

Linux version 4.17.3-rc1 (buildslave at lkft-01) (gcc version 6.2.1 20161016
(Linaro GCC 6.2-2016.11)) #1 SMP Thu Jun 21 02:19:19 UTC 2018

This test was good on kernel 4.17.2
good  git commit: 3816828a8cd06c5e0a0a9e0456013d61d979d975

Bad on 4.17.3-rc1 (and stable-rc 4.14.52-rc1)
Bad git commit: 894caab83aab21f120cde83eb5b969b99fcf8696

git repo:
 https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git

qemu-system-x86_64 version 2.12.0

steps to reproduce and test log,
+ cd tools/testing/selftests/x86
+ ./mov_ss_trap_64

SS = 0x2b, &SS = 0x0x604188
Set up a watchpoint
DR0 = 604188, DR1 = 400a19, DR7 = 7000a
[RUN] Read from watched memory (should get SIGTRAP)
Got SIGTRAP with RIP=4008ea, EFLAGS.RF=0
[RUN] MOV SS; INT3
Got SIGTRAP with RIP=4008fb, EFLAGS.RF=0
[RUN] MOV SS; INT 3
Got SIGTRAP with RIP=40090d, EFLAGS.RF=0
[RUN] M[   20.305426] PANIC: double fault, error_code: 0x0
OV SS; CS CS INT3
Got SIGTRAP with RIP=400920,[   20.308317] CPU: 3 PID: 2471 Comm:
mov_ss_trap_64 Not tainted 4.17.3-rc1 #1
 EFLAGS.RF=0
[RUN] MOV SS; CSx14 INT3
[   20.311664] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
 1.10.2-1 04/01/2014
[   20.314738] RIP: 0010:error_entry+0x32/0x100
<trim>
[   20.336649] Call Trace:
[   20.337523]  <ENTRY_TRAMPOLINE>
[   20.338507]  ? native_iret+0x7/0x7
[   20.339611]  ? page_fault+0x8/0x30
[   20.340693]  ? error_entry+0x86/0x100
[   20.341871]  ? trace_hardirqs_off_caller+0x7/0xa0
[   20.343212]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[   20.344554]  ? native_iret+0x7/0x7
[   20.345647]  ? page_fault+0x8/0x30
[   20.346716]  ? error_entry+0x86/0x100
[   20.347853]  ? page_fault+0x8/0x30
[   20.348920]  ? ist_enter+0x6/0xa0
[   20.349961]  ? do_int3+0x34/0x120
[   20.351095]  ? int3+0x14/0x20
[   20.352047]  </ENTRY_TRAMPOLINE>
[   20.353060] Code: 48 89 7c 24 08 52 31 d2 51 31 c9 50 41 50 45 31
c0 41 51 45 31 c9 41 52 45 31 d2 41 53 45 31 db 53 31 db 55 31 ed 41
54 45 31 e4 <41> 55 45 31 ed 41 56 45 31 f6 41 57 45 31 ff 56 48 8d 6c
24 09
[   20.357895] Kernel panic - not syncing: Machine halted.

Bug ink,
https://bugs.linaro.org/show_bug.cgi?id=3916

Test case link,
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/tree/tools/testing/selftests/x86/mov_ss_trap.c?h=linux-4.17.y

Best regards
Naresh Kamboju
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
