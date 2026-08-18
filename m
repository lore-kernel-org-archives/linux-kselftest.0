Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ACB37B02A;
	Tue, 18 Aug 2026 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037447; cv=none; b=WOwP16vmVP7JrlyIvsHiY/j+L8gmmq8+234rBGjiDS65ZPR8EO6Zz+Zru2R4n0n5OXvBoG071rqZScy7SdGvodQG0jqIwtAfA9hZElch80TFnyH/9/QExEfXy5R0LGMNrPdjctAyq/lui+qs0erPxis2bAQFMUA4ts46wPTe3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037447; c=relaxed/simple;
	bh=rhl32ekHq0gDBQnYZNzvt0rcqXPknuq+HBKXft6nw3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZJWlo1WiTEg6Xq7vG0lDgm3SGljClcDxvxmkdytSalkt9rrAo67yL2RNMdX09JLnrjdfgZk+h573pBZVY4MJlbWQLUP8drT5qIvcc5sXCz+tm1aCkue6VJOacM+0hC1mI6AVWWNSNvuTNmDK/tKuWk60UAV7G4UV4W2IWyuAEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5PNbVyn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5PNbVyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787037445; x=1818573445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rhl32ekHq0gDBQnYZNzvt0rcqXPknuq+HBKXft6nw3k=;
  b=I5PNbVynYunXRjiOvtp0in7DruVNcRmyisWMZp3kNnO7VGxgQUR77/RY
   ciasTM36+DuYC3BN+6XSUt2zhJu9v+pvsgSgvcMrJrLXB+ZwghUJXWH6/
   YZAJOLsZ8jlJIX0JjOGv4TC0K7HoW3hVCG+4VDl6iyE68UWz4fCK1vOp8
   ARfFooPpZCYkHCxus4APLDWHMj0VBgnQhnt0LAA808JGi6poNMncIH7AJ
   FKS6js1GhnbU+UHOfJBsMd5GqFfXMgBBDW0jm52qNqW0qxvk45NZ4P6mQ
   6AZg60rt7ooanBko8o3ArHv71bgX49mnc2iQUoHi2ovtIdFjGAFgV7q3u
   Q==;
X-CSE-ConnectionGUID: pPTDLvT1RFCA4nBdWxrQwA==
X-CSE-MsgGUID: 62DDvuWHSRmRYJVZ6//NBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="86482977"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="86482977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:25 -0700
X-CSE-ConnectionGUID: g0bJ9BTgTmaWBEZ+d4kuXA==
X-CSE-MsgGUID: pJj9pQ7zQ5auYVkGebxfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263410852"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:20 -0700
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
Subject: [PATCH net 2/3] net/sched: taprio: enforce a minimum interval for software schedules
Date: Tue, 18 Aug 2026 15:17:05 +0800
Message-ID: <20260818071706.251035-3-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818071706.251035-1-junjie.cao@intel.com>
References: <20260818071706.251035-1-junjie.cao@intel.com>
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
index f3f90c5d2dca..7519bc5c1aff 100644
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

