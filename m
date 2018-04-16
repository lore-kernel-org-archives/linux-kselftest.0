From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Mon, 16 Apr 2018 11:01:15 -0600
Subject: Linux 4.17-rc1 - kernel paging errors running x86 selftests
Message-ID: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>

Andy/Ingo,

While running test_vsyscall_64 and fsgsbase_64 tests, I am seeing
the following errors in dmesg.

Also these tests either take forever to run or hang. I killed it after
waiting for an hour or so.  Unfortunately it makes the kselftest suite
pain to run. Could you please take a look and see if we need to disable
the tests for the time being or any way to make them not painful.

These tests went into stable as well? These commits went through x86 tree
and I didn't get a chance to run the. Did you see these problems when you
ran them on your test systems. I do have KASAN enabled on mine.

[  884.496588] BUG: unable to handle kernel paging request at fffffe8000010030
[  884.496601] PGD 372870067 P4D 372870067 PUD 346e84067 PMD 34005f067 PTE ffffffffffffffff
[  884.496614] Oops: 0009 [#1] SMP KASAN PTI
[  884.496619] Modules linked in: iptable_mangle xt_tcpudp bridge stp llc iptable_filter binfmt_misc gpio_ich x86_pkg_temp_thermal coretemp kvm_intel kvm irqbypass ghash_clmulni_intel pcbc aesni_intel aes_x86_64 crypto_simd cryptd glue_helper snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic wmi_bmof snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm lpc_ich snd_timer mac_hid parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs xor zstd_decompress zstd_compress xxhash raid6_pq libcrc32c dm_mirror dm_region_hash dm_log hid_generic usbhid hid i915 iosf_mbi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm r8169 mii wmi video
[  884.496730] CPU: 1 PID: 8200 Comm: sigreturn_64 Not tainted 4.17.0-rc1 #1
[  884.496735] Hardware name: System76, Inc. Wild Dog Performance/H87-PLUS, BIOS 0705 12/05/2013
[  884.496741] RIP: 0033:0x4031c2
[  884.496745] RSP: 002b:00007ffd805b56d8 EFLAGS: 00010246
[  884.496751] RAX: 0000000000000000 RBX: 0000000000000010 RCX: 0000000000000000
[  884.496756] RDX: 0000000000400000 RSI: 0000000000000000 RDI: 0000000000000037
[  884.496760] RBP: 0000000000000000 R08: 0000000000000037 R09: 0000000000000033
[  884.496765] R10: 0000000000000010 R11: 0000000000000000 R12: 00000000ffffffff
[  884.496769] R13: 0000000000402000 R14: 0000000000000000 R15: 0000000000000000
[  884.496774] FS:  00007f9445162740(0000) GS:ffff8803cfc40000(0000) knlGS:0000000000000000
[  884.496779] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  884.496783] CR2: fffffe8000010030 CR3: 000000036c5c2002 CR4: 00000000001606e0
[  884.496788] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  884.496792] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  884.496798] RIP: 0x4031c2 RSP: 00007ffd805b56d8
[  884.496802] CR2: fffffe8000010030
[  884.496807] ---[ end trace 286073d5ab6d2df6 ]---
[  884.650095] BUG: unable to handle kernel paging request at fffffe8000000000
[  884.650103] PGD 363699067 P4D 363699067 PUD 3371c6067 PMD 37cfbc067 PTE ffffffffffffffff
[  884.650112] Oops: 0009 [#2] SMP KASAN PTI
[  884.650115] Modules linked in: iptable_mangle xt_tcpudp bridge stp llc iptable_filter binfmt_misc gpio_ich x86_pkg_temp_thermal coretemp kvm_intel kvm irqbypass ghash_clmulni_intel pcbc aesni_intel aes_x86_64 crypto_simd cryptd glue_helper snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic wmi_bmof snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm lpc_ich snd_timer mac_hid parport_pc ppdev lp parport ip_tables x_tables autofs4 btrfs xor zstd_decompress zstd_compress xxhash raid6_pq libcrc32c dm_mirror dm_region_hash dm_log hid_generic usbhid hid i915 iosf_mbi i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm r8169 mii wmi video
[  884.650192] CPU: 0 PID: 8251 Comm: fsgsbase_64 Tainted: G      D           4.17.0-rc1 #1
[  884.650195] Hardware name: System76, Inc. Wild Dog Performance/H87-PLUS, BIOS 0705 12/05/2013
[  884.650200] RIP: 0033:0x401471
[  884.650203] RSP: 002b:00007fc8e6775eb0 EFLAGS: 00010206
[  884.650206] RAX: 0000000000000007 RBX: 00000000006030a8 RCX: 0000000000000b40
[  884.650210] RDX: 00007fc8e6b53880 RSI: 0000000000401918 RDI: 00007fc8e6b52720
[  884.650213] RBP: a1fa5f343cb85fa4 R08: 00007fc8e6776700 R09: baadf00d00000000
[  884.650215] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000401727
[  884.650218] R13: 0000000000401726 R14: 0000000200000000 R15: 00007fc8e67769c0
[  884.650222] FS:  00007fc8e6776700(0000) GS:ffff8803cfc00000(0000) knlGS:0000000000000000
[  884.650225] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  884.650228] CR2: fffffe8000000000 CR3: 0000000371d32001 CR4: 00000000001606f0
[  884.650231] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  884.650233] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  884.650237] RIP: 0x401471 RSP: 00007fc8e6775eb0
[  884.650240] CR2: fffffe8000000000
[  884.650244] ---[ end trace 286073d5ab6d2df7 ]---


thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
