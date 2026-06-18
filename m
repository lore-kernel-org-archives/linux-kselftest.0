Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BD732E757
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752331; cv=none; b=AChQ9m7+znTHJeG+EeJT0RfuYZNwu6HrOjzvdcu9B804fdwcwpf265wAkxvbuJE8po2AlXh7V5e5ZrQVTJ6pSdOL/FErjyJLdipKw8mLB8R1llrnblTvfrrfR6R+dhZxuReEfBqcFVZpLIwKpdKn3WJVGPuoSnB75O3826WHtX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752331; c=relaxed/simple;
	bh=B8gyjG7FPCLUh1O4Z9fKhzpiDUNCioFcs5Lz1i1uV6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRCS2CoUzeQrPBxhvdwji751CyZznOLZcuMuYl9JAiF8xWPEQ41/TC0gVMw8RbPVoQN1m3+YDv4wCCBH0LmKlUypMpsXHCg+dtNKJ/4FvVuNYN8W4DSxO422P85w+j/ErBxXzoxo4TmzO6ln3KotiwOsTs4qoTnyCB/7bl3uDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHU98Jew; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHU98Jew"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso231000a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 20:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752330; x=1782357130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NERal9DiopbIQ+nDYvnmg4O3D7AE0rEg1povJlnV+E4=;
        b=fHU98JewrVJ1wDqYVeMzen+xCWrLzTAJhVR/pC1orc9O3m/zXfxOtH6EkGnFuOkwQo
         iSgb82m4fG+KXp6mKsiTKWzqkLP1R3IvuzFqSBno/Qk8XKFare3LXx4v2BSvttuUN57w
         gtBipLBsexh9aY1ssft/b2o+tY57rOIwnJ/SXz5HmUccJvgksYRWkXdAj6pVgZrbj+Xy
         Vb69yLyxMI7sE3Q8BfCbcUCdLktIpAWmnUYvncIaxuLPchznDQM51tcxwYasyWPzDKIo
         6y6lzofw2le8q6jp88rPez38cc2yUEKWJqLVZeqWfwEDGqH0SR9sWfNOpxx99m90ucVk
         F/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752330; x=1782357130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NERal9DiopbIQ+nDYvnmg4O3D7AE0rEg1povJlnV+E4=;
        b=K8s8P1TP87S4nX4d3nHvhXUiadg/sGS9l27tu4DOfwl+yKuqaLQcSIjk3h2FTDzrWw
         l6q6KUMAkzA4mWlhRhWkDye+b6P8sP2OaZci5OD0MJO9B+MLbXTl3dXuw8dQb3eXYrrZ
         CohAG2IjAO+JukTyEYidWJoNLXDBwPeaYDsr96YbczLZ1/yL+WnfDxX0zVmXHwL7KX9m
         bansI2DlcEV4em5qF2uB3Lge2ODQVZ51363BulTmy92BgX7rC3LK/krneUQsNPjlOxsW
         1koAYKsr/gYvl+vzpbeHE/4ijyLC+t8MVj9gXYVT0oFFCWQcY6BIBmWmh8DZhFq7QMK2
         vgIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zBIS2J8HtCbWSQzJ6dvyMYEy5X8h0+ZHwiDTfFo+8QwiyUwIcZpmEjGPDThPRg3+eT5r+Au0kPuIe9uEi+aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJBBmWz/HUdps80EkUwV/xJYkAI2ekUi+q45z9VNwSZ28TIcQ
	IBpo50Sdv/rQ2c5RkUrv+5kNUiuODmCk/oD4iRiQGEWHZ6F8hy0TMsuv
X-Gm-Gg: AfdE7ckhpPW03qhowUHn+LaDocAAa66bKCg0E/D3+R3AMc/G6MlVmis2sQR+XtcyPTZ
	ohFHoAiSViLDUAe1cMxsK4WQ3whRd2a04uDyNJr/EcuyKYwyr6aJ1hGvUSlueK4GTpNSTUfK6md
	7hPlBjEDmc5SWgetiCCAmZzcD8rflKUfNMqSQSPXl12Gw7LLYoEA0BOBPhuEPWirI10wsfKwv4C
	P1y7qqTXQt/eK+J+SpWCo1APwriSxi7aX22tVVdwtTX9kaEnt74xft1BgbvXnpekDU8F8x7Gty1
	Sf4WH1saPRSEgjVIzQ9wQyyz4BpgF97n/uqrWvYnNnXkMZhHWW7LdJjlP4mRZRfb0/7kXaf8JDN
	GWEt8/5M6Hfpai+uyTKtTxYcOKOXG1ngOlaBXkyVuj+Up5q1JUsEkTDNwWQU8g9J19mAQSMA8xW
	YKEOPzlSd+GaE=
X-Received: by 2002:a17:902:ce07:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c6f347e06fmr4597485ad.35.1781752329634;
        Wed, 17 Jun 2026 20:12:09 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:12:09 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:18 +0800
Subject: [PATCH v3 07/13] rcu/nocb: Add explicit housekeeping callback for
 runtime NOCB toggling
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-7-28f1a4d83b68@gmail.com>
References: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
In-Reply-To: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
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
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

Register a housekeeping callback for HK_TYPE_KERNEL_NOISE.  When the
mask changes, schedule asynchronous work to iterate all possible CPUs
and toggle NOCB mode for CPUs whose state disagrees with the new mask.
CPUs in the housekeeping set are de-offloaded; isolated CPUs are
offloaded.

