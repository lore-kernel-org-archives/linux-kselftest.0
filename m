From: jpoimboe at redhat.com (Josh Poimboeuf)
Date: Tue, 10 Apr 2018 15:00:59 -0500
Subject: [PATCH v2] selftests/livepatch: introduce tests
In-Reply-To: <1523373354-10801-2-git-send-email-joe.lawrence@redhat.com>
References: <1523373354-10801-1-git-send-email-joe.lawrence@redhat.com>
 <1523373354-10801-2-git-send-email-joe.lawrence@redhat.com>
Message-ID: <20180410200059.loy3hw6tcwdi4m5z@treble>

On Tue, Apr 10, 2018 at 11:15:54AM -0400, Joe Lawrence wrote:
> +static void test_klp_shadow_vars_exit(void)
> +{
> +}
> +
> +module_init(test_klp_shadow_vars_init);
> +module_init(test_klp_shadow_vars_exit);

For this last line, s/module_init/module_exit/, though I think the exit
function can just be removed altogether?

Also I get the following bug (run on latest Linus master + Petr's two
patch sets):

[  106.302072] % modprobe test_klp_shadow_vars
[  106.311165] test_klp_shadow_vars: klp_shadow_get(obj=PTR5, id=0x1234) = PTR0
[  106.313080] test_klp_shadow_vars:   got expected NULL result
[  106.314811] BUG: sleeping function called from invalid context at mm/slab.h:421
[  106.316518] in_atomic(): 1, irqs_disabled(): 1, pid: 2254, name: modprobe
[  106.318107] 1 lock held by modprobe/2254:
[  106.319332]  #0: 00000000d0851080 (klp_shadow_lock){....}, at: __klp_shadow_get_or_alloc+0x88/0x1b0
[  106.321220] irq event stamp: 4408
[  106.322176] hardirqs last  enabled at (4407): [<ffffffff8114c28e>] console_unlock+0x44e/0x680
[  106.323598] hardirqs last disabled at (4408): [<ffffffff8199e6c7>] _raw_spin_lock_irqsave+0x27/0x90
[  106.325041] softirqs last  enabled at (4404): [<ffffffff81c0039b>] __do_softirq+0x39b/0x4fc
[  106.326469] softirqs last disabled at (4367): [<ffffffff810d8450>] irq_exit+0xe0/0xf0
[  106.327901] Preemption disabled at:
[  106.327905] [<ffffffff81167c28>] __klp_shadow_get_or_alloc+0x88/0x1b0
[  106.330117] CPU: 7 PID: 2254 Comm: modprobe Tainted: G              K  4.16.0+ #60
[  106.331565] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-2.fc27 04/01/2014
[  106.333143] Call Trace:
[  106.334011]  dump_stack+0x8e/0xd5
[  106.334962]  ___might_sleep+0x185/0x260
[  106.335997]  ? shadow_dtor+0x40/0x40 [test_klp_shadow_vars]
[  106.337170]  __might_sleep+0x4a/0x80
[  106.338137]  kmem_cache_alloc_trace+0x20b/0x300
[  106.339183]  ? ptr_id+0x5c/0xd0 [test_klp_shadow_vars]
[  106.340341]  ? shadow_dtor+0x40/0x40 [test_klp_shadow_vars]
[  106.341506]  ptr_id+0x5c/0xd0 [test_klp_shadow_vars]
[  106.342725]  shadow_ctor+0x20/0x40 [test_klp_shadow_vars]
[  106.343998]  __klp_shadow_get_or_alloc+0xc4/0x1b0
[  106.345184]  ? shadow_dtor+0x40/0x40 [test_klp_shadow_vars]
[  106.346494]  klp_shadow_alloc+0x10/0x20
[  106.347583]  shadow_alloc+0x28/0xa0 [test_klp_shadow_vars]
[  106.348871]  ? shadow_free_all+0x40/0x40 [test_klp_shadow_vars]
[  106.350200]  test_klp_shadow_vars_init+0x96/0x400 [test_klp_shadow_vars]
[  106.351646]  ? shadow_free_all+0x40/0x40 [test_klp_shadow_vars]
[  106.352949]  do_one_initcall+0x61/0x37f
[  106.353963]  ? rcu_read_lock_sched_held+0x79/0x80
[  106.355040]  ? kmem_cache_alloc_trace+0x29d/0x300
[  106.356098]  ? do_init_module+0x27/0x213
[  106.357090]  do_init_module+0x5f/0x213
[  106.358047]  load_module+0x2815/0x2e70
[  106.358992]  ? vfs_read+0x12d/0x150
[  106.359920]  SYSC_finit_module+0xfc/0x120
[  106.360870]  ? SYSC_finit_module+0xfc/0x120
[  106.361839]  SyS_finit_module+0xe/0x10
[  106.362753]  do_syscall_64+0x7e/0x240
[  106.363645]  entry_SYSCALL_64_after_hwframe+0x42/0xb7
[  106.364711] RIP: 0033:0x7f26d0d40b19
[  106.365799] RSP: 002b:00007ffee1de19a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  106.367306] RAX: ffffffffffffffda RBX: 00005636550d54b0 RCX: 00007f26d0d40b19
[  106.368573] RDX: 0000000000000000 RSI: 0000563654134186 RDI: 0000000000000003
[  106.369950] RBP: 0000563654134186 R08: 0000000000000000 R09: 00005636550d4270
[  106.371164] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
[  106.372422] R13: 00005636550d53b0 R14: 0000000000040000 R15: 00005636550d54b0
[  106.373900] test_klp_shadow_vars: shadow_ctor: PTR6 -> PTR1
[  106.375249] test_klp_shadow_vars: klp_shadow_alloc(obj=PTR5, id=0x1234, size=8, gfp_flags=GFP_KERNEL), ctor=PTR7, ctor_data=PTR1 = PTR6
[  106.378893] test_klp_shadow_vars: shadow_ctor: PTR8 -> PTR2
[  106.380305] test_klp_shadow_vars: klp_shadow_alloc(obj=PTR9, id=0x1234, size=8, gfp_flags=GFP_KERNEL), ctor=PTR7, ctor_data=PTR2 = PTR8
[  106.382779] test_klp_shadow_vars: shadow_ctor: PTR10 -> PTR3
[  106.384131] test_klp_shadow_vars: klp_shadow_alloc(obj=PTR5, id=0x1235, size=8, gfp_flags=GFP_KERNEL), ctor=PTR7, ctor_data=PTR3 = PTR10
[  106.386584] test_klp_shadow_vars: klp_shadow_get(obj=PTR5, id=0x1234) = PTR6
[  106.387929] test_klp_shadow_vars:   got expected PTR6 -> PTR1 result
[  106.389181] test_klp_shadow_vars: klp_shadow_get(obj=PTR9, id=0x1234) = PTR8
[  106.390488] test_klp_shadow_vars:   got expected PTR8 -> PTR2 result
[  106.391731] test_klp_shadow_vars: klp_shadow_get(obj=PTR5, id=0x1235) = PTR10
[  106.393066] test_klp_shadow_vars:   got expected PTR10 -> PTR3 result
[  106.394347] test_klp_shadow_vars: shadow_ctor: PTR11 -> PTR4
[  106.395523] test_klp_shadow_vars: klp_shadow_get_or_alloc(obj=PTR12, id=0x1234, size=8, gfp_flags=GFP_KERNEL), ctor=PTR7, ctor_data=PTR4 = PTR11
[  106.398033] test_klp_shadow_vars: klp_shadow_get_or_alloc(obj=PTR12, id=0x1234, size=8, gfp_flags=GFP_KERNEL), ctor=PTR7, ctor_data=PTR4 = PTR11
[  106.400554] test_klp_shadow_vars:   got expected PTR11 -> PTR4 result
[  106.401937] test_klp_shadow_vars: shadow_dtor(obj=PTR5, shadow_data=PTR6)
[  106.403592] test_klp_shadow_vars: klp_shadow_free(obj=PTR5, id=0x1234, dtor=PTR13)
[  106.405083] test_klp_shadow_vars: klp_shadow_get(obj=PTR5, id=0x1234) = PTR0
[  106.406500] test_klp_shadow_vars:   got expected NULL result
[  106.407735] test_klp_shadow_vars: shadow_dtor(obj=PTR9, shadow_data=PTR8)
[  106.409252] test_klp_shadow_vars: klp_shadow_free(obj=PTR9, id=0x1234, dtor=PTR13)
[  106.410867] test_klp_shadow_vars: klp_shadow_get(obj=PTR9, id=0x1234) = PTR0
[  106.412232] test_klp_shadow_vars:   got expected NULL result
[  106.413461] test_klp_shadow_vars: shadow_dtor(obj=PTR12, shadow_data=PTR11)
[  106.414888] test_klp_shadow_vars: klp_shadow_free(obj=PTR12, id=0x1234, dtor=PTR13)
[  106.416319] test_klp_shadow_vars: klp_shadow_get(obj=PTR12, id=0x1234) = PTR0
[  106.417681] test_klp_shadow_vars:   got expected NULL result
[  106.418947] test_klp_shadow_vars: klp_shadow_get(obj=PTR5, id=0x1235) = PTR10
[  106.420314] test_klp_shadow_vars:   got expected PTR10 -> PTR3 result
[  106.421658] test_klp_shadow_vars: shadow_dtor(obj=PTR5, shadow_data=PTR10)
[  106.423065] test_klp_shadow_vars: klp_shadow_free_all(id=0x1235, dtor=PTR13)
[  106.424421] test_klp_shadow_vars: klp_shadow_get(obj=PTR5, id=0x1234) = PTR0
[  106.425745] test_klp_shadow_vars:   shadow_get() got expected NULL result
[  106.438719] % rmmod test_klp_shadow_vars


-- 
Josh
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
