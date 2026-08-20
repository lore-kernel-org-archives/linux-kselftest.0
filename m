Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E63AFCF0;
	Thu, 20 Aug 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207258; cv=none; b=Cy4MLX7bpnii/5kMctv2zY4eLU7CbpmmtMMspGIXOXTDVJO96j18J1fJfKDXuuoaF4c/QvoujsTgnfXitM6Ttn5kX0VK4iiJfHdkxDoWbXbaCjTAmuv1c1ZCbblzsrMt79aG0ReqUIQ7AScAjSGJ0L9sbpHuRqKh139KmDHpzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207258; c=relaxed/simple;
	bh=N8Yp/SGc1CoGaxsZyq6L706tRBRe7Js0kKMGUstVYrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=he49NL81ojSydhhtCWfPqIR8xr1wrVmYksr4UNvyScLY264agtRBZiFTFxoFTgZlm12faLtFGcf8Ydspoeu8b+8ckexaqJ3U86dSLE14mZv5X7XPTYfUoFmjynewkSBMdarlHOsTd8UB5wlDkLGQVTTmsmL0wWqO7OoH1M8aGiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfrpIR9u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfrpIR9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787207256; x=1818743256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N8Yp/SGc1CoGaxsZyq6L706tRBRe7Js0kKMGUstVYrA=;
  b=KfrpIR9uqapTLq4Zl0mNblHrNcMexDFwAzsdqMC/R5Lm0cNxHOvyeJ25
   i1NljRhL87t+bL+rh8Ag1bunTSYP4HXIfA1xEM4c67Fy8dFvGh0ewDYQn
   6NuZVq6Som9JZ2B6HBzCR6YA9D59ydm0w9L5XkJQVM43CxDpDXm8K22Vh
   3uPV89KE4rA0opeWV/mZQbY/lauhgGaI0Y6UOH3inkc4TnCFx8h9ZVSeC
   Fdmzgx8rmF8TzLunHXVbjPJ9EwH8PGs5Gq4H5gzIYBCU3XnoiylcKCCXM
   AWzHBEtYlsJcg74WHG0XgXTZNIq/SZ7lQps2V37vH7YPbGEqIp44HECB7
   w==;
X-CSE-ConnectionGUID: dYbA1JJvSFKrsv4JVqcLSA==
X-CSE-MsgGUID: T3nnfiksTgiLVY24yYjwzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="110519161"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="110519161"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:36 -0700
X-CSE-ConnectionGUID: m+KjWns0SmOwMVgRolHqkg==
X-CSE-MsgGUID: MJCQ+hBwRjmijQmBvZ5svw==
X-ExtLoop1: 1
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:27:32 -0700
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
Subject: [PATCH net v2 1/3] net/sched: taprio: catch up in bounded time when the schedule falls behind
Date: Thu, 20 Aug 2026 14:27:13 +0800
Message-ID: <20260820062715.278124-2-junjie.cao@intel.com>
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
index 299234a5f0fe..0d566c934b2f 100644
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
 
+	now = hrtimer_cb_get_time(timer);
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

