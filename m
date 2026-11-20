Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172315;
	b=liWI5fvqVkKhn8kKHrFXBS/woIT4t03iERJUlkz5XRn+MKp3R3kswH5WX6d7tTWjms6i
	 Pl8igCCW/FNBt5bPWmctKT8WdrYd4udg+gp3Jzk+X/HHtomglfsOwXg2ymHpD+6vn/LpZ
	 mjw1q7AEm+YCvR2Cz2nDxpAT1mHe3ueDxow+ANfcnDGvWJ2u6HhT0OtHWb9t34kSSEKnC
	 25mvLDHol4/JuJaR+CDbY1USPBCrzEFb06JYNnuN40a1oNBSwZ/s7E5GsCxR9P0Qd3qlu
	 2Fmn8AB0a32+oAxlTL4d3J6Yr27M7GsEyc9bVTAvRs+3RacBCYzX1IRwudszz4A2esg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172315;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=yvQXu6dR+QvEP8TzMzLD7JVkNNphPtBs+knO8K3lRNM=;
	b=V9N9wuZFnDZnCkCwc7lVZLWiAUJPj3xrr03pevQkwEYb2YNRAhwEQb6KwusjOgzMPEGt
	 LY8PHzBq++CLmAzh6Ri6kjg/BlzH2Y1ntDddmBvPVFVW8FoSdwhJ/pRKX/HkjL9txHuND
	 XcGXbcjxcbz2VMYygZrxWAdioB+DNp33OUI+HE0xlqBXx6lgKJjO08VIP4yQ7NadZHdLh
	 ee8val7TqARmu++P1rWU5tXWCpvhWBQoiwfwHYBdKLQbrabM+Af9Rz1weidp/gkeD5YnW
	 Rq5OpC3DxzrUXvwi42ugxbI6ypKvIDCsRwYKkEkGV8UsqoYQqjASiuSWG/g6C5SIZYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=pBCS4zUK;
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113A606A320;
	Fri, 20 Nov 2026 10:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1113A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=pBCS4zUK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795172315; x=1826708315;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yvQXu6dR+QvEP8TzMzLD7JVkNNphPtBs+knO8K3lRNM=;
  b=pBCS4zUK1xGnNj8kIKHkFyGvZuQln/9jFgT7he8pAbpcyFHT7XmSeLmc
   T0UILv9h61a7+E8yZeMKvC/VJEGoC8hAeFtyKRbHI/+SgOjNiCumKDW7V
   EltvYGTXVmmQPpIOkIKqzAUb5yqYK9B4fhZ3cpzF7FjXb9YPzM4q1Bt4e
   FyWCS4Fc7VVslgHbG27so8qZNKWCSNZDV3XS2R+IQ+6tXVfkkLQ2AS5oc
   T5E+toKj4/sDgJKWvT8YzeS0o9/Wkub/VCxLJmjR1RJYY3WBkJFoDcx7R
   JhcaJEsAN8VkjVVje78nEngMrf+xHVkYKOWEdFcq7Z6MssxlZQ8a+cgfN
   Q==;
X-CSE-ConnectionGUID: /8KqqdTBS6+wz+n3QN+Ogg==
X-CSE-MsgGUID: poCk/whcRFKLq01QejUFrw==
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="34597964"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:58:32 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:16912]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.86:2525] with esmtp (Farcaster)
 id af5e9a32-fd9b-4dd2-ba91-6e9a937cc2f3; Fri, 20 Nov 2026 10:58:32 +0000 (UTC)
X-Farcaster-Flow-ID: af5e9a32-fd9b-4dd2-ba91-6e9a937cc2f3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Fri, 20 Nov 2026 10:58:31 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Fri, 20 Nov 2026
 10:58:29 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>, Shuah Khan
	<shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Fernand Sieber
	<sieberf@amazon.com>, Roman Kagan <rkagan@amazon.de>
Subject: [PATCH v2 0/3] sched/core: Fix stale core_pick and forced idle after SM_IDLE fast path
Date: Fri, 20 Nov 2026 10:58:19 +0000
Message-ID: <20261120105822.7770-1-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Under core scheduling, a core-wide selection can leave a pick for an
idle sibling in rq->core_pick and force the other sibling idle. If the
picked task is migrated away before the idle sibling schedules, and it
was that sibling's only task, the SM_IDLE fast path (v6.12+) sends the
sibling back to idle without a pick. The core then stays forced idle
with nothing running, and the forced idle accounting keeps using the
stale pointer, also after the task and its cgroup are freed.

Patch 1 clears rq->core_pick when the picked task is dequeued. Patch 2
stops idle CPUs from taking the SM_IDLE fast path while the core is
forced idle. Patch 3 adds a selftest for the stuck forced idle and the
use-after-free.

Changes in v2:
- Patch 2: drop the rq->core_pick check. With patch 1 a pending pick
  is always queued on its rq, so an empty runqueue has none (Peter).
  Reword the subject and changelog accordingly.
- Patch 3: new, a selftest derived from the reproducer (Peter). It
  checks for stuck forced idle and, with cgroup v2 and schedstats,
  frees each stalled task with its cgroup to catch the use-after-free.
- v1: https://lore.kernel.org/lkml/20261117142704.6878-1-lshahed@amazon.de/

Testing, on tip sched/core d7e670601af6, schedstats=enable:

- KVM guest, 2 cores x 2 threads, idle=halt, the v1 reproducer. Without
  the series, both boots oopsed in __cgroup_account_cputime_field()
  from __sched_core_account_forceidle(). With v2, 6 boots of 240 s
  (972562 attempts) showed no stuck forced idle and no oops; the
  no-migrate control (194596 attempts) was clean as well.

- cs_forceidle_test through run_kselftest.sh in the same guest, 30 s
  runs. Without the series, all 11 runs crashed in
  __cgroup_account_cputime_field() 0.4-2.2 s into the test (with
  KASAN, 2 of 2 first reported a slab-use-after-free in
  __account_forceidle_time()); with -n, which skips freeing the
  stalled tasks, 72, 59 and 67 stalls in about 20000 attempts each.
  With v2, 10 of 10 runs passed with 0 stalls and nothing in dmesg (2
  with KASAN, 2 booted without schedstats). With patch 1 alone, 42, 43
  and 34 stalls and no crash; with patch 2 alone, 0 stalls.

- Builds with SCHED_CORE on and off, SCHEDSTATS on and off,
  SCHED_CLASS_EXT, PREEMPT_RT, tinyconfig and allnoconfig; W=1 clean in
  kernel/sched/, and each patch builds on its own.

Ibrahim Elshahed (3):
  sched/core: Clear a stale rq->core_pick after dequeue
  sched/core: Don't take the idle fast path while the core is forced
    idle
  selftests/sched: Add a test for stuck forced idle under core
    scheduling

 kernel/sched/core.c                           |  28 +-
 tools/testing/selftests/sched/.gitignore      |   1 +
 tools/testing/selftests/sched/Makefile        |   1 +
 tools/testing/selftests/sched/config          |   2 +-
 .../selftests/sched/cs_forceidle_test.c       | 471 ++++++++++++++++++
 5 files changed, 500 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched/cs_forceidle_test.c


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.47.3

