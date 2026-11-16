Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857204;
	b=DGWVdU/2JsukjuM89wbajTfVZ08CaZC9bPwbwfdLxFz0fVrDWa7jhOJiqn13eKqNn8dq
	 otny11iPE60xg8FTixJH2Xb1g1j2tm8FNAmDb1/jkQqkwJ4RgEWRSBUmKuelHSynz3Krz
	 TIweTgeTu0u1GYkFtxnG8uK24aOgsPaqn4paQNC3jfFcAmmkaUQb1QRVIoNPF038scAbE
	 iPAioNor1yc602pqG+gvhAndDh6pRX6s+MX8Oh/swUKd8s+38xnVogYjsxUGtFSAvrw7M
	 qkuljjuyYP1bCy6Wja0Odvf5YfY2CQPUnMZ6p0ZdWZl0B4mgr8rLpCRGYRn0Laxcxdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857204;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TIljInu5CZkjAQtyryKtlWe5f+v0dKeS6BHx3Bo97w8=;
	b=kmIR4qNBkbj3VN+AF0yDIOeEmPPJQagdH9LAE+l+X9TzNPjwSQEBCITQcW+dXzvTLP2T
	 D0+oz3Y2kBpjqi+ZoiJKV5+IoKiiQGWVpROV1z9qf7AQL51GsY1N4d8ZZDly/eubl5oDw
	 WBQz93ZpB6RN27ExLwzT+MNjQdJnSPVgbApObxUUKojsGjRm7+7S5rCvmHKXDaGVO2Zjp
	 SnVnFoJm7bVsN51chYRl+hSwpmeZy2i5PsolWu0oaODSg/0iCV/dAsWsOi2ge7lLwnEXB
	 XTunDvLgGucJ/lReBJ6bjZQUMlvrndPIPKqC8IiPsVJvSlZ3jgatPlWAENE0mOHxpYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=aWi7dk5m;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17479606A323;
	Mon, 16 Nov 2026 19:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17479606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=aWi7dk5m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857201;
	bh=TIljInu5CZkjAQtyryKtlWe5f+v0dKeS6BHx3Bo97w8=;
	h=From:To:Cc:Subject:Date:From;
	b=aWi7dk5mF0kPF7Of0vlX1QsRySapgIid3RdKJU3HpFptBMPCYrRL0tM2qVoOc4Chm
	 T6tz2KGEn1CMMuCFckkT0lVoAtH5wLtjgXNDyaDg+zdc4ACuLV7gf7bWbGgJ5dYcmC
	 U5DH2ah9LmzTDqBFw9zC7fs1tt6xzWe/0KOMSyxWoy85dWcEbFdJkF14hlVmHVPilU
	 U4C9wibYj1Kf1WWXMiOAS2FfpHl80JnoF55YVmK6d9RCKzxomolkVVmcWaYdRT3dAX
	 VpAAn53cxqLFAKGq/3Z3eSwmIClljP1syjTctlWEzCBW2mEMTNVx308y7kEqoiYMY0
	 xSQkBnvvuvZHA==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXd5qz9zRJj;
	Mon, 16 Nov 2026 14:26:41 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: jstultz@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	connoro@google.com,
	arighi@nvidia.com,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 0/8] sched/proxy: fixes for proxy execution, with selftests
Date: Mon, 16 Nov 2026 14:26:30 -0500
Message-Id: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi John, Peter,

This series fixes six problems of proxy execution, and adds a test
module and a selftest for them. I found them while I looked at how
SCHED_DEADLINE priority inheritance could move to proxy execution.

It applies on top of v6 of my deadline series (link below). Patches 4
and 6 need it: they change code that v6 adds to the deadline bandwidth
accounting. Patches 1, 2, 3 and 5 do not.

The fixes:

 1  Reschedule when a blocked task is woken under a proxy, so that the
    old owner stops running on the donor's context.
 2  Wake blocked RT and deadline tasks through the full wake-up path, so
    that they are pushable and another CPU can take them.
 3  Stop the chain walk when the blocked_on chain is a cycle, so that a
    mutex deadlock no longer locks up the CPU.
 4  Tell the class about a proxy migration, so that the load of a fair
    donor is attached to the runqueue it moves to. The bandwidth of a
    deadline donor stays in its root domain.
 5  Clear blocked_donor when the donor stops donating, so that the
    unlock path does not use a task that can be freed.
 6  Check and admit a proxy-migrated deadline task in its own root
    domain, so that sched_setattr() no longer fails with EPERM.

