Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253734;
	b=Vz7O+JS/qvIS1eaA7EtZDWZBL3U1NuIbcDE8Fre1wT9FG4PLXREq2NWsSnXUqoE3Pcm7
	 7nJrPW9rE8coIaK1aVeq8lqdJJAnmc2OfCDFU3IHrPs3NPXes0lZEt22Tro6UG7O03iAx
	 PmkQS1HvTQcQjVskj3A7sWSW4lHp9cfv+gLkKElBRW9qS0zoWUH/bQfdcFZE+K2XYdi2P
	 e7/IUv1yN8W0yJfZR5omiiY7e6EqoXY9hKSrutN3mrpy+FYtMCe9pYCSlOavPQliP7N72
	 7JNs16pTGmGMnJjrF57nPU5N32zGAbttD7lgwYkafAvQkJviupeYHM6HXF0c9wyCvkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253734;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=j9g5WU5Spk+Dn//kp9f4xjhZLy9psmLHKbjpszhklxY=;
	b=iknuiBh+bWVw7dGGnGkBpHU4luJeqYcalaGCghE0Hvm5z9gWmjySgtktpUyg3uSIW0Vr
	 5CugpgH1P/ECGQkQeA7UebGTx2tAzNJr5RQiJbb2+5lnJbxxNBSa/3Bts4DyBJDVDvCMY
	 vCmRlgyFnjsI0U3hvoIE/C3zN+Q3L6a0fvZ7UWH6+DDKDehCYdZZh6rs21J22fFSWJuxe
	 YgPyZqxUe4gw+GZsEvp8iOTiXfRKvHDlLgMTveo9WMfjZjSyDMSLPOE1eb+O1z5/RoMzs
	 S1ECjeS0KiggFgBJlhgyDuaCeK6vFKlhHSYgjM/bXyPQ7NiXJ2Pb8Fp4ueyHlWpF2kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=qUA8ifQX;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1C60A260F;
	Mon,  9 Nov 2026 19:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA1C60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=qUA8ifQX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794253733; x=1825789733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j9g5WU5Spk+Dn//kp9f4xjhZLy9psmLHKbjpszhklxY=;
  b=qUA8ifQXZeebkVfK0xkFfBxMI6KnWdqlpj5G70/ZX8lqeBXCwQXePWjN
   /FamJMEiOvHMwPn2o/74TgA3hpwq2DcDLfm3gvSN8zk2RP8ADQ+EpHWdM
   r9gNNw74vchVCdl1ERjecU8ybKc4GDpmMpvN6D7z4Md+eUoiLcamZ2Gie
   X3lRMG4+s0UYcXlDfiNJH3ivJDok8oe8tCRYcADsnvfma5oedvGqwDsA7
   nYJVnpsETK13reDiQHeAv6u0en/LYKhGdXuPIlorHQHqeLszawJHCgWOr
   dlFQZOMQwWzKZ5eK6HHpvYwryRCjdMpnCH01smlzzAsDioiKFRYRKbc7g
   w==;
X-CSE-ConnectionGUID: kPrsA+GwQg+OVR1pdBYLbA==
X-CSE-MsgGUID: 0PFA2SNUS/GC+oyMTPF7Pg==
X-IronPort-AV: E=Sophos;i="6.27,204,1787011200"; 
   d="scan'208";a="33357812"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:48:51 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:15320]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id a0b40043-b039-4313-b4fc-b9571f74dcb7; Mon, 9 Nov 2026 19:48:50 +0000 (UTC)
X-Farcaster-Flow-ID: a0b40043-b039-4313-b4fc-b9571f74dcb7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 19:48:50 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Mon, 9 Nov 2026
 19:48:47 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <shuah@kernel.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<nh-open-source@amazon.com>, <hborghor@amazon.de>, <fmubeen@amazon.de>,
	<dwmw@amazon.co.uk>
Subject: [PATCH 1/2] sched/fair: Renew slice protection when current is picked again
Date: Mon, 9 Nov 2026 21:48:26 +0200
Message-ID: <20261109194827.87349-2-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109194827.87349-1-sieberf@amazon.com>
References: <20261109194827.87349-1-sieberf@amazon.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 0b9ca2dcabc3 ("sched/fair: Always trigger resched at the end of a
protected period") made update_curr() request a reschedule as soon as the
running entity's protected period has run out:

	if (resched || !protect_slice(curr)) {
		resched_curr_lazy(rq);
		clear_buddies(cfs_rq, curr);
	}

se->vprot, which protect_slice() tests against, is armed by
set_protect_slice() in set_next_task_fair() only for a fresh pick
(SNT_PICK). An entity that is picked again - prev == next, so
put_prev_set_next_task() uses SNT_REPICK, see commit c72945693b90
("sched: Restart fair hrtick after same-task repicks") - keeps its expired
vprot. Every later update_curr() on it therefore sets TIF_NEED_RESCHED
again, and keeps doing so until the entity is switched out.

On a CPU that picks only for itself this is mostly harmless, because the
pick runs inside __schedule(), which clears TIF_NEED_RESCHED right after
it.

With core scheduling it is not. pick_next_task() does a core wide pick and
calls pick_task(rq_i) - hence pick_task_fair() and update_curr() - on every
SMT sibling's runqueue. resched_curr_lazy() on a remote runqueue ends in
smp_send_reschedule(), a real rescheduling IPI to that sibling. The sibling
schedules, re-picks the same task, renews nothing, and its own core wide
pick sends the IPI straight back. The two siblings then trade rescheduling
IPIs for as long as both run a task whose protected period has expired.

This needs CONFIG_PREEMPT_LAZY=n. __resched_curr() only calls
smp_send_reschedule() for the eager TIF_NEED_RESCHED, and
resched_curr_lazy() asks for TIF_NEED_RESCHED_LAZY instead once
PREEMPT_LAZY is built in, so a lazy kernel sets a remote flag and sends no
IPI.

To reproduce on any SMT machine built with CONFIG_SCHED_CORE=y and
CONFIG_PREEMPT_LAZY=n:

 1) take an SMT sibling pair from
    /sys/devices/system/cpu/cpu0/topology/thread_siblings_list;
 2) give the process group a core scheduling cookie with
    prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PGID, 0);
 3) fork four children that spin, two pinned to each sibling. Two per
    runqueue is the minimum: update_curr() returns early while
    cfs_rq->h_nr_queued == 1;
 4) read the RES row of /proc/interrupts for both siblings, wait ten
    seconds and read it again.

Renewing on a repick does not undo 0b9ca2dcabc3: the resched leg of the
condition is untouched, so the reschedule at the end of a protected period
still happens. A repicked entity gets the same bounded protection a fresh
pick gets - set_protect_slice() caps vprot at the entity's own deadline, at
the shortest slice enqueued on the cfs_rq under RUN_TO_PARITY, and at
ineligible_vruntime() under PREEMPT_SHORT - and only once its previous
protection has expired.

Fixes: 0b9ca2dcabc3 ("sched/fair: Always trigger resched at the end of a protected period")
Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 kernel/sched/fair.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4cc0caee6265..237908a8c4cd1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15645,6 +15645,13 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
 	sched_fair_update_stop_tick(rq, p);
 
 repick:
+	/*
+	 * A repick is a pick: renew a protected period that ran out, else
+	 * update_curr() reschedules on every update until p is switched out.
+	 */
+	if (type == SNT_REPICK && on_rq && !protect_slice(se))
+		set_protect_slice(cfs_rq, se);
+
 	/*
 	 * A same-task repick skips put_prev_task_fair(), but
 	 * pick_task_fair() refreshed the entity hrtick_start_fair() reads
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

