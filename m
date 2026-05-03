Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5575D2C21F8
	for <linux-kselftest@vger.kernel.org>; Sun,  3 May 2026 21:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843391; cv=none; b=TPHia3rLoNayaI9ZJZeMElbMTWo8XNKwZIMTS/PkSZAm34Rg77sbRuXehu4fVggBeJvKYsuHr+ceYC5C0n5DRJxDae75SI3WjtcZx+cjY7WXCuIt3olpzo8woREC+7Jpkn2zCydupclsjewIQ+TDLrapU21/be4C26mKxCGid3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843391; c=relaxed/simple;
	bh=tcfwiHfBmdPlDswQOFCg9Ur4ZjaLagCYDx1ehhgDEQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OFy7UwSR/0vZAlZvgQGHl1UuvGC0N4OIAxnLpW+hYZKATIU5A9iYkEVN8XxzZ/rEB3leWD9AnwWV0UMHW9pZ6Dp1hHR/wGgShXIdI44MvDiZ2fQb1Grs+RKitil6Q79xt9TWVRscmPKdULviM6ub7Wo/5B2p6fMnY5oZ8XCweGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p7i0qwuy; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p7i0qwuy"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so5651089eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777843389; x=1778448189; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHo3S2sC3hPKYGBbJhzMJdbsQdshtIhZZObsDHnBi1U=;
        b=p7i0qwuy3JnZnNzgmJksfIiMNm/QjtbdUSpH0iDwjg2t4BriTrRXeQKV4js0MkOIRB
         FNGJaS0pb/JvBs2FSp+t1bQPymGRIQ8NEzi1GSDBhO5tGvfYZFrJT8tnf4KQoFAKtP7S
         EwOnRG1Nwv27o3hzb180zRmNFqt+Qx+h9qXzDHkvaz8hxvi1BQ5E+pedtySAMTC+K4nu
         Z+WmqBzhDr0xi9R68zMf95GX6TGBA8eCO+lwKCI9vEhx1M7OiYGesjXPIprauNFE+KYF
         rNdT817Udg9dmpZBhQ3jbyJqSb9WRYqvPDsQbRphrWmyf4PbZZFojEo9C0PBnKmzZKgs
         clDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777843389; x=1778448189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHo3S2sC3hPKYGBbJhzMJdbsQdshtIhZZObsDHnBi1U=;
        b=eHfvn7maoU+Uja3l4Xl6vGp3jL72WRnrOIdult+WR7cklPPg7baBxbbryVSZCw+tQ+
         XodC6Uzzmi88mknmmxwtkhxWTukwh2ulVlKUKqV4LyyzunIPzKQ97qy1kDqbAtBn5I/v
         nJ7eHEqqD0ipd+FjnkYNxXvsJFN4kQKZdW3ZGVwhs0huu1f6wOMjphBkRbJgPps+IAJ7
         ELf7vmGSuTyURncKVrs75tksNUUYDk2pmmGG6vRUeHyh7THYn//037FZgZcO9VG8geDW
         FIxT7o8EdRMAPKhK1vJuGCrmm6UPXrr1dshQbSZbNQ0th4px+sg4XdxHlkVn6m2ddKJg
         yQ7g==
X-Forwarded-Encrypted: i=1; AFNElJ+CONe0e51gaj9mJ9IzczFd7Fv7dmhjNrH0xc5Nfa4j0nPIp03KYDigt//gRoAvrGwuCNtd6EjQtqhUSCnRCGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOpSJ05X2BkrIVA54QDu8hemxj0RrdxpOMn0Mos3N2D5ToovW
	+g1iVuqF7KF71pwAiN0dJzGdqa4IjCEprTe31FLBxow5c5iL8L8UQ20HsMdzbH/O86vonhnsF4I
	FpaBZ4Bfndz+/Nz6WG7/ZN3ogZMxZncXrGg==
X-Received: from dybcr21.prod.google.com ([2002:a05:7300:ac95:b0:2e2:2088:dca7])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:cb17:b0:2ed:e14:7f54 with SMTP id 5a478bee46e88-2efba7a6c9dmr2712951eec.30.1777843389183;
 Sun, 03 May 2026 14:23:09 -0700 (PDT)
Date: Sun,  3 May 2026 21:22:03 +0000
In-Reply-To: <20260503212205.3714217-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260503212205.3714217-1-aniketgattani@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260503212205.3714217-2-aniketgattani@google.com>
Subject: [PATCH v3 1/3] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aniket Gattani <aniketgattani@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, the membarrier system call uses a single global mutex
(`membarrier_ipi_mutex`) to serialize expedited commands. This causes
significant contention on large systems when multiple threads invoke
membarrier concurrently, even if they target different CPUs.

This contention becomes critical when combined with CFS bandwidth
throttling/unthrottling, during which interrupts can be disabled for
relatively long periods on target CPUs. If membarrier is waiting for a
response from such a CPU, it holds the global mutex, blocking all other
membarrier calls on the system. This cascade effect can lead to hard
lockups when thousands of threads stall waiting for the mutex.

Optimize `MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ` when a specific CPU is
targeted by introducing per-CPU mutexes. Broadcast commands and commands
without a specific CPU target continue to use the global mutex.

