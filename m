Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB5242D6A
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 23:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295296; cv=none; b=gp7uWMYclo/YbeVMrsS0MsWnMvGfUk+Kou9rHK/wujZIocSVjBNchbefQRi/QqtM/0vv+Xp3Lf3oa53QN+TFbK6eRBtqHXsBO0Qp3Ajc3WySajxuymnoy9+LYY2ZHPOd3GiasYdSXvgpROtA5T78cg40ovqonlcy1QCIezQGxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295296; c=relaxed/simple;
	bh=6dAhuECT/i1VihQi3r45JGDd6acMTRJ9plcxtde7Fn0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PJbaSXHjSVqqXDdGzILz3GRAGQ/ynKkO09wtU07WeiYHiFwsJ0lGuV0r8dD6HpUoD+pi4mWivPC3wt2acq6Qmm+kH7hB4M4HMDsp3sE3kjX3ytaRqbj5SB1wLl1LBntrAUI5cDdJeYHaRzbzZhWmmb/n5bVuj17xYN/MQo8xhdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X4b63/zq; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X4b63/zq"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdd327d970so78853eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 16:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776295293; x=1776900093; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+r+WpZUUQ/YvdDlyZscQdfNrzTqbtr5QHQkAJv55K3U=;
        b=X4b63/zqCfUiwaG554XMiwn1ZyYAa/xLbA5PczHnIp/PY2F7kWK36iy7vad6m5jtMz
         qda7Cy1zcLlxsrJNpJkxizbmSiUYsvLMBwfMcP/3q3bQ3AmQz4Mve9rhs4EkV9RPMV7F
         fmfjEzDE1YLTblWaktV97NK3SPXDAFaIORK9PCPy5ia6q8mnTdscxn9brN/yb3MHCVNh
         gJrGEuXWiKD2l3qHoHkuksHepnaPelGvuMAjrf41E9EbjlVKd5EyZZxKd2ffZHBrJ1ys
         ii86s5KS0nZllGQAQYnOy8shvJAAbxQVClXX1uuutgLD+0GKelQJuda9YeZmtdIOGHSk
         jxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295293; x=1776900093;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+r+WpZUUQ/YvdDlyZscQdfNrzTqbtr5QHQkAJv55K3U=;
        b=Ls5DENaWl+zwCzqoVZSBtVG4qyCI9fy5j23lxVKIbfy7KOQPizbc8DBEpcINMZY+i6
         3OSTAq3e5fXCPEEz11cT4z+wmxi1nbyX/pLNOcL1iTA/HRd7LHzVgDb1sMyxCzbseUCj
         PtTLeXjEuFZojCMK+sKtPWUILhoeHGxhBvFZwzBETKoOh8dt89EtQkjs8qdeBygVLStw
         gfz1sUuwYu4P/fdH2YS8tk1klNaXH/YKQTEDBEjzykrt73EFSOZSqKDNojy20MusjrfC
         L6TQaudipgCa9AWOH3SdJ67yqqWvc8ssN327jREBE52K3nvi/iUumzvPBeo8o9GTPxnc
         XPqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8O+gAY0SGf967UmtSC2sjLfEt+EL4udRyDEsQE8bILeUrPT4rC8YwMaEzUG3DTJFkC25B6KwOW018V5JQmur0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1gzI4ExtqCi9AL89VD/KdBkp+HC7WmJrJK2NCfBu8xwZUVSS6
	eOy3um3Rqi98i/1tGG3CwINC9o2ChwWx+Kl9X7kHxVvj2q8Jry6Te8on84RTa9JHwb1Oyjkz9LM
	gKEOg6/6g0bBc4cTtvaHgYVrfh74f0IB9Qw==
X-Received: from dybdm8.prod.google.com ([2002:a05:7300:bb08:b0:2d8:5557:aec])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:ad26:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2df7dcdd7b4mr803163eec.7.1776295293029;
 Wed, 15 Apr 2026 16:21:33 -0700 (PDT)
Date: Wed, 15 Apr 2026 23:21:04 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.513.gad8abe7a5a-goog
Message-ID: <20260415232106.2803644-1-aniketgattani@google.com>
Subject: [PATCH v2 0/2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aniket Gattani <aniketgattani@google.com>
Content-Type: text/plain; charset="UTF-8"

This series mitigates a severe contention issue in the membarrier system
call by replacing the global membarrier_ipi_mutex with per-CPU mutexes
for targeted expedited commands.

Problem:
Currently, MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ relies on a single
global mutex to serialize IPIs. On large systems with heavy concurrent
usage, this creates significant contention. The issue cascades into
hard lockups when combined with CFS bandwidth throttling, during which
target CPUs may have interrupts disabled for extended periods.
If membarrier is waiting on such a CPU, it holds the global mutex,
stalling all other membarrier callers system-wide.

Solution:
Patch 1 introduces membarrier_cpu_mutexes to serialize expedited commands
specifically when a target CPU is provided, isolating the lock contention
to the targeted CPU. Broadcast commands continue to use the global mutex.

Patch 2 introduces a dedicated kselftest reproducer
(membarrier_rseq_stress) to permanently test this interaction. It
aggressively hammers targeted membarrier commands within a deep,
aggressively throttled cgroup hierarchy to prove the lockup scenario
and validate the fix.

Results:
As measured by the stress test introduced in Patch 2, testing on an
AMD Turin machine with 384 CPUs (2 NUMA nodes, SMT=2) shows:

Throughput: ~200x increase in successful membarrier calls.

---
Changes in v2:
v1: https://lore.kernel.org/lkml/20260409212223.2072418-1-aniketgattani@google.com
- Use different mutex macros for global vs targeted cpu membarrier (Mathieu).
- Use (unsigned int) cpu_id >= nr_cpu_id (Peter).
- Removed #warning on unsupported architectures that causes build
failures with W=1 reported by the kernel test robot.

Aniket Gattani (2):
  sched/membarrier: Use per-CPU mutexes for targeted commands
  selftests/membarrier: Add rseq stress test for CFS throttle
    interactions

 kernel/sched/membarrier.c                     |  36 +-
 tools/testing/selftests/membarrier/Makefile   |   5 +-
 .../membarrier/membarrier_rseq_stress.c       | 951 ++++++++++++++++++
 3 files changed, 979 insertions(+), 13 deletions(-)
 create mode 100644
 tools/testing/selftests/membarrier/membarrier_rseq_stress.c

-- 
2.54.0.rc1.513.gad8abe7a5a-goog