The selftest shows the behaviour that patches 1 to 4 and 6 fix. Patch 5
comes from reading the code: I have no reproducer for it.

The tests:

 7  test_proxy_exec, a module with kernel mutexes that user space can
    hold, take and chain through debugfs. Proxy execution acts on tasks
    blocked on a struct mutex, and no system call lets user space block
    tasks on one in a chosen way.
 8  proxy_exec_test, a selftest with eight cases. Each fails with proxy
    execution and passes with the fix its comment names. All pass with
    sched_proxy_exec=0. The deadlock case runs only with
    PROXY_EXEC_TEST_DEADLOCK=1: a kernel without patch 3 locks up.

Points I would like your opinion on:
- Patch 2 sends RT and deadline tasks through the full wake-up again. That
  undoes part of commit 7918cf369361 ("sched/proxy: Only return migrate
  when needed") for these classes. Putting the woken task on the pushable
  list in place would keep the optimization, but it needs a hook into
  the classes.
- Patch 1 reschedules for any blocked task woken on a runqueue that runs
  a proxy. A fair task woken from a delayed dequeue there also triggers
  it. That is harmless, but not free.
- Patch 3 also stops the donation on a ww_mutex cycle that the wound or
  die path is about to break. The donor then sleeps on its mutex.
- Patch 4 repeats in proxy_set_task_cpu() what set_task_cpu() does
  around __set_task_cpu(). A helper shared by both would keep them from
  drifting apart. I left it out to keep the fix small.

Not in this series:
- A donor's reservation used in a root domain that did not admit it.
  This happens when the affinities of the donor and the owner do not
  overlap.

Testing
=======

The tests ran in x86-64 QEMU guests with PREEMPT_LAZY and lockdep:
- proxy_exec_test on 4 CPUs: 8 runs with proxy execution and 8 with
  sched_proxy_exec=0 pass, half of them with the deadlock case. On
  deadline v6 with the test module alone, every case fails with proxy
  execution, in 8 runs of 8. The deadlock case hangs the guest there.
- The deadline selftests of v6 pass in 10 guests, with and without
  proxy execution.
- locktorture passes with mutex_lock and with ww_mutex_lock (16 writers
  on 8 CPUs, 180s), with and without proxy execution. So do the
  ww_mutex, locking API and futex selftests.

How this was developed
======================

An LLM coding assistant reviewed the proxy execution code under my
direction. It wrote these patches, their messages and the tests, which
I reviewed. A reproducer that stops failing shows that the symptom goes
away. It does not show that the fix is the one you would have written,
so I ask for a careful reading.

Based on tip sched/urgent, ec6f6731538e, with v6 of "sched/deadline:
bandwidth accounting fixes and selftests" applied first:
https://lore.kernel.org/all/20261116190549.230119-1-mathieu.desnoyers@efficios.com/


Mathieu Desnoyers (8):
  sched/proxy: Reschedule when a blocked task is woken under a proxy
  sched/proxy: Wake blocked RT and deadline tasks through the full path
  sched/proxy: Stop the chain walk when the blocked_on chain is a cycle
  sched/proxy: Tell the class about a proxy migration
  sched/proxy: Clear blocked_donor when the donor stops donating
  sched/deadline: Use the root domain a proxy-migrated task runs in
  lib: Add test_proxy_exec, kernel mutexes that user space can hold
  selftests/sched: Add tests of proxy execution

 kernel/sched/core.c                           |  94 +-
 kernel/sched/deadline.c                       |  10 +-
 kernel/sched/sched.h                          |  23 +
 kernel/sched/syscalls.c                       |   9 +-
 lib/Kconfig.debug                             |  11 +
 lib/Makefile                                  |   1 +
 lib/test_proxy_exec.c                         | 132 +++
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/sched/proxy_exec/.gitignore     |   1 +
 .../selftests/sched/proxy_exec/Makefile       |   7 +
 .../testing/selftests/sched/proxy_exec/config |   5 +
 .../sched/proxy_exec/proxy_exec_test.c        | 913 ++++++++++++++++++
 .../selftests/sched/proxy_exec/settings       |   1 +
 13 files changed, 1200 insertions(+), 8 deletions(-)
 create mode 100644 lib/test_proxy_exec.c
 create mode 100644 tools/testing/selftests/sched/proxy_exec/.gitignore
 create mode 100644 tools/testing/selftests/sched/proxy_exec/Makefile
 create mode 100644 tools/testing/selftests/sched/proxy_exec/config
 create mode 100644 tools/testing/selftests/sched/proxy_exec/proxy_exec_test.c
 create mode 100644 tools/testing/selftests/sched/proxy_exec/settings


base-commit: ec6f6731538e0d45872eb279fdeb477bed152d6f
prerequisite-patch-id: 5e2478ffdfb7583751bf44bdf87fb930bc23551b
prerequisite-patch-id: d5e5ef986ff2d9bc39a87b56e96a2acbd3158687
prerequisite-patch-id: 99e47f80396008ee2b2576157d37842481ce52d2
prerequisite-patch-id: a10824f98c11a4c902dad55cab3ec03b3dbe2c8a
prerequisite-patch-id: 6a944081caf562b37b617f6a763fb9c5e93b7671
prerequisite-patch-id: 16acf1d18f01d20310d6db767dfbec2f072e0372
prerequisite-patch-id: e1946bb015a7b14ed4e2cd0421e5e30b0c7afdda
prerequisite-patch-id: 13ae41e148238564753e668868311a4d5e905020
prerequisite-patch-id: f8b34127a06e7503c069fb08e275574569aa1663
prerequisite-patch-id: d76a04cc6382c157d75b79231e6cba472367d875
prerequisite-patch-id: fb69a0665dc38ca9022cc2bd75234a90e2035b7f
prerequisite-patch-id: e5b851fc06511b47520dbbd96a7823cb28e83904
prerequisite-patch-id: 6e7ce0551aae3d1e5cdffcb79a9dfad9572d171e
prerequisite-patch-id: 8574b50d81a09ec6091e42d65338adcab2986d71
prerequisite-patch-id: cf098d7617ec51026a60140b231640a73a67be83
prerequisite-patch-id: b4ace4d6fbffab1d45765c86650ca535c4bade7e
prerequisite-patch-id: f6b9bef6e53a08be446fd431a8d6790470c74234
prerequisite-patch-id: 1aa25df96d60d30f549c71fdfba5589cb239928f
prerequisite-patch-id: 3f22a07ea1846d81570daafd00db92f077a6703e
prerequisite-patch-id: e1dd6913718da692992ed4c0304e56b93195327e
prerequisite-patch-id: ca239064b2461ed44c672e2e0cc3f53ff372f134
prerequisite-patch-id: a005df845d96a168895545d1ee2e003b353fbf98
prerequisite-patch-id: 002838bd7a490b5652baa9e9ff4807fcd7a2abe8
prerequisite-patch-id: f4c7d346d9b538b65385631a620a6b154b85a848
prerequisite-patch-id: 12e92679eab6c8262b962c9aabd221a2d3bccfd4
prerequisite-patch-id: 0518465685600028b5cef2695868f32ca9705ea7
prerequisite-patch-id: f75ff674ec8c99e53c6460a8f70828060947bd39
prerequisite-patch-id: 9f785aa3a5378bded94e838c9fb9305cb90d1d33
prerequisite-patch-id: 73b7bf5a66a4b43ebc393b7a77ec59cf92c6f944
prerequisite-patch-id: 9b860d340021441081e605651f409c46769501f2
prerequisite-patch-id: bddfc273edbf8d9c19aa8429731c93fb62a26395
prerequisite-patch-id: 1c864890d70c38372dc4ae9326e41b794e163ab8
prerequisite-patch-id: f8b569a9b72ed4acb0c8d7f7bfeaa91ada80f7f4
prerequisite-patch-id: d38384e0b7d043a3556ee02fb09316a6227038da
prerequisite-patch-id: 1f13e48ca223d57cf3a2087600949330f82457c1
prerequisite-patch-id: 727a8041cecc638f8051ad069b7606515c1739c4
prerequisite-patch-id: 566a6e8350b5ae85e6aaf0579d84c2227672b56d
-- 
2.47.3

