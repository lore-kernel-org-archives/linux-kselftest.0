Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02302492529
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484281; cv=none; b=u0NhfOn/Zx5POK7I074ZxhKV9MRiVgYo8tKCyePAFZCHt2k5JFyKbssBcZYgkszav1tsRYyZTriiA70QCHftHYf/dTxZpzu+gIEi03Kf0Ja2KaW4ItkteFB2TbJVTVkKjj6+29DW+qsmtHZ8Dx6J/0kjErX16wU1jHqIhvwLFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484281; c=relaxed/simple;
	bh=4ukv+spDQIX2E2lhjd+pi/nANVf12Qo7w+qdwYfXwOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9dfzHCMGyddMZWx76oGn0nNwITcImuymH9e/YALndGcZ+ArULZJsN3QF2Emk4OSqbn+axeHIqr8ZyYCnUqLgqIw/a4FwQrrVxuGdZobxUikpU+ZAvaKSxuYoUwLYsdVcuFvmclNfDS9SpkTBDzULTCZXaLrP66qTZ6CO8ir0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/y2EOAi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/y2EOAi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso2018227f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 12:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772484278; x=1773089078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXi9aUNBTEamIc/dINzBjAwejZeZdWklBvTEx/GQ9ms=;
        b=C/y2EOAijJ3kekRqDfvl7C0rQkTln5pSqjApZqLVVknXu0PioutGtgcm/nkjBbmdih
         v7ECXseMbRlQl01hEsHZJG2DiUDhsLbolBIEyAzGghMJi+DxaFNFABv/NWEmIFaN2JeN
         fdJqPX5nwHcS93PNh+FBqUWSym5h+nYa1X+S/r0bzF9MJpvNZm+SOFtBzAXt4YC/+iS/
         E75hra4eAVYjTsFFp3Hfc4Cy8BZ+oilsE+S00W3D6zw/aVpy7Jf4LsxcfqOYPpmy/zVs
         TauaJ82gKiiSG8RAgE7N6XSgTxTLnwOO/iIiH4aM6zomMhKY4aojdeYbyAQjsE/rTCkR
         HDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484278; x=1773089078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXi9aUNBTEamIc/dINzBjAwejZeZdWklBvTEx/GQ9ms=;
        b=MEUMytuGwe+AhHXRGz6zIWvYHQAecMP4tyh9pny7ffXdV1ZmXXd4HLyZRiCjjenkij
         ARSZxXj44PTyGmpt9HBHN1HN9l0tbNnVKS20gDQ/l1u200BaEEnJ4x6WoXwBfu24F7ih
         Ugu1b6XznoMPwE7vAlKPPREKt4yRxaOztOGMkbcnXek6NUri9iy0klkQ23GZV8UlsHhK
         cSwzb/tTDmUajvQtce79HUcZ83tNlSW2vxq8GZEjSHcxhN2zHWg/JwIS+ZTVfrk78rdG
         YccKtScYLzv/+VMYFgOUxmqA5FAhk8Hp9YIxfsHHGYttU7sW6C848sz/fUwJpmnHvKC2
         cNhA==
X-Forwarded-Encrypted: i=1; AJvYcCVxm4R+JRFrkiZO/GFXwxDD4OnpNjxhQAJCJD5SKT6q1Vxy7e+sue4nQLdEcU1k58eGOLrCa5/3Y78RjCbeccg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjrW5BIvLKLe5+A4G4SwrPE70vmlwmHtqcEQ1wtPtQ1fgtdZUg
	zeReQRSEghzd4Poa48yg2Tj8LNdGw8PnUQyeC+GVKLpglizGv4hGKAgL
X-Gm-Gg: ATEYQzz+cHCnOVgSfHcSSJQ1GUYIR8oF0rTKq9+Ys7/nCyU1j7n4P74uSJqQGGh0oC4
	oJhmw/+QryRgZ7aUJnHn0/IXSzL5rWvuFY9FvkGbdMBFW2bdtNE3AmnAWXXl0al3sB07L1fP3gu
	yxsG7OoJPoJQ69ESDuWaHfYLpkFD0zTBpB73+WERCRcDQ2H7zCHEXxY55UhEwCVN+4V2rDQjp7O
	pTev6dbJy+ji3XLLXGnyziSlRSTFOagqTyzOadzSAOUkqxME6wPXXrbqUyfeV1jG9PEDdnBGikA
	zUQwk8TY3buE/VXTEC+sFvBnvV867vMswTzWuF8qfuZkvGeZ8ntDLj9HE/TjQWlufwPEtlgjVVq
	vQcDeWWi4ktpG0CL9eoylY3zOEAmRR+nUrbkjSyLQQ1pAtoJ5H0etcbKaIczBCDhoQd+LGDVDJg
	hxUsSbwePLnQo7oc73R1w9RL3sMaelqcBDeFrKrXtC+h+ueuejldDJ13awmmrdKRg00lkdV5ZNq
	0TsR+Y=
