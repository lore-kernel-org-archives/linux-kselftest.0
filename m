Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B22F40DFC8
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181065; cv=none; b=UDapvH3m03p18Ir2nFdtnVsaPyRY2cJQLGyNc1TpQK6absk4+y3tVpOUk9LnSWrqT3cFMbX9lxejMwD7ljk5w+pyFGsuy75tQ//QNK7x5L0Q5xxC2HWrfjq8Wi+JUe+JHDZY7P4SJ7AVe9aaMhYI/dlg4zYPwCKM1Tk3594xBN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181065; c=relaxed/simple;
	bh=KuQAoeUw5VvFaVUix9mixdEPOjhu7di6tejilqlu3ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EATwzwLK7zUKdE0xkHDJBoBjT/YL23vUhUeVPTsszzxYa8puwn184JkYHePagV98t3Sx6j7lFYMrGu9y9QXyPitqGEoHJPSjFaQ8xutsmMP4F61w8JH36RhN8Gq74wb8rcTop33zx/78bJiz9i0noSwUOMA0u8C2RnxyCcOKs3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=TNVCrSjZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="TNVCrSjZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c252c7270faso587984166b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788181059; x=1788785859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUGpuHHAU/PbSc1GZGy8GNwrdLNTHkmDfRtWuNZwtZ4=;
        b=TNVCrSjZleB23ZiifnBOajqzwQKbhSDUQG3D0siop0nlMga2Q0BdHgVzUMRJBvqiNI
         poViAhBfpMR0YYbWtVPTa2TdD1mQ7ozmBC8tLO6gB490+EMEFMWOJZpUNPuMVZ1tG+fo
         a5gg+/+EaJKe2PYxz4Jrbe6MhlT3ugTFYF2/e6UjpF3OGztRdil/MSVFAZB/IkvobMdN
         37dfdIn58s7osfNJdkkwFteNRAxxnAahSfkJOAdm7Ly/qjGR7MXzdJp1Az9tIbaXB6CI
         UZhdE5RrFAgvNj5VYT8ODOLC7iAYEu0OmpYzy7rIkaf8TKeKDUSRfFaV1/Y3Q06nLWgT
         E7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181059; x=1788785859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUGpuHHAU/PbSc1GZGy8GNwrdLNTHkmDfRtWuNZwtZ4=;
        b=fsXzjU1wG6QQLsbiQvztvWxEbUpsz1zznZOmPyD/QudN3Z6/F+YbrFMaUID4ModKdW
         vNHvPSBlrV4lerXKARo3zliKI6PT/+Sci0JhSbIZB8Nk7vGC4I10XryUg02tDq2xsZgz
         6blX5XvsHFt1t4IYEK023bx44ZqOEmLVRF55ER9vsv2CW+2Zt25WXxzV4Iz1wdT6N0go
         6QJ6SqiCJJzC6+/F+Sl+9V/e+WR9tUzwfAAdsfdOSQZfTMpGN1MpmfVJ5hAzwBde3p0l
         /VNiI3DJAY6FUH4gtrJIj5mMZLYKjPCfpqQXu2nB+CsAZmIUGHx7J7AZoBEAjhxLV+n1
         R93g==
X-Forwarded-Encrypted: i=1; AHgh+RqDKxqT5B3NqI+Fxr2jiyrRwtmep7jnIv/4ESXMYD1IZNCvkaQCF3F/F1ctbzoSCIFV+UDbkqaD9yeHL8u7hY0=@vger.kernel.org
X-Gm-Message-State: AFuF++knld9RFxhDbzK+xwR5Pjm++R43U3o7m6Gj7DinfmMaxKlKcsK3
	OJvSV2VCWuxJSk3KllPqOffWMwa7Qzmcg2fFaL+nHpvGGJYHQ1QmywpItWIQvVkHmg==
