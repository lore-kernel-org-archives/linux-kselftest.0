Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA183947B0
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066247; cv=none; b=iEB6qsNDcaSJAP/p9C6B0R8AWmtmhl6E5TTlF0PP2tEHsKbQydLKuL/PEmPLNnxTH3vaMs35Y/Mv883odOlSLfQWtb2nu7osHTr8wgP2OsKPLA2nNKUlm3gkug7qH9igIltTe7pgfjvxVI2bgqY2QGry4+rgpgFNxndZjTxPt/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066247; c=relaxed/simple;
	bh=Y0xqgw/0a5rTkwx+KfPUGwTxkRJeNcj/lT+2uowTJCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByNfHZ1tNvlo+7USpz2E8jkDSLHM9qnIam/bm9hpMYtcGWAUgcY13jf2a6KCg3VQe9kkobHjGaEvBK5w912fWT76R2hd7LZ+YFjr9bEOcfZVM6JTMe4lEY/PshBWlbVl1gq4XKq8zuyecBBFwv/kKs90/J7qoW3aT+7duaRJiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psy7Tq7A; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psy7Tq7A"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1271257ae53so11457751c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066245; x=1776671045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFe08Ts/hypKtbjTki6Zi9pd0qwjzgX8Ya0BzZ0CJRU=;
        b=psy7Tq7ABGPF6GaU9/g4aAkV1a2pzB3ML+cSDy0yWSyCa5q2CQH9lKnLnunU8ppBa+
         KrWTifxQv7HReEaW+67JomhAJTqpAT02KfLrLMRRdpTr+olat2OAwUuTWOVjY+5Mxg8H
         kpZ/7+gEM+8jucV3ymXmy3emhPiSlamTYIYLSNV+nKIV2SpVZ2u4+iv/2aLoMgadGBLy
         U11ubO1qFK34y1T/GglNY/d36ZGGVs183ohh8EJ0NU1vVEzApFMlcCgsNjCnz2E0jg/9
         TAzidbBEVDaz48R8CZeG8tHfpSyo1hCtk6RN7GIObUCuYRTCvwC4GzlTtcbiMPi96qZD
         xbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066245; x=1776671045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFe08Ts/hypKtbjTki6Zi9pd0qwjzgX8Ya0BzZ0CJRU=;
        b=NkUHu1RETOMX6FbbQR/zGEpPKvOdbHsf9vReDdAQEZQ6Knvdcx5VAi1epHZW41qj6L
         qZAntr6hKyoxVhcWd/j60A2HlwgX1cLKiaVg286YRumAdtl+KEDNNcc7DxouonMcQP2D
         GzWCuNAyirHHqtFYQKQFjonGJDzlq4ljUlDeAj+0uXCEVML+Oq5rnmTWDJO2u2c4kFi4
         skMnlWaKWnPwv+pgDbfwfZYfxaS9mbur/bmr+SfBxW3d0ajw5Gq5jmyJ68MbibYgxRuu
         1j3ydr7ejgWuuTF9XCvteacBb/eQeaqxCZzTM4CJraartOL8jSUVViD7EAc9P9YvYvou
         ET7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9+XOcDmEzy7TQUWdUJjpR11EUC7gqpgNLrOgZDKrwnjts68eHbAk2wTkRL4POtUCpno+MqEQnJWLngjG5ryZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdP1r2KpKljaPzjoKq8kCZJJH6e9txD+lOsjLXZjrDl5A0ATp
	aDfzOvtXSgNa+qzI0Bt1Zbxc1akzBGpCp0x5hhPa8iSit5+TwQNfNBIi
X-Gm-Gg: AeBDievWqZWvi1zf2yxBGdXDzks24gfAfZmAISdq48KKnMh4oHdajlaAs44s3tqY0MP
	seplz/SaSvSfpTTZ4IfT/lpWm1zRbozXtCPjf8VAwoxEJrCy/ylvAQUffbzPOVJC0Bq25vLCaJR
	61AED2LPlpxPSzNQPWrj82aVpB77Acrfonwvl2RfW0y70DL8IBZ2mXPZMMUMnxypq2I6eeb4Pfm
	56B3Emjw+MV0ExvpRVyM0+JhWwqOQ5k5BaWEB4GGSU80p166CQxeJqJe3QSe16lgAEXsyCsyYUf
	3Tf7e54xrnxGS+UCUuPFw/78tvXR6CXK8BDOJc9md8MKrLz0BDn652vHwDDr76VfZfA8DTChyQT
	n8YbSzr/z+hHFmUUhwqovNs1W9/pQAcyBkIkE1kVjAd9rrwsZHIUGxa/XYWolWPcz4JYfkpbFl0
	OqrNLzrUyw9M9ponpY
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr6243136c88.14.1776066245003;
        Mon, 13 Apr 2026 00:44:05 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:04 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:10 +0800