X-Received: by 2002:a05:6000:2401:b0:439:9106:3bb3 with SMTP id ffacd0b85a97d-4399de57098mr24624886f8f.59.1772484278016;
        Mon, 02 Mar 2026 12:44:38 -0800 (PST)
Received: from ?IPV6:2001:861:4a40:8620:6e55:aea5:1db9:cf20? ([2001:861:4a40:8620:6e55:aea5:1db9:cf20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b130abfasm14493935f8f.34.2026.03.02.12.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:44:37 -0800 (PST)
Message-ID: <72bd77ed-51e0-49f2-b67c-0e68340f2070@gmail.com>
Date: Mon, 2 Mar 2026 21:44:36 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 7.0-rc1 kunit x86_64 run crashes
To: Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 david@davidgow.net
Cc: KUnit Development <kunit-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <0b621c07-9359-45fc-b14d-1a86d0b153b0@linuxfoundation.org>
Content-Language: en-GB
From: Guillaume Tucker <guillaume.tucker@gmail.com>
In-Reply-To: <0b621c07-9359-45fc-b14d-1a86d0b153b0@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shuah,

On 02/03/2026 18:57, Shuah Khan wrote:
> All,
> 
> I am seeing the following crash on Linux 7.0-rc1  kunit x86_64 run.
> Is this a known problem?

Yes, and there's a fix attached to this email:

    https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@brauner/

It's fixed in next-20260302 but not in mainline yet.

Cheers,
Guillaume

> ---------------------------------------------------------------------------
> 
> Command '['qemu-system-x86_64', '-nodefaults', '-m', '1024', '-kernel', '.kunit/arch/x86/boot/bzImage', '-append', 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-bios', 'qboot.rom']' timed out after 300 seconds
> [10:52:02] [ERROR] Test: string-stream-test: missing expected subtest!
> [10:52:02]     # string_stream_performance_test: Time elapsed:           1900 us
> [10:52:02]     # string_stream_performance_test: Total string length:    573890
> [10:52:02]     # string_stream_performance_test: Bytes requested:        823930
> [10:52:02]     # string_stream_performance_test: Actual bytes allocated: 1048312
> [10:52:02] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
> [10:52:02] BUG: unable to handle page fault for address: ffff9174c12172b8
> [10:52:02] #PF: supervisor instruction fetch in kernel mode
> [10:52:02] #PF: error_code(0x0011) - permissions violation
> [10:52:02] PGD 563f067 P4D 563f067 PUD 5640067 PMD 80000000012001e3
> [10:52:02] Oops: Oops: 0011 [#2] SMP NOPTI
> [10:52:02] CPU: 0 UID: 0 PID: 214 Comm: kunit_try_catch Tainted: G      D          N  7.0.0-rc1 #1 PREEMPT(lazy)
> [10:52:02] Tainted: [D]=DIE, [N]=TEST
> [10:52:02] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
> [10:52:02] RIP: 0010:0xffff9174c12172b8
> [10:52:02] Code: 00 00 00 00 00 00 00 00 00 00 30 39 01 80 54 99 ff ff 30 39 01 80 54 99 ff ff e0 a9 9a c1 74 91 ff ff 40 ee 86 c1 74 91 ff ff <40> 6d 82 88 ff ff ff ff f8 c1 80 c1 74 91 ff ff 00 00 00 00 00 00
> [10:52:02] RSP: 0018:ffff995480003f08 EFLAGS: 00010286
> [10:52:02] RAX: ffff9174c180c1f0 RBX: 0000000000000003 RCX: ffff9174c1397000
> [10:52:02] RDX: ffff9174c12172b8 RSI: 0000000000000001 RDI: ffff9174c180c1f0
> [10:52:02] RBP: ffff9174fec1e100 R08: ffff9174c145c6d8 R09: ffffffff880fe68b
> [10:52:02] R10: ffffffff888080c0 R11: 00000000000000a1 R12: ffff995480003f40
> [10:52:02] R13: ffff9174c186ee40 R14: 0000000000000002 R15: 0000000000000000
> [10:52:02] FS:  0000000000000000(0000) GS:ffff91757602e000(0000) knlGS:0000000000000000
> [10:52:02] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [10:52:02] CR2: ffff9174c12172b8 CR3: 0000000005218000 CR4: 00000000000006f0
> [10:52:02] Call Trace:
> [10:52:02]  <IRQ>
> [10:52:02]  ? rcu_core+0x24b/0x5a0
> [10:52:02]  ? rcu_core+0x1e9/0x5a0
> [10:52:02]  ? handle_softirqs+0xc7/0x1d0
> [10:52:02]  ? irq_exit_rcu+0x47/0x90
> [10:52:02]  ? sysvec_apic_timer_interrupt+0x69/0x80
> [10:52:02]  </IRQ>
> [10:52:02]  <TASK>
> [10:52:02]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
> [10:52:02]  ? __kmem_cache_free_bulk.part.0+0x105/0x240
> [10:52:02]  ? __pcs_replace_full_main+0x1ab/0x2f0
> [10:52:02]  ? kfree+0x158/0x290
> [10:52:02]  ? string_stream_clear+0x64/0xa0
> [10:52:02]  ? string_stream_clear+0x64/0xa0
> [10:52:02]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> [10:52:02]  ? resource_free_string_stream+0x28/0x70
> [10:52:02]  ? kunit_remove_resource+0x7b/0xa0
> [10:52:02]  ? kunit_cleanup+0x38/0x80
> [10:52:02]  ? kunit_generic_run_threadfn_adapter+0x1c/0x40
> [10:52:02]  ? kthread+0xc9/0x100
> [10:52:02]  ? __pfx_kthread+0x10/0x10
> [10:52:02]  ? ret_from_fork+0x124/0x240
> [10:52:02]  ? __pfx_kthread+0x10/0x10
> [10:52:02]  ? ret_from_fork_asm+0x1a/0x30
> [10:52:02]  </TASK>
> [10:52:02] CR2: ffff9174c12172b8
> [10:52:02] ---[ end trace 0000000000000000 ]---
> [10:52:02] RIP: 0010:kunit_test_null_dereference+0x2f/0x80
> [10:52:02] Code: 83 ec 10 49 c7 c1 10 af 75 88 49 c7 c0 20 b1 2a 88 ba 01 00 00 00 65 48 8b 05 85 66 93 00 48 89 44 24 08 31 c0 48 8d 4c 24 07 <c7> 04 25 00 00 00 00 00 00 00 00 48 c7 c6 20 30 62 88 48 c7 87 a0
> [10:52:02] RSP: 0018:ffff9954800e3ed0 EFLAGS: 00010246
> [10:52:02] RAX: 0000000000000000 RBX: ffff9174c19ab580 RCX: ffff9954800e3ed7
> [10:52:02] RDX: 0000000000000001 RSI: 0000000000000246 RDI: ffff995480013a78
> [10:52:02] RBP: ffff9174c186e200 R08: ffffffff882ab120 R09: ffffffff8875af10
> [10:52:02] R10: 0000000000000001 R11: 00000000000aae60 R12: ffff9954800ebd50
> [10:52:02] R13: ffff9174c180c180 R14: ffffffff882ab7b0 R15: ffff9174c19ab580
> [10:52:02] FS:  0000000000000000(0000) GS:ffff91757602e000(0000) knlGS:0000000000000000
> [10:52:02] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [10:52:02] CR2: ffff9174c12172b8 CR3: 0000000005218000 CR4: 00000000000006f0
> [10:52:02] Kernel panic - not syncing: Fatal exception in interrupt
> [10:52:02] Kernel Offset: 0x6e00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> [10:52:02] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
> [10:52:02] qemu-system-x86_64: terminating on signal 15 from pid 64729 (python3)
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: string-stream-test: missing subtest result line!
> [10:52:02] # module: string_stream_test
> [10:52:02] =============== [CRASHED] string-stream-test ===============
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] [ERROR] Test: main: missing expected subtest!
> [10:52:02] [CRASHED]
> [10:52:02] ============================================================
> [10:52:02] Testing complete. Ran 159 tests: passed: 81, crashed: 68, skipped: 10, errors: 69
> The kernel seems to have crashed; you can decode the stack traces with:
> $ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
> [10:52:02] Elapsed time: 350.724s total, 4.449s configuring, 46.217s building, 300.058s running
> 