Use CPU hotplug (remove_cpu() / add_cpu()) because
rcu_nocb_cpu_offload() and rcu_nocb_cpu_deoffload() require the target
CPU to be offline.  The hotplug cycle takes the CPU fully offline to
quiesce its RCU state before toggling the NOCB flag, then brings it
back.  Skip CPUs whose state already matches to avoid unnecessary
hotplug churn.  Only bring a CPU back online if it was online before
the state change (was_online guard avoids add_cpu() on a CPU that was
already offline).

This differs from Frederic Weisbecker's suggestion to "assume the CPU
is offline" within the RCU subsystem and toggle NOCB without a full
hotplug cycle.  The full hotplug approach was chosen for v3 because
rcu_nocb_cpu_offload() and rcu_nocb_cpu_deoffload() are the existing
stable interfaces and the "assume offline" path would require adding
new internal RCU APIs.  This is a known limitation that may be
addressed by RCU maintainers in follow-up work.

Snapshot the current HK_TYPE_KERNEL_NOISE cpumask inside the work
function under an RCU read lock rather than caching the pointer at
apply() time.  Caching at apply() time would create a use-after-free
hazard: a subsequent housekeeping_update_types() call frees the old
cpumask after synchronize_rcu() but before the work function runs.

Remove the cpus_read_lock() / cpus_read_unlock() pair that wrapped the
hotplug loop.  remove_cpu() and add_cpu() acquire the cpu_hotplug_lock
write side; holding the read side via cpus_read_lock() before calling
them causes a deadlock.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 kernel/rcu/tree.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 55df6d37145e8..214ce940f501b 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -4929,3 +4929,107 @@ void __init rcu_init(void)
 #include "tree_exp.h"
 #include "tree_nocb.h"
 #include "tree_plugin.h"
+
+#ifdef CONFIG_RCU_NOCB_CPU
+/*
+ * RCU NOCB runtime toggle via housekeeping callback.
+ * Schedule the CPU-hotplug work asynchronously because
+ * remove_cpu() and add_cpu() must not be called while holding
+ * cpuset_top_mutex (the hk callback context).
+ *
+ * Snapshot the current HK_TYPE_KERNEL_NOISE cpumask inside the work
+ * function under an RCU read lock to avoid caching a pointer at
+ * apply() time that could be freed before the work runs.
+ */
+struct rcu_hk_work {
+	struct work_struct work;
+};
+
+static void rcu_hk_workfn(struct work_struct *w)
+{
+	struct rcu_hk_work *hw = container_of(w, struct rcu_hk_work, work);
+	cpumask_var_t hk_mask;
+	int cpu, ret;
+
+	if (!alloc_cpumask_var(&hk_mask, GFP_KERNEL)) {
+		kfree(hw);
+		return;
+	}
+
+	rcu_read_lock();
+	cpumask_copy(hk_mask, housekeeping_cpumask_rcu(HK_TYPE_KERNEL_NOISE));
+	rcu_read_unlock();
+
+	for_each_possible_cpu(cpu) {
+		bool should_offload = !cpumask_test_cpu(cpu, hk_mask);
+		bool is_offloaded;
+		bool was_online;
+
+		if (!cpumask_available(rcu_nocb_mask)) {
+			is_offloaded = false;
+		} else {
+			is_offloaded = cpumask_test_cpu(cpu, rcu_nocb_mask);
+		}
+
+		if (should_offload == is_offloaded)
+			continue;
+
+		was_online = cpu_online(cpu);
+		if (was_online) {
+			ret = remove_cpu(cpu);
+			if (ret)
+				continue;
+		}
+		if (should_offload)
+			rcu_nocb_cpu_offload(cpu);
+		else
+			rcu_nocb_cpu_deoffload(cpu);
+		if (was_online)
+			add_cpu(cpu);
+	}
+
+	free_cpumask_var(hk_mask);
+	kfree(hw);
+}
+
+static void rcu_hk_apply(enum hk_type type)
+{
+	struct rcu_hk_work *hw;
+
+	if (!cpumask_available(rcu_nocb_mask))
+		return;
+
+	hw = kmalloc(sizeof(*hw), GFP_KERNEL);
+	if (!hw)
+		return;
+
+	INIT_WORK(&hw->work, rcu_hk_workfn);
+	schedule_work(&hw->work);
+}
+
+static int rcu_hk_validate(enum hk_type type,
+			   const struct cpumask *cur_mask,
+			   const struct cpumask *new_mask)
+{
+	if (!IS_ENABLED(CONFIG_RCU_NOCB_CPU))
+		return -EOPNOTSUPP;
+	return 0;
+}
+
+static struct housekeeping_cbs rcu_hk_cbs = {
+	.name		= "rcu/nocb",
+	.pre_validate	= rcu_hk_validate,
+	.apply		= rcu_hk_apply,
+};
+
+static int __init rcu_hk_init(void)
+{
+	int ret;
+
+	ret = housekeeping_register_cbs(HK_TYPE_KERNEL_NOISE, &rcu_hk_cbs);
+	if (ret)
+		pr_info("rcu/nocb: runtime NOCB toggle disabled (%d)\n", ret);
+	return 0;
+}
+late_initcall(rcu_hk_init);
+#endif /* CONFIG_RCU_NOCB_CPU */

-- 
2.43.0

