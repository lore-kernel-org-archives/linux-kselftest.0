Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172318;
	b=FWkz9HR2xQCtMoEzBHvOXc21NDAclphR6ueYCgxnQAMDX1clB5qaydEAmVGQsHliJQwW
	 V+3n/LsOGW4f3VVAMSexF9or9KIhzDqq40dZBL6sb2pz6P3BqsFNqyKKYwDq38GBTlbbH
	 KlXRA3szl/KUfm+bcA+ZFsiIWGeHzzOaCSEmtj4gbHeIz5PlMs9aV3Yo/GqLyq+OmR1by
	 48KQdF76ijDfbDN4Wn7rGLe+zHnF57SqRtwmKozKHdfWmNw125KDi+PrOxH45jKi0wJfV
	 XG0Gzh6pIJKK1RGWgLz0DIWcoJSIguHNJ7agMpV/whjTukkDIEh+lmVRTZa2LagP54w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172318;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=AkOJ+Myj2ETQZmmGlWz7oa9vaDDW2dRxOxKFjBmdIe8=;
	b=jCt3aEalJywQ7rEB86q0utbDZ2DWV9tqR2q1hv5KRfjK4Hb7b3nUpyNDuV1qttPbg4BX
	 5+Q557avQIq3yWpxI/I+wPFOavY5ce18/vt6iBkckKxYg1howZtmFfUphuUdx3SGgBjRo
	 pFDG2atpL/Te4ibGtgwKxZGJ5n19uUyD4aRYeGCDd5GJ1ab5DSE5N91jFUMFChIT/eA8e
	 ofhEUrzVRpY8syFTX499ZC4MSFvTj5eaImepmOVQ5iqZA+MB5p1Pu3jVnu6rNVzVqdfrf
	 ozrqbV2IXIhEyvCgFmsE16L7+5jQrQZwME0CXLhyFDtu8NuEHgMJfkLDFyiaE6kH91Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=EKK66efL;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6726606A339;
	Fri, 20 Nov 2026 10:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6726606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=EKK66efL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795172317; x=1826708317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AkOJ+Myj2ETQZmmGlWz7oa9vaDDW2dRxOxKFjBmdIe8=;
  b=EKK66efL8ozC1PYh8JNw6Pq8XFPP4BojY+PKNYDdEv8nVzJmu1tNrXg2
   4QOoJqyaS+Y9Qhx8U3vOlZxmuwd+iYEHXAp9/LERFv4EwMcizy+sgTKO3
   19jWxMbnbLpjM9bgW+ybekAUKpktPeEtRfhhcz1+5vPTbz2Jc+E3bTGbd
   9lBzQc3QN5O1FvCVUjp0yqZjY9wJ/lTfqRhgREh4dOvnh6pWaNwzQl9vy
   XCS1VPLtu5LRdN24OXaKzA7S8DG048DkDGItQuwSiNRiO0G8qOVBxyqvB
   KOaLp1f4OCBUk5uLVYwo4ARmMCz0Ug/wp1Cq+GRjcvy4Wo74kPgBA8aYm
   A==;
X-CSE-ConnectionGUID: kvlLoeuSR9SSqrEhn8+jxw==
X-CSE-MsgGUID: K1Gae5iKR5WwHjjHB5xWMQ==
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="34639974"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 10:58:35 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:31951]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.86:2525] with esmtp (Farcaster)
 id a189ccf4-f869-4d5d-9ae7-80d97904740c; Fri, 20 Nov 2026 10:58:35 +0000 (UTC)
X-Farcaster-Flow-ID: a189ccf4-f869-4d5d-9ae7-80d97904740c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Fri, 20 Nov 2026 10:58:34 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Fri, 20 Nov 2026
 10:58:31 +0000
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
Subject: [PATCH v2 1/3] sched/core: Clear a stale rq->core_pick after dequeue
Date: Fri, 20 Nov 2026 10:58:20 +0000
Message-ID: <20261120105822.7770-2-lshahed@amazon.de>
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

A core-wide selection leaves the task chosen for each sibling in that
sibling's rq->core_pick until pick_next_task() on the sibling consumes
it. If the task is dequeued before the sibling consumes it, for example
migrated away, the pointer stays until the sibling's next
pick_next_task() overwrites it. Until then
__sched_core_account_forceidle() keeps charging forced idle time to a
task that no longer runs there and, with schedstats enabled, to its
cgroup, even after the task has exited.

Clear rq->core_pick and rq->core_dl_server in sched_core_dequeue() once
the pending pick is dequeued, and don't wait for pick_next_task() to
overwrite them.

Fixes: 4feee7d12603 ("sched/core: Forced idle accounting")
Cc: stable@vger.kernel.org
Co-developed-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Ibrahim Elshahed <lshahed@amazon.de>
---
 kernel/sched/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 175b52a7ea79..b1718ba5a4d1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -328,6 +328,15 @@ void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
 		RB_CLEAR_NODE(&p->core_node);
 	}
 
+	/*
+	 * @p left this rq, so it can no longer be the pick a sibling made.
+	 * This also avoids forced idle accounting charging it once it is gone.
+	 */
+	if (rq->core_pick == p) {
+		rq->core_pick = NULL;
+		rq->core_dl_server = NULL;
+	}
+
 	/*
 	 * Migrating the last task off the cpu, with the cpu in forced idle
 	 * state. Reschedule to create an accounting edge for forced idle,
-- 
2.47.3

