From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Mon, 13 May 2019 18:49:27 +0530
Subject: selftests: bpf: test_sock: WARNING: workqueue.c:3030
 __flush_work+0x3fc/0x470
Message-ID:
 <CA+G9fYv0Ycums3ziT3np3kfGek3Hhphj_c5PFjeL7th3B9feDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190513131927.hWRzNDXg-AOeI32N7TZ3ocSW8ngZSt6Q5zN9r1-bVYU@z>

Do you see kernel WARNING while running bpf: test_sock test case ?
This  kernel warning is popping up continuously for ~725 times on all
devices ( arm64, arm, x86_64 and i386).

selftests: bpf: test_sock
Test case: bind4 load with invalid access: src_ip6 .. [PASS]
Test case: bind4 load with invalid access: mark .. [PASS]
Test case: bind6 load with invalid access: src_ip4 .. [PASS]
Test case: sock_create load with invalid access: src_port .. [PASS]
Test case: sock_create load w/o expected_attach_type (compat mode) .. [PASS]
Test case: sock_create load w/ expected_attach_type .. [PASS]
Test case: attach type mismatch bind4 vs bind6 .. [PASS]
Test case: attach type mismatch bind6 vs bind4 .. [PASS]
Test case: attach type mismatch default vs bind4 .. [PASS]
Test case: attach type mismatch bind6 vs sock_create .. [PASS]
Test case: bind4 reject all .. [PASS]
Test case: bind6 reject all .. [PASS]
Test case: bind6 deny specific IP & port .. [PASS]
Test case: bind4 allow specific IP & port .. [PASS]
Test case: bind4 allow all .. [PASS]
Test case: bind6 allow all .. [PASS]
Summ[  200.359313] WARNING: CPU: 1 PID: 3400 at
/usr/src/kernel/kernel/workqueue.c:3030 __flush_work+0x3fc/0x470
[  200.369390] Modules linked in: tun algif_hash af_alg
x86_pkg_temp_thermal fuse
[  200.376621] CPU: 1 PID: 3400 Comm: kworker/1:156 Not tainted 5.1.0 #1
[  200.383061] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.2 05/23/2018
[  200.390455] Workqueue: events sk_psock_destroy_deferred
[  200.395679] RIP: 0010:__flush_work+0x3fc/0x470
[  200.400123] Code: 03 00 31 c0 e9 a4 fe ff ff 41 8b 0c 24 49 8b 54
24 08 83 e1 08 49 0f ba 2c 24 03 80 c9 f0 e9 d0 fd ff ff 0f 0b e9 83
fe ff ff <0f> 0b 31 c0 e9 7a fe ff ff e8 e6 1f 06 00 84 c0 0f 85 fd fe
ff ff
[  200.418859] RSP: 0018:ffffa5d68487bca0 EFLAGS: 00010246
[  200.424079] RAX: 0000000000000000 RBX: ffff9abc19269468 RCX: 0000000000000006
[  200.431200] RDX: 0000000000001b35 RSI: 0000000000000001 RDI: ffff9abc19269468
[  200.438324] RBP: ffffa5d68487bd68 R08: 0000000000000000 R09: 0000000000000000
[  200.445449] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9abc19269468
[  200.452572] R13: 0000000000000001 R14: ffffa5d68487bd98 R15: ffffffffabe91000
[  200.459696] FS:  0000000000000000(0000) GS:ffff9abc6f880000(0000)
knlGS:0000000000000000
[  200.467776] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  200.473521] CR2: 00007f6c3ebf3cb0 CR3: 00000001d920a006 CR4: 00000000003606e0
[  200.480644] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  200.487768] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  200.494891] Call Trace:
[  200.497338]  ? get_work_pool+0x90/0x90
[  200.501090]  ? mark_held_locks+0x4d/0x80
[  200.505015]  ? __cancel_work_timer+0x11a/0x1d0
[  200.509452]  ? cancel_delayed_work_sync+0x13/0x20
[  200.514151]  ? lockdep_hardirqs_on+0xf6/0x190
[  200.518509]  ? __cancel_work_timer+0x11a/0x1d0
[  200.522946]  ? get_work_pool+0x90/0x90
[  200.526691]  __cancel_work_timer+0x134/0x1d0
[  200.530965]  cancel_delayed_work_sync+0x13/0x20
[  200.535497]  strp_done+0x1c/0x50
[  200.538729]  sk_psock_destroy_deferred+0x34/0x1c0
[  200.543434]  process_one_work+0x281/0x610
[  200.547439]  worker_thread+0x3c/0x3f0
[  200.551105]  kthread+0x12c/0x150
[  200.554337]  ? process_one_work+0x610/0x610
[  200.558515]  ? kthread_park+0x90/0x90
[  200.562180]  ret_from_fork+0x3a/0x50
[  200.565762] irq event stamp: 2382
[  200.569079] hardirqs last  enabled at (2381): [<ffffffffabe9569a>]
__cancel_work_timer+0x11a/0x1d0
[  200.578030] hardirqs last disabled at (2382): [<ffffffffabe01b7b>]
trace_hardirqs_off_thunk+0x1a/0x1c
[  200.587234] softirqs last  enabled at (1806): [<fffffffface00334>]
__do_softirq+0x334/0x445
[  200.595573] softirqs last disabled at (1761): [<ffffffffabe76e70>]
irq_exit+0xc0/0xd0
[  200.603398] ---[ end trace 447ba7732b3f8640 ]---

Test full log link,
https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.1-9822-g47782361aca2/testrun/719520/log

Best regards
Naresh Kamboju
