From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Mon, 8 Oct 2018 18:43:06 +0530
Subject: selftests/bpf: test_kmod.sh hangs on all devices
Message-ID: <CA+G9fYumFxZghmxndq7STURbDbM4jgUzESr88yCgWvv=S+hbRA@mail.gmail.com>

BPF test case test_kmod.sh hangs on all devices running linux next.

+ cd /opt/kselftests/default-in-kernel/bpf
+ ./test_kmod.sh
sysctl: cannot stat /proc/sys/net/core/bpf_jit_enable: No such file or directory
sysctl: cannot stat /proc/sys/net/core/bpf_jit_harden: No such file or directory
sysctl: cannot stat /proc/sys/net/core/bpf_jit_enable: No such file or directory
sysctl: cannot stat /proc/sys/net/core/bpf_jit_harden: No such file or directory
[ JIT enabled:0 hardened:0 ]

https://lkft.validation.linaro.org/scheduler/job/429726

Test hangs started from 4.19.0-rc4-next-20180918.
Linux version 4.19.0-rc4-next-20180918 (oe-user at oe-host) (gcc version
7.1.1 20170707 (Linaro GCC 7.1-2017.08)) #1 SMP Tue Sep 18 05:26:00
UTC 2018

History can be compared from this page.
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/kselftest/bpf_test_kmod.sh

OTOH,
There is a kernel BUG,

