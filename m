Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857203;
	b=Am034c/YTNdbM3DzMzp0T0Qdoui1fojDVnht2YRW2ZxIV7d2cs0BfNeijZZ1bIuPrMjG
	 wd8Wg93891a9IkC1VEssvzb/kozp1IP6hfSoh7nEuZBQFzZHt9Zg9Isp0L//69DiXeraB
	 Yr6O2gkDrsJwJZRGmEMNG5x5vY223PTlYcHd8J7Twau3wkU9y1Y4cmM3Ui8rcUhOq4c67
	 jBtCwhJbz+9Ea/CNoo4qBea6bAbwZgk41x/ofRPzax7SsEBT2zwmcDUpHvNrCriW2gjLS
	 ojHrg/ek7NcF5G71JSbGGC2m7+ZKimPfHJejIfrjlsREzRD2HhyLBRmRu3S/8SUJ5iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857203;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/Ht/COUbB5JDxYERD5b+OdKZt7mFWtp8lMUTNH7YKuE=;
	b=qUrELhYF2/WWrwUkvVu4i16ocQ90RiSw7etcltU2pvkczdQTL+hCYj7wIZwSCQfhYw/O
	 zpviO6BzZM1bgSBh2JzqEk/4OqQeIKAHIzdyRDQtUlolP6r8lQQAReEypmof4EFKU4JaW
	 dnVbHmAKk7xGM8Dmg7E/uvTWo1Tc05hAn+TwTT2XsmXJxSqEtv3LTYNcXgniveWmhv9p5
	 L640IIAcXtFFYLKJsYdT7gfFd2jGwKJUQGo+oRjeoOb8yrAHuA14tYFUnP7OZOik7t9Na
	 BXZPLTlZj9ynQT0pvCP/8NkULWllqXe0bWSn4mwv0S14afh4X5buuIcFkqkvdayZc8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Zu58a2Cu;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34867606A322;
	Mon, 16 Nov 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34867606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=Zu58a2Cu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794857202;
	bh=/Ht/COUbB5JDxYERD5b+OdKZt7mFWtp8lMUTNH7YKuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zu58a2CuH/L8I389RWVzADzLhNc/oizoNRW3VA62xSfQ5t9xe311E6MLI9nXnZg3S
	 dtwcw0sJCEFwWZ171501j3C3J8ZjfYldR0qr/wEzt2YPLLTpR7urOrJn5xDQOseTDl
	 +d/+pN2eF4VMQDbI0ogwAO+mrXft8wJefJECXWqtmFFQiXlqC0l/9jhtscQ5h1h+o3
	 NKtsrzFcahneMFCGW5T7nn1BtIB2ZdBLratVGe+Q0VybRJzMWLlFuoggeIBe9Wv5Z+
	 fAyONwY2x7kzQEfX+JSs7sVsHdBvEwVUU3BzuJqOc0QMQ1DJdE+IaEQ4gKi3sjYHVq
	 UzZkGO3fE8ecQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jSyXf250BzRPf;
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
Subject: [RFC PATCH v1 3/8] sched/proxy: Stop the chain walk when the blocked_on chain is a cycle
Date: Mon, 16 Nov 2026 14:26:33 -0500
Message-Id: <20261116192638.233125-4-mathieu.desnoyers@efficios.com>
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

find_proxy_task() follows the blocked_on chain from the donor to a task
that can run. It holds the rq lock, with interrupts off. It has no bound
on the number of steps.

The walk relies on the chain having an end. The ww_mutex die and wound
paths clear blocked_on for that reason. Their comments say that circular
blocked_on relationships would not resolve otherwise. But two tasks that
take two plain mutexes in opposite orders deadlock for good. Once both
are on one runqueue, the walk goes around the cycle forever.

Without proxy execution, such a deadlock leaves two tasks asleep, and
the hung task detector can report them. With it, the CPU locks up with
its rq lock held. Other CPUs would then block on that lock. In a test
with two CPUs, the guest stopped without a message.

Fix this by detecting the cycle. The walk remembers the task it met at
its last step that is a power of two. When it meets that task again, it
stops the donation and deactivates the donor. The donor then sleeps on
its mutex, as without proxy execution.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/sched/core.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cededdcfd5a3..24105eeeb3c7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7135,7 +7135,8 @@ static struct task_struct *
 find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
-	struct task_struct *owner = NULL;
+	struct task_struct *owner = NULL, *mark = NULL;
+	unsigned int steps = 0, mark_at = 1;
 	bool curr_in_chain = false;
 	int this_cpu = cpu_of(rq);
 	struct task_struct *p;
@@ -7145,6 +7146,29 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	for (p = donor; p->is_blocked; p = owner) {
 		/* if its PROXY_WAKING, do return migration or run if current */
 		struct mutex *mutex = p->blocked_on;
+
+		/*
+		 * The walk came back to a task it already met: the chain is
+		 * a cycle. Either the tasks deadlock, or a ww_mutex cycle is
+		 * about to be broken. Do not walk it forever with the rq lock
+		 * held. Stop the donation: the donor then sleeps on its
+		 * mutex, as it does without proxy execution.
+		 *
+		 * @mark is the task met at the last step that is a power of
+		 * two. Once the walk is in a cycle, @mark is soon a task of
+		 * that cycle, and the walk meets it again.
+		 */
+		if (p == mark) {
+			if (curr_in_chain)
+				goto resched_idle;
+			p = donor;
+			clear_task_blocked_on(p, NULL);
+			goto deactivate;
+		}
+		if (++steps == mark_at) {
+			mark = p;
+			mark_at <<= 1;
+		}
 		if (!mutex) {
 			clear_task_blocked_on(p, mutex);
 			if (task_current(rq, p)) {
-- 
2.47.3

