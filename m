Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253714;
	b=Gl/AraUkiSz2NbF2/JErJvmx3Dkzh8rtKWlsf59cqq98IJ3Xg9cBDmJQChkj97rX+83p
	 Jbe4kjJCeGmG3do31EA3WGjCJkBS+TFqNidn6i2gzd2pyueGEJA95nHisjhS6ESofcrOH
	 R/ImWDJNkDQfwLYOmSu5fsOkbWzI8vO3SHTlOb/ypRRLD9WR579miESDBBNASjmXJrcu/
	 EbTuKVTMHjE34fecrwujrdH5uc5+RtwwecmxZgPHzAU9aCZUgB2Wr554lOnTdKscWIQYC
	 APkGCxUIQ7ai4PB78xEneqLsMoCYW5hA7xp0UZbN16I/eH1kXImZO91nirNbnR/w5FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253714;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Originating-IP:X-ClientProxiedBy:Content-Type:
	 Content-Transfer-Encoding;
	bh=hg6Lq3LaZX+NBqsbdEPtxB2Zy/CQ06DdlwM0HCmSCr8=;
	b=THFZDW4QnuU5B7CcKABwxBmd6oj1jVpmbYWaGp+66NfU8C6vI1hMYKFyEGnOpkeyfe3t
	 m7Pxd6k+JCVoWIGeIFJIU5RO4xu8Q/URJ4P0CzPnPitB0XqQn/XROvStVcL7Mru8nigXc
	 66Y4pFvvlUAE9XblRI2d1huXBOhrAKNNJOa3dDQ6Oc6vTwXIPqiEvtag0aHqiA8ppahdK
	 tPYfJtUPUvInxXW7Lu2ANgkWQewqenU/UeIXNP822tZ1yjWHNy0Y21AyVnPHNPKzsE3JY
	 vF8HPTskz2hXRqHoBDi2mY30aMLFeoUhT1w0lK1cQi4pu8g2aPBHA/nZa9zvmwI6IYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=RIXLERVx;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3560A260C;
	Mon,  9 Nov 2026 19:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F3560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=RIXLERVx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794253714; x=1825789714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hg6Lq3LaZX+NBqsbdEPtxB2Zy/CQ06DdlwM0HCmSCr8=;
  b=RIXLERVxIpYCMvVKLibk4KuoUu+/e+Il6u2MfXxxSWEbJPjtSZo+C6im
   T09I4xsgVtYy4ODLAagikLsxcynZQiSVOCg4fTBNne4TJKZ13nF92yHqc
   gJgxvf6zpNpeq6tw2znnLgsu7RJyZA9G2DTPXEjVEe0bQSfENjuDXOKWf
   HKlLU6HRRabYfjKCJ77pEgT8VE7S567BUP5zq6pOwUebBrTdTfeQ77X3J
   mBE2okpxSxSWX/yjEvmd+TA6vAQcJhnJhLemfMwGmPHd3BcwVkj8jToRg
   hM3EVKZ7P0I2DIzQmB1orJ34yOtC4Mz5AJKES+xpzgBy6xXr5bHVirzrA
   Q==;
X-CSE-ConnectionGUID: dviy2xHsSgW2E3LS/kxk/g==
X-CSE-MsgGUID: lZDCxsgsRzWAHfjvihhVlg==
X-IronPort-AV: E=Sophos;i="6.27,204,1787011200"; 
   d="scan'208";a="33546071"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:48:32 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:22452]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id f60dd975-c1d5-4f4e-a67b-dbe0158e5e0e; Mon, 9 Nov 2026 19:48:31 +0000 (UTC)
X-Farcaster-Flow-ID: f60dd975-c1d5-4f4e-a67b-dbe0158e5e0e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 19:48:31 +0000
Received: from dev-dsk-sieberf-metal-1a-7543e84d.eu-west-1.amazon.com
 (172.19.116.227) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Mon, 9 Nov 2026
 19:48:28 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <shuah@kernel.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<nh-open-source@amazon.com>, <hborghor@amazon.de>, <fmubeen@amazon.de>,
	<dwmw@amazon.co.uk>
Subject: [PATCH 0/2] sched/fair: Stop core-scheduled siblings trading rescheduling IPIs
Date: Mon, 9 Nov 2026 21:48:25 +0200
Message-ID: <20261109194827.87349-1-sieberf@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since v6.17, two SMT siblings under core scheduling can keep sending each
other rescheduling IPIs, thousands per CPU per second, while each keeps
running the same task.

Commit 0b9ca2dcabc3 ("sched/fair: Always trigger resched at the end of a
protected period") makes update_curr() ask for a reschedule once the
running entity's protected period has expired. set_protect_slice() only
rearms that period on a fresh pick (SNT_PICK), so an entity that is picked
again keeps an expired vprot and every later update_curr() on it asks
again. Under core scheduling the ask is remote: a core wide pick calls
pick_task() - hence update_curr() - on every sibling's runqueue, so each
sibling IPIs the other, which schedules, re-picks the same entity, renews
nothing, and IPIs back.

Patch 1 renews the protection on a repick. Patch 2 adds a selftest that
cookies one SMT pair, runs two spinners on each sibling and fails above
1000 rescheduling IPIs per CPU per second. It reproduces in a 4 vCPU QEMU
guest (-smp 4,sockets=1,cores=2,threads=2) with CONFIG_SCHED_CORE=y and
CONFIG_PREEMPT_LAZY=n: without patch 1 it fails 6 runs out of 7, at
808-2123 IPIs/CPU/s; with it all 7 pass, at 224-271.

This series, including the changelogs, was prepared with the help of an AI
coding assistant; I have reviewed and tested all of it.

Fernand Sieber (2):
  sched/fair: Renew slice protection when current is picked again
  selftests/sched: Add a core scheduling rescheduling IPI test

 kernel/sched/fair.c                           |   7 +
 tools/testing/selftests/sched/.gitignore      |   1 +
 tools/testing/selftests/sched/Makefile        |   4 +-
 tools/testing/selftests/sched/config          |   2 +-
 .../selftests/sched/cs_resched_ipi_test.c     | 377 ++++++++++++++++++
 5 files changed, 388 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched/cs_resched_ipi_test.c

-- 
2.47.3




Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

