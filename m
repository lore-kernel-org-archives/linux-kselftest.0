From: zhijianx.li at intel.com (Li Zhijian)
Date: Fri, 23 Mar 2018 09:23:40 +0800
Subject: kernel_selftests.x86.mpx-mini-test_32.fail on skylake platform
In-Reply-To: <3aa057ec-c0e7-8b18-2054-ec2a6aecaeb9@linux.intel.com>
References: <d36f0567-04a3-3e7f-4332-ce7518bfff60@intel.com>
 <3aa057ec-c0e7-8b18-2054-ec2a6aecaeb9@linux.intel.com>
Message-ID: <c238a4c5-e7a5-4dbb-c178-5bf127c75b9f@intel.com>

Sorry to reply so late.

On 3/13/2018 1:34 AM, Dave Hansen wrote:
> On 03/08/2018 05:24 PM, Li Zhijian wrote:
>> 0Day robot tried to bisect the FBC, but it failed at last. But anyway
>> i want to let you know we had this issue.
> Can you please bisect this, manually if necessary?  Let me know if you
> need any help.


Try to bisect manually, but looks the 'git bisect' can not figure out the correct FBC.

First, the test has different behaviors at different commit. could you help to judge they are good or bad.
1) commit: 59c58ceb29d0f030eddb36a3a9dbadcc499786a6

XSAVE is supported by HW & OS
XSAVE processor supported state mask: 0x1f
XSAVE OS supported state mask: 0x1f
  BNDREGS: size: 64 user: 1 supervisor: 0 aligned: 0
   BNDCSR: size: 64 user: 1 supervisor: 0 aligned: 0

[  OK  ] Reached target Timers.
[  OK  ] Started Permit User Sessions.
[FAILED] Failed to start OpenBSD Secure Shell server.executing unmaptest
mpx dig (  1) complete, SUCCESS (       0 /    0)
unexpected trap 0! at 0x5663fbfa
si_addr (nil)
REG_ERR: 0
abort @ mpx-mini-test.c::450

  --------------

