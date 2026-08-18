Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DFD34572B;
	Tue, 18 Aug 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037443; cv=none; b=N1Gt7mpK08tFs59UDzX1DxFzcyb3+MEUc/fl1ihq3pkzb7CuBegGHqL/IHy0O7IHGc416m2WgIb65RK0pNftz1YIn2SCyl/oYxSBr1N0xpN3J5/1QrteThv/aNOdfflDi3Ddjx+y7VtSB2F7UpcUrkQCJhMP1Rvs/lbMlpZ5J7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037443; c=relaxed/simple;
	bh=cpyskyAnrIvjKhOv4zt1c/g/OfoLxR5r2bmhbHql31c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+uG2uwBu4F3wsBk9O+6VaTPj9tHcxVcMjCcPOFKKfsfUpBp/DcYg0wHNpWUalWdnAC0P0nopKVJmzykG1z0m/xfznZWanDSVc3Rg41Ul4tDmN2D55n4stBlG6O0mJ+MzIZL8+Lyo6lGlZwEjwGB5aLOcQw4Pb0buzZ8XLh5bH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzouMxh/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzouMxh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787037441; x=1818573441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cpyskyAnrIvjKhOv4zt1c/g/OfoLxR5r2bmhbHql31c=;
  b=DzouMxh/zO4y6sbGp9MLieqwmXgdHkxL5/dg4Y8B2NRh7x9lyuinVudB
   2OyCVx4DJywP+pmRHqWysKzBkDUc+UtYFvKGNJjL8tfamTuChRHZrdUET
   l46o8E1HD+TrG02brdni9SxIVIxUXoDbayCjExNs97aFWzyTfbBV5TOKv
   zfLUxAatNPQowMGkK7miJ4NQSs6IAn7p5bJnAvnSo3awF1QW8cmBajQHn
   xTLANmOjothQSxRo9bEg6fgBTcnbRDW6an8rTWQ7s2H8wPMv/D3XAUz9m
   iZGsSc5iL49frR89q0cKTWsgj0rfvhl1E0r0TuWZ9ZQV00B2Yhzp+8/KH
   w==;
X-CSE-ConnectionGUID: uecRfQ/xRGqTCTDElso1PQ==
X-CSE-MsgGUID: g8MiuBWsTPWG1qUOJkxncA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="86482954"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="86482954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:21 -0700
X-CSE-ConnectionGUID: +KmYAEHjQleMccxRE5yhDQ==
X-CSE-MsgGUID: Sb6UeuJrQVqm9ON69hqmDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263410841"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:17:16 -0700
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
Subject: [PATCH net 1/3] net/sched: taprio: catch up in bounded time when the schedule falls behind
Date: Tue, 18 Aug 2026 15:17:04 +0800
Message-ID: <20260818071706.251035-2-junjie.cao@intel.com>
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

advance_sched() advances exactly one entry per hrtimer expiry. When the
operational schedule falls behind - the timer was delayed, the CPU was
starved, or the reference clock stepped forward - every elapsed entry
is replayed back to back from hrtimer context with current_entry_lock
held, and each replay rearms the timer with an expiry in the past. Once
the backlog is large enough the CPU never leaves timer processing and
RCU stalls follow. syzbot triggers this with schedules whose intervals
are shorter than the cost of servicing one expiry, so the backlog only
ever grows.

Skip complete cycles arithmetically and walk at most one cycle of
entries to land on the entry covering the current time. Gate close
times and budgets are still only computed for the entry landed on. An
admin schedule crossed by the jump is picked up by the existing
should_change_schedules() check on the recomputed end time. The walk is
capped at twice the entry count as a safeguard against degenerate
intervals; leftover backlog is then handled by the next expiry as
today.

Fixes: 5a781ccbd19e ("tc: Add support for configuring the taprio scheduler")
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 net/sched/sch_taprio.c | 56 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 299234a5f0fe..f3f90c5d2dca 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -915,6 +915,51 @@ static bool should_change_schedules(const struct sched_gate_list *admin,
 	return false;
 }
 
+/* The operational schedule fell behind, e.g. because the timer was delayed
+ * or the reference clock stepped forward. Advancing one entry per timer
+ * expiry would replay the whole backlog from hrtimer context, so skip
+ * complete cycles arithmetically and walk the remaining entries to land on
+ * the entry covering the current time.
+ */
+static void taprio_catch_up(struct sched_gate_list *oper,
+			    struct sched_entry **next, ktime_t *next_start,
+			    ktime_t *end_time, ktime_t now)
+{
+	int budget = 2 * oper->num_entries + 1;
+	struct sched_entry *entry = *next;
+	ktime_t start = *next_start;
+	ktime_t end = *end_time;
+	s64 behind = ktime_sub(now, end);
+
+	if (oper->cycle_time > 0 && behind >= oper->cycle_time) {
+		s64 jump = div64_s64(behind, oper->cycle_time) * oper->cycle_time;
+
+		start = ktime_add_ns(start, jump);
+		end = ktime_add_ns(end, jump);
+		oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time, jump);
+	}
+
+	while (ktime_before(end, now) && --budget) {
+		if (list_is_last(&entry->list, &oper->entries) ||
+		    ktime_compare(end, oper->cycle_end_time) == 0) {
+			entry = list_first_entry(&oper->entries,
+						 struct sched_entry, list);
+			oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time,
+							    oper->cycle_time);
+		} else {
+			entry = list_next_entry(entry, list);
+		}
+
+		start = end;
+		end = ktime_add_ns(end, entry->interval);
+		end = min_t(ktime_t, end, oper->cycle_end_time);
+	}
+
+	*next = entry;
+	*next_start = start;
+	*end_time = end;
+}
+
 static enum hrtimer_restart advance_sched(struct hrtimer *timer)
 {
 	struct taprio_sched *q = container_of(timer, struct taprio_sched,
@@ -924,7 +969,7 @@ static enum hrtimer_restart advance_sched(struct hrtimer *timer)
 	int num_tc = netdev_get_num_tc(dev);
 	struct sched_entry *entry, *next;
 	struct Qdisc *sch = q->root;
-	ktime_t end_time;
+	ktime_t end_time, next_start, now;
 	int tc;
 
 	spin_lock(&q->current_entry_lock);
@@ -960,14 +1005,19 @@ static enum hrtimer_restart advance_sched(struct hrtimer *timer)
 		next = list_next_entry(entry, list);
 	}
 
-	end_time = ktime_add_ns(entry->end_time, next->interval);
+	next_start = entry->end_time;
+	end_time = ktime_add_ns(next_start, next->interval);
 	end_time = min_t(ktime_t, end_time, oper->cycle_end_time);
 
+	now = taprio_get_time(q);
+	if (unlikely(ktime_before(end_time, now)))
+		taprio_catch_up(oper, &next, &next_start, &end_time, now);
+
 	for (tc = 0; tc < num_tc; tc++) {
 		if (next->gate_duration[tc] == oper->cycle_time)
 			next->gate_close_time[tc] = KTIME_MAX;
 		else
-			next->gate_close_time[tc] = ktime_add_ns(entry->end_time,
+			next->gate_close_time[tc] = ktime_add_ns(next_start,
 								 next->gate_duration[tc]);
 	}
 
-- 
2.43.0

