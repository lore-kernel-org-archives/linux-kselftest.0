From: songliubraving@fb.com (Song Liu)
Date: Mon, 17 Dec 2018 22:22:53 +0000
Subject: selftests/bpf/test_progs: 32-bit: Unable to handle kernel NULL
 pointer dereference at virtual address 00000000
In-Reply-To: <84fd5ad3-894c-7350-fb7f-cb310d914c3b@iogearbox.net>
References: <CA+G9fYua8RE81YiNkfoafbZyACtY1_rZpczsU8otPBuJqck=7A@mail.gmail.com>
 <84fd5ad3-894c-7350-fb7f-cb310d914c3b@iogearbox.net>
Message-ID: <CE1721B5-04A9-4D48-AAEC-957DEB6976AA@fb.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181217222253.6YmSTh-HYZr-oVtL5MYjioE-HHR6InE21S98PFmknOM@z>



> On Dec 17, 2018,@6:26 AM, Daniel Borkmann <daniel@iogearbox.net> wrote:
> 
> [ +Song, if you get a chance please take a look at the panic in
>  stack_map_get_build_id_offset(), thanks! ]
> 

Thanks Daniel! I will take a look. 

I don't have an ARM32 system handy for tests. Any suggestion on where I can
lease/borrow one?

Thanks,
Song



