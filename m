Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172318;
	b=Q5cCjoslEeSWNH3BcTy0ZPW/D8zZFen/u1SH6I9ACzQgcLRE5XzO4RDm5AYA/1ErZYJ7
	 qGqkKAQ0vfJkFECrM+r//+tDg0MvlEsYrFFInTiVbOz00EplyKRBVoJjIMnq0pgKidR49
	 ypwukwUkz6i7/1unUqBOytOxCna6XQwfhT4NqsSjhYKQrG388iOio8eor/kCqMqweigHP
	 5pGtsn5fl1iIpZjgqqs4E52StILSrCgMqH3p7js7RI3Nx+lXt7C9a/n2MqMK76wHKTFPg
	 dWbDNgIs2KRl8M8w7k07RQpOlqpViHX5tTdZW1PyQhhL/5WqM1USsI+5OTDtjaJhNHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172318;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=a47GnPmA7yCvByu942AqUHzg7fboFgq9NmdfW+J4hM0=;
	b=rQGCO/StWRxOOreK8TId+QeQ55PtHbs1dV//KjOqEcUPrOhIQNFeBGkWKVMXL/A6WITd
	 5chxZs/LezchLGC2AadNd6aetJU1vfZXS80s1xgwqT51SdBbN6QJp5U5YErVELNrCr4qh
	 hnjqEaPABIx8q1LwShXogV0M4Sd+0pKjeY9V2eYQe9IvDoeufa6S8eLCxiEcuG3MCHg6L
	 mJbNqorcMHx5aRxhxAqqUbzB0XPskuHmhe3EU8CqCxlFG0TmWDsksCb0Yw9U0h5iqH+CV
	 9oc2DwVjbyY3uUwYF9xqhTLb7nmO/EPKdTPDBG54i+bc1TXJ4BAkeC0lIMYFW5+2nWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=phlDasCG;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD1C606A33D;
	Fri, 20 Nov 2026 10:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD1C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=phlDasCG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795172318; x=1826708318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a47GnPmA7yCvByu942AqUHzg7fboFgq9NmdfW+J4hM0=;
  b=phlDasCGlh1h8dQzpAowqXeOz55TOB8Pg72G3z86VMgdUyqQ7o5X1xUc
   YnoM+1wJ+56j5Fj0/oEerNF0Me85UYA2MkBdjY5s2s3WHew3ZtUMUz1sy
   6mmGY2OwiDIcCab370eCkp7MyC7V3GkET9dUqg26q9zAHwYPJtdUiXwzq
   F5+gPMqmJ9EWPgEDBsLYKt9nuVhMRCJ6SYNqkM1N5zF19S6sueL+/W4iN
   YtJ4cdgr0+JslusnCzNTv0TVuvQ+bVxZRcnvFsoKRuwxIsgrrDSJz/2+s
   shHLNW5aKXhoXu6j5GEu+/0BAP4yKZwxLHXTa75dIae7J8Xt2NJeboPJQ
   g==;
X-CSE-ConnectionGUID: z9WgkFkHTkySKwhTBDOFtQ==
X-CSE-MsgGUID: +0w82pwKSWezz4jNi3tZyQ==
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="34639978"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:58:37 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:17362]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.222:2525] with esmtp (Farcaster)
 id df07f201-4bfe-4000-b03d-94666382f153; Fri, 20 Nov 2026 10:58:37 +0000 (UTC)
X-Farcaster-Flow-ID: df07f201-4bfe-4000-b03d-94666382f153
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Fri, 20 Nov 2026 10:58:37 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Fri, 20 Nov 2026
 10:58:34 +0000
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
Subject: [PATCH v2 2/3] sched/core: Don't take the idle fast path while the core is forced idle
Date: Fri, 20 Nov 2026 10:58:21 +0000
Message-ID: <20261120105822.7770-3-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120105822.7770-1-lshahed@amazon.de>
References: <20261120105822.7770-1-lshahed@amazon.de>
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

