Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C9832E757
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752306; cv=none; b=JLtIIzoi+gBiFnGGhoutebMP2mA2wngnnFcVgPyzQguRZNZ1f1Fuc9HYa02NrupRR55UXMUPS1Yn/P4gWZCD1K7w2UROhSxnT2fcBc4Rkrgjj+BnO6kim+juR7A7j+BVCmZWCdecDEsxTSXCZ6IAlTGFfJ6fD5qrSxbVIQy2LqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752306; c=relaxed/simple;
	bh=YCJVKs6GRsboN/yU+D9T5MpjnesbxxZmC8h0qZxZbQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWA2XiSwUrIsY9WOsG4P8LruQ1rFGNzPuGWDyPJSzX6tpcVejuupH+fa9aMe4CdcxtsJB4Cp1AQanYkA+Ye0D0/2TVDUpDv5rirOAlIJRTSd/sF8War+/a5UzpEV4z+yEGKZcKCa412jxg+z2QR2Aq99/ZMYee378f3xe9oDoww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snYOpuep; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snYOpuep"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso3229355ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 20:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752304; x=1782357104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8004pEbSIDGa1Ap5Bs3Wfq58HXT/Y9JfCOcV2ZZV6yI=;
        b=snYOpuep97JPsToZB0W4g+q370ip3Aj3uGEwrKAOGhSl8Iz3CJNqwGKO9CYLK8DcYS
         jZAPlE+khqKLi7t4hITH6mq/qljMvAyJL+g+paXOa/FBOpOgmjayosvtW+/npENk7oEz
         pWaTABQNWUSzM+XclOHGElKZOxGPjRNV9XrtzOp81HB9fMEahH3fqdtMdwb+V5+b0Cvw
         Ywy30/UFVZ/vhyoYPVV0T6HIYZI627suVm4Lp2FLtVRFG7nSWTlTKiTBoSckxB8lFuNh
         FQJsmltWJDjWYd3wyuGt+p4XM2wXxXZLASQsvaiyJ2JABufc15DqDY78F/3EgjHH7Lja
         SWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752304; x=1782357104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8004pEbSIDGa1Ap5Bs3Wfq58HXT/Y9JfCOcV2ZZV6yI=;
        b=m+LyPUfJBOO9WgVC//e0jeUnZYV0xoFjSxuwOQIYacAiW11UX+nDXu6gOfUs2J8Tb3
         F1eSRvz1J6pi2SUousObvexMlGRT1TXIc7OaiX+4N/ipP+oGL1zwV1Pv6AahdUww/51m
         695MD+WfGrwpZMXCSP/Bl80RFNR5yWh2kiqV0Yr8BUGY/vTaczeuwe3qplLAV5TYGRzL
         Zs6k/LMZTdDfw5LGpkK3cqLzHkegxbS2ISnr4MFj+TTpFIyhZSc6u8LzQH0G/LgIMLh7
         5oTf7R95e0hXh639NBq1t1f4GCvDMcIPbOsJuTM1TDdv7jyeQVvNjwjgvxE4ZNEJnDXl
         92DQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cslsAkJ6TjBExlU0LIwPTh08IyiQMlZQvT4WkPEVMnR9g1gHuycH+RhEIKPFRaT5h59ucTikfFX7vedDqfcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP36rlNGAqr2OnVfK7UvUStRhXqS3nB0fY8XDM+GkcT0x5Zyi+
	+IqFTrSyuzeD1oW9ppCowyO3jwPqWsshF1QM4O3RckDhTPES0gvYCf5G
X-Gm-Gg: AfdE7cnVTVEkFynnAo15k1xUNiwgpKOFdxUCzskQXsrWEH8BJBJrWnFaOOEm1CYkTYz
	UkX79jIZZYm5jVIEtm9cuNGcoFqCWft/6FG6tDWGoD8q12fcshWRS8c0yvkR0rU+817kBw3ySDJ
	i4tm3J4Wju5v71W4VwUUS9zim5pWsqx6siNmvLuAFFoxpnCeYlqgxEZ08qYOIDgrabR1qDtRJSC
	+aYA6cWzS1Xdq87dhnRsUu6/FUa28EE30GL9yEx8FfwgoX2Va6uO+6CXPQ3AKZewqvafcXrDkFX
	NDHYrC/CpuBKl5hz2zvb9TCpMoWPDt4UzfJCvbNADwn0GH6LJxmpD/44Qw7k5qifO9FInTooEkj
	huqoMtbk6v9fDp8RsgGlFlF0RYf2JJ47AFEXAvDroiFiTEKZ8vp1mZM8U3/w+Ol+slf9HvJkAtt
	ndE6Tr4KNv/fY=
