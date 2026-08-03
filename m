Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4F1377AAF;
	Mon,  3 Aug 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751490; cv=none; b=c1bDTy8ko+9ZaN966V41/LuMlUH4UzMai0cJdhZ15RfRFnSC9FJPTcQohghn8uC5ouGMn0FIolB+mOABC2HgCJuIgcpNSiZBbdo8SxMc6A14i3fKE+zi/NIzIVSFZsZC9YQuefuXVgvsKwNw9JjcZM7Jlv8FTeGrbzg30Kt1jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751490; c=relaxed/simple;
	bh=NipaXHPAq76M86EjLRyPE6b8t9xRLNeeTqhuOQMKWa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKnj19bFMScLPfmL8DSwEAB0vBK7SjMHFgt6jjYzElDH/OvOlYkuQlQZxwGrEDL9dhPZm20fBov46FhE5zHy3O4Dk2jEK27klOY0JE21FIxW1ZifuhmsLiWMtZORP5S6ap8D00D5lEb/b+yvHG8z7O7NbPk0PKrz4MDlNZP7EzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=olNED2Ur; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iSmPZLTn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="olNED2Ur";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iSmPZLTn"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785751485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCS0g8a8OyZwzIP30riCL7VLYAsYU4rATP5iLUn/jy8=;
	b=olNED2UrwNBMoTMPyMznd3PlpIcrP0HHHQxUxquKOKINiDLckmSv2Z3/qY1mDq6pd2mr26
	SInDs7fvQMuj6gTAg/lgyF1swJlgXwRxln5bzXyZKFrUZj1mPUhmeNN940DWm4Ko9l+OLt
	DwTStVueGA7b3Oe7uaKeKtOoNs7BKVv7AarODVgdyI1XU4laQg+KHp0COIqSpQrS/Jj1nj
	7kOXvETYy7PkkYh4b7e1cUH7Xuj159350tZa/naKTcuBo/Bw7MdtyuyCJ1yjdOH1VveBir
	VrXyzqr8zOCHzeQKdlRJ3U0+Peq77z8TaDxuKzGl6xNHOQB0a4CRQUXgoq/oFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785751485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCS0g8a8OyZwzIP30riCL7VLYAsYU4rATP5iLUn/jy8=;
	b=iSmPZLTndQJmDj0aJD3iKxCUyLzenE9bPliDJrxh/PAu08ic2oF3FkBBXcrTZjsVqbl4bz
	zVHq6944OrVUydCg==
Date: Mon, 03 Aug 2026 12:04:36 +0200
Subject: [PATCH v2 05/17] timer_list: Use ktime_t over nanoseconds
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-auxclock-nanosleep-prep-v2-5-910cbd485390@linutronix.de>
References: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
In-Reply-To: <20260803-auxclock-nanosleep-prep-v2-0-910cbd485390@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785751481; l=6459;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NipaXHPAq76M86EjLRyPE6b8t9xRLNeeTqhuOQMKWa0=;
 b=VT/LX1vmx2SZRiT/5NApnRkbmXADeWVTVyFjc6hU3o3wUMggZyxMgr8QhZvTPLhP+VAhH/Fnc
 MBHxOOQveLkARtJ8y3PGmjmGRvq3OJdWPzv0USxMWld+ZZUgsFHOOQq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

hrtimers use ktime_t in their implementation and API.
The timer list performs a lot of unnecessary conversion to nanoseconds
which make the code harder to read and are also wrong in case the values
ever become negative.

