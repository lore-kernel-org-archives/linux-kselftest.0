Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857203;
	b=AKfHsO3HBzkm8t08Alp3ypH4nPPCyiUMHEl3TdTdrlh7KPYKK6vV2PrOmDJM3ceaQWZ3
	 UnreioKha49JBySZIJdjXYWRR83EuYiab9FWO+5dePZmEEDko6BNJSQB2PNGJiWpfG4Z3
	 ta6inkN7TB5aondXslG1bwyYFOCa0DBizd/QmA5BSKz1kiHCgK+DjlSKS5yglY0ORoMgN
	 JkYSambb1blPGTNkNs09oLVz11FoUvZ5OfBSz9TXBD/2ePx8g65jOoIzocnYCKEOmRQqs
	 CSfECJWnrlHSPp2rRaweTqmWXMIIn40XhGbhVyjdWWcepKrdw+LyuBh1TXDjvnEmpHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857203;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mGsIKuSa2CQ3IKHzue+XvHB7p7VYK4vECVEMRihSH7s=;
	b=QIS8yamDyAbpVPzmWE9cszZjFIKqQIhRPX0oPLrgyZ/yUHveBAKBwDtAJlV/Tvjzsm/w
	 /aWmzwqXE8SlBlkF5eh4YLgAMcivheudnC8hAurmAqSks1BUWcHi0+2ZGyk1bWEUNr2TY
	 Yi61y69qbMeSip2zljX5wyGCm8xDfcJg9bscbZjqapPgAiDAl87eWU9RaUYCxrmCQzrPi
	 K/DAJvLpR5hqxvbTVGqKPs66uciOXhH5sh0Q4Lm7/DOQ1I+3NqjWOCD18Z7P9RbQYh/2x
	 nL3wXOk56odg257Juy2DOgb3l00FXzbuWPv4Tkud6Se9Wjo5R18YoyMV7iQQ1qDmKjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=GfBrhjp1;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60445606A329;
	Mon, 16 Nov 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60445606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=GfBrhjp1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857202;
	bh=mGsIKuSa2CQ3IKHzue+XvHB7p7VYK4vECVEMRihSH7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GfBrhjp1x+QhlzWwmIpCw15dqqbF47mhXFFGFeaFb0mdNB39qYN5bXy65kL5d3Dsk
	 NPugi3hvfB719Wc7t1tEs7TXjXgxrX4ZEeA65Bwkqwg1TJgU7QdIEW6WZNhsT4aM8Q
	 yIdnqJTcX1xFLQBIB7jlqWqkCiScoAabhB40m254njXvewwPYKVkpacrfoGKyUl1jT
	 Ntli5HnUwMXaV8rgi3626fE2v11Jib8He0otn3cVqIlrBCtlv0ZDRPC8NWXQ/VBWEM
	 BsyX2VDfwiWnhdRaejh8aQ8iOoCI7+j5hIY7d4lItuRWUyeV6qkThDuDSQFvRvqTZd
	 /nBckAHg7OUDg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXf38DhzQjM;
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
Subject: [RFC PATCH v1 4/8] sched/proxy: Tell the class about a proxy migration
Date: Mon, 16 Nov 2026 14:26:34 -0500
Message-Id: <20261116192638.233125-5-mathieu.desnoyers@efficios.com>
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

find_proxy_task() moves a blocked donor to the runqueue of the mutex
owner. proxy_set_task_cpu() does this with __set_task_cpu(), so that it
can keep p->wake_cpu, the CPU the donor returns to.

But __set_task_cpu() skips what set_task_cpu() does around it:
- the migrate_task_rq() method of the class;
- the migration count and the perf event;
- the sched_migrate_task tracepoint.

For a fair task, the dequeue on the old runqueue detaches its load.
migrate_task_rq_fair() would then reset last_update_time, which makes
the enqueue on the new runqueue attach the load. Without that call, the
load is attached nowhere. When the donor is woken, the return migration
goes through set_task_cpu(). It removes that load from the owner's
runqueue, which never got it.

So each round trip of a donor lowers the load and the utilization of
the owner's runqueue. In a test, a CPU with two tasks that never sleep
showed a mean util_avg of 195, where 1024 is expected. schedutil would
then pick a low frequency for a CPU that is fully busy, and the load
balancer would see that CPU as nearly idle.

Fix this by doing in proxy_set_task_cpu() what set_task_cpu() does
around __set_task_cpu(). Tracers and perf now see a proxy migration as
a migration, and nr_migrations counts it.

migrate_task_rq_dl() moves the bandwidth of a task that migrates to
another root domain. "sched/deadline: Move a task's bandwidth to the
root domain it runs in" added that. A proxy migration must not do it:
the task does not run where it is queued. So make migrate_task_rq_dl()
leave the bandwidth of such a task in its root domain. If its wake-up
then picks a CPU of another root domain, the bandwidth moves at that
time.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/core.c     | 13 +++++++++++++
 kernel/sched/deadline.c |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 24105eeeb3c7..5d82c343662f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6967,6 +6967,19 @@ static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
 	 * was previously runnable.
 	 */
 	wake_cpu = p->wake_cpu;
+	/*
+	 * Tell the class and the tracers about the migration, as
+	 * set_task_cpu() does. The fair class then attaches the load of @p
+	 * to the new runqueue. Without that, the return migration removes
+	 * load that the runqueue never got.
+	 */
+	trace_sched_migrate_task(p, cpu);
+	if (task_cpu(p) != cpu) {
+		if (p->sched_class->migrate_task_rq)
+			p->sched_class->migrate_task_rq(p, cpu);
+		p->se.nr_migrations++;
+		perf_event_task_migrate(p);
+	}
 	__set_task_cpu(p, cpu);
 	p->wake_cpu = wake_cpu;
 }
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 3b62ee43c209..d14ce3615ba6 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3030,8 +3030,14 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu)
 	 * the bandwidth. A mask can hold CPUs of two root domains, and
 	 * select_fallback_rq() can widen it. Move the bandwidth there, as
 	 * dl_task_offline_migration() does for a throttled task.
+	 *
+	 * Not for a task that is blocked on a mutex and only queued for
+	 * proxy execution. It does not run on the new CPU, so its bandwidth
+	 * stays in its root domain. If its wake-up then picks a CPU of another
+	 * root domain, the bandwidth moves at that time.
 	 */
-	if (unlikely(dl_task_bw_elsewhere(p, new_cpu)))
+	if (unlikely(dl_task_bw_elsewhere(p, new_cpu)) &&
+	    !(p->is_blocked && task_on_rq_migrating(p)))
 		dl_task_move_bw(p, new_cpu);
 
 	if (READ_ONCE(p->__state) != TASK_WAKING)
-- 
2.47.3

