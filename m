Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.155.198.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500208;
	b=yKZgYgEyhFjcZ60ZZQGe6BlbG9RqzjRKUkr+5cF/2lttQ+bInylbHRcK14bRwcXAJiwN
	 U50RpPuh4hhFIyiJ5UdpYmw02zzdFRChBGHqLTzZPpQv16TMS9dKfF5rJsoyFWXTUM+Qt
	 04U1OlKD4ZG3qGy/BwoRMLth8YGbLC3ELM6TRUYFD0d3gi2P1KDurhqJ0rm98TT8Ug+RR
	 l3HiVTixxyk9m698vRrXZ8hIcqgXyIFgbc+uMT4Ofi4bzMDfaFs7JO+7px9j9GGqkJoCj
	 54c5WlHKJDi0dn4ypiA+/oPmz1M4Fm++Qn+WXGO8eiDWtkWqc9PcIA2MHGRj8MOPH1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500208;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=9ZQevISBhHYwgSnfIhwqNtzxOicUyU+bjXzaxpw3Fl8=;
	b=D3fC53UyctaEtj7co07H6OXK8Ib0cOwlg22iRCQXXGdhz0LKOl342pTf9wnjM/bV/0v3
	 tmY6M4anP4+frsNbsO9ES2zjujlYID9DfVVAZSYVa+DEZkEiWNyFV+pQnD2TsTY840P4J
	 ILE432EfknY2yPasDN/BjKYPjW0G3U9m/gv4r4cIpqMJ/LImBZGgyGxyr2pmHX2TSu9H0
	 GtFVWPnC8THUvkNrccQsC453Xxd60XTcKZ0wy+MwxP5fLdwLsqytS5I/Z2ulvg7dV3o2I
	 TAesnC0PUOlGskS5U3B339wZqq/XPSQHrxts3y/ckPoDOQxV98LGSy2jjjHGsbS+fIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b="Kuk/BwkH";
	arc=none smtp.remote-ip=35.155.198.111
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4A606A334;
	Thu, 12 Nov 2026 16:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D4A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Kuk/BwkH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794500208; x=1826036208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ZQevISBhHYwgSnfIhwqNtzxOicUyU+bjXzaxpw3Fl8=;
  b=Kuk/BwkHDa9/lifQYB9PhHFGrOEcm/icbboJUQCdO5O9DliOusgj6Rzd
   w5aIPoNW3OrqLVQWDQ9oN+PyBp1mO2qYUS/Tn/GUVDJ9K1BM9l/9nbsd5
   0/80qfwqt+ntDlSmvGTvc/tB+2IG+jCZ+r8OZSP9WEpkNEIeyHP5Iy1Lo
   s6Ylc7U7XJnrAGLKWmtU2FrHd1AG9F6D1JU7iLn4VXwMdEG9w6tG2hG7+
   kwxnW1CbrpBARjeBSPe0uEK5igP5/fEucg9s1OSm3FLtTPZ/qwNv6D3VV
   AhSsh3X+Or/VpXzC8cJFjuSbg+ukGbznPi/Ldlh6v13ulDIulYSW4U5LG
   g==;
X-CSE-ConnectionGUID: KFbEuYyeTzCsqrmXUiTi+A==
X-CSE-MsgGUID: fZ2UiwVcTiiNzAKXolfOMw==
X-IronPort-AV: E=Sophos;i="6.27,210,1787011200"; 
   d="scan'208";a="33731713"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:16:45 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:13408]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.142:2525] with esmtp (Farcaster)
 id 7b503f49-2b85-4a09-b3d2-289b8b468abc; Thu, 12 Nov 2026 16:16:45 +0000 (UTC)
X-Farcaster-Flow-ID: 7b503f49-2b85-4a09-b3d2-289b8b468abc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 16:16:44 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 16:16:41 +0000
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
Subject: [PATCH 2/5] sched/core: Keep a sibling's DL server link in the core-wide pick
Date: Thu, 12 Nov 2026 18:15:45 +0200
Message-ID: <20261112161548.78189-3-sieberf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The core-wide selection records in rq_i->core_dl_server the DL server
each sibling's pick came through, then clears it for every sibling in
the cookie matching loop, including when the pick is kept. The sibling
takes the fast path, which sets rq->dl_server from rq->core_dl_server,
and runs the task its server picked with p->dl_server NULL. Only the
selecting CPU keeps the link, as its pick goes through rq->dl_server.

A running task is ranked for core scheduling by p->dl_server. While
such a task runs on a sibling, each following core-wide selection
ranks it as a plain fair or ext task rather than by its server's
deadline, so a higher class task on another sibling takes the core
back before the server's runtime is used. The RV nomiss monitor, which
follows the server through next->dl_server at sched_switch, does not
see the server run either.

Keep the server that pick_task() left in rq_i->dl_server. With the
previous patch it is NULL when the class pick was replaced. Drop the
assignment in the first loop, which the matching loop always
overwrites.

Fixes: bd9bbc96e835 ("sched: Rework dl_server")
Signed-off-by: Fernand Sieber <sieberf@amazon.com>
---
 kernel/sched/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f7ac13186ee59..61d4e6e990bba 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6431,7 +6431,6 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 		}
 
 		rq_i->core_pick = p;
-		rq_i->core_dl_server = rq_i->dl_server;
 
 		if (!max || prio_less(max, p, fi_before))
 			max = p;
@@ -6462,7 +6461,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 		}
 
 		rq_i->core_pick = p;
-		rq_i->core_dl_server = NULL;
+		rq_i->core_dl_server = rq_i->dl_server;
 
 		if (p == rq_i->idle) {
 			if (rq_i->nr_running) {
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

