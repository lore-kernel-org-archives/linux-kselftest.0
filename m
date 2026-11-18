Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007464;
	b=oqXHNX+TLJ6EJNbhYswWfLRpmTTkn/iu4FK2UPdaHp2xQkLGbcquVFYaURhcoPD0Wt0s
	 WgI8oaPLvhVbwrZjpfTz0fZtx0UoLnrfDjFpQDOOUC05udkUr91k8HmB5Yy8gVWEErxbj
	 qXNxb2+nTgN/la6eCpKUYU0VBLSmwFPCYoKvphjsPLjBOtwN2OM/oO+DuUGpv8kI1AvFd
	 Yd1uEJpjv8yG3VFRKGvP7mVRRRutFo6S0tT+F98nbRKBg5cOecNW+b7LJGNqpx65HVhUj
	 zrj4A8Orb8ljIDt/TQVY8PPWNJUdWrxEWOWvg5ctDgj1859t3ZsQTMKrAjaKilf+k7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007464;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rZjv8Mq8kebIeUPmcfLPbunYIIr9N4sYE9eDm+AsvT8=;
	b=yKtPh4uZOYvCLdf286GymDw9IA5HY+tQvUEIo5guwkzo2zXzXjLw5EhmD6wDY/F2Ye4H
	 l3DOtBWjTubdJpxAy/OdidTSDyFIRUPLHDEphn1wR1hAxOh0su4ExReKP+A513PZhTRO5
	 MY60WST2CziVcdPuNBP1R7aWrWZUb92XWTttTDL0VkxPM9MorZ8xH+d5jBx4TsboxgPBY
	 0/hlJi3EDRbic8qlEOn0KIPRMl4iknD0qcEG1KvR/Lk14W4wGNSZJVFPwE7hoHsKyahsl
	 jB004Ct3pjhVsJBbt3yC94rn805RFzUaxp5azu87qDbOuZLYREQ3zemyWsPlfK0T+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CMTxniV4;
	arc=none smtp.remote-ip=95.215.58.182
Received: from mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B79606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0B79606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CMTxniV4
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TmxosFtvGznyGNgGfW/95/46PiO8uiDVIbCfVo7RBqs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795007462; v=1; x=1795612262;
 b=CMTxniV4mx53LJcBUnjBGuNZGwIFaW3sjTXowXQuEbhjzHFiM3hzZK/ixM/Z/vFh+Or2Xafl
 Fob7D8vbeqXCTMbvjls5lYEfrIP6q+HjaTupbUKnyMHpE2FqNXnl63u01ePWR92/cGEv2JQKZOf
 UUDyKHBYiZKc1aYdBXXz8O0g=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5b8da3600f67e505;
	Wed, 18 Nov 2026 13:11:01 +0000
X-Mizu-Trace-ID: 5b8da3600f67e505
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org,
	josef@toxicopanda.com,
	axboe@kernel.dk,
	ast@kernel.org,
	alexei.starovoitov@gmail.com
Cc: cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	daniel@iogearbox.net,
	linux-kselftest@vger.kernel.org,
	cui.tao@linux.dev,
	cuitao@kylinos.cn,
	ameryhung@gmail.com
Subject: [RFC PATCH v14 2/4] blk-iocost: add iocost_ioc_tick tracepoint for per-period device summary
Date: Wed, 18 Nov 2026 21:10:27 +0800
Message-ID: <20261118131029.797007-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118131029.797007-1-cui.tao@linux.dev>
References: <20261118131029.797007-1-cui.tao@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

Add iocost_ioc_tick, a tracepoint emitted once per period with a
summary of the controller's overall state.

Observing this state today requires drgn scripts to dig into ioc
internals. Exposing the per-period summary through a tracepoint lets
the common monitoring paths use standard tools (perf, bpftrace)
instead, and gives them an interface that does not shift with the
internal data layout. The emission points and the exact event fields
are documented in include/trace/events/iocost.h.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
Acked-by: Tejun Heo <tj@kernel.org>
---
 MAINTAINERS                   |  1 +
 block/blk-iocost.c            | 18 +++++++++++
 include/trace/events/iocost.h | 57 +++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d4f4312a2c2..cb9837e3bda7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6910,6 +6910,7 @@ F:	block/blk-iocost.c
 F:	block/blk-iolatency.c
 F:	block/blk-throttle.c
 F:	include/linux/blk-cgroup.h
+F:	include/trace/events/iocost.h
 
 CONTROL GROUP - CPUSET
 M:	Waiman Long <longman@redhat.com>
diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index 8398a406f7d3..607f886803b9 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -2378,6 +2378,7 @@ static void ioc_timer_fn(struct timer_list *timer)
 	struct ioc_now now;
 	LIST_HEAD(surpluses);
 	int nr_debtors, nr_shortages = 0, nr_lagging = 0;
+	int nr_active = 0;
 	u64 usage_us_sum = 0;
 	u32 ppm_rthr;
 	u32 ppm_wthr;
@@ -2575,6 +2576,23 @@ static void ioc_timer_fn(struct timer_list *timer)
 
 	ioc->busy_level = clamp(ioc->busy_level, -1000, 1000);
 
+	/*
+	 * busy_level, cur_period, nr_active and usage_us_sum are complete
+	 * here. usage is wall time over wall time, summed over iocgs, and
+	 * is not capped at 100. vrate and period_us reflect the current
+	 * controller state, which an io.cost.qos write may have changed
+	 * mid-period. Emit before the refresh and the period transition.
+	 */
+	if (trace_iocost_ioc_tick_enabled()) {
+		struct ioc_gq *active_iocg;
+
+		list_for_each_entry(active_iocg, &ioc->active_iocgs,
+				    active_list)
+			nr_active++;
+
+		trace_iocost_ioc_tick(ioc, &now, nr_active, usage_us_sum);
+	}
+
 	ioc_adjust_base_vrate(ioc, rq_wait_pct, nr_lagging, nr_shortages,
 			      prev_busy_level, missed_ppm);
 
diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
index eb711343ce4f..31df5ed5ee8c 100644
--- a/include/trace/events/iocost.h
+++ b/include/trace/events/iocost.h
@@ -181,6 +181,63 @@ TRACE_EVENT(iocost_ioc_vrate_adj,
 	)
 );
 
+/*
+ * Periodic per-device summary, emitted once per period before the vrate
+ * adjustment and the period transition in ioc_timer_fn(). Unlike the
+ * state-change events above, this fires every period the controller is
+ * running, including steady states, and one final time before the
+ * controller goes idle, so the transition to dormancy is directly
+ * visible. It carries the overall controller state so basic monitoring
+ * doesn't require drgn.
+ *
+ * vrate is the current vrate in vtime units, where one IO time second
+ * is VTIME_PER_SEC (2^37) vtime and cost.vrate in io.stat reports the
+ * same value as a percentage of that base.
+ *
+ * nr_active is the number of iocgs on the active list when the event
+ * fires, gathered only when the tracepoint is enabled.
+ * usage_pct is the active iocgs' raw usage deltas summed over the period,
+ * as a percentage of the period wall time, the input to debt forgiveness
+ * decisions, before any per-iocg in-flight usage correction (donation
+ * decisions use the per-iocg usage after that correction). It can
+ * exceed 100% when concurrent service-time estimates exceed wall time.
+ */
+TRACE_EVENT(iocost_ioc_tick,
+
+	TP_PROTO(struct ioc *ioc, const struct ioc_now *now,
+		 int nr_active, u64 usage_us_sum),
+
+	TP_ARGS(ioc, now, nr_active, usage_us_sum),
+
+	TP_STRUCT__entry (
+		__string(devname, ioc_name(ioc))
+		__field(u64, cur_period)
+		__field(u32, period_us)
+		__field(u64, vrate)
+		__field(int, busy_level)
+		__field(int, nr_active)
+		__field(u64, usage_pct)
+	),
+
+	TP_fast_assign(
+		__assign_str(devname);
+		__entry->cur_period = atomic64_read(&ioc->cur_period);
+		__entry->period_us = ioc->period_us;
+		__entry->vrate = ioc->vtime_base_rate;
+		__entry->busy_level = ioc->busy_level;
+		__entry->nr_active = nr_active;
+		__entry->usage_pct = now->now > ioc->period_at ?
+			div64_u64(usage_us_sum * 100,
+				  now->now - ioc->period_at) : 0;
+	),
+
+	TP_printk("[%s] period=%llu:%uus vrate=%llu busy=%d active=%d usage=%llu%%",
+		__get_str(devname), __entry->cur_period, __entry->period_us,
+		__entry->vrate, __entry->busy_level, __entry->nr_active,
+		__entry->usage_pct
+	)
+);
+
 TRACE_EVENT(iocost_iocg_forgive_debt,
 
 	TP_PROTO(struct ioc_gq *iocg, const char *path, struct ioc_now *now,
-- 
2.53.0