X-Gm-Gg: AR+sD122qQOtF3PveweHnZbbvqjm9+QTHw9TmCZYR4Arv/ckF0M9cP7nQiTtHTGa6rj
	crnoGYPdNZxM8hvXKjmTwsTLva4xQGwFYfDs61rNM3dElW2YnkKSzRfNevzPpycmXWVq/v7w2qp
	hVdxcGfXv4EXjj8FiZkFqtbUnr4nLG/IDV3ifaj5PEzJSIbAZY/1SQE28VIsWuaHBKXQcQxO+3W
	x6pJKqK1nP0OWg8TKdPnwjVH+Heu4d4KvrTgxrWTUTYJ+xzAg3FnmxDvXXkHlw8HrtdUxdR2qAw
	yAHkJ9W3YEz+848XUiVQPoJmr4F0ZV7F66hl8qxDuEY9w64keNyTiIx17/Ndas3OiaR8DFd5U8Q
	libpSDgoriev/x5ukDGtGKTkn4V4E2fZhakarYGJd5BjZ+GiO0v8F9KysDxb+dmB05aB0+yW9c7
	OARlqk3JAqQxqZRzoybc1VtjMoKgHijRg45TVAc0+xyVCSV21QYqvMYSHk0dpU5kacwE7UUUxlf
	KiYFzLxP62GliecPEkEafJPGMT2iJcFjMJb
X-Received: by 2002:a17:907:c78a:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c25b3d1f286mr22620666b.18.1788181059020;
        Mon, 31 Aug 2026 05:57:39 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee28596sm446377466b.20.2026.08.31.05.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:57:38 -0700 (PDT)
Message-ID: <b1be5d00-dc18-4b36-93e4-a866dff49766@monstr.eu>
Date: Mon, 31 Aug 2026 14:57:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] microblaze: KUnit support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 8/4/26 07:32, Thomas Weißschuh wrote:
> Add the necessary prerequisites and configuration to run KUnit on
> microblaze.
> 
> Please note that various KUnit tests will fail with the default
> configuration as the memmove() implementation from
> arch/microblaze/lib/memmove.c seems to be broken.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Thomas Weißschuh (4):
>        microblaze: uaccess: Zero out destination on failed get_user()
>        microblaze: reset: Call POWER_OFF handlers
>        microblaze: reset: Provide a power off handler through an unaligned PC
>        kunit: qemu_configs: Add microblaze configuration
> 
>   arch/microblaze/Kconfig                        |  9 +++++++++
>   arch/microblaze/include/asm/uaccess.h          |  3 ++-
>   arch/microblaze/kernel/reset.c                 | 22 ++++++++++++++++++++++
>   tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
>   4 files changed, 50 insertions(+), 1 deletion(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260802-kunit-microblaze-7a3f6ac88b4d
> 
> Best regards,
> --
> Thomas Weißschuh <linux@weissschuh.net>
> 

One more thing. I see that this test is also failing on 32bit riscv. Is this 
something 32bit architecture related? That was only one test which failed on 
little endian Microblaze.

Thanks,
Michal

./tools/testing/kunit/kunit.py run       --arch=riscv32 
--cross_compile=riscv32-unknown-linux-gnu- 
"gpu_buddy.gpu_test_buddy_alloc_exceeds_max_order"
[14:53:50] Configuring KUnit Kernel ...
[14:53:50] Building KUnit Kernel ...
Populating config with:
$ make ARCH=riscv O=.kunit olddefconfig CROSS_COMPILE=riscv32-unknown-linux-gnu-
Building with:
$ make all compile_commands.json scripts_gdb ARCH=riscv O=.kunit --jobs=12 
CROSS_COMPILE=riscv32-unknown-linux-gnu-
[14:53:54] Starting KUnit Kernel (1/1)...
[14:53:54] ============================================================
Running tests with:
$ qemu-system-riscv32 -nodefaults -m 1024 -kernel .kunit/arch/riscv/boot/Image 
-append 'kunit.filter_glob=gpu_buddy.gpu_test_buddy_alloc_exceeds_max_order 
kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -accel 
kvm -accel hvf -accel tcg -serial stdio -machine virt
[14:53:56] ================== gpu_buddy (1 subtest) ===================
[14:53:56]     # gpu_test_buddy_alloc_exceeds_max_order: EXPECTATION FAILED at 
drivers/gpu/tests/gpu_buddy_test.c:1429
[14:53:56]     Expected err == -22, but
[14:53:56]         err == 0 (0x0)
[14:53:56] ------------[ cut here ]------------
[14:53:56] WARNING: drivers/gpu/buddy.c:508 at gpu_buddy_fini+0x26e/0x36c, 
CPU#0: kunit_try_catch/27
[14:53:56] CPU: 0 UID: 0 PID: 27 Comm: kunit_try_catch Tainted: G 
  N  7.3.0-rc1-00016-g9987f87429e8-dirty #9 PREEMPTLAZY
[14:53:56] Tainted: [N]=TEST
[14:53:56] Hardware name: riscv-virtio,qemu (DT)
[14:53:56] epc : gpu_buddy_fini+0x26e/0x36c
[14:53:56]  ra : gpu_buddy_fini+0xc0/0x36c
[14:53:56] epc : c02adc98 ra : c02adaea sp : c1a8dde0
[14:53:56]  gp : c14a13c8 tp : c1880000 t0 : 00000000
[14:53:56]  t1 : c1b44630 t2 : 00000000 s0 : c1a8de10
[14:53:56]  s1 : 00000015 a0 : fffffff4 a1 : c1b446f0
[14:53:56]  a2 : fffffc00 a3 : 00000004 a4 : 00000008
[14:53:56]  a5 : 00000400 a6 : 00000000 a7 : 40000812
[14:53:56]  s2 : c1a8de40 s3 : 00000000 s4 : 00000c00
[14:53:56]  s5 : fffff000 s6 : c14a3000 s7 : 0000001f
[14:53:56]  s8 : 80000000 s9 : 00000002 s10: 00000000
[14:53:56]  s11: 00000000 t3 : c1b445d0 t4 : 00000000
[14:53:56]  t5 : 0000000d t6 : 00000001 ssp : 00000000
[14:53:56] status: 00000120 badaddr: 00000000 cause: 00000003
[14:53:56] [<c02adc98>] gpu_buddy_fini+0x26e/0x36c
[14:53:56] [<c02b0ece>] gpu_test_buddy_alloc_exceeds_max_order+0x16c/0x2e4
[14:53:56] [<c01e1238>] kunit_try_run_case+0x72/0x1ba
[14:53:56] [<c01e2f16>] kunit_generic_run_threadfn_adapter+0x1a/0x32
[14:53:56] [<c003bfdc>] kthread+0xbe/0xd4
[14:53:56] [<c000f6f6>] ret_from_fork_kernel+0x1a/0x110
[14:53:56] [<c035cff2>] ret_from_exception_end+0x16/0x18
[14:53:56] ---[ end trace 0000000000000000 ]---
[14:53:56]     # gpu_test_buddy_alloc_exceeds_max_order: 
drivers/gpu/buddy.c:508: gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]))
[14:53:56] ------------[ cut here ]------------
[14:53:56] WARNING: drivers/gpu/buddy.c:516 at gpu_buddy_fini+0x33e/0x36c, 
CPU#0: kunit_try_catch/27
[14:53:56] CPU: 0 UID: 0 PID: 27 Comm: kunit_try_catch Tainted: G        W 
  N  7.3.0-rc1-00016-g9987f87429e8-dirty #9 PREEMPTLAZY
