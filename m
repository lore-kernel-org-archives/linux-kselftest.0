Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500228;
	b=ARrFCoAhyHiBzIV+g665ue9sRFohXqdGNqxju2wExJXBsjSzr2VwAN39StxrIfKy/1U4
	 xPv8gngfXOGvqewAGH/fwtcYDWNucKAjgTPRukvcudrXc2TMDPDrdQASGxnay95+0UM2A
	 xdJM5DruFS+ns5DUnS2nIibfyLn0pyE++fy3algZ7Uewa3LrNGK0r2c4pm1L7+XEaJQAv
	 zdTu1ViopAGqDhob4VQOiHvUPUMIiNlzpy/0+IW6vod0aJIxNR90zCi5hPFViz83o4Dx3
	 Hji2Baahi2/mmaUlIe9BSx/lsM1Ug0TUzV26nGSkB8kBuXEj6jgAuJkzhC4isSPmB+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500228;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yrvz3QzKkAfwEQ7kZgGigJVPNWT/Ew4XqbvaE9TIarE=;
	b=uwNK75WXJotrCEah3d2xZqX/eiQhTXZSGFFHbhgjHrgeDK0lge+bM3HQUbw/wmt9cxAk
	 TCz9Fc27BJkQtEmklVw1ftbIrSVodVPLGgSKUbLi9d3Ra9bxEppPqmXxQbRkNQVUYy3cL
	 Yq71GyMNH66F1UpLb1eSR32IAsdyXAWQSs0VSam1LWfwBaZQWXbpN1HkG4THqFqS4EQPC
	 T9l4ZL8MRsF+hSMcPW8IH2DnAyRYrT8CAB7IkuZ7WbHZB0oa9J9BkSyK1B/NUxi1jiJW+
	 +AegGp3hyrPuVHMX0Glr+o98dVMLrT0u5NKxzaWXGl8eIbtdiA3KxtW8M/MAYO1Uuaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=I0RtndbS;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F111606A31C;
	Thu, 12 Nov 2026 16:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F111606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=I0RtndbS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794500228; x=1826036228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yrvz3QzKkAfwEQ7kZgGigJVPNWT/Ew4XqbvaE9TIarE=;
  b=I0RtndbSluS3DhZ14k92xKimu+N8ShiNUD9A0y8tJDeD+sVkmHGk6ROO
   YPrzsg8x6ALvEoMR6MDb97589dSsQDBY/HV0KSGFi5bpuq4d7UAypnM5i
   c+w3KjSonLQpDo80txKZzNPo9q+ck0LNkglgnFwkAovxFnD9oe+FCwm1M
   R0tlOe3yfFhDy8ATL5hvKA3v3AjX9cTrR2xqAw/f0cd5W+nOLw/EU+4M/
   VpunEyg4xw5xeQ03J7f16YXCJ/wKCQyfsNl/j2jTJzj8sUUxxGUzqEj2+
   qNPIFuwpr15qPQEa2Y+4y/+RSrPzBh2ErpiARrp6kZfo+7u3SgY6H7hb4
   g==;
X-CSE-ConnectionGUID: 6/VLLrNDRh+tP3b6XI7yKg==
X-CSE-MsgGUID: FbAbPrH3QdCSimybOW7LmA==
X-IronPort-AV: E=Sophos;i="6.27,210,1787011200"; 
   d="scan'208";a="33601504"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:17:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:25487]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id f031de29-1fdd-4db5-b74e-14794b6c8173; Thu, 12 Nov 2026 16:17:05 +0000 (UTC)
X-Farcaster-Flow-ID: f031de29-1fdd-4db5-b74e-14794b6c8173
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 16:17:04 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 16:17:01 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Daniel Bristot de Oliveira <bristot@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Don <joshdon@google.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<nh-open-source@amazon.com>, Fahad Mubeen <fmubeen@amazon.de>, "David
 Woodhouse" <dwmw@amazon.co.uk>, Misha Karataiev <karataev@amazon.com>,
	Hendrik Borghorst <hborghor@amazon.de>, Ibrahim Elshahed <lshahed@amazon.de>,
	Fernand Sieber <sieberf@amazon.com>
