Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500247;
	b=f1rqj+vo8EmSgNKfX+qydeC/qQy4PHiHEqY0A9iHLo/kYkc3BQDrLr/ovqcoKI3hxkyh
	 ANYxXgg1EdGAqSeuzojclFAcR85X3J++DtfyyvzDrtSQdcd7tp+WDGWQOkk7Wy0lwKH6y
	 PEBuLOliosI9xONJZUJZpXfpDg5HRy7YW/w3DGEmyOZA3YZ198Wzm4EIFv9DajBfO1Uxr
	 QPvYlmq+43W1wuaManjQ2sjAWKiEUmbZS4c4X6TVdnX9pI3LiWr12A8Zbze3N5qDt79eh
	 MmQ7EPur1xxZ2yDwagtj38k4epjRxBNDdO8Nwo59JGTMTLZRvcdR0eEfco7qlIsNnuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500247;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=GmY5lvPLJS1hj5L5fe9PTUj2Hep0rqPvHSqtsKT0SIA=;
	b=32s3NVwchWEGRNeJkZUHaaFY2cqGHxfOKBS1zQ0pFCoMyFEySY7DL9XXh7gU6p3BuXlc
	 yD2/XTUVLzaxOXgjG+5JmrBnU41S+KCiLW34BhT5cOHjFguHLnTjfSa6J/ZsEmWejMaOL
	 bN1LfPLv9rXmPVQVxUDlJjRdBLDQFuSSPiPcCMVWZUQn8j4hYB0uKKH6uBXtr0xmSCmIu
	 6kNmctIdvN4danjifCLc5dGSh72X+ejnw/XPZAtcz7Dp7ZM0FZRF2v65pmSKV3dWcUFam
	 UvT26NB9Tx2Kxz30zN9Zk84dKa8Ct23E2KzZaj798M8Xbeq4P3pcbDm902PsKWdgRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b="ANh0CCP/";
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D3606A31C;
	Thu, 12 Nov 2026 16:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ANh0CCP/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794500247; x=1826036247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GmY5lvPLJS1hj5L5fe9PTUj2Hep0rqPvHSqtsKT0SIA=;
  b=ANh0CCP/pddwMxQuQN6+IfFPf10aNweSssSaolr3pQI7CtievWdX0MoW
   /Uq5N2fYCgrgwA/IuQBw/uR7fZ6k66cljxahX5tKUZldLzKve7tk0b8z/
   FwO6SHB5MYbR4GOEO5EPXbc97x/0yfRebSG5DsgVnMyHjpDf3jJs4yBK+
   Uf6133P/ue5KqZQGBReye2Z+njHE1GHYzDE62Fmg0Z/WlnUOLwr6iJUxa
   VvMHzscQa5OdZ/ZXe4c5UrMgmDT9lQSTs6ILSNfGbVrfNIek7kc3C4/o+
   kT1xjd4gvnRUjMcsMEM4bcz9qcCO1+MkMax3kJxIDJZyZfeOVKUe/blUS
   g==;
X-CSE-ConnectionGUID: FR8US6JjRAiYSyRL5VV21A==
X-CSE-MsgGUID: eluSq235REGrECWWNk3EJg==
X-IronPort-AV: E=Sophos;i="6.27,210,1787011200"; 
   d="scan'208";a="33837868"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:17:24 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:21173]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.231:2525] with esmtp (Farcaster)
 id 39d59ed5-643c-4f08-a4ce-3e4f2ec50af8; Thu, 12 Nov 2026 16:17:24 +0000 (UTC)
X-Farcaster-Flow-ID: 39d59ed5-643c-4f08-a4ce-3e4f2ec50af8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 16:17:24 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 16:17:20 +0000
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
Subject: [PATCH 4/5] sched/deadline: Don't charge core-sched forced idle to the DL servers
Date: Thu, 12 Nov 2026 18:15:47 +0200
Message-ID: <20261112161548.78189-5-sieberf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A deferred DL server is charged the idle time of its rq, on the premise
that the time was available to the server's class and went unused. Core
scheduling breaks that premise: a CPU is forced idle when a SMT sibling
runs a task with an incompatible cookie, so that time was available to
no class at all.

update_curr_dl_se() then runs the server's runtime out while it is
throttled and calls replenish_dl_new_period(), pushing the activation a
full period out. dl_defer_idle does not help, as idle_rq() is false on a
forced-idle CPU: nr_running is not 0. Every period of forced idle pushes
the activation again, the zero-laxity timer never fires, and the class
the server reserves for gets nothing.

Reproduction on 2 cores x 2 threads with the default fair server
(50 ms / 1 s): a SCHED_FIFO spinner with a core-sched cookie on CPU0 and
an uncookied CFS spinner on CPU1 force-idle CPU1, and the CFS task gets
under 0.1% of a CPU instead of the reserved 5%. The ext server starves
sched_ext tasks the same way, and there a plain CFS spinner on the
sibling is enough.

Don't charge forced idle. A server still only loses runtime to real
execution or real idle, and one whose class has nothing to run still
stops through dl_defer_idle once the rq is idle for real; with core
scheduling off nothing changes. Getting the reserved bandwidth back also
needs the server's pick to win the core-wide selection, which the
preceding sched/core patches fix.

Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")
Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 kernel/sched/idle.c  |  7 +++++++
 kernel/sched/sched.h | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index f7dd151f77920..451b4846219d5 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -573,6 +573,13 @@ static void update_curr_idle(struct rq *rq)
 
 	se->exec_start = now;
 
+	/*
+	 * Forced idle was not time available to any class on this rq, so
+	 * don't let the deferred servers consume their runtime on it.
+	 */
+	if (forced_idle_rq(rq))
+		return;
+
 	dl_server_update_idle(&rq->fair_server, delta_exec);
 #ifdef CONFIG_SCHED_CLASS_EXT
 	dl_server_update_idle(&rq->ext_server, delta_exec);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a4df59c9c9b60..f3b22c4bd6782 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1525,6 +1525,16 @@ static inline bool sched_core_disabled(void)
 	return !static_branch_unlikely(&__sched_core_enabled);
 }
 
+/*
+ * True while core scheduling keeps @rq idle because a SMT sibling runs a task
+ * with an incompatible cookie, even though @rq has runnable tasks of its own.
+ */
+static inline bool forced_idle_rq(struct rq *rq)
+{
+	return sched_core_enabled(rq) && rq->core->core_forceidle_count &&
+	       rq->nr_running;
+}
+
 /*
  * Be careful with this function; not for general use. The return value isn't
  * stable unless you actually hold a relevant rq->__lock.
@@ -1659,6 +1669,11 @@ static inline bool sched_core_disabled(void)
 	return true;
 }
 
+static inline bool forced_idle_rq(struct rq *rq)
+{
+	return false;
+}
+
 static inline raw_spinlock_t *rq_lockp(struct rq *rq)
 {
 	return &rq->__lock;
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