[14:53:56] Tainted: [W]=WARN, [N]=TEST
[14:53:56] Hardware name: riscv-virtio,qemu (DT)
[14:53:56] epc : gpu_buddy_fini+0x33e/0x36c
[14:53:56]  ra : gpu_buddy_fini+0xe2/0x36c
[14:53:56] epc : c02add68 ra : c02adb0c sp : c1a8dde0
[14:53:56]  gp : c14a13c8 tp : c1880000 t0 : 00005b73
[14:53:56]  t1 : c1b44630 t2 : 5d695b73 s0 : c1a8de10
[14:53:56]  s1 : 00000000 a0 : c1b12a00 a1 : 00000000
[14:53:56]  a2 : 00000002 a3 : 00000000 a4 : 00001000
[14:53:56]  a5 : 40000000 a6 : 0000007b a7 : 40000812
[14:53:56]  s2 : c1a8de40 s3 : c0cd84c8 s4 : c1a8de20
[14:53:56]  s5 : 00000001 s6 : 00000000 s7 : 00000000
[14:53:56]  s8 : 80000000 s9 : 00000002 s10: 00000000
[14:53:56]  s11: 00000000 t3 : c14a9b36 t4 : c14a9b36
[14:53:56]  t5 : c14a9ab8 t6 : c14a9b34 ssp : 00000000
[14:53:56] status: 00000120 badaddr: 00000000 cause: 00000003
[14:53:56] [<c02add68>] gpu_buddy_fini+0x33e/0x36c
[14:53:56] [<c02b0ece>] gpu_test_buddy_alloc_exceeds_max_order+0x16c/0x2e4
[14:53:56] [<c01e1238>] kunit_try_run_case+0x72/0x1ba
[14:53:56] [<c01e2f16>] kunit_generic_run_threadfn_adapter+0x1a/0x32
[14:53:56] [<c003bfdc>] kthread+0xbe/0xd4
[14:53:56] [<c000f6f6>] ret_from_fork_kernel+0x1a/0x110
[14:53:56] [<c035cff2>] ret_from_exception_end+0x16/0x18
[14:53:56] ---[ end trace 0000000000000000 ]---
[14:53:56]     # gpu_test_buddy_alloc_exceeds_max_order: 
drivers/gpu/buddy.c:516: gpu_buddy_assert(mm->avail == mm->size)
[14:53:56] ------------[ cut here ]------------
[14:53:56] WARNING: drivers/gpu/buddy.c:519 at gpu_buddy_fini+0x240/0x36c, 
CPU#0: kunit_try_catch/27
[14:53:56] CPU: 0 UID: 0 PID: 27 Comm: kunit_try_catch Tainted: G        W 
  N  7.3.0-rc1-00016-g9987f87429e8-dirty #9 PREEMPTLAZY