This prevents the cascade lockup scenario. As measured by the stress test
introduced in the subsequent patch, on an AMD Turin machine with 384 CPUs
(2 NUMA nodes with SMT=2), this optimization yields 200x more
throughput.

Changes in v3:
- Fixed the code path when `cpu_id < 0` in membarrier_private_expedited
  as reported by Peter.
  Link: https://lore.kernel.org/lkml/20260428124823.GY3102624@noisy.programming.kicks-ass.net/

Signed-off-by: Aniket Gattani <aniketgattani@google.com>
---
 kernel/sched/membarrier.c | 77 ++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 33 deletions(-)

diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 623445603725..3d88e900a17f 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -164,8 +164,26 @@
 	| MEMBARRIER_PRIVATE_EXPEDITED_RSEQ_BITMASK			\
 	| MEMBARRIER_CMD_GET_REGISTRATIONS)
 
+/*
+ * Scoped guard for memory barriers on entry and exit.
+ * Matches memory barriers before & after rq->curr modification in scheduler.
+ */
+DEFINE_LOCK_GUARD_0(mb, smp_mb(), smp_mb())
 static DEFINE_MUTEX(membarrier_ipi_mutex);
+static DEFINE_PER_CPU(struct mutex, membarrier_cpu_mutexes);
+
 #define SERIALIZE_IPI() guard(mutex)(&membarrier_ipi_mutex)
+#define SERIALIZE_IPI_CPU(cpu_id) guard(mutex)(&per_cpu(membarrier_cpu_mutexes, cpu_id))
+
+static int __init membarrier_init(void)
+{
+	int i;
+
+	for_each_possible_cpu(i)
+		mutex_init(&per_cpu(membarrier_cpu_mutexes, i));
+	return 0;
+}
+core_initcall(membarrier_init);
 
 static void ipi_mb(void *info)
 {
@@ -315,7 +333,6 @@ static int membarrier_global_expedited(void)
 
 static int membarrier_private_expedited(int flags, int cpu_id)
 {
-	cpumask_var_t tmpmask;
 	struct mm_struct *mm = current->mm;
 	smp_call_func_t ipi_func = ipi_mb;
 
@@ -352,30 +369,45 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 	 * On RISC-V, this barrier pairing is also needed for the
 	 * SYNC_CORE command when switching between processes, cf.
 	 * the inline comments in membarrier_arch_switch_mm().
+	 *
+	 * Memory barrier on the caller thread _after_ we finished
+	 * waiting for the last IPI. Matches memory barriers before
+	 * rq->curr modification in scheduler.
 	 */
-	smp_mb();	/* system call entry is not a mb. */
-
-	if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
-		return -ENOMEM;
-
-	SERIALIZE_IPI();
-	cpus_read_lock();
-
+	guard(mb)();
 	if (cpu_id >= 0) {
+		if (cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))
+			return 0;
+
+		SERIALIZE_IPI_CPU(cpu_id);
+		guard(cpus_read_lock)();
 		struct task_struct *p;
 
-		if (cpu_id >= nr_cpu_ids || !cpu_online(cpu_id))
-			goto out;
+		if (!cpu_online(cpu_id))
+			return 0;
+
 		rcu_read_lock();
 		p = rcu_dereference(cpu_rq(cpu_id)->curr);
 		if (!p || p->mm != mm) {
 			rcu_read_unlock();
-			goto out;
+			return 0;
 		}
 		rcu_read_unlock();
+		/*
+		 * smp_call_function_single() will call ipi_func() if cpu_id
+		 * is the calling CPU.
+		 */
+		smp_call_function_single(cpu_id, ipi_func, NULL, 1);
 	} else {
+		cpumask_var_t __free(free_cpumask_var) tmpmask = CPUMASK_VAR_NULL;
 		int cpu;
 
+		if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
+			return -ENOMEM;
+
+		SERIALIZE_IPI();
+		guard(cpus_read_lock)();
+
 		rcu_read_lock();
 		for_each_online_cpu(cpu) {
 			struct task_struct *p;
@@ -385,15 +417,6 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 				__cpumask_set_cpu(cpu, tmpmask);
 		}
 		rcu_read_unlock();
-	}
-
-	if (cpu_id >= 0) {
-		/*
-		 * smp_call_function_single() will call ipi_func() if cpu_id
-		 * is the calling CPU.
-		 */
-		smp_call_function_single(cpu_id, ipi_func, NULL, 1);
-	} else {
 		/*
 		 * For regular membarrier, we can save a few cycles by
 		 * skipping the current cpu -- we're about to do smp_mb()
@@ -420,18 +443,6 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 		}
 	}
 
-out:
-	if (cpu_id < 0)
-		free_cpumask_var(tmpmask);
-	cpus_read_unlock();
-
-	/*
-	 * Memory barrier on the caller thread _after_ we finished
-	 * waiting for the last IPI. Matches memory barriers before
-	 * rq->curr modification in scheduler.
-	 */
-	smp_mb();	/* exit from system call is not a mb */
-
 	return 0;
 }
 
-- 
2.54.0.545.g6539524ca2-goog