X-Received: by 2002:a17:902:e889:b0:2c1:150d:6db5 with SMTP id d9443c01a7336-2c6e4724551mr17521875ad.6.1781752304159;
        Wed, 17 Jun 2026 20:11:44 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:43 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:14 +0800
Subject: [PATCH v3 03/13] sched/isolation: RCU-protect all housekeeping
 cpumask readers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-3-28f1a4d83b68@gmail.com>
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

Extend housekeeping_dereference_check() to validate all runtime-mutable
types (HK_TYPE_DOMAIN, HK_TYPE_KERNEL_NOISE, HK_TYPE_MANAGED_IRQ), not
only HK_TYPE_DOMAIN.  Boot-only types (HK_TYPE_DOMAIN_BOOT) remain
unchecked.

Add housekeeping_cpumask_rcu() for callers that already hold an RCU
read lock.  This variant uses rcu_dereference() without the lockdep
annotation, avoiding false-positive lockdep warnings in RCU read-side
critical sections.

Use READ_ONCE() consistently when testing housekeeping.flags in paths
that may race with housekeeping_update_types().

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 include/linux/sched/isolation.h |  6 +++++
 kernel/sched/isolation.c        | 57 +++++++++++++++++++++++++++++++----------
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index eecbcbe802bd0..ed6e1c6980131 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -40,6 +40,7 @@ enum hk_type {
 DECLARE_STATIC_KEY_FALSE(housekeeping_overridden);
 extern int housekeeping_any_cpu(enum hk_type type);
 extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
+extern const struct cpumask *housekeeping_cpumask_rcu(enum hk_type type);
 extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
@@ -87,6 +88,11 @@ static inline const struct cpumask *housekeeping_cpumask(enum hk_type type)
 	return cpu_possible_mask;
 }
 
+static inline const struct cpumask *housekeeping_cpumask_rcu(enum hk_type type)
+{
+	return cpu_possible_mask;
+}
+
 static inline bool housekeeping_enabled(enum hk_type type)
 {
 	return false;
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 4eca18cc5e8ce..3d5d3f12853c7 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -121,25 +121,40 @@ bool housekeeping_enabled(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_enabled);
 
+/*
+ * Types that can change at runtime via cpuset isolated partitions.
+ * Boot-only types (DOMAIN_BOOT) are always safe to read without lockdep.
+ */
+static bool housekeeping_type_can_change(enum hk_type type)
+{
+	switch (type) {
+	case HK_TYPE_DOMAIN:
+	case HK_TYPE_KERNEL_NOISE:
+	case HK_TYPE_MANAGED_IRQ:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool housekeeping_dereference_check(enum hk_type type)
 {
-	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
-		/* Cpuset isn't even writable yet? */
-		if (system_state <= SYSTEM_SCHEDULING)
-			return true;
+	if (!IS_ENABLED(CONFIG_LOCKDEP) || !housekeeping_type_can_change(type))
+		return true;
 
-		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
-		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
-			return true;
+	/* Cpuset isn't even writable yet? */
+	if (system_state <= SYSTEM_SCHEDULING)
+		return true;
 
-		/* Cpuset lock held, partitions not writable */
-		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
-			return true;
+	/* CPU hotplug write locked, so cpuset partition can't be overwritten */
+	if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
+		return true;
 
-		return false;
-	}
+	/* Cpuset lock held, partitions not writable */
+	if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
+		return true;
 
-	return true;
+	return false;
 }
 
 static inline struct cpumask *housekeeping_cpumask_dereference(enum hk_type type)
@@ -162,12 +177,26 @@ const struct cpumask *housekeeping_cpumask(enum hk_type type)
 }
 EXPORT_SYMBOL_GPL(housekeeping_cpumask);
 
+const struct cpumask *housekeeping_cpumask_rcu(enum hk_type type)
+{
+	const struct cpumask *mask = NULL;
+
+	if (static_branch_unlikely(&housekeeping_overridden)) {
+		if (READ_ONCE(housekeeping.flags) & BIT(type))
+			mask = rcu_dereference(housekeeping.cpumasks[type]);
+	}
+	if (!mask)
+		mask = cpu_possible_mask;
+	return mask;
+}
+EXPORT_SYMBOL_GPL(housekeeping_cpumask_rcu);
+
 int housekeeping_any_cpu(enum hk_type type)
 {
 	int cpu;
 
 	if (static_branch_unlikely(&housekeeping_overridden)) {
-		if (housekeeping.flags & BIT(type)) {
+		if (READ_ONCE(housekeeping.flags) & BIT(type)) {
 			cpu = sched_numa_find_closest(housekeeping_cpumask(type), smp_processor_id());
 			if (cpu < nr_cpu_ids)
 				return cpu;

-- 
2.43.0

