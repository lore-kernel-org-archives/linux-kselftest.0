Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F9138D6A9;
	Thu, 20 Aug 2026 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207255; cv=none; b=GjBrSz7EdIm+3SrZffad0nWPHM7XNGb4beDnRUIuQ3FYv8kWf/5tZP5QOZZ/VjJohkxOygNTQLxO/s8wwrBZKjG6w6fLg2L1NJ8HE0dicGFTfSaL5y5yldcpWUxwhOGBhGstkma5rqZFbcHaga8u6VqmLI9gGNoNZCCj5y9h7bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207255; c=relaxed/simple;
	bh=kRJTNcaJzsMZuTbP8Z9v0IhOmWbyNgC8dhkAMyUol0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DY+3pInXM1EdEQBpIEzjZxAULCSUPbx5HAzZYUYzRt40KZHidVb3WoEA4UfQpeVsv8LPYO2Btez5ahNdGTksJgLey1tTzk8MumWOo7He7FT6BzfyoL7Y2cqa/OUdTEa8UT91x1L0LD0s4zdOmPyuCNsR7DtRfEvI1ch0seZ43lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFET0ukJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFET0ukJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787207253; x=1818743253;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kRJTNcaJzsMZuTbP8Z9v0IhOmWbyNgC8dhkAMyUol0M=;
  b=eFET0ukJSCSngSK+IDD2RKJCAppxRSZ2qz1pmIHXtnv9nlUWTfjOcIQR
   ELTuqJlTUBuPwiucVgOhDWi/zUTfxYOmPeWUTKZxujD9lMf3DYaM8AQse
   qL42/sa4f+/f19/qINgd1/eVNsewS2E3/llKTt1r5sWMjWw1mplefx9fl
   peTWX+vcvosm6eVWUWJJSI5MVom1ND4Tod27xanwJt2R55GbpizSlZn9D
   xZTaHjOpnNp4VsrKO+wNszkc3y2Wsplopn3huWoIE/Q44VdwHBP9naKjH
   O2uKJpTmB3X62DI5xa0MaUkdr3JbPCeRSa1zvluj/rSVcK/0n/PeEYkZS
   g==;
X-CSE-ConnectionGUID: +OrSonKERN2FIkAzQSz8sg==
X-CSE-MsgGUID: K1kbsaiUQYmhRWXTjXaMYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110519151"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="110519151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:32 -0700
X-CSE-ConnectionGUID: 0+7x8qG3TUSutAX560QSog==
X-CSE-MsgGUID: zr/wu3eFTV2LgtFOmPv1AQ==
X-ExtLoop1: 1
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:28 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/3] net/sched: taprio: fix software schedule livelocks
Date: Thu, 20 Aug 2026 14:27:12 +0800
Message-ID: <20260820062715.278124-1-junjie.cao@intel.com>
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

Changes in v2:
- advance_sched() takes now from the timer's clock base rather than
  re-deriving it through taprio_get_time() (Hillf Danton).

v1: https://lore.kernel.org/all/20260818071706.251035-1-junjie.cao@intel.com/

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