[   41.003698] BUG: unable to handle kernel paging request at 0000000000001460
[   41.016603] PGD 800000045d648067 P4D 800000045d648067 PUD 4575c8067 PMD 0
[   41.023475] Oops: 0000 [#1] SMP PTI
[   41.026959] CPU: 3 PID: 2790 Comm: modprobe Not tainted
4.19.0-rc4-next-20180920 #1
[   41.034621] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[   41.042094] RIP: 0010:__skb_flow_dissect+0xd9/0x1740
[   41.047057] Code: 7b 79 ff 85 c0 41 5a 74 0d 80 3d 06 cd 00 01 00
0f 84 4f 05 00 00 4d 85 ff 0f 84 4a 02 00 00 49 8b 47 10 48 8b 80 40
05 00 00 <4c> 8b 80 60 14 00 00 4c 89 85 28 ff ff ff e8 54 7b 79 ff 85
c0 4c
[   41.065795] RSP: 0018:ffff9accc1cf79c0 EFLAGS: 00010286
[   41.071019] RAX: 0000000000000000 RBX: 000000000000000e RCX: 000000002c29b266
[   41.078143] RDX: 0000000097969774 RSI: 0000000000000000 RDI: 0000000000000001
[   41.085268] RBP: ffff9accc1cf7ac0 R08: ffffffff9b7517e9 R09: 0000000000000002
[   41.092392] R10: ffffffff9b7517e9 R11: ffffffff9c662080 R12: ffffffff9c78b620
[   41.099517] R13: 0000000000000008 R14: ffff9accc1cf7aec R15: ffff882f575e6800
[   41.106640] FS:  00007fcb533fe740(0000) GS:ffff882f5fb80000(0000)
knlGS:0000000000000000
[   41.114716] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.120454] CR2: 0000000000001460 CR3: 000000045b606002 CR4: 00000000003606e0
[   41.127590] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   41.134737] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   41.141860] Call Trace:
[   41.144305]  ? find_held_lock+0x35/0xa0
[   41.148136]  ? __lock_acquire+0x2b5/0x1340
[   41.152227]  ? find_held_lock+0x35/0xa0
[   41.156057]  skb_get_poff+0x4b/0x90
[   41.159542]  ? skb_get_poff+0x4b/0x90
[   41.163207]  bpf_skb_get_pay_offset+0xe/0x20
[   41.167471]  ___bpf_prog_run+0x45f/0x10d0
[   41.171475]  __bpf_prog_run32+0x39/0x50
[   41.175305]  ? lockdep_hardirqs_on+0xef/0x180
[   41.179656]  ? ktime_get+0x6b/0x110
[   41.183143]  test_bpf_init+0x5ab/0x1000 [test_bpf]
[   41.187933]  ? 0xffffffffc02e2000
[   41.191244]  do_one_initcall+0x5f/0x2b7
[   41.195074]  ? rcu_read_lock_sched_held+0x81/0x90
[   41.199770]  ? kmem_cache_alloc_trace+0x1de/0x210
[   41.204469]  ? do_init_module+0x27/0x212
[   41.208387]  do_init_module+0x5f/0x212
[   41.212138]  load_module+0x20f5/0x2640
[   41.215886]  __do_sys_finit_module+0xd1/0xf0
[   41.220156]  ? __do_sys_finit_module+0xd1/0xf0
[   41.224626]  __x64_sys_finit_module+0x1a/0x20
[   41.228984]  do_syscall_64+0x4f/0x190
[   41.232645]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   41.237697] RIP: 0033:0x7fcb52d087f9
[   41.241266] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f e6 2b 00 f7 d8 64 89
01 48
[   41.260004] RSP: 002b:00007ffe780dd828 EFLAGS: 00000206 ORIG_RAX:
0000000000000139
[   41.267589] RAX: ffffffffffffffda RBX: 00000000006aba70 RCX: 00007fcb52d087f9
[   41.274737] RDX: 0000000000000000 RSI: 0000000000418424 RDI: 0000000000000003
[   41.281861] RBP: 0000000000418424 R08: 0000000000000000 R09: 0000000000000000
[   41.288985] R10: 0000000000000003 R11: 0000000000000206 R12: 0000000000000000
[   41.296108] R13: 0000000000040000 R14: 0000000000000000 R15: 0000000000000000
[   41.303234] Modules linked in: test_bpf(+) x86_pkg_temp_thermal fuse
[   41.309590] CR2: 0000000000001460
[   41.312930] ---[ end trace a7d5229a26c41aad ]---
[   41.317541] RIP: 0010:__skb_flow_dissect+0xd9/0x1740
[   41.322497] Code: 7b 79 ff 85 c0 41 5a 74 0d 80 3d 06 cd 00 01 00
0f 84 4f 05 00 00 4d 85 ff 0f 84 4a 02 00 00 49 8b 47 10 48 8b 80 40
05 00 00 <4c> 8b 80 60 14 00 00 4c 89 85 28 ff ff ff e8 54 7b 79 ff 85
c0 4c
[   41.341235] RSP: 0018:ffff9accc1cf79c0 EFLAGS: 00010286
[   41.346452] RAX: 0000000000000000 RBX: 000000000000000e RCX: 000000002c29b266
[   41.353588] RDX: 0000000097969774 RSI: 0000000000000000 RDI: 0000000000000001
[   41.360716] RBP: ffff9accc1cf7ac0 R08: ffffffff9b7517e9 R09: 0000000000000002
[   41.367841] R10: ffffffff9b7517e9 R11: ffffffff9c662080 R12: ffffffff9c78b620
[   41.374964] R13: 0000000000000008 R14: ffff9accc1cf7aec R15: ffff882f575e6800
[   41.382089] FS:  00007fcb533fe740(0000) GS:ffff882f5fb80000(0000)
knlGS:0000000000000000
[   41.390165] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.395903] CR2: 0000000000001460 CR3: 000000045b606002 CR4: 00000000003606e0
[   41.403026] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   41.410153] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   41.417275] BUG: sleeping function called from invalid context at
/srv/oe/build/tmp-rpb-glibc/work-shared/intel-corei7-64/kernel-source/include/linux/percpu-rwsem.h:34
[   41.432199] in_atomic(): 1, irqs_disabled(): 1, pid: 2790, name: modprobe
[   41.438977] INFO: lockdep is turned off.
[   41.442893] irq event stamp: 13766
[   41.446292] hardirqs last  enabled at (13765): [<ffffffff9af037eb>]
ktime_get+0x6b/0x110
[   41.454369] hardirqs last disabled at (13766): [<ffffffff9ae01c6b>]
trace_hardirqs_off_thunk+0x1a/0x1c
[   41.463658] softirqs last  enabled at (13728): [<ffffffff9be0032d>]
__do_softirq+0x32d/0x42f
[   41.472084] softirqs last disabled at (13711): [<ffffffff9ae70679>]
irq_exit+0xc9/0xd0
[   41.479996] CPU: 3 PID: 2790 Comm: modprobe Tainted: G      D
    4.19.0-rc4-next-20180920 #1
[   41.489026] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[   41.496496] Call Trace:
[   41.498943]  dump_stack+0x70/0xa5
[   41.502261]  ___might_sleep+0x152/0x240
[   41.506091]  __might_sleep+0x4a/0x80
[   41.509679]  exit_signals+0x33/0x240
[   41.513249]  do_exit+0xb1/0xc60
[   41.516387]  rewind_stack_do_exit+0x17/0x20
[   41.520587] RIP: 0033:0x7fcb52d087f9
[   41.524177] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f e6 2b 00 f7 d8 64 89
01 48
[   41.542914] RSP: 002b:00007ffe780dd828 EFLAGS: 00000206 ORIG_RAX:
0000000000000139
[   41.550471] RAX: ffffffffffffffda RBX: 00000000006aba70 RCX: 00007fcb52d087f9
[   41.557608] RDX: 0000000000000000 RSI: 0000000000418424 RDI: 0000000000000003
[   41.564735] RBP: 0000000000418424 R08: 0000000000000000 R09: 0000000000000000
[   41.571860] R10: 0000000000000003 R11: 0000000000000206 R12: 0000000000000000
[   41.578985] R13: 0000000000040000 R14: 0000000000000000 R15: 0000000000000000
e)

Bug reported,
https://bugs.linaro.org/show_bug.cgi?id=4006