> On 12/17/2018 01:50 PM, Naresh Kamboju wrote:
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000
>> While running test case selftests: bpf: test_progs on arm32 x15 device
>> running Linux -next, mainline and 4.19 kernel.
>> 
>> steps to reproduce,
>> cd tools/testing/selftests/bpf
>> ./test_progs
>> 
>> Test log
>> ----------
>> selftests: bpf: test_progs
>> libbpf: object file doesn't contain bpf program
>> libbpf: object file doesn't contain bpf program
>> libbpf: object file doesn't contain bpf program
>> libbpf: object file doesn't contain bpf program
>> libbpf: object file doesn't contain bpf program
>> libbpf: ./test_tcp_estats.o doesn't provide kernel version
>> [  132.402282] Unable to handle kernel NULL pointer dereference at
>> virtual address 00000000
>> [  132.410971] pgd = a200d8e2
>> [  132.413703] [00000000] *pgd=abd21003, *pmd=f1e93003
>> [  132.418711] Internal error: Oops: 207 [#1] SMP ARM
>> [  132.423536] Modules linked in: sha1_generic sha1_arm_neon sha1_arm
>> algif_hash af_alg snd_soc_simple_card snd_soc_simple_card_utils
>> snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd
>> soundcore fuse
>> [  132.442171] CPU: 0 PID: 513 Comm: dd Not tainted 4.19.10-rc1 #1
>> [  132.448121] Hardware name: Generic DRA74X (Flattened Device Tree)
>> [  132.454257] PC is at stack_map_get_build_id_offset+0x124/0x45c
>> [  132.460125] LR is at mark_held_locks+0x54/0x78
>> [  132.464595] pc : [<c05941cc>]    lr : [<c04bc8b4>]    psr: 20060013
>> [  132.470894] sp : ebff9b78  ip : 00000002  fp : ebff9bac
>> [  132.476144] r10: ffffe000  r9 : f5018c00  r8 : ec562018
>> [  132.481396] r7 : ebba5750  r6 : effe2400  r5 : ec562010  r4 : f5018c14
>> [  132.487958] r3 : ebff8000  r2 : 00000004  r1 : c240a758  r0 : 00000000
>> [  132.494521] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
>> [  132.501691] Control: 30c5387d  Table: abd3b280  DAC: fffffffd
>> [  132.507469] Process dd (pid: 513, stack limit = 0x0c814d44)
>> [  132.513072] Stack: (0xebff9b78 to 0xebffa000)
>> [  132.517453] 9b60:
>>    00000002 00000000
>> [  132.525674] 9b80: c1e08488 256dbf98 ebfe2c84 00000018 ebfe2cec
>> 00000001 f5018c00 00000000
>> [  132.533894] 9ba0: ebff9bfc ebff9bb0 c05948e4 c05940b4 0000007f
>> 00000000 00000000 ec0156e0
>> [  132.542114] 9bc0: ffefe180 f59bc75f ec562008 00000002 60060013
>> 00000000 00000000 00000100
>> [  132.550332] 9be0: 00000000 00000000 c1418258 c05704d0 ebff9c34
>> ebff9c00 c0564410 c0594510
>> [  132.558552] 9c00: 00000100 00000000 00000000 00000000 00000000
>> 00000000 f50db0b0 ebff9cd0
>> [  132.566770] 9c20: c05643d8 00000000 ebff9cac ebff9c38 c0570c28
>> c05643e4 00000100 00000000
>> [  132.574991] 9c40: ffffe000 00000000 60060013 ff7e0868 ebdf72c0
>> ec2f7900 00000a07 c1e08488
>> [  132.583211] 9c60: 00000100 00000000 ff7e0868 00000000 ebdf77b0
>> 00000000 aa61b412 b921aec2
>> [  132.591429] 9c80: 00000001 c1e08488 ebd3bd48 c1da5160 ff7e0868
>> c1da5164 00000000 c0aaec90
>> [  132.599648] 9ca0: ebff9d44 ebff9cb0 c0572b74 c057061c c04bcb6c
>> c04bc0c4 ebdf72c0 b921aec2
>> [  132.607868] 9cc0: 00000001 00000000 00000000 00000000 ed7b4e90
>> 00000000 ff7e0868 00000000
>> [  132.616087] 9ce0: ebfe2c00 00000000 00000100 00000000 ffffe000
>> 00000000 60060013 ff7e0868
>> [  132.624305] 9d00: ff7e0868 00000000 00000000 00000000 c04b9e14
>> c04b9d08 c1fa7f7e ebd3bd40
>> [  132.632523] 9d20: ebff9cd0 00000000 ebff9d44 b921aec2 c04dcf54
>> 00000001 ebff9d7c ebff9d48
>> [  132.640742] 9d40: c05635a8 c0572b34 00000000 00000000 c05634bc
>> 60060093 c1f4e428 c1f4ecb0
>> [  132.648962] 9d60: ff7e0868 00000000 eef92230 00000014 ebff9dbc
>> ebff9d80 c05a8938 c0563460
>> [  132.657180] 9d80: 00000001 c1fa9750 ffffe000 ebff9e34 ebff9dbc
>> ebff9da0 c055ccfc c1e08488
>> [  132.665401] 9da0: 00000000 ff7df4ac 000007b4 00000001 ebff9e14
>> ebff9dc0 c0aab0b8 c05a8904
>> [  132.673621] 9dc0: 00000001 00000000 eef92230 ff7df4ac 00000000
>> ebff9e34 ebff9dfc eef92230
>> [  132.681839] 9de0: 00000000 b921aec2 ebff9e54 c1fab6cc c1e084c0
>> ebd3bc88 00000200 c0aaafcc
>> [  132.690060] 9e00: 000007b4 00001000 ebff9ea4 ebff9e18 c0aaec90
>> c0aaafd8 0003258c ebdf72c0
>> [  132.698279] 9e20: c1e08488 00000200 c1e08488 c187b204 00000001
>> 00000000 00000000 00000000
>> [  132.706498] 9e40: 00000000 00000000 00000000 00000000 00000000
>> 00000000 00000000 00000000
>> [  132.714718] 9e60: 00000000 00000000 00000000 00000000 00000000
>> b921aec2 ebff9e9c c1e08488
>> [  132.722937] 9e80: c0aae980 ec7dda00 ebff9f58 00000000 00030000
>> 00000200 ebff9f24 ebff9ea8
>> [  132.731154] 9ea0: c06412f8 c0aae98c c04bea54 c04be3b8 c1fa8059
>> 00000000 00000000 00000800
>> [  132.739374] 9ec0: 00000000 00000055 c1e084c0 c1e08488 00000a07
>> 0003258c c1e10eb0 ebff9fb0
>> [  132.747594] 9ee0: b6fbacc0 00001208 ebff9fac ebff9ef8 c041a73c
>> b921aec2 00000000 00000200
>> [  132.755812] 9f00: ec7dda00 00030000 ebff9f58 00000000 00030000
>> 00000200 ebff9f54 ebff9f28
>> [  132.764032] 9f20: c06414b4 c06412bc ec7dd640 c0666714 c1e08488
>> ec7dda00 00000000 00000000
>> [  132.772253] 9f40: ec7dda00 00030000 ebff9f94 ebff9f58 c06419f8
>> c0641428 00000000 00000000
>> [  132.780471] 9f60: ebff9f94 b921aec2 c1da4e48 00014080 00000200
>> 00030000 00000003 c04011c4
>> [  132.788691] 9f80: ebff8000 00000003 ebff9fa4 ebff9f98 c0641a70
>> c06419a8 00000000 ebff9fa8
>> [  132.796911] 9fa0: c0401000 c0641a64 00014080 00000200 00000000
>> 00030000 00000200 00000000
>> [  132.805131] 9fc0: 00014080 00000200 00030000 00000003 0002e1f0
>> 00000000 b6fbacd0 0002e160
>> [  132.813353] 9fe0: b6f0d130 bed4a9d8 000140bc b6f0d150 60060010
>> 00000000 00000000 00000000
>> [  132.821579] [<c05941cc>] (stack_map_get_build_id_offset) from
>> [<c05948e4>] (bpf_get_stackid+0x3e0/0x45c)
>> [  132.831113] [<c05948e4>] (bpf_get_stackid) from [<c0564410>]
>> (bpf_get_stackid_tp+0x38/0x40)
>> [  132.839513] [<c0564410>] (bpf_get_stackid_tp) from [<c0570c28>]
>> (___bpf_prog_run+0x618/0x1650)
>> [  132.848173] [<c0570c28>] (___bpf_prog_run) from [<c0572b74>]
>> (__bpf_prog_run32+0x4c/0x68)
>> [  132.856398] [<c0572b74>] (__bpf_prog_run32) from [<c05635a8>]
>> (trace_call_bpf+0x154/0x298)
>> [  132.864709] [<c05635a8>] (trace_call_bpf) from [<c05a8938>]
>> (perf_trace_run_bpf_submit+0x40/0xb0)
>> [  132.873634] [<c05a8938>] (perf_trace_run_bpf_submit) from
>> [<c0aab0b8>] (perf_trace_urandom_read+0xec/0xf4)
>> [  132.883340] [<c0aab0b8>] (perf_trace_urandom_read) from
>> [<c0aaec90>] (urandom_read+0x310/0x3a8)
>> [  132.892088] [<c0aaec90>] (urandom_read) from [<c06412f8>]
>> (__vfs_read+0x48/0x16c)
>> [  132.899612] [<c06412f8>] (__vfs_read) from [<c06414b4>] (vfs_read+0x98/0x11c)
>> [  132.906785] [<c06414b4>] (vfs_read) from [<c06419f8>] (ksys_read+0x5c/0xbc)
>> [  132.913786] [<c06419f8>] (ksys_read) from [<c0641a70>] (sys_read+0x18/0x1c)
>> [  132.920789] [<c0641a70>] (sys_read) from [<c0401000>]
>> (ret_fast_syscall+0x0/0x28)
>> [  132.928308] Exception stack(0xebff9fa8 to 0xebff9ff0)
>> [  132.933386] 9fa0:                   00014080 00000200 00000000
>> 00030000 00000200 00000000
>> [  132.941605] 9fc0: 00014080 00000200 00030000 00000003 0002e1f0
>> 00000000 b6fbacd0 0002e160
>> [  132.949824] 9fe0: b6f0d130 bed4a9d8 000140bc b6f0d150
>> [  132.954906] Code: eb00807f e2506000 0a00002c eb017c95 (e5d03000)
>> 
>> Broadcast message from systemd-journald at am57xx-evm (Tue 2018[
>> 132.961142] ---[ end trace 1c5735a4a3de9954 ]---
>> -12-04 10:50:54 UTC):
>> kernel[162]: [  132.418711] Internal [  132.971394] note: dd[513]
>> exited with preempt_count 4
>> error: Oops: 207 [#1] SMP ARM
>> libbpf: object file doesn't contain bpf program
>> sh: line 1:   513 Segmentation fault dd if=/dev/urandom of=/dev/zero
>> count=4 2> /dev/null
>> test_progs: test_progs.c:1202: test_stacktrace_build_id:
>> Assertion `system(\"dd if=/dev/urandom of=/dev/zero count=4 2>
>> /dev/null\") == 0' failed.
>> test_xdp_adjust_tail:FAIL:ipv4 err 0 errno 2 retval 1 size 54
>> test_xdp_adjust_tail:FAIL:ipv6 err 0 errno 2 retval 3 size 54
>> test_tcp_estats:FAIL: err -2 errno 2
>> 
>> Full test log,
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkft.validation.linaro.org_scheduler_job_547076-23L2539&d=DwICaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=dR8692q0_uaizy0jkrBJQM5k2hfm4CiFxYT8KaysFrg&m=ZHA_6t4yZyF6uZt7Kk6p3d8BSGugaP3XM7AA_yZyw2Y&s=xDs-wlRZpvxrKQzY1Vs-beMBDtz1Wp_UG46LBR5o7oA&e=
>> 
>> metadata:
>>  git branch: linux-4.19.y
>>  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>>  git commit: 4875bf1f86d7bdc8dbf3222ab4028239446fab3f
>>  git describe: v4.19.9-143-g4875bf1f86d7
>>  make_kernelversion: 4.19.10-rc1
>>  kernel-config:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__snapshots.linaro.org_openembedded_lkft_rocko_am57xx-2Devm_rpb_linux-2Dstable-2Drc-2D4.19_43_config&d=DwICaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=dR8692q0_uaizy0jkrBJQM5k2hfm4CiFxYT8KaysFrg&m=ZHA_6t4yZyF6uZt7Kk6p3d8BSGugaP3XM7AA_yZyw2Y&s=MUmui1Z_mKLFW3b8uC5OoQ6oikjd3yhtRGVMhmLEPLA&e=
>>  build-url: https://urldefense.proofpoint.com/v2/url?u=https-3A__ci.linaro.org_job_openembedded-2Dlkft-2Dlinux-2Dstable-2Drc-2D4.19_DISTRO-3Drpb-2CMACHINE-3Dam57xx-2Devm-2Clabel-3Ddocker-2Dlkft_43_&d=DwICaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=dR8692q0_uaizy0jkrBJQM5k2hfm4CiFxYT8KaysFrg&m=ZHA_6t4yZyF6uZt7Kk6p3d8BSGugaP3XM7AA_yZyw2Y&s=vqBrjKZ3iceZRyPBUTSSdLVIsSvJ0WZKf-5hWt3OjQY&e=
>>  build-location:
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__snapshots.linaro.org_openembedded_lkft_rocko_am57xx-2Devm_rpb_linux-2Dstable-2Drc-2D4.19_43&d=DwICaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=dR8692q0_uaizy0jkrBJQM5k2hfm4CiFxYT8KaysFrg&m=ZHA_6t4yZyF6uZt7Kk6p3d8BSGugaP3XM7AA_yZyw2Y&s=fpP0kuT7R3BOTT66rUxVJ2UTEwBBUDv3Qh0eQalmExY&e=
>> 
>>  kselftest__url: https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.19.tar.xz
>>  kselftest__version: '4.19'
>>  kselftest__revision: '4.19'
>> 
>> Best regards
>> Naresh Kamboju
>> 
> 
