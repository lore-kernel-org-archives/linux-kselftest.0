Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB244266AF
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772474248; cv=none; b=QBa9fs9Zmr/lG99tN71SBjWHHWOviA1gFiBAdOYo3FrDa6kKHMKQb5MhPMQAU9BxwbBwqsTeK9R2UulL/T+K76KztpBU/IbUtdbpxHPN+qJG+NzbeR9MiAaUpzOEvDMR1MC1rH1/wWpuyD4UXdYuDT39uv9sLAZYAJz5okpXq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772474248; c=relaxed/simple;
	bh=W1+PwYwc0tgjP4gNsTYo5LKWbikmYKB6OhEtfhDWqo4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tta8VY+kbVfIa/kuSsJZYvGTv3H/xKaIbghICwYcld9KELPPJjaps+xk4Sb5k73i015K25ogqiAYWMRp3g3nMBGMxhWWr9VNe7udgGduovoWokNzZcK0VfTIlOfXPddcTZLBgSZra64y4db61/cdL6HTswBOFdgb+7JUmMQ6Hsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O3KgD4U1; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O3KgD4U1"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d1872504cbso2352538a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 09:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772474246; x=1773079046; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GHZwxEOSUvZ5QPp84XmR7M89P6ABzkp4T2LW46zkr0=;
        b=O3KgD4U1rYsO5HvwIymhnbWz2v5Mucc+Q1Z1fq9rmGS7y9RJCuSrhCxpQaQGFJuJdU
         Igx+AXI6deejWZUqGAlD2WfMChfoXEZJOqyO5oVRBFdPe6ENDs4scWcgL99CX1u43jLM
         OkD5WlXUq/l0DEPVX2xlyVat49ZNHCuqxJTrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772474246; x=1773079046;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GHZwxEOSUvZ5QPp84XmR7M89P6ABzkp4T2LW46zkr0=;
        b=Lo5l5SnQYvXk4fifxwl8klfz0jJ5FD7Rr0YDCK6vlWXNVzrAhpfUHjwLIoYVFnScSD
         XwBFyp6juuNnGyN0/4Z3+TEqQHcTeO7RFqGGgv269TQ1rlQZxveYRHNxbgn/ZIC+YZPh
         rAmLXcmAGugYkmoSjuK+wLu/lCNQDpzIsbPkz1ThBOAX+uXYEsfIWJI/LzDgR/B9bOPQ
         gou8ifjmMQT9DheMX5kj/aqXeWxsAhoNixaP9DfO6/JXEHZ1VPR1bhy26G86SZrCIkbg
         35Ngz6Uea5yzQvx1FoxRMtYc958DgwTgwkAy8xK7TB3bu4Ai2aowhZRJo/xhIotsB2s2
         Rd0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6r0m2mC8kx+dIqKoOkBgD2S+nQ1uLezvnywdBH0Kxkm3pCZOARPnyenQ3tond3E0MctGVOylw/gVyKnUFTUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dp05Nw04n08FLYZvvc8yRdkujzNF8EofPTR4uaLnQI65ehBq
	+5IlUOUdGDBqIYtlu98NMgBBzTZZTjGqwDYDXy+8AOUwvsGzLbd/4U/YN4YRXUjqqzM=
X-Gm-Gg: ATEYQzzgsVO6knzjIVsnMhFxZbP5wWaJH0FyQkXyoxDiUNb67nSS7GoNsRlZx3AQM42
	uqF3tbFNr2CcBAH79lXmCZpGBGIbYUuJVcPa2ekCY5Ws029kiEPwDhqZqW4Ib6wEMY2Ez5dt1XP
	KVVQgwdwdbxNXkzkfDdecv+Di7B21AZeJtM9/WMlyVfAORNqGgRRi81oE0C7xaPexWbWjGhh4BW
	INjr3ssfDqekhekcJ3dwnjlPTFS0PO+Dq0mkYZyugPmjIYUVkfGtl+Ni2Pea6gPIFzSSvdQOn8O
	LOav+2Tblo5FKfEoobn6Quwgj4uII5lyPVoGhapbE5is2J4r3+HDa4WQ9waEiNsOyvwqcyiA9XR
	Q5I1W8jCrJarroIqcfkJoROje6dFZPecNscDfC7X3me1lNdw6V3YNMDbYCYOMfFuUJHUKnm5Q6r
	JtX3IUPh5nsZSQ2yzwtH9MSvXjxp90aqXkbTk=
