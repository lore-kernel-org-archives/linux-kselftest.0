Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11443AFD08;
	Thu, 20 Aug 2026 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207262; cv=none; b=O7dTubLtNAl3Nvy574P9gm8q3JILxX3Lp3R3XkXGlScDBGEbYWyPCUbQmIE0I19a/vQdYmxuzofCgfzaMiaTB11u13ap/WYnYK6DmRI2bQEke2uFr0FtyNs917exd/K8/wX/AwAdEts0ktlziXtnuiifbayXLlH657M+S9DdTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207262; c=relaxed/simple;
	bh=JlgRoSocLBcoRDoXfT0tPUeQnHNFLvwtp1sPuoL7q9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNyyMvd6LXnE0Dq32PNsGFFaZGQ4KfdOP7cPVO4xanftK9RxqldpDsv4Lj++NfZwuI6S9HcgexTyBCCeLoND9z8FnUMPVuBwBHmuYuWYS4dMFlLrdoOjmb0AYmBiwTKroiimPZntce1C5FJB9qBH4Xokte2OMP8cwrg6apa1yK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9EAgK9H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9EAgK9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787207260; x=1818743260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JlgRoSocLBcoRDoXfT0tPUeQnHNFLvwtp1sPuoL7q9w=;
  b=N9EAgK9HXi4V47M9HUkfbt7Fxx79cqI8efxGrIZB2QlBCYFr/+WZMgX9
   yN+KsJDmeD9/wkrObg6wmgQcfdrRM8rX6FCiKshzL49pmvoJzWMkw0FKW
   EoQEQlJcKLJJUdRXXGbOc0EQ3Z2LMYbN1z4rcQHX9uBL6rl5CrSuDl1qI
   oCBsIOKhLpkyesnjentASNd/vDYyBHFKipS2bSKJS1zQ8rE5yCeDpS+rl
   6afwEYs94TDZZV0zroCsvh5eLaw6raYFrO3jfZBljKuy6eHeBSFCYCEY3
   5aiexETAMEIW98n4hf8HxN3/TsrRweA1KpNROaL9ewyf8w1jkyJB00ZVM
   Q==;
X-CSE-ConnectionGUID: CkjoImA8RA+eBc87NSU6mg==
X-CSE-MsgGUID: HaCtTT9jSp68t1sG9AeDpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110519175"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="110519175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:40 -0700
X-CSE-ConnectionGUID: wruokuFPSAKj2FoS5gzdPg==
X-CSE-MsgGUID: R0Jix2JpTy23+0Asfuw0RQ==
X-ExtLoop1: 1
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:36 -0700
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
Subject: [PATCH net v2 2/3] net/sched: taprio: enforce a minimum interval for software schedules
Date: Thu, 20 Aug 2026 14:27:14 +0800
Message-ID: <20260820062715.278124-3-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820062715.278124-1-junjie.cao@intel.com>
References: <20260820062715.278124-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>

The interval validation only requires an entry to cover the
transmission of a minimum sized frame at link speed. Virtual devices
inflate that budget: veth advertises 10Gb/s and bonding sums the
speeds of its members, so length_to_duration(ETH_ZLEN) evaluates to a
few tens of nanoseconds and schedules with nanosecond intervals pass
validation. In software mode each entry expiry is an hrtimer callback
costing on the order of 10us on a debug configuration and about a
microsecond on a release build; intervals below that cost rearm the
timer with an expiry already in the past, storming the CPU with back
to back timer interrupts until RCU stalls.

Require 100us per entry in software mode, leaving margin above the
timer service cost. Offloaded and txtime-assist schedules never arm
the per-entry hrtimer and keep the frame-length based minimum only.

Fixes: b5b73b26b3ca ("taprio: Fix allowing too small intervals")
Reported-by: syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=19d01f6082ec61dd45b2
Reported-by: syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8785aaf121cfb2141e0d
Reported-by: syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2642f347f7309b4880dc
Tested-by: syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com
Tested-by: syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com
Tested-by: syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/afe041f6-ef7d-4434-b2d0-096be49b5bcb@mail.kernel.org/
Signed-off-by: Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>
[jc: exempt txtime-assist, use s64 to keep rejecting negative
 cycle_time, rework commit message]
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 net/sched/sch_taprio.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 0d566c934b2f..91a7f7f17462 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -259,6 +259,26 @@ static int length_to_duration(struct taprio_sched *q, int len)
 	return div_u64(len * atomic64_read(&q->picos_per_byte), PSEC_PER_NSEC);
 }
 
+/* Software schedules service one hrtimer expiry per entry; intervals
+ * shorter than the expiry service cost rearm the timer with an expiry
+ * already in the past and storm the CPU. 100us leaves margin above the
+ * measured cost on debug configurations.
+ */
+#define TAPRIO_MIN_SW_INTERVAL_NS	(100 * NSEC_PER_USEC)
+
+static s64 taprio_min_interval(struct taprio_sched *q)
+{
+	s64 min_interval = length_to_duration(q, ETH_ZLEN);
+
+	/* Only pure software schedules arm the per-entry hrtimer. */
+	if (!FULL_OFFLOAD_IS_ENABLED(q->flags) &&
+	    !TXTIME_ASSIST_IS_ENABLED(q->flags))
+		min_interval = max_t(s64, min_interval,
+				     TAPRIO_MIN_SW_INTERVAL_NS);
+
+	return min_interval;
+}
+
 static int duration_to_length(struct taprio_sched *q, u64 duration)
 {
 	return div_u64(duration * PSEC_PER_NSEC, atomic64_read(&q->picos_per_byte));
@@ -1088,7 +1108,7 @@ static int fill_sched_entry(struct taprio_sched *q, struct nlattr **tb,
 			    struct sched_entry *entry,
 			    struct netlink_ext_ack *extack)
 {
-	int min_duration = length_to_duration(q, ETH_ZLEN);
+	s64 min_duration = taprio_min_interval(q);
 	u32 interval = 0;
 
 	if (tb[TCA_TAPRIO_SCHED_ENTRY_CMD])
@@ -1216,7 +1236,7 @@ static int parse_taprio_schedule(struct taprio_sched *q, struct nlattr **tb,
 		new->cycle_time = cycle;
 	}
 
-	if (new->cycle_time < new->num_entries * length_to_duration(q, ETH_ZLEN)) {
+	if (new->cycle_time < (s64)new->num_entries * taprio_min_interval(q)) {
 		NL_SET_ERR_MSG(extack, "'cycle_time' is too small");
 		return -EINVAL;
 	}
-- 
2.43.0