Subject: [PATCH v2 04/12] tick/nohz: Transition to dynamic full dynticks
 state management
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-4-06df21caba5d@gmail.com>
References: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
In-Reply-To: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Waiman Long <longman@redhat.com>, Chen Ridong <chenridong@huaweicloud.com>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Context:
Full dynticks (NOHZ_FULL) is typically a static configuration determined
at boot time. DHEI extends this to support runtime activation.

Problem:
Switching to NOHZ_FULL at runtime requires careful synchronization
of context tracking and housekeeping states. Re-invoking setup logic
multiple times could lead to inconsistencies or warnings, and RCU
dependency checks often prevented tick suppression in Zero-Conf setups.

Solution:
- Replace the static tick_nohz_full_enabled() checks with a dynamic
  tick_nohz_full_running state variable.
- Refactor tick_nohz_full_setup to be safe for runtime invocation,
  adding guards against re-initialization and ensuring IRQ work
  interrupt support.
- Implement boot-time pre-activation of context tracking (shadow
  init) for all possible CPUs to avoid instruction flow issues during
  dynamic transitions.
- Hook into housekeeping_notifier_list to update NO_HZ states dynamically.

This provides the core state machine for reliable, on-demand tick
suppression and high-performance isolation.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/time/tick-sched.c | 130 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 25 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index f7907fadd63f2..23d69d7d44538 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -27,6 +27,7 @@
 #include <linux/posix-timers.h>
 #include <linux/context_tracking.h>
 #include <linux/mm.h>
+#include <linux/sched/isolation.h>
 
 #include <asm/irq_regs.h>
 
