Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857204;
	b=vHFov6F8cK8bsCwFDxQGnZ6xwtPqLj7gZAvO5NU+LBA/JNPLR69n+6y3n1YPQRT/Bneu
	 VL8HnQwfM8r5MKv4hZZ2+OtbDa0MfrhnW/ulyoZ6Eq+4ogUn/OUInnE5E7/ODHD/ZfVx7
	 /aIEmhRY/TdlirzUFXq5Z4dgh+UFDPsKQdOLFGshH+1uw6N0gKJP4EFwNnQp+F4bXpVRG
	 l9fjbHChdXyv5ovHMlg7RW7hr1WHZGdscKh9hB542MYdfnZXkcmI6oIXjJUg/AcVJlLzW
	 ACYygxMycSPyXwskjGJ59nsQ3V0frtH5UfZX7dCSpltX2tK3MBiwc8csCbekh5/x+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857204;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vnJoppMAP7WauRxqGK6EpYtf89QFW43KTEiv1ZnXlrs=;
	b=Eh/EXEwrRONuxTQSYUdYwv3vVdHs8Pg4oKTmXQjNFnyScrfU13desK3xWmb0Wam+I1mV
	 Trd19u9DaWKGrNRIbxOsjmBKvgxL6XNlvlrexPGJbQsPxKE8Wx3TfzNti0OMa3CXHMfq/
	 IrCukjiZbajiXlHN5VX6qKuge0SQoT1Vz2lh/9rUE1FqEsC5YVY7cSOv9AjuG4wZSKwch
	 fOkkIjTZmYulA0SG/9PqJpK0z4T4kovjekM1yx2H3eTU2W8/s9M6SO8dvYIKP008eSKuf
	 u7UULRaSrpr8+XSQjDJzAJ09Zg2ac3thubmAsNsF1sG7Dk9caKwgOG8QJaaiaXKDdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=IF87Fvb8;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174AE606A32A;
	Mon, 16 Nov 2026 19:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174AE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=IF87Fvb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857202;
	bh=vnJoppMAP7WauRxqGK6EpYtf89QFW43KTEiv1ZnXlrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IF87Fvb84bGCqgEnyGxJm1m8hoHtA1/QVZqNcwrhTCWSbiLhXVnW2rn5mkwB13PUj
	 V5J4wz0x3yAuvXbHtbrER2VNtSOKZUk5Ld2DjB4a4WzkQbAWpQO7FzTT8Uvb9gsPZc
	 +cYn7V+zK3f1nmTDD561TMyUz/0PokmYQfUHcmrRjnJPqnH6MDWWwjHSVvUrZ6xW/m
	 n1SxD3cf0wzwr4oME+ukqyRatqHMPXCTkXHSNrUWUwCD0nWt9igxWvBQ2QYDGCe/sW
	 M85E2B8xqZmUpZGfl7MTBkHwD8uxGlrTg6M1/2uxq0wik1kcXNJBdPkKkj/dyOwe5t
	 LEq159vHJMtMg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXd70sfzPsn;
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
Subject: [RFC PATCH v1 1/8] sched/proxy: Reschedule when a blocked task is woken under a proxy
Date: Mon, 16 Nov 2026 14:26:31 -0500
Message-Id: <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
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

With proxy execution, a task blocked on a mutex stays on its runqueue.
The scheduler can pick it as the donor and run the mutex owner in its
place. When the donor is woken, the CPU must stop running the owner on
the donor's context.

Commit 7918cf369361 ("sched/proxy: Only return migrate when needed")
wakes a blocked task in place when it is still on its original CPU.
ttwu_runnable() then relies on wakeup_preempt() to preempt the running
task. But every class compares the woken task with rq->donor. When the
woken task is the donor, it compares the task with itself, and no
reschedule is requested. Only sched_ext handles this, with WF_TTWU_RQ.

So the old owner keeps the donor's context after the mutex hand-off or
after a signal. With a SCHED_FIFO donor nothing bounds this: the owner
runs at the donor's priority until it blocks. With a SCHED_DEADLINE
donor the owner consumes the donor's runtime.

In a test on one CPU, a SCHED_OTHER owner kept spinning in user space
after it released the mutex. A SCHED_FIFO waiter then ran 800ms late. A
SCHED_DEADLINE waiter ran one period late.

The same would happen when a task in the middle of a chain is woken.
proxy_needs_return() resets the donor only when the woken task is the
donor.

Fix this in ttwu_runnable(). When a blocked task is woken on a runqueue
that runs a proxy, reschedule. The next pick walks the chain again. A
blocked task outside the donor's chain causes a harmless reschedule
too.

Fixes: 7918cf369361 ("sched/proxy: Only return migrate when needed")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dc270a23179d..326026ba0b2b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4057,9 +4057,20 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 
 	update_rq_clock(rq);
 	if (p->is_blocked) {
+		bool returned;
+
 		if (p->se.sched_delayed)
 			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
-		if (proxy_needs_return(rq, p))
+		returned = proxy_needs_return(rq, p);
+		/*
+		 * @p was blocked and this CPU runs a proxy. If @p is the donor
+		 * or a task of its chain, the donor no longer waits for the
+		 * task that runs. wakeup_preempt() compares @p with the donor,
+		 * so it does not see this. Pick again.
+		 */
+		if (rq->donor != rq->curr)
+			resched_curr(rq);
+		if (returned)
 			return 0;
 	}
 	if (!task_on_cpu(rq, p)) {
-- 
2.47.3