2) 74c8ce958dbf0b64f198becb5d8aa93afb967438
--------------
[    3.423346] BUG: unable to handle kernel paging request at ffffffffff577060
[    3.424283] IP: 0xf77cebe9
[    3.424594] PGD 1c0a067
[    3.424594] P4D 1c0a067
[    3.424853] PUD 1c0c067
[    3.425111] PMD 1c0d067
[    3.425391] PTE 800000002aa09161
[    3.425741]
[    3.426296] Oops: 0003 [#1] SMP
[    3.426622] CPU: 0 PID: 359 Comm: mpx-mini-test_3 Not tainted 4.11.0-rc2-00243-g74c8ce958dbf #37
[    3.427508] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-20171110_100015-anatol 04/01/2014
[    3.428533] task: ffff88003f46cb80 task.stack: ffffc90000738000
[    3.429129] RIP: 0023:0xf77cebe9
[    3.429456] RSP: 002b:00000000ffb3df10 EFLAGS: 00010246
[    3.429982] RAX: 0000000000000063 RBX: 00000000ffb3df10 RCX: 00000000f74bac98
[    3.430696] RDX: 00000000f74ba700 RSI: 00000000f77f5000 RDI: 0000000000000001
[    3.431442] RBP: 00000000ffb3e0c8 R08: 0000000000000000 R09: 0000000000000000
[    3.432153] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[    3.432889] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    3.433723] FS:  0000000000000000(0000) GS:ffff88002aa00000(0000) knlGS:0000000000000000
[    3.434540] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[    3.435130] CR2: ffffffffff577060 CR3: 000000003f52b000 CR4: 00000000003406f0
[    3.435928] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    3.436653] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    3.437390] RIP: 0xf77cebe9 RSP: 00000000ffb3df10
[    3.437869] CR2: ffffffffff577060
[    3.438229] ---[ end trace dd63a5ceee1b0022 ]---
[    3.438698] Kernel panic - not syncing: Fatal exception
[    3.439316] Kernel Offset: disabled
[    3.439680] ---[ end Kernel panic - not syncing: Fatal exception
qemu-system-x86_64: terminating on signal 2
--------------

3) 8f3e474f3cea7b2470218a6ed6da47ff02147dce
------------
mpx dig (  2) complete, SUCCESS (    7914 / 4986)
[    2.733036] tsc: Refined TSC clocksource calibration: 3192.000 MHz
[    2.733876] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2e02c4a121d, max_idle_ns: 440795236083 ns
mpx dig (  3) complete, SUCCESS (   11673 / 7372)
mpx dig (  4) complete, SUCCESS (   10703 / 6725)
mpx dig (  5) complete, SUCCESS (       0 /    0)
mpx dig (  6) complete, SUCCESS (     675 /  421)
mpx dig (  7) complete, SUCCESS (     324 /  205)
[    3.165773] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
mpx dig (  8) complete, SUCCESS (       0 /    0)
mpx dig (  9) complete, SUCCESS (       0 /    0)
mpx dig ( 10) complete, SUCCESS (       0 /    0)
mpx dig ( 11) complete, SUCCESS (       0 /    0)
mpx dig ( 12) complete, SUCCESS (       0 /    0)
mpx dig ( 13) complete, SUCCESS (       0 /    0)
mpx dig ( 14) complete, SUCCESS (       0 /    0)
mpx dig ( 15) complete, SUCCESS (       0 /    0)
mpx dig ( 16) complete, SUCCESS (       0 /    0)
mpx dig ( 17) complete, SUCCESS (       0 /    0)
iteration 1292 complete, OK so far
mpx dig ( 18) complete, SUCCESS (       0 /    0)
mpx dig ( 19) complete, SUCCESS (       0 /    0)
mpx dig ( 20) complete, SUCCESS (       0 /    0)
mpx dig ( 21) complete, SUCCESS (       0 /    0)
mpx dig ( 22) complete, SUCCESS (       0 /    0)
mpx dig ( 23) complete, SUCCESS (       0 /    0)
mpx dig ( 24) complete, SUCCESS (       0 /    0)
mpx dig ( 25) complete, SUCCESS (       0 /    0)
mpx dig ( 26) complete, SUCCESS (       0 /    0)
mpx dig ( 27) complete, SUCCESS (       0 /    0)
mpx dig ( 28) complete, SUCCESS (       0 /    0)
mpx dig ( 29) complete, SUCCESS (       0 /    0)
mpx dig ( 30) complete, SUCCESS (       0 /    0)
mpx dig ( 31) complete, SUCCESS (       0 /    0)
mpx dig ( 32) complete, SUCCESS (       0 /    0)
mpx dig ( 33) complete, SUCCESS (       0 /    0)
mpx dig ( 34) complete, SUCCESS (       0 /    0)
mpx dig ( 35) complete, SUCCESS (       0 /    0)
iteration 2844 complete, OK so far
done with malloc() fun
starting mpx bounds table test
ERROR: siginfo boundsdo  not match shadow boundsfor  register 0
7
------------

4) v4.12
------------
#BR status == 2, missing bounds table,kernel should have handled!!
XSAVE is supported by HW & OS
XSAVE processor supported state mask: 0x2ff
XSAVE OS supported state mask: 0x2ff
   BNDREGS: size: 64 user: 1 supervisor: 0 aligned: 0
    BNDCSR: size: 64 user: 1 supervisor: 0 aligned: 0
executing unmaptest
mpx dig (  1) complete, SUCCESS (       0 /    0)
------------


tried so many wasy to bisect it, find out 3 possible commits
# first bad commit: [771ceddaadd0a2b31603034b36dca50943ff6836] perf vendor events: Add mapping for KnightsMill PMU events
# first bad commit: [1b028f784e8c341e762c264f70dc0ca1418c8b7a] x86/mm: Introduce mmap_compat_base()for  32-bit mmap()
# first bad commit: [5ed386ec09a5d75bcf073967e55e895c2607a5c3] x86/mpx: Correctly report do_mpx_bt_fault() failures to user-space


Thanks
Zhijian

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
