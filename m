Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78192F7F02;
	Tue, 18 Aug 2026 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037439; cv=none; b=bL1K8qPRCSB8Q6Eke7PaPJGjodimi8Fev0UWhJ5TzVP+HHXtxMdbU3xo41LGt4RGuSrKr6aIIAyMIkOnfRlmqiDy3ZBKvKPQMj6AipSva3naZj+LSXTut9RP9kIjHmsvGhmdge55np5hgy4NTWBiU6tPxaUpOcSOQXsSIcSyHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037439; c=relaxed/simple;
	bh=VXr3fp0F8dUjwOPp9sEZHfObw2m61CVOCJJ8c3RiWiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p89MtAZzCPVyzolUXo4U6sKW/Q0iCTAn3qnyIyvnXHIteJ4TbTBXCHOUW9XeB9fghjVS93c7kIlO6l9sVnhyF+sd7MiLCz38+ESpKX+/yE0e05ppykOQGGrom6LKn9pXyw6Ml60f5/3MboayETpqPaJ/7WfEPR4/2ohg6Tpivp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOg/inTV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOg/inTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787037438; x=1818573438;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VXr3fp0F8dUjwOPp9sEZHfObw2m61CVOCJJ8c3RiWiQ=;
  b=NOg/inTVKVTC7cx3ubKreIbyBoz4XuGCMARJaB8/x5JnQ/Wcdfc6TTwx
   3p0x4bp3W5WFt4mwoqgNPTA6IzBsIbOyuxiP0uMUzJhYy1JvDN1LNJOWG
   AT4Ma6K2pbzDnsPSwR8ZKYWRFhJKXl4w0A655kVynGhwQMwNKVZsr6nFF
   AcCMBS70ro4cI3h8hFx8fShEMq0QaWCrVjBoR0bzZOfaljTNP/dvJ4xvY
   lZAaFOcwuOIABreiKSx8THdnMrUpk1F4Ie3TZfijyYKf8CnMaLpsY6cgj
   tpiVxZJM2bLbz0mo7RT5yh5jENzeefKC3PptULTrGUOkZd+mIItpuGPrp
   Q==;
X-CSE-ConnectionGUID: Qc5eClZUQmWHxQSyVrDtAQ==
X-CSE-MsgGUID: K3MCJzlaTOKOrDtLk7LW/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="86482932"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="86482932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:16 -0700
X-CSE-ConnectionGUID: aLpf17x7S2SZddTzpDwYMg==
X-CSE-MsgGUID: U0Qb6swbSVOJzepgKfvzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263410819"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:12 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Weiming Shi <bestswngs@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Hillf Danton <hdanton@sina.com>,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 0/3] net/sched: taprio: fix software schedule livelocks
Date: Tue, 18 Aug 2026 15:17:03 +0800
Message-ID: <20260818071706.251035-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

advance_sched() livelocks the owning CPU in two independent ways:
schedules with entry intervals below the cost of servicing one hrtimer
expiry pass validation, because virtual devices inflate the link speed
behind the frame-length minimum, and a valid schedule that falls
behind - delayed timer, starved CPU, stepped clock - replays its whole
backlog one entry per expiry from hrtimer context.

Neither fix covers the other case. With only bounded catch-up, a 700ns
single-entry schedule on veth is still admitted and sustains ~1M timer
irqs/s on a release build. With only the interval floor, a stepped
clock still replays the backlog. Clamping the next expiry into the
future at runtime, as tested on one of the reproducer buckets in 2025
[1], keeps the stall detector quiet but leaves the sub-microsecond
schedule admitted, the CPU servicing an expiry every few microseconds
for the lifetime of the qdisc, and the gates drifting off the
configured timeline with every clamped expiry.

Patch 2 extends the patch generated by syzkaller's patching workflow
[2] to exempt txtime-assist, which never arms the per-entry hrtimer.
syzbot tested the series against the reproducers of all three known
buckets on net.git; tags on patch 2.

[1] https://lore.kernel.org/all/20250729010657.3326-1-hdanton@sina.com/
[2] https://lore.kernel.org/all/afe041f6-ef7d-4434-b2d0-096be49b5bcb@mail.kernel.org/


Junjie Cao (2):
  net/sched: taprio: catch up in bounded time when the schedule falls
    behind
  selftests/tc-testing: taprio: add case for the software minimum
    interval

Uladzislau Zhauniarovich (1):
  net/sched: taprio: enforce a minimum interval for software schedules

 net/sched/sch_taprio.c                        | 80 +++++++++++++++++--
 .../tc-testing/tc-tests/qdiscs/taprio.json    | 22 +++++
 2 files changed, 97 insertions(+), 5 deletions(-)

-- 
2.43.0