[14:53:56] Tainted: [W]=WARN, [N]=TEST
[14:53:56] Hardware name: riscv-virtio,qemu (DT)
[14:53:56] epc : gpu_buddy_fini+0x240/0x36c
[14:53:56]  ra : gpu_buddy_fini+0x36a/0x36c
[14:53:56] epc : c02adc6a ra : c02add94 sp : c1a8dde0
[14:53:56]  gp : c14a13c8 tp : c1880000 t0 : 0000733e
[14:53:56]  t1 : 00000029 t2 : 7a69733e s0 : c1a8de10
[14:53:56]  s1 : 00000012 a0 : c1803400 a1 : ffaf5490
[14:53:56]  a2 : 00000001 a3 : 3f2e0000 a4 : 00000001
[14:53:56]  a5 : 00000000 a6 : 0000007b a7 : 00735049
[14:53:56]  s2 : c1a8de40 s3 : c0cd84c8 s4 : c1a8de20
[14:53:56]  s5 : 00000001 s6 : 00000000 s7 : 00000000
[14:53:56]  s8 : 80000000 s9 : 00000002 s10: 00000000
[14:53:56]  s11: 00000000 t3 : c14aa17a t4 : c14aa17a
[14:53:56]  t5 : c14aa10c t6 : c14aa178 ssp : 00000000
[14:53:56] status: 00000120 badaddr: 00000000 cause: 00000003
[14:53:56] [<c02adc6a>] gpu_buddy_fini+0x240/0x36c
[14:53:56] [<c02b0ece>] gpu_test_buddy_alloc_exceeds_max_order+0x16c/0x2e4
[14:53:56] [<c01e1238>] kunit_try_run_case+0x72/0x1ba
[14:53:56] [<c01e2f16>] kunit_generic_run_threadfn_adapter+0x1a/0x32
[14:53:56] [<c003bfdc>] kthread+0xbe/0xd4
[14:53:56] [<c000f6f6>] ret_from_fork_kernel+0x1a/0x110
[14:53:56] [<c035cff2>] ret_from_exception_end+0x16/0x18
[14:53:56] ---[ end trace 0000000000000000 ]---
[14:53:56]     # gpu_test_buddy_alloc_exceeds_max_order: 
drivers/gpu/buddy.c:519: gpu_buddy_assert(!mm->used_scoreboard[i])
[14:53:56] [FAILED] gpu_test_buddy_alloc_exceeds_max_order
[14:53:56] # gpu_buddy: Testing GPU buddy manager, with random_seed=0x11376afa
[14:53:56] # module: gpu_buddy_tests
[14:53:56] ==================== [FAILED] gpu_buddy ====================
[14:53:56] ============================================================
[14:53:56] Testing complete. Ran 1 tests: failed: 1
[14:53:56] Elapsed time: 6.310s total, 0.001s configuring, 4.289s building, 
1.982s running


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