Subject: [PATCH 3/5] sched/core: Rank DL server picks as deadline in the core-wide pick
Date: Thu, 12 Nov 2026 18:15:46 +0200
Message-ID: <20261112161548.78189-4-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112161548.78189-1-sieberf@amazon.com>
References: <20261112161548.78189-1-sieberf@amazon.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 4b26cfdd3956 ("sched/core: Fix priority checking for DL server
picks") made the core-wide selection rank a task picked through a DL
server as deadline, so that a fair task competing with RT tasks under
core scheduling still gets its server's bandwidth. It keys on
p->dl_server, which pick_task() used to set.

Since commit bd9bbc96e835 ("sched: Rework dl_server"), pick_task()
records the server in rq->dl_server and p->dl_server is only set once
the task is switched in. The core-wide selection still ranks each
sibling's pick with prio_less(), so a task the sibling's server has
just picked ranks as a plain fair or ext task and loses to an RT task
on another sibling. The server's CPU then runs a task with the RT
task's cookie or is forced idle, and the fair task gets none of the
server's bandwidth for as long as the RT task runs.

Rank each sibling's pick by the server it came through, rq_i->dl_server.
prio_less() keeps using p->dl_server for the core tree, whose tasks are
not being picked.

Fixes: bd9bbc96e835 ("sched: Rework dl_server")
Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 kernel/sched/core.c | 50 ++++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 61d4e6e990bba..ffe8a41380d0e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -196,12 +196,13 @@ __read_mostly int scheduler_running;
 DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
 
 /* kernel prio, less is more */
-static inline int __task_prio(const struct task_struct *p)
+static inline int __task_prio(const struct task_struct *p,
+			      const struct sched_dl_entity *dl_server)
 {
 	if (p->sched_class == &stop_sched_class) /* trumps deadline */
 		return -2;
 
-	if (p->dl_server)
+	if (dl_server)
 		return -1; /* deadline */
 
 	if (rt_or_dl_prio(p->prio))
@@ -223,12 +224,19 @@ static inline int __task_prio(const struct task_struct *p)
  * ge(a,b) := !l(a,b)
  */
 
-/* real prio, less is less */
-static inline bool prio_less(const struct task_struct *a,
-			     const struct task_struct *b, bool in_fi)
+/*
+ * real prio, less is less
+ *
+ * @a_dl_server and @b_dl_server are the DL servers @a and @b run on
+ * behalf of, if any.
+ */
+static inline bool __prio_less(const struct task_struct *a,
+			       const struct sched_dl_entity *a_dl_server,
+			       const struct task_struct *b,
+			       const struct sched_dl_entity *b_dl_server,
+			       bool in_fi)
 {
-
-	int pa = __task_prio(a), pb = __task_prio(b);
+	int pa = __task_prio(a, a_dl_server), pb = __task_prio(b, b_dl_server);
 
 	if (-pa < -pb)
 		return true;
@@ -239,18 +247,13 @@ static inline bool prio_less(const struct task_struct *a,
 	if (pa == -1) { /* dl_prio() doesn't work because of stop_class above */
 		const struct sched_dl_entity *a_dl, *b_dl;
 
-		a_dl = &a->dl;
 		/*
-		 * Since,'a' and 'b' can be CFS tasks served by DL server,
+		 * Since 'a' and 'b' can be tasks served by a DL server,
 		 * __task_prio() can return -1 (for DL) even for those. In that
 		 * case, get to the dl_server's DL entity.
 		 */
-		if (a->dl_server)
-			a_dl = a->dl_server;
-
-		b_dl = &b->dl;
-		if (b->dl_server)
-			b_dl = b->dl_server;
+		a_dl = a_dl_server ?: &a->dl;
+		b_dl = b_dl_server ?: &b->dl;
 
 		return !dl_time_before(a_dl->deadline, b_dl->deadline);
 	}
@@ -266,6 +269,12 @@ static inline bool prio_less(const struct task_struct *a,
 	return false;
 }
 
+static inline bool prio_less(const struct task_struct *a,
+			     const struct task_struct *b, bool in_fi)
+{
+	return __prio_less(a, a->dl_server, b, b->dl_server, in_fi);
+}
+
 static inline bool __sched_core_less(const struct task_struct *a,
 				     const struct task_struct *b)
 {
@@ -6297,6 +6306,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *next, *p, *max;
+	struct sched_dl_entity *max_dl_server;
 	bool fi_before = false;
 	bool core_clock_updated = (rq == rq->core);
 	unsigned long cookie;
@@ -6410,6 +6420,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * Tie-break prio towards the current CPU
 	 */
 	max = NULL;
+	max_dl_server = NULL;
 	for_each_core_cpu_wrap(i, rq) {
 		rq_i = cpu_rq(i);
 
@@ -6432,8 +6443,15 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 
 		rq_i->core_pick = p;
 
-		if (!max || prio_less(max, p, fi_before))
+		/*
+		 * p->dl_server is only set once @p runs; rank a pick that
+		 * came through a DL server by that server.
+		 */
+		if (!max || __prio_less(max, max_dl_server, p, rq_i->dl_server,
+					fi_before)) {
 			max = p;
+			max_dl_server = rq_i->dl_server;
+		}
 	}
 
 	cookie = rq->core->core_cookie = max->core_cookie;
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

