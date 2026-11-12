Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500168;
	b=0Gx+yCzXBlnTdIxknkIfaFOjbxh1pFUALDLwkKFwP6rBOo5m7j4g+9/VBu9pSdx60xVl
	 flMux525NrWUrqc4xfV7oQRymy/eH+ofC/9pU05DhAE4Q5Wfl1Y6Cfp07G49vaFu9Yl9Q
	 FrYLCFVnQGQlRaICfLATr2J55PGpGWGzsnBppDvZXdiBD3EKnSiYPRSM5NMbyLI58A3Lg
	 3myr8VNr2lcqr0R5AUXVaVgrqqlviqZ9t2+DAqedDXYNaSWb+pInILRJLSL+LnZD3FnBy
	 a4PTPXBorYvb5dr7W78YhtzlggRudFls4ZTnHBYqRqA779j107Eov35qERUdzGCC39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500168;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=6slC24wsI5oZIPToi5t2zeTD9OO9CM1u2kY0JlnOvHk=;
	b=ZbT5xXLRg0MnQCy5rYFekrBD2Hq49cWEjfcZFhuiInZMmHNAoju23dTCF3qPzyulUcfJ
	 Ym2f9FyLeUT7UBZIbryfbvfTs9x5c7Z+NeNcf9gdmsht67J1s7llng5fxGWTQqsDDWFgM
	 U7GqI9abhOXuS6mjEK8DDJ31WGPLpvbF+b0Ud9DMoSmTR6nV4CLxdEENzQl3vDoVvw1y4
	 AQUt6aGIq0bu0+n/cKRIvaLWC+v4u+35dJ1CDO2YXwpVKw0AFt8br2hKFtmyELaXnHPx0
	 gVDMozfF4axbChzMbFmtgaO4H3YZKBbJbwcGpI5tMcteq8KjJiExFFj5Sc1CVDJ35cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jGSqKKbJ;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981E606A331;
	Thu, 12 Nov 2026 16:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E981E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jGSqKKbJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794500167; x=1826036167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6slC24wsI5oZIPToi5t2zeTD9OO9CM1u2kY0JlnOvHk=;
  b=jGSqKKbJaYzePqN/E2kJQ0Jcn9ST6Mo51ULFMNZ0HAnGVoDxiGzKmgLd
   GqAl+n+4NBOxyYP7s4u0HdBx6+5WmMY3sqoIDs1cyHOTwL/asfNw+anbW
   tJqaRlMEFsMJpqu/Q9GVyU8g80uVkVQyt6LVTEBzAPvyuSxrBtEa6sNMK
   RYdpzpo8maLsBgVZlkbcHF15txyPBgNgcWLMl6hDsGtzatDKpFZADivbU
   ASlJypWAZeFZEs452JAzAd1/IW2j5TxgnT4KoCZkp63YoeUQADu6NbXth
   URe4gVIqR+/tnepwCXmnOfOQDuOx2TCzPcejqJ+43ju5OTQnN3JYNGYhL
   Q==;
X-CSE-ConnectionGUID: QqAIZDgOSuWrT8TmWsF6aA==
X-CSE-MsgGUID: OwIqrzKTQVelmb21GKI8SA==
X-IronPort-AV: E=Sophos;i="6.27,210,1787011200"; 
   d="scan'208";a="33640521"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:16:05 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:29758]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.61:2525] with esmtp (Farcaster)
 id febfd303-a639-4c39-98e5-657cdafe4b62; Thu, 12 Nov 2026 16:16:05 +0000 (UTC)
X-Farcaster-Flow-ID: febfd303-a639-4c39-98e5-657cdafe4b62
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 16:16:04 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 16:16:01 +0000
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
Subject: [PATCH 0/5] sched: Fix DL server starvation under core scheduling
Date: Thu, 12 Nov 2026 18:15:43 +0200
Message-ID: <20261112161548.78189-1-sieberf@amazon.com>
X-Mailer: git-send-email 2.47.3
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

Under core scheduling the class a DL server reserves CPU time for gets
almost nothing. With the default fair server (50 ms / 1 s), a CFS task
spinning on one SMT sibling beside a cookied SCHED_FIFO task on the
other measures 0.000% of its CPU instead of the reserved 5%. The ext
server starves sched_ext tasks the same way.

Two independent mechanisms are at fault. The core-wide selection
mishandles the rq->dl_server hand-off: a stale link is passed to idle
(which then forces the siblings idle and trips the forced-idle WARN), a
sibling's link is lost on the fast path, and picks are ranked before
p->dl_server is set (patches 1-3, Fixes: bd9bbc96e835). Independently,
a deferred server is charged its rq's forced-idle time, so its runtime
runs out while it is still throttled, replenish_dl_new_period() pushes
the activation a full period out, and the next period of forced idle
pushes it again (patch 4, Fixes: a110a81c52a9). Either fix alone leaves
the share at ~0%.

Patch 5 adds cs_dl_server_test to selftests/sched: a cookied FIFO
spinner on one sibling, an uncookied CFS spinner on the other, and a
check of the CFS share of that CPU against half the fair server's
reservation, 2.5% by default. Run under QEMU with -smp 4,cores=2,threads=2.

Over a 5 s window, plain tip fails 10/10 at 0.000%, and with the whole
series it passes 31/31 at 3.99-5.19%.

This series was prepared with the help of an AI coding assistant. I
have reviewed and tested all of it.

Fernand Sieber (5):
  sched/core: Clear stale rq->dl_server when core-sched replaces a pick
  sched/core: Keep a sibling's DL server link in the core-wide pick
  sched/core: Rank DL server picks as deadline in the core-wide pick
  sched/deadline: Don't charge core-sched forced idle to the DL servers
  selftests/sched: Add a core-sched forced-idle DL server test

 kernel/sched/core.c                           |  59 ++-
 kernel/sched/idle.c                           |   7 +
 kernel/sched/sched.h                          |  15 +
 tools/testing/selftests/sched/.gitignore      |   1 +
 tools/testing/selftests/sched/Makefile        |   4 +-
 tools/testing/selftests/sched/config          |   4 +-
 .../selftests/sched/cs_dl_server_test.c       | 402 ++++++++++++++++++
 7 files changed, 471 insertions(+), 21 deletions(-)
 create mode 100644 tools/testing/selftests/sched/cs_dl_server_test.c


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

