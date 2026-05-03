Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0232C21F8
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843385; cv=none; b=AjL3cvFx48FLnlbHGsrMYpENEKAIDR28GrsxQAYqV0oHOOtNTrY+nG8lM9qC8nLaKFAGA9qYZOvd4C67EpFqjI/HROA9b+AJx/uuG1DhIZuQ8ChYv2Vb5epEcnGf7odimb/WaPjwFgvujXguWvfx8l1+1WqikEYiF182DrNjymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843385; c=relaxed/simple;
	bh=WXrx9c+nMNDPeUEQKmBb/sq2LfOjqtKHDbSbS2TtogI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Wd84JDtiekwgNxMHaExHmNCnpVuMmkbUUka+AECjOkgBiuOK2nbmXr1Hn8Krgq1yLRMZH7m3V89SaAGwI5bhsVYyk6HghikelNJfOTK9CxdHBygF9vIeQaWY1JitnSV0CbyeTKrKraLLDdGvCQkaiSAdvrH5Kw4ODj1pDX6QthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BS8g/htP; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BS8g/htP"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2cc75e79b97so5408080eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777843383; x=1778448183; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gq2Gng3Hvmwz5Vm+i5jnIMG3GH6+vilWdigdGYt3TFs=;
        b=BS8g/htPfQRbNSVCgHeDGETDQtqBFiWiWIngdm4lUd4Fgbanj5FnMVGOPf/D6f5Od9
         WCKCWndWAuoFwcOqwto5Nhnaf3vLnVgORfM8SPtToyhqCuWSNUuiwLfChM7ndcHMVdq4
         nnHuukxq/gXzYA0z5eCn5i075cZSRkGpYJCyvT+BVQqSbblcpU0RltwJFlp5MXAjA8Mo
         9ATW6VwMn+Uciq5fHNi7+3/9yVWLjj4jr+Nd/737f5FDTFFw3jJZqi79IuMLtmnmUz/c
         KcNVZ+xZ0Bf+3THuYrr1tr84JNNTDSifDHrjdC7dJZIPv+uXF1aUX7tVey/LaVo09kkR
         RpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843383; x=1778448183;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gq2Gng3Hvmwz5Vm+i5jnIMG3GH6+vilWdigdGYt3TFs=;
        b=i9UWfjNjb4iAnYczX98VDHAyi75IZLiHCceU0Y82WoepKFVc4R+dmQ7AfdZHb/7YZq
         mWK6JDbldeggQzF3iG3py0sk3XKkHWGfKGflM66bPpJckPgQNMysESge4Ug95BkYfugY
         tPO3ENVLqvMQEjT2sMd//HWsCdJV0oWf69S3X3HuppkXKidvKYVpjDNdTMHF7r9cNNdJ
         69Bcnm7FiLk+rEgXeTRTDeEf/XyyBTD4FQFJ5TMbkPNcwx+AmawaxWmk/dGpoUkwCTVp
         DbRo2fMxFdPmQhsqmDOTLvqGkSX0f5CelBcr3wCSgCSXI5JAStj8D/jUf/dYUnMOloJK
         hylw==
X-Forwarded-Encrypted: i=1; AFNElJ8K6UFIe/QVdrDV2MnPvC11FeAyMJuQv8Np706iCuTTq4AjD6QwndCOuG2VkmpdRWj1YtYJCEDoaYtnHTa2nZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrblEw6QVj4/vHy7WdtfTleaM4SxD1QfziFCqrRqFAmLEwP5bt
	+D9PupzocO/4OJ36TvKnLP7OuBB698DZmiNfeKJFUd3Gk5YXVB19fB9ItRCkuSP7dvO5vCV3J+t
	xIS0hYIKDtkZwdm/WXpM42rUuqIqiI2GUqw==
X-Received: from dll26.prod.google.com ([2002:a05:7022:21a:b0:12d:b48e:8597])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:699d:b0:12d:ba50:4baf with SMTP id a92af1059eb24-12dfd85ec6cmr3267112c88.33.1777843383182;
 Sun, 03 May 2026 14:23:03 -0700 (PDT)
Date: Sun,  3 May 2026 21:22:02 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260503212205.3714217-1-aniketgattani@google.com>
Subject: [PATCH v3 0/3] sched/membarrier: Use per-CPU mutexes for targeted commands
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

Patch 2 modernizes `membarrier_global_expedited` by using scoped cleanup
guards (`guard` and `__free`) to simplify error paths and resource
management.

Patch 3 introduces a dedicated kselftest reproducer
(membarrier_rseq_stress) to permanently test this interaction. It
aggressively hammers targeted membarrier commands within a deep,
aggressively throttled cgroup hierarchy to prove the lockup scenario
and validate the fix.

Results:
As measured by the stress test introduced in Patch 3, testing on an
AMD Turin machine with 384 CPUs (2 NUMA nodes, SMT=2) shows:

Throughput: ~200x increase in successful membarrier calls.

---
Changes in v3:
v2: https://lore.kernel.org/lkml/20260415232106.2803644-1-aniketgattani@google.com/
- Fixed the code path when `cpu_id < 0` in membarrier_private_expedited
  as reported by Peter.
- Added Patch 2 to use cleanup guards in `membarrier_global_expedited`.

Aniket Gattani (3):
  sched/membarrier: Use per-CPU mutexes for targeted commands
  sched/membarrier: Modernize membarrier_global_expedited with cleanup
    guards
  selftests/membarrier: Add rseq stress test for CFS throttle
    interactions

 kernel/sched/membarrier.c                     |  98 +-
 tools/testing/selftests/membarrier/Makefile   |   5 +-
 .../membarrier/membarrier_rseq_stress.c       | 951 ++++++++++++++++++
 3 files changed, 1002 insertions(+), 52 deletions(-)
 create mode 100644 tools/testing/selftests/membarrier/membarrier_rseq_stress.c

-- 
2.54.0.545.g6539524ca2-goog