X-Received: by 2002:a05:6830:264f:b0:7d1:89b9:9205 with SMTP id 46e09a7af769-7d5856c012fmr10965408a34.3.1772474245968;
        Mon, 02 Mar 2026 09:57:25 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58666e5c6sm11634247a34.25.2026.03.02.09.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:57:25 -0800 (PST)
Message-ID: <0b621c07-9359-45fc-b14d-1a86d0b153b0@linuxfoundation.org>
Date: Mon, 2 Mar 2026 10:57:24 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, david@davidgow.net
Cc: KUnit Development <kunit-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Linux 7.0-rc1 kunit x86_64 run crashes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

All,

I am seeing the following crash on Linux 7.0-rc1  kunit x86_64 run.
Is this a known problem?

thanks,
-- Shuah

---------------------------------------------------------------------------

Command '['qemu-system-x86_64', '-nodefaults', '-m', '1024', '-kernel', '.kunit/arch/x86/boot/bzImage', '-append', 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot', '-no-reboot', '-nographic', '-accel', 'kvm', '-accel', 'hvf', '-accel', 'tcg', '-serial', 'stdio', '-bios', 'qboot.rom']' timed out after 300 seconds
[10:52:02] [ERROR] Test: string-stream-test: missing expected subtest!
[10:52:02]     # string_stream_performance_test: Time elapsed:           1900 us
[10:52:02]     # string_stream_performance_test: Total string length:    573890
[10:52:02]     # string_stream_performance_test: Bytes requested:        823930
[10:52:02]     # string_stream_performance_test: Actual bytes allocated: 1048312
[10:52:02] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
[10:52:02] BUG: unable to handle page fault for address: ffff9174c12172b8
[10:52:02] #PF: supervisor instruction fetch in kernel mode
[10:52:02] #PF: error_code(0x0011) - permissions violation
[10:52:02] PGD 563f067 P4D 563f067 PUD 5640067 PMD 80000000012001e3
[10:52:02] Oops: Oops: 0011 [#2] SMP NOPTI
[10:52:02] CPU: 0 UID: 0 PID: 214 Comm: kunit_try_catch Tainted: G      D          N  7.0.0-rc1 #1 PREEMPT(lazy)
[10:52:02] Tainted: [D]=DIE, [N]=TEST
[10:52:02] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.1 11/11/2019
[10:52:02] RIP: 0010:0xffff9174c12172b8
[10:52:02] Code: 00 00 00 00 00 00 00 00 00 00 30 39 01 80 54 99 ff ff 30 39 01 80 54 99 ff ff e0 a9 9a c1 74 91 ff ff 40 ee 86 c1 74 91 ff ff <40> 6d 82 88 ff ff ff ff f8 c1 80 c1 74 91 ff ff 00 00 00 00 00 00
[10:52:02] RSP: 0018:ffff995480003f08 EFLAGS: 00010286
[10:52:02] RAX: ffff9174c180c1f0 RBX: 0000000000000003 RCX: ffff9174c1397000
[10:52:02] RDX: ffff9174c12172b8 RSI: 0000000000000001 RDI: ffff9174c180c1f0
[10:52:02] RBP: ffff9174fec1e100 R08: ffff9174c145c6d8 R09: ffffffff880fe68b
[10:52:02] R10: ffffffff888080c0 R11: 00000000000000a1 R12: ffff995480003f40
[10:52:02] R13: ffff9174c186ee40 R14: 0000000000000002 R15: 0000000000000000
[10:52:02] FS:  0000000000000000(0000) GS:ffff91757602e000(0000) knlGS:0000000000000000
[10:52:02] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[10:52:02] CR2: ffff9174c12172b8 CR3: 0000000005218000 CR4: 00000000000006f0
[10:52:02] Call Trace:
[10:52:02]  <IRQ>
[10:52:02]  ? rcu_core+0x24b/0x5a0
[10:52:02]  ? rcu_core+0x1e9/0x5a0
[10:52:02]  ? handle_softirqs+0xc7/0x1d0
[10:52:02]  ? irq_exit_rcu+0x47/0x90
[10:52:02]  ? sysvec_apic_timer_interrupt+0x69/0x80
[10:52:02]  </IRQ>
[10:52:02]  <TASK>
[10:52:02]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
[10:52:02]  ? __kmem_cache_free_bulk.part.0+0x105/0x240
[10:52:02]  ? __pcs_replace_full_main+0x1ab/0x2f0
[10:52:02]  ? kfree+0x158/0x290
[10:52:02]  ? string_stream_clear+0x64/0xa0
[10:52:02]  ? string_stream_clear+0x64/0xa0
[10:52:02]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[10:52:02]  ? resource_free_string_stream+0x28/0x70
[10:52:02]  ? kunit_remove_resource+0x7b/0xa0
[10:52:02]  ? kunit_cleanup+0x38/0x80
[10:52:02]  ? kunit_generic_run_threadfn_adapter+0x1c/0x40
[10:52:02]  ? kthread+0xc9/0x100
[10:52:02]  ? __pfx_kthread+0x10/0x10
[10:52:02]  ? ret_from_fork+0x124/0x240
[10:52:02]  ? __pfx_kthread+0x10/0x10
[10:52:02]  ? ret_from_fork_asm+0x1a/0x30
[10:52:02]  </TASK>
[10:52:02] CR2: ffff9174c12172b8
[10:52:02] ---[ end trace 0000000000000000 ]---
[10:52:02] RIP: 0010:kunit_test_null_dereference+0x2f/0x80
[10:52:02] Code: 83 ec 10 49 c7 c1 10 af 75 88 49 c7 c0 20 b1 2a 88 ba 01 00 00 00 65 48 8b 05 85 66 93 00 48 89 44 24 08 31 c0 48 8d 4c 24 07 <c7> 04 25 00 00 00 00 00 00 00 00 48 c7 c6 20 30 62 88 48 c7 87 a0
[10:52:02] RSP: 0018:ffff9954800e3ed0 EFLAGS: 00010246
[10:52:02] RAX: 0000000000000000 RBX: ffff9174c19ab580 RCX: ffff9954800e3ed7
[10:52:02] RDX: 0000000000000001 RSI: 0000000000000246 RDI: ffff995480013a78
[10:52:02] RBP: ffff9174c186e200 R08: ffffffff882ab120 R09: ffffffff8875af10
[10:52:02] R10: 0000000000000001 R11: 00000000000aae60 R12: ffff9954800ebd50
[10:52:02] R13: ffff9174c180c180 R14: ffffffff882ab7b0 R15: ffff9174c19ab580
[10:52:02] FS:  0000000000000000(0000) GS:ffff91757602e000(0000) knlGS:0000000000000000
[10:52:02] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[10:52:02] CR2: ffff9174c12172b8 CR3: 0000000005218000 CR4: 00000000000006f0
[10:52:02] Kernel panic - not syncing: Fatal exception in interrupt
[10:52:02] Kernel Offset: 0x6e00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[10:52:02] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
[10:52:02] qemu-system-x86_64: terminating on signal 15 from pid 64729 (python3)
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: string-stream-test: missing subtest result line!
[10:52:02] # module: string_stream_test
[10:52:02] =============== [CRASHED] string-stream-test ===============
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] [ERROR] Test: main: missing expected subtest!
[10:52:02] [CRASHED]
[10:52:02] ============================================================
[10:52:02] Testing complete. Ran 159 tests: passed: 81, crashed: 68, skipped: 10, errors: 69
The kernel seems to have crashed; you can decode the stack traces with:
$ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
[10:52:02] Elapsed time: 350.724s total, 4.449s configuring, 46.217s building, 300.058s running