Remove the conversions.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/timer_list.c | 57 +++++++++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index ccbbb2ad1517..0406bf4488e9 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -20,7 +20,7 @@
 struct timer_list_iter {
 	int cpu;
 	bool second_pass;
-	u64 now;
+	ktime_t now;
 };
 
 /*
@@ -44,19 +44,19 @@ static void SEQ_printf(struct seq_file *m, const char *fmt, ...)
 
 static void
 print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
-	    int idx, u64 now)
+	    int idx, ktime_t now)
 {
 	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer, function));
 	SEQ_printf(m, ", S:%02x", timer->is_queued);
 	SEQ_printf(m, "\n");
-	SEQ_printf(m, " # expires at %llu-%llu nsecs [in %lld to %lld nsecs]\n",
-		(unsigned long long)ktime_to_ns(hrtimer_get_softexpires(timer)),
-		(unsigned long long)ktime_to_ns(hrtimer_get_expires(timer)),
-		(long long)(ktime_to_ns(hrtimer_get_softexpires(timer)) - now),
-		(long long)(ktime_to_ns(hrtimer_get_expires(timer)) - now));
+	SEQ_printf(m, " # expires at %lld-%lld nsecs [in %lld to %lld nsecs]\n",
+		(long long)hrtimer_get_softexpires(timer),
+		(long long)hrtimer_get_expires(timer),
+		(long long)ktime_sub(hrtimer_get_softexpires(timer), now),
+		(long long)ktime_sub(hrtimer_get_expires(timer), now));
 }
 
-static void print_active_timers(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
+static void print_active_timers(struct seq_file *m, struct hrtimer_clock_base *base, ktime_t now)
 {
 	struct timerqueue_linked_node *curr;
 	struct hrtimer *timer, tmp;
@@ -94,7 +94,7 @@ static void print_active_timers(struct seq_file *m, struct hrtimer_clock_base *b
 }
 
 static void
-print_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
+print_base(struct seq_file *m, struct hrtimer_clock_base *base, ktime_t now)
 {
 	SEQ_printf(m, "  .base:       %p\n", base);
 	SEQ_printf(m, "  .index:      %d\n", base->index);
@@ -105,10 +105,10 @@ print_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
 		   (long long) base->offset);
 #endif
 	SEQ_printf(m,   "active timers:\n");
-	print_active_timers(m, base, now + ktime_to_ns(base->offset));
+	print_active_timers(m, base, ktime_add(now, base->offset));
 }
 
-static void print_cpu(struct seq_file *m, int cpu, u64 now)
+static void print_cpu(struct seq_file *m, int cpu, ktime_t now)
 {
 	struct hrtimer_cpu_base *cpu_base = &per_cpu(hrtimer_bases, cpu);
 	int i;
@@ -124,12 +124,11 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 #define P(x)				     \
 	SEQ_printf(m, "  .%-15s: %llu\n", #x, \
 		   (unsigned long long)DIAG_READ(cpu_base->x))
-#define P_ns(x) \
-	SEQ_printf(m, "  .%-15s: %llu nsecs\n", #x, \
-		   (unsigned long long)ktime_to_ns(DIAG_READ(cpu_base->x)))
+#define P_ktime(x) \
+	SEQ_printf(m, "  .%-15s: %lld nsecs\n", #x, (long long)DIAG_READ(cpu_base->x))
 
 #ifdef CONFIG_HIGH_RES_TIMERS
-	P_ns(expires_next);
+	P_ktime(expires_next);
 	P(hres_active);
 	P(nr_events);
 	P(nr_retries);
@@ -137,15 +136,14 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 	P(max_hang_time);
 #endif
 #undef P
-#undef P_ns
+#undef P_ktime
 
 #ifdef CONFIG_TICK_ONESHOT
 # define P(x) \
 	SEQ_printf(m, "  .%-15s: %llu\n", #x, \
 		   (unsigned long long)DIAG_READ(ts->x))
-# define P_ns(x) \
-	SEQ_printf(m, "  .%-15s: %llu nsecs\n", #x, \
-		   (unsigned long long)ktime_to_ns(DIAG_READ(ts->x)))
+# define P_ktime(x) \
+	SEQ_printf(m, "  .%-15s: %lld nsecs\n", #x, (long long)DIAG_READ(ts->x))
 # define P_flag(x, f)			    \
 	SEQ_printf(m, "  .%-15s: %d\n", #x, !!(DIAG_READ(ts->flags) & (f)))
 
@@ -153,22 +151,22 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 		struct tick_sched *ts = tick_get_tick_sched(cpu);
 		P_flag(nohz, TS_FLAG_NOHZ);
 		P_flag(highres, TS_FLAG_HIGHRES);
-		P_ns(last_tick);
+		P_ktime(last_tick);
 		P_flag(tick_stopped, TS_FLAG_STOPPED);
 		P(idle_calls);
 		P(idle_sleeps);
-		P_ns(idle_entrytime);
-		P_ns(idle_waketime);
+		P_ktime(idle_entrytime);
+		P_ktime(idle_waketime);
 		P(last_jiffies);
 		P(next_timer);
-		P_ns(idle_expires);
+		P_ktime(idle_expires);
 		SEQ_printf(m, "jiffies: %llu\n",
 			   (unsigned long long)jiffies);
 	}
 #endif
 
 #undef P
-#undef P_ns
+#undef P_ktime
 #undef P_flag
 #undef DIAG_READ
 	SEQ_printf(m, "\n");
@@ -201,8 +199,7 @@ print_tickdevice(struct seq_file *m, struct tick_device *td, int cpu)
 	SEQ_printf(m, " mult:           %u\n", dev->mult);
 	SEQ_printf(m, " shift:          %u\n", dev->shift);
 	SEQ_printf(m, " mode:           %d\n", clockevent_get_state(dev));
-	SEQ_printf(m, " next_event:     %lld nsecs\n",
-		   (unsigned long long) ktime_to_ns(dev->next_event));
+	SEQ_printf(m, " next_event:     %lld nsecs\n", (long long)dev->next_event);
 
 	SEQ_printf(m, " set_next_event: %ps\n", dev->set_next_event);
 
@@ -255,17 +252,17 @@ static void timer_list_show_tickdevices_header(struct seq_file *m)
 }
 #endif
 
-static inline void timer_list_header(struct seq_file *m, u64 now)
+static inline void timer_list_header(struct seq_file *m, ktime_t now)
 {
 	SEQ_printf(m, "Timer List Version: v0.11\n");
 	SEQ_printf(m, "HRTIMER_MAX_CLOCK_BASES: %d\n", HRTIMER_MAX_CLOCK_BASES);
-	SEQ_printf(m, "now at %lld nsecs\n", (unsigned long long)now);
+	SEQ_printf(m, "now at %lld nsecs\n", (long long)now);
 	SEQ_printf(m, "\n");
 }
 
 void sysrq_timer_list_show(void)
 {
-	u64 now = ktime_to_ns(ktime_get());
+	ktime_t now = ktime_get();
 	int cpu;
 
 	timer_list_header(NULL, now);
@@ -323,7 +320,7 @@ static void *timer_list_start(struct seq_file *file, loff_t *offset)
 	struct timer_list_iter *iter = file->private;
 
 	if (!*offset)
-		iter->now = ktime_to_ns(ktime_get());
+		iter->now = ktime_get();
 	iter->cpu = -1;
 	iter->second_pass = false;
 	return move_iter(iter, *offset);

-- 
2.55.0