@@ -624,13 +625,25 @@ void __tick_nohz_task_switch(void)
 /* Get the boot-time nohz CPU list from the kernel parameters. */
 void __init tick_nohz_full_setup(cpumask_var_t cpumask)
 {
-	alloc_bootmem_cpumask_var(&tick_nohz_full_mask);
+	if (!tick_nohz_full_mask) {
+		if (!slab_is_available())
+			alloc_bootmem_cpumask_var(&tick_nohz_full_mask);
+		else
+			zalloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL);
+	}
 	cpumask_copy(tick_nohz_full_mask, cpumask);
 	tick_nohz_full_running = true;
 }
 
 bool tick_nohz_cpu_hotpluggable(unsigned int cpu)
 {
+	/*
+	 * Allow all CPUs to go down during shutdown/reboot to avoid
+	 * interfering with the final power-off sequence.
+	 */
+	if (system_state > SYSTEM_RUNNING)
+		return true;
+
 	/*
 	 * The 'tick_do_timer_cpu' CPU handles housekeeping duty (unbound
 	 * timers, workqueues, timekeeping, ...) on behalf of full dynticks
@@ -646,45 +659,112 @@ static int tick_nohz_cpu_down(unsigned int cpu)
 	return tick_nohz_cpu_hotpluggable(cpu) ? 0 : -EBUSY;
 }
 
+static int tick_nohz_housekeeping_reconfigure(struct notifier_block *nb,
+					     unsigned long action, void *data)
+{
+	struct housekeeping_update *upd = data;
+	int cpu;
+
+	if (action == HK_UPDATE_MASK && upd->type == HK_TYPE_TICK) {
+		cpumask_var_t non_housekeeping_mask;
+
+		if (!alloc_cpumask_var(&non_housekeeping_mask, GFP_KERNEL))
+			return NOTIFY_BAD;
+
+		cpumask_andnot(non_housekeeping_mask, cpu_possible_mask, upd->new_mask);
+
+		if (!tick_nohz_full_mask) {
+			if (!zalloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL)) {
+				free_cpumask_var(non_housekeeping_mask);
+				return NOTIFY_BAD;
+			}
+		}
+
+		/* Kick all CPUs to re-evaluate tick dependency before change */
+		for_each_online_cpu(cpu)
+			tick_nohz_full_kick_cpu(cpu);
+
+		cpumask_copy(tick_nohz_full_mask, non_housekeeping_mask);
+		tick_nohz_full_running = !cpumask_empty(tick_nohz_full_mask);
+
+		/*
+		 * If nohz_full is running, the timer duty must be on a housekeeper.
+		 * If the current timer CPU is not a housekeeper, or no duty is assigned,
+		 * pick the first housekeeper and assign it.
+		 */
+		if (tick_nohz_full_running) {
+			int timer_cpu = READ_ONCE(tick_do_timer_cpu);
+			if (timer_cpu == TICK_DO_TIMER_NONE ||
+			    !cpumask_test_cpu(timer_cpu, upd->new_mask)) {
+				int next_timer = cpumask_first(upd->new_mask);
+				if (next_timer < nr_cpu_ids)
+					WRITE_ONCE(tick_do_timer_cpu, next_timer);
+			}
+		}
+
+		/* Kick all CPUs again to apply new nohz full state */
+		for_each_online_cpu(cpu)
+			tick_nohz_full_kick_cpu(cpu);
+
+		free_cpumask_var(non_housekeeping_mask);
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block tick_nohz_housekeeping_nb = {
+	.notifier_call = tick_nohz_housekeeping_reconfigure,
+};
+
 void __init tick_nohz_init(void)
 {
 	int cpu, ret;
 
-	if (!tick_nohz_full_running)
-		return;
-
-	/*
-	 * Full dynticks uses IRQ work to drive the tick rescheduling on safe
-	 * locking contexts. But then we need IRQ work to raise its own
-	 * interrupts to avoid circular dependency on the tick.
-	 */
-	if (!arch_irq_work_has_interrupt()) {
-		pr_warn("NO_HZ: Can't run full dynticks because arch doesn't support IRQ work self-IPIs\n");
-		cpumask_clear(tick_nohz_full_mask);
-		tick_nohz_full_running = false;
-		return;
+	if (!tick_nohz_full_mask) {
+		if (!slab_is_available())
+			alloc_bootmem_cpumask_var(&tick_nohz_full_mask);
+		else
+			zalloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL);
 	}
 
-	if (IS_ENABLED(CONFIG_PM_SLEEP_SMP) &&
-			!IS_ENABLED(CONFIG_PM_SLEEP_SMP_NONZERO_CPU)) {
-		cpu = smp_processor_id();
+	housekeeping_register_notifier(&tick_nohz_housekeeping_nb);
 
-		if (cpumask_test_cpu(cpu, tick_nohz_full_mask)) {
-			pr_warn("NO_HZ: Clearing %d from nohz_full range "
-				"for timekeeping\n", cpu);
-			cpumask_clear_cpu(cpu, tick_nohz_full_mask);
+	if (tick_nohz_full_running) {
+		/*
+		 * Full dynticks uses IRQ work to drive the tick rescheduling on safe
+		 * locking contexts. But then we need IRQ work to raise its own
+		 * interrupts to avoid circular dependency on the tick.
+		 */
+		if (!arch_irq_work_has_interrupt()) {
+			pr_warn("NO_HZ: Can't run full dynticks because arch doesn't support IRQ work self-IPIs\n");
+			cpumask_clear(tick_nohz_full_mask);
+			tick_nohz_full_running = false;
+			goto out;
 		}
+
+		if (IS_ENABLED(CONFIG_PM_SLEEP_SMP) &&
+				!IS_ENABLED(CONFIG_PM_SLEEP_SMP_NONZERO_CPU)) {
+			cpu = smp_processor_id();
+
+			if (cpumask_test_cpu(cpu, tick_nohz_full_mask)) {
+				pr_warn("NO_HZ: Clearing %d from nohz_full range "
+					"for timekeeping\n", cpu);
+				cpumask_clear_cpu(cpu, tick_nohz_full_mask);
+			}
+		}
+
+		pr_info("NO_HZ: Full dynticks CPUs: %*pbl.\n",
+			cpumask_pr_args(tick_nohz_full_mask));
 	}
 
-	for_each_cpu(cpu, tick_nohz_full_mask)
+out:
+	for_each_possible_cpu(cpu)
 		ct_cpu_track_user(cpu);
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"kernel/nohz:predown", NULL,
 					tick_nohz_cpu_down);
 	WARN_ON(ret < 0);
-	pr_info("NO_HZ: Full dynticks CPUs: %*pbl.\n",
-		cpumask_pr_args(tick_nohz_full_mask));
 }
 #endif /* #ifdef CONFIG_NO_HZ_FULL */
 
@@ -1209,7 +1289,7 @@ static bool can_stop_idle_tick(int cpu, struct tick_sched *ts)
 	if (unlikely(report_idle_softirq()))
 		return false;
 
-	if (tick_nohz_full_enabled()) {
+	if (tick_nohz_full_running) {
 		int tick_cpu = READ_ONCE(tick_do_timer_cpu);
 
 		/*

-- 
2.43.0

