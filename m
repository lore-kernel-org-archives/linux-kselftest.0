Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500188;
	b=neq91MWlYe6+v8KiRDmUGq/dXbQlSZZaaEfVXCzlRihY4eKzNtsyjhPgnEXhWYVKc5W/
	 32GW1YlrNKYUOO9JSeqi5YIGybDt4ZJSeR7Cx9tHsDxzO9a/JngM9+3ydgxMFfGVnEqW5
	 ZWJsJV3FLC+IJGLnys133v5+HDN8JL5d+0OCFTCwpt+Z19c1xGrX7MRr2tOqkNj3C9Mtz
	 n4ApNTdIMckKn6+UptGesLTDjQJjn0tKQ9x5hxYOJu9lGMbZd4rcpVIuu3B6qfhx4eWiR
	 aANT1HpnmxqLLlrsSkSj3GyLp5IOKLQ/pfyTSbyEq4vNAOofN0NoaFriNAa8+dCYuFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500188;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=zI6jpPdRTfEJ3iMeZVxYPwVawJ+oNViJsEyZsG8jQeo=;
	b=z0nXIa9+0AHvuARkCmUEHK02bd0ShzUYRHX5ruF19+W8eYoMBylE2m+1NzpQjA5wlLNY
	 3ufNjnWP36a+eC8tSO2VS9wJOTOev8LVy+OAy5o4GNXrG1UBE9sAfn7Yb2U9XMBw4C8mW
	 ip9ibmJTy2S96yTTNZPpBMsFxyL1uE3SsBGLhhOaFfHQzbeeBC8bYrdE7MFp1fsHaz5EK
	 YtIUGWwAWBzYRtrsVVtuN7FYvXeDrzoDOwWx8fYI5HGA7Wj/9igCbIJfj3YtAlBR9oW47
	 aaro1rXnWWL6PTxeCS5vyAwlDEKdcBQbDsmlq0muPdf1ztl6jZ/yfPF4GtyvMkW6Epw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ETQW6o0s;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D58606A323;
	Thu, 12 Nov 2026 16:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D58606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=ETQW6o0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794500188; x=1826036188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zI6jpPdRTfEJ3iMeZVxYPwVawJ+oNViJsEyZsG8jQeo=;
  b=ETQW6o0sIiscXzzfryk4AKdwRsodv6lpu8Dxk6pZJPQaWKuds4ucVS4q
   gVtQZG8a2SGGE66MEUBoC3JDIAuUeNhA8+iTIcOb7wUA/niUFQa8QsgVf
   fxi3CRfU8av4FF9TY3v5Pws7nhMCij/k6F9zKk6KAriiZXhDit/gUPQYK
   IdQuzat12WOnrEF3g6jcMiMyqGZXLs0axyEVBK029kT89T8eLiVp+TdTB
   Y3UwacmhH9z2jeBVgguhhbdGAdoPqx3O9Izj+zQeH+qmOYDbsSnCKvbGv
   ZmkUiutl+gKsWNE9uNAulJHOHit89vy+NpNU2P4hMJhQxhFyvlcmB/tY9
   w==;
X-CSE-ConnectionGUID: i3W5HIP0Q/OS3pq1ol8tlg==
X-CSE-MsgGUID: lCcJXC0AS5Kug8HyhYN2WA==
X-IronPort-AV: E=Sophos;i="6.27,210,1787011200"; 
   d="scan'208";a="33829665"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:16:25 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:24853]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 1fc5008f-f181-49aa-b8ce-554d2f56a30b; Thu, 12 Nov 2026 16:16:25 +0000 (UTC)
X-Farcaster-Flow-ID: 1fc5008f-f181-49aa-b8ce-554d2f56a30b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 16:16:24 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 16:16:21 +0000
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
Subject: [PATCH 1/5] sched/core: Clear stale rq->dl_server when core-sched replaces a pick
Date: Thu, 12 Nov 2026 18:15:44 +0200
Message-ID: <20261112161548.78189-2-sieberf@amazon.com>
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

With core scheduling and the fair server, the forced-idle accounting
warns from an idle core:

  WARNING: kernel/sched/core_sched.c:263 at __sched_core_account_forceidle+0x1d6/0x1f0, CPU#0: swapper/0/0

The core is in forced idle with no sibling running a task. The reason
is a stale rq->dl_server causing the idle task to incorrectly be
considered as carried by the deadline server. The idle task then wins
over a runnable sibling task and the whole core is idle despite having
runnable tasks.

The timeline below describes the issue:

  Setup. CPU0 and CPU1 are SMT siblings.
  - CPU1 runs R, a SCHED_FIFO task with cookie X.
  - CPU0 has C, a CFS task with no cookie, which has been starved.
    So CPU0's fair server is due to step in.

  t0, CPU0 picks for the core.
  - pick_task(rq0) goes through the deadline class, which picks the
    fair server, which picks C. As a side effect it sets
    rq0->dl_server = &rq0->fair_server.
  - pick_task(rq1) picks R.

  t1, ranking. C->dl_server is only set once C is switched in, so C
  ranks as CFS. R (RT) beats C (CFS), so the core cookie becomes X.

  t2, matching. CPU0's pick C has cookie 0, not X, so it is replaced.
  There is no cookie-X task on CPU0, so the replacement is idle, and
  CPU0 is forced idle.
  - The code sets rq0->core_pick = idle and rq0->core_dl_server = NULL.
  - The bug: it leaves rq0->dl_server pointing at CPU0's fair server,
    even though idle didn't come through any server.

  t3, CPU0 switches. CPU0 is the selecting CPU, so next = idle, and
  put_prev_set_next_task() hands the stale rq0->dl_server to it. Now
  idle->dl_server is CPU0's fair server.

  t4, C leaves. Load balancing moves C to another core, so CPU0 has
  nothing runnable. The stale link stays on idle.

  t5, the next core-wide selection (when CPU1 reschedules, say on a
  wakeup).
  - CPU0's pick is idle, and the ranking sees idle->dl_server set, so
    it ranks idle as a deadline task.
  - idle now beats R, and the core cookie becomes idle's cookie, 0.
  - CPU1's R has cookie X, not 0, so CPU1 is forced idle.

  t6, result. The whole core is idle. R is runnable but can't run, and
  nothing runs on either CPU. That's the WARN in
  __sched_core_account_forceidle(): forced idle with no sibling running
  a task. It lasts until CPU0 goes through a full schedule that resets
  its server link.

With this patch, step t2 also does rq0->dl_server = NULL. At t3 idle
gets no server, and at t5 it ranks as plain idle, so R wins and keeps
running on CPU1.

Fixes: bd9bbc96e835 ("sched: Rework dl_server")
Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 kernel/sched/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 175b52a7ea793..f7ac13186ee59 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6453,6 +6453,12 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 				p = sched_core_find(rq_i, cookie);
 			if (!p)
 				p = idle_sched_class.pick_task(rq_i, rf);
+
+			/*
+			 * Neither a core tree pick nor idle comes through a
+			 * DL server; drop the one the replaced pick left.
+			 */
+			rq_i->dl_server = NULL;
 		}
 
 		rq_i->core_pick = p;
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

