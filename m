Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857203;
	b=LT8/SPEuFtjdqjJrgOEbNAG8xTW/08VmkvkbUXWg+mszPYZMTRDHO6sJPMUbV6a8sRZ9
	 yCxU+itQvei+SsHtCr9o6aSXhcvOvjqSyISJPJJq8Z4HJe/095vuUhnvjuXMQb6Q5JEHq
	 q7ew387fh60u6xFk5woVqqPk70Lcdy5vwFX4PD4uD3jOahN//vPx8K8KcHGEqm9on7Qs0
	 3SicO4BeVwNVqgQzOcZMFSuZ9Yb+rKe45bjBGAzxg8hIo9t5fXt4ooP2GKngzanSR1PxD
	 yFO9ftPYxM6icyNQdlEcfxGApWoXAurr6nLyVyqx62uiJFKMAf6Kxs4nbpOvxXhVY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857203;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GZDmk4EtvB+Y7/4LxYfg3cRfdolkwdrxTQcDWDIgaIo=;
	b=LU5S+W6UZqPR0+Edt8YO5TvSZMAhuREzeKi/vTIOodtxB+OrAVJlrP6ILoljb1v7O7wZ
	 K1uUiWRef6grcnIMPSGwHuJF/57SSfO/vFv1ZWF188itBwFW/JVtivn1KoVGQPbwZj4O+
	 pPubarroiNyblQnGJhkAA1uBB6688A2js6U3K0GL7nIJ4EpJe4UFC0dD8ulCkLX4OLRBj
	 cQnUhcQ/GV9cHPUA3oGoULVxUWpZ/tX3mTMOlH6zMkvRilstFaFWMhswoBKkI7v8dk2VF
	 ODAb4x3tefuSZ/wgWH5M/AyjPo6PScoJWEtGMbCLiShWA3b4QafYGwAl/XwJ9LS/KEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b="xFH8WMD/";
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173BD606A31C;
	Mon, 16 Nov 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=xFH8WMD/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857202;
	bh=GZDmk4EtvB+Y7/4LxYfg3cRfdolkwdrxTQcDWDIgaIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xFH8WMD/N+2MhuRAmDaeC+OWxR1y/JtqqMy/2ng/FJcgilt7DD9zsixIm3l4LOjZ3
	 oWgveHD6IKQ4NHLE53SQmeUsLY7U13pJj0Bxxpv2mtQpdCERTjYq0b4dWGJIDaSic2
	 ucLA5i2MD2PeCtCg7Mx1WvZTcDF38meLWW1DNGOVOeJu6GiGI6wjR1enHtYE0FAqsE
	 mLBK2sgy0burruSEfvzeuLKlLROOR6xNC0EFXw3e+nZ01Qz8AxbFGys3euJeB6FghT
	 Gs6SEoG06zzWOS8tLHYqRBGAbj31Ha632/CW46Xik3pDabDEHGd4pH/2uZfnexu2lM
	 ZS3RplwMOD5aQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXf0z3DzQtr;
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
Subject: [RFC PATCH v1 2/8] sched/proxy: Wake blocked RT and deadline tasks through the full path
Date: Mon, 16 Nov 2026 14:26:32 -0500
Message-Id: <20261116192638.233125-3-mathieu.desnoyers@efficios.com>
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
The RT and deadline classes do not put such a task on their pushable
lists. enqueue_task_rt() and put_prev_task_rt() skip a blocked task.
enqueue_task_dl() and put_prev_task_dl() do the same. find_proxy_task()
migrates it instead.

Commit 7918cf369361 ("sched/proxy: Only return migrate when needed")
wakes a blocked task in place when it is still on its original CPU.
That wake-up does no enqueue. It also skips select_task_rq() and the
task_woken() method of the class. So the woken task is runnable, but it
is not pushable, and no other CPU can pull it.

A SCHED_FIFO task woken this way waits behind a higher priority task
while another CPU is idle. In a test on two CPUs, it ran 500ms after
the mutex was released, when the higher priority task stopped. Without
proxy execution it ran at once on the idle CPU. The test uses
SCHED_FIFO. The deadline class has the same code path.

Fix this in proxy_needs_return(). An RT or deadline task takes the full
wake-up path, as a task that was proxy-migrated does. The other classes
keep the in-place wake-up.

Fixes: 7918cf369361 ("sched/proxy: Only return migrate when needed")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 326026ba0b2b..cededdcfd5a3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3953,8 +3953,15 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 	 * only set p->wake_cpu when !p->on_rq, and since here p->on_rq, this
 	 * will not apply. But if it did, this check is the safe way around
 	 * and would migrate.
-	 */
-	if (task_cpu(p) == p->wake_cpu)
+	 *
+	 * The RT and deadline classes place a task at wake-up:
+	 * select_task_rq(), the pushable list, a push to another CPU. An
+	 * in-place wake-up skips all of that. So their tasks take the full
+	 * wake-up path too.
+	 */
+	if (task_cpu(p) == p->wake_cpu &&
+	    p->sched_class != &rt_sched_class &&
+	    p->sched_class != &dl_sched_class)
 		return false;
 
 	scoped_guard(raw_spinlock, &p->blocked_lock) {
-- 
2.47.3

