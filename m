Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857206;
	b=MEe5aULeWUTpqHnNxp4+D6q0qYhiWy7ggnJHwHOM7Ng5Wsz2zFT7Mk4VCeId9eNX20gS
	 CoYFfziDtxPvBKdMwIWCHHdXCv+6cmGEWAcguZAKzEn1FknjRvk/on16Csw6VPAK6n1VT
	 PNUXz1DRlHv7Xn0xceHi1YcsLCwhr+dB7NFII50S8JPukYkqi8Jh3jzu21NuZ99VErFyF
	 VSiQHDuIssjkQuJ1dAN25faqDGjYn4IEU1PB8IYJXE39Kr9UBWwIVPh7IDX5pUdM0eynP
	 TtLtiHRJ+RwXlXFOTAsZ9kVnBmu96Rg+vPMDUwahmizxcnr4McYL1kjHFxC033M1hMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857206;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0DSwPSYkG/NYmuS97d1a4rhTytn5xQvCEPguRg+31Xs=;
	b=rI04UH8vG5O4Vy6IIlGC+/HPhcGpz6v0bcSeBGXiFD4eWE2RtrPeG/4y07gzu7u9diiO
	 2RcsxUFwM/zfHX9h05LyHLk+EAtgvXJ5ic+YaTiq9ItQrbtJWJZ2pkbabYs6eoIEdFeXQ
	 GmWBPVRcDT1oRxQ31/yrLtdmaXUZRv4q2KtVyhKErX81HaSrvGSdfNjrtK2LfbqEwynMv
	 7vHtfPBaRVlxLwPPuJrtLgaysGtjsl4Wxc/JXDFxAeuU55jD+RP9PtJ9pkuNa+UaF0YPx
	 eTTbP9GRojWuC3nUKPtGs6z1UaDUvgvC+q6bfrxuh+6ineSgDtn23XoT77CAlN7yBZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Ygx+9BYN;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641EF606A888;
	Mon, 16 Nov 2026 19:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641EF606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Ygx+9BYN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857202;
	bh=0DSwPSYkG/NYmuS97d1a4rhTytn5xQvCEPguRg+31Xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ygx+9BYNRwjsmjHSxTyL66YN/DE6NOhFNhgG7x7DbTByiqyMZGN0SbomvQpoNvBg3
	 ieQnGjZOT6wXZkhxZEEmt/lP03wfEdKofVxE3Zsz/SD+6xPY4IDr1ud6SN6a/hrRLf
	 qqtRvN7ZOVy6uS/i+8gWDUzGa0ZrZKX6Jn6QLkJ5GJch9lSZp7sYESeTzK0B3Sc1YX
	 Yk9HkGBry0b1DJLOiWburVm2tl/Hw50raANHCDnlX5+BeOhZFKt7zA6EN2dtscTAxw
	 6IDzmGVXUDOxbVgxBhmNFoIItBzQMBTuOLixKUmkgjgtprJpOWWG8VpilmWnv22+ch
	 PHU+1D3XbkyHg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXf4MJszQjN;
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
Subject: [RFC PATCH v1 5/8] sched/proxy: Clear blocked_donor when the donor stops donating
Date: Mon, 16 Nov 2026 14:26:35 -0500
Message-Id: <20261116192638.233125-6-mathieu.desnoyers@efficios.com>
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

find_proxy_task() sets owner->blocked_donor to the task that donates to
the owner. __mutex_unlock_slowpath() reads current->blocked_donor to
hand the mutex to that task. The comment of the field says that it is
set in schedule() and only stable under preempt_disable(). So the
pointer is valid until the owner schedules again.

But the donor can stop donating while the owner keeps running. It is
woken, or a change of its scheduling class or of its affinity takes it
off the runqueue. The owner keeps its blocked_donor until it schedules.
Meanwhile the donor can run on another CPU and exit.

This would be a use after free: __mutex_unlock_slowpath() would take
the blocked_lock of a freed task. It was found by reading the code,
and has not been reproduced. The owner must stay in the kernel without
scheduling for as long as the donor needs to exit and be freed.

Fix this by clearing rq->curr->blocked_donor when the task it points
at is woken, or leaves the runqueue in sched_proxy_block_task() or
move_queued_task(). The clear takes the blocked_lock of the running
task, which the unlock path holds while it uses the pointer.

Fixes: 1628b25248d0 ("sched: Add blocked_donor link to task for smarter mutex handoffs")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/core.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5d82c343662f..de357acfec56 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2584,6 +2584,33 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
  *    is done.
  */
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+/*
+ * @p stops donating on @rq: it is woken, or it leaves the runqueue. The
+ * task that runs can still point at @p with blocked_donor until it
+ * schedules, and __mutex_unlock_slowpath() dereferences that pointer.
+ * Meanwhile @p can run on another CPU and exit. So clear the pointer.
+ * The unlock path reads it under the blocked_lock of the running task.
+ */
+static inline void proxy_clear_curr_donor(struct rq *rq, struct task_struct *p)
+{
+	struct task_struct *curr = rq->curr;
+
+	lockdep_assert_rq_held(rq);
+
+	if (READ_ONCE(curr->blocked_donor) != p)
+		return;
+
+	guard(raw_spinlock)(&curr->blocked_lock);
+	if (curr->blocked_donor == p)
+		curr->blocked_donor = NULL;
+}
+#else /* !CONFIG_SCHED_PROXY_EXEC */
+static inline void proxy_clear_curr_donor(struct rq *rq, struct task_struct *p)
+{
+}
+#endif /* !CONFIG_SCHED_PROXY_EXEC */
+
 /*
  * move_queued_task - move a queued task to new rq.
  *
@@ -2595,6 +2622,7 @@ static struct rq *move_queued_task(struct rq *rq, struct rq_flags *rf,
 {
 	lockdep_assert_rq_held(rq);
 
+	proxy_clear_curr_donor(rq, p);
 	deactivate_task(rq, p, DEQUEUE_NOCLOCK);
 	set_task_cpu(p, new_cpu);
 	rq_unlock(rq, rf);
@@ -3995,6 +4023,7 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 {
 	return false;
 }
+
 #endif /* CONFIG_SCHED_PROXY_EXEC */
 
 static void
@@ -4068,6 +4097,7 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 
 		if (p->se.sched_delayed)
 			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
+		proxy_clear_curr_donor(rq, p);
 		returned = proxy_needs_return(rq, p);
 		/*
 		 * @p was blocked and this CPU runs a proxy. If @p is the donor
@@ -7031,6 +7061,7 @@ void sched_proxy_block_task(struct rq *rq, struct task_struct *p)
 	if (WARN_ON_ONCE(state == TASK_RUNNING))
 		return;
 
+	proxy_clear_curr_donor(rq, p);
 	if (task_current_donor(rq, p))
 		proxy_reset_donor(rq);
 
-- 
2.47.3