Since v6.12, with commit 3dcac251b066 ("sched/core: Introduce SM_IDLE
and an idle re-entry fast-path in __schedule()"), an idle CPU with an
empty runqueue skips pick_next_task() when it is rescheduled. Under
core scheduling that pick also ends or re-examines the core's forced
idle.

A core-wide selection chooses a task for an idle sibling and reschedules
it. If the chosen task is migrated away before the sibling schedules
and it was the sibling's only task, the sibling goes back to idle
through the fast path. When that selection also forced the other
sibling idle, because its runnable tasks did not match the chosen
task's cookie, the core stays forced idle with nothing running on it,
and two things go wrong:

- Without the previous patch, the idle sibling's rq->core_pick keeps
  pointing at the migrated task, and with schedstats enabled the forced
  idle accounting keeps writing through it, even after the task and its
  cgroup are freed:

  BUG: unable to handle page fault for address: ffff8d6b205f7018
  #PF: supervisor write access in kernel mode
  #PF: error_code(0x0002) - not-present page
  RIP: 0010:__cgroup_account_cputime_field+0x3c/0x70
  Call Trace:
   __sched_core_account_forceidle+0xd8/0x140
   __schedule+0x1390/0x18d0
   schedule_idle+0x1a/0x30
   cpu_startup_entry+0x29/0x30
   start_secondary+0x11e/0x140

- The forced-idle sibling keeps waiting with runnable tasks until some
  unrelated event reschedules the core. Likewise, when the forced-idle
  CPU itself loses its last task, the reschedule that
  sched_core_dequeue() sends to end the forced idle also ends in the
  fast path.

Take the SM_IDLE fast path only when the core is not forced idle. A
pending rq->core_pick needs no check of its own: the previous patch
clears it when the picked task is dequeued, so a CPU with an empty
runqueue has none.

Fixes: 3dcac251b066 ("sched/core: Introduce SM_IDLE and an idle re-entry fast-path in __schedule()")
Cc: stable@vger.kernel.org
Co-developed-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Ibrahim Elshahed <lshahed@amazon.de>
---
 kernel/sched/core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b1718ba5a4d1..d2f7532fc7cf 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -347,6 +347,15 @@ void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
 		resched_curr(rq);
 }
 
+/*
+ * An idle CPU with an empty runqueue must still call pick_next_task() while
+ * the core is forced idle. Only that pick ends or re-examines the forced idle.
+ */
+static inline bool sched_core_idle_needs_pick(struct rq *rq)
+{
+	return sched_core_enabled(rq) && rq->core->core_forceidle_count;
+}
+
 static int sched_task_is_throttled(struct task_struct *p, int cpu)
 {
 	if (p->sched_class->task_is_throttled)
@@ -550,6 +559,7 @@ void sched_core_put(void)
 static inline void sched_core_enqueue(struct rq *rq, struct task_struct *p) { }
 static inline void
 sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags) { }
+static inline bool sched_core_idle_needs_pick(struct rq *rq) { return false; }
 
 #endif /* !CONFIG_SCHED_CORE */
 
@@ -7285,8 +7295,13 @@ static void __sched notrace __schedule(int sched_mode)
 	 */
 	prev_state = READ_ONCE(prev->__state);
 	if (sched_mode == SM_IDLE) {
-		/* SCX must consult the BPF scheduler to tell if rq is empty */
-		if (!rq->nr_running && !scx_enabled()) {
+		/*
+		 * SCX must consult the BPF scheduler to tell if rq is empty,
+		 * and core scheduling may need pick_next_task() to end forced
+		 * idle.
+		 */
+		if (!rq->nr_running && !scx_enabled() &&
+		    !sched_core_idle_needs_pick(rq)) {
 			next = prev;
 			rq->next_class = &idle_sched_class;
 			goto picked;
-- 
2.47.3

