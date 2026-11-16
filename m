Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857204;
	b=cJewfx+RT/3bpamtG5xWuRJtxq874hNTxW6nUWSbus06P+vOYFWUBoBZ7DErab6VpaiF
	 W6aCRiT7mzNpHnqCHymJFbA4qb91LNCzalcInauT3DDE466UInF1k8EM5dLkpWSIaCOca
	 bLFl8QVw8PKrPCLKbrxUaz2HpdsREUwOM3MyIQB3SdedOmlS+ebfrtGYNZ3TZzbi+9mwN
	 o9qViQFLx4RF3KEIczO4rI7m5phSfwFO/8YvrsGJZD/Pjr7feMMBr/mTy36Kl9T6TPn4E
	 e+7LIDvhFHxLnzQ4AtFV83uowR1jyq3enY/AMMTn0SOsn+uzIjXfmzsfRv1FmZD/Tdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857204;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rTAGMePT7zV6AmlwtAYGxs2h0IDd3cQ2XFpKwG/Bz54=;
	b=yhwNGWBl1at6AVVPmLGz6HANekPgYk11rXWp1cwmLC9TOApKsZEELOOE/2lX3fqEo1IX
	 +XFkRbIauBGtByViFoXJdrucNg4E19pA+t+70hYjkw/WeOxPm45CCCbw4yss4oeROSq6i
	 BsvIWoARMFZhT4uPng5rPg/2i3q6u7Vmy8pn5VRyGqcUsTRrExvpKnfcoVTc2Uw9y3fkj
	 wmxufaTtTc7Sosk6BftRBv3rR9SAaMmLaB7yVBw6hhSQ6Vz+kYcWDjG8Llu+JddYD8Ou2
	 0day9de0ZaSEjcLmdDTCRm/Dtv0QeZSwNAWh/spoytoqqJUaD2YDXJSI0VH1qrKDAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=SuXMG3yd;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B5606A886;
	Mon, 16 Nov 2026 19:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5B5606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=SuXMG3yd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857202;
	bh=rTAGMePT7zV6AmlwtAYGxs2h0IDd3cQ2XFpKwG/Bz54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SuXMG3ydw6IOTlw+ASQoIpUElxknJRtDDXayA0byNr963ToQWGz8LTvFPttFX4s9+
	 EqggALf6eAmDXA7tWBHA3tHPyfFGIc5os5rOKvhfnDD6j14IASmvn3bB7bWUvo5W6B
	 IxIeVl55/Ej9k6Lah9ubA5DRFtWXO1hRoD+pKcd6xmvQ0PdR410Vg2eOzcOuW++SSo
	 a3dFbxdhZ+FuWQRL3Pjpe5a17LxcpoxQxckkuzyKAssOICSDuxe/F0jaj61nCg+Eds
	 h4VCb4kcRpVc8iERnlTbdr7DUidQW6E8Q9/bWFOGos/fOx2I1fnbU1Zb2WG3cPWlHy
	 R99bVRhQFrUuA==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXf5SD9zRPg;
	Mon, 16 Nov 2026 14:26:42 -0500 (EST)
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
Subject: [RFC PATCH v1 6/8] sched/deadline: Use the root domain a proxy-migrated task runs in
Date: Mon, 16 Nov 2026 14:26:36 -0500
Message-Id: <20261116192638.233125-7-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
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

With proxy execution, find_proxy_task() can queue a task blocked on a
mutex on the runqueue of the mutex owner. It ignores the affinity of
the task, which does not run there. The task returns to p->wake_cpu when
it is woken.

__sched_setscheduler() checks that the affinity of a task covers its
root domain before it lets the task use SCHED_DEADLINE. It takes the
root domain from the runqueue the task is on. sched_dl_overflow() admits
the bandwidth of a task that enters the class in the root domain of
task_cpu(). Both predate proxy execution, when a task was always queued
on a CPU it can run on.

When the mutex owner is in another root domain, both use the wrong one.
sched_setattr() fails with EPERM for a deadline task that waits for the
mutex, and for a task that asks for SCHED_DEADLINE while it waits. In a
test with two cpuset partitions, both calls failed. Without proxy
execution they work.

Fix this by adding task_home_cpu(), which returns p->wake_cpu for such a
task, and by using its root domain in both places. An affinity change
or a CPU hotplug can leave p->wake_cpu stale while the task is queued
elsewhere. task_home_cpu() then returns an active CPU of the task's
mask.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/deadline.c |  2 +-
 kernel/sched/sched.h    | 23 +++++++++++++++++++++++
 kernel/sched/syscalls.c |  9 +++++++--
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index d14ce3615ba6..c55967135df0 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -4625,7 +4625,7 @@ int sched_dl_overflow(struct task_struct *p, int policy,
 	if (new_bw == p->dl.dl_bw && counted)
 		return 0;
 
-	cpu = counted && p->dl.dl_bw ? p->dl.dl_bw_cpu : task_cpu(p);
+	cpu = counted && p->dl.dl_bw ? p->dl.dl_bw_cpu : task_home_cpu(p);
 	dl_b = dl_bw_of(cpu);
 
 	/*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f80ea5541b3f..7f5e45a86285 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2585,6 +2585,29 @@ static inline int task_on_rq_queued(struct task_struct *p)
 	return READ_ONCE(p->on_rq) == TASK_ON_RQ_QUEUED;
 }
 
+/*
+ * Return the CPU where @p runs, or will run. Proxy execution can queue a
+ * task blocked on a mutex on the CPU of the mutex owner. The task does
+ * not run there. It returns to p->wake_cpu when it is woken. The caller
+ * holds the rq lock of @p.
+ */
+static inline int task_home_cpu(struct task_struct *p)
+{
+	int cpu = p->wake_cpu;
+
+	if (!sched_proxy_exec() || !p->is_blocked || !task_on_rq_queued(p))
+		return task_cpu(p);
+
+	/*
+	 * An affinity change or a CPU hotplug can leave wake_cpu stale
+	 * while the task is queued elsewhere.
+	 */
+	if (cpumask_test_cpu(cpu, p->cpus_ptr) && cpu_active(cpu))
+		return cpu;
+	cpu = cpumask_any_and(p->cpus_ptr, cpu_active_mask);
+	return cpu < nr_cpu_ids ? cpu : task_cpu(p);
+}
+
 static inline int task_on_rq_migrating(struct task_struct *p)
 {
 	return READ_ONCE(p->on_rq) == TASK_ON_RQ_MIGRATING;
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 59d78ae6b9fd..a88a6ddc500e 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -647,7 +647,12 @@ int __sched_setscheduler(struct task_struct *p,
 #endif /* CONFIG_RT_GROUP_SCHED */
 		if (dl_bandwidth_enabled() && dl_policy(policy) &&
 				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
-			cpumask_t *span = rq->rd->span;
+			/*
+			 * Use the root domain @p runs in. Proxy execution can
+			 * have queued it in the root domain of a mutex owner.
+			 */
+			struct root_domain *rd = cpu_rq(task_home_cpu(p))->rd;
+			cpumask_t *span = rd->span;
 
 			/*
 			 * Don't allow tasks with an affinity mask smaller than
@@ -655,7 +660,7 @@ int __sched_setscheduler(struct task_struct *p,
 			 * will also fail if there's no bandwidth available.
 			 */
 			if (!cpumask_subset(span, &p->cpus_mask) ||
-			    rq->rd->dl_bw.bw == 0) {
+			    rd->dl_bw.bw == 0) {
 				retval = -EPERM;
 				goto unlock;
 			}
-- 
2.47.3

