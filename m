Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58823331EAA
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752300; cv=none; b=ALGGU3PzyhQ9uz+YW50z3ylQEvdD3oL0M4oWoI04JOX4rp0l7yBR1UgJtQed7JxZpPIeavZT+/0nGUvoRlUPnCPSA10hUC8QbEmw7BDpO4iPN8LZ9cKDcZKdG0PqSO0t6Cr/iJcp2h4D3CEjl+hEPsRLp4bJzayBUHaLCQVXEZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752300; c=relaxed/simple;
	bh=wNAVoY+2XUhNXD7ws5hDG4Y7LngUTCxkc6ilR6rWf9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQpID57HVXaZVpvdy6OnSt8n7G4qSXCV5ZV4MbOcZ2/R/sQalo7fYkEqaIZbeX5gQmo+aZlW7QvkMJ+5uMTjt7FCjKp5kgLpAUgQ5RZ/0siGm3GpArL3AncQh1v1dH4PtfRYHHq/2DF0wqBQlHetcSPoNbf7Z8qSQOdyKpMlfXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNbVv9Mb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNbVv9Mb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso3228715ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 20:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752298; x=1782357098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH2J//DFdecoNTzDNyFAADQileJGwCOemNHhoqIoONY=;
        b=RNbVv9Mb9PpiUrdAQpE9vJagWCFUYRcE4SfoUFAoTQjFEO/62sIBh5NDM+zQtGy48C
         CLRHkE0ctwXA9zcmEbRa3fLDapHAQnWkU+TqIscCln0iqqviIt7iCg8xYMABo8onmNJG
         Rby8kq6RpslJcF/iy+8aBy4ZbncoWvcjXlWFCzJtxFIoey93oo7m6ieRNRHOo3aOTvB6
         +3caSVFAgM7vYRzjBKNU21wBmhhKRVAxhcjZ+Hwoj1uvl7vgUO7ub82M+P4Q9UC83GSE
         4oJbOS4+8sJeiG6KEX2KfTgcjx4uewd7z9n+1mqdQ9y7R/oCrdT+TgZtesptSoF1Slbt
         qAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752298; x=1782357098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GH2J//DFdecoNTzDNyFAADQileJGwCOemNHhoqIoONY=;
        b=eW2NWMstTKkTBDOzx+X6z2753405rY0Dnesrmi/5ZeyptOToMzxURYNJv4qxEH+zjo
         jl3FIbJRvY3FCQpI8DrVfikxJ/jrolUZZnZaO7wIgHVPKOU0rvMLUiuGOPHg0hhoI7ce
         4n6cYaqh3yVPFOKzACpXy9PoNOmw4m3dYgS3Ar0/fARqu8a0fsNURWz3uJmG4CE7Kaw+
         l09jfFFFjcDolF8UUeMRlU4xkTP+79goPfM3dDYQ77sK1tXpl6EpUpleatJ8/kgN+aNQ
         SzQgAcIeNC7mhbzl+xLVEe9pFyytTipLgeX6DHX1hEifVyzo/6+oiiKfKEMOdqhQAJ98
         sLZA==
X-Forwarded-Encrypted: i=1; AFNElJ+qqqR7Z2jytxUEnN//o6p6stFVBb77CR3rhH2R2AmurU1KseE2f5F6RPwHZfVoMhfKlYv+nsr2v9QJ2AyVrdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyarkWhRZ90nDgd+xWId6KT5u5uM//zDG+LqB2MHkhF5RDpxa3p
	30sB3egl8HDHXuI729lbr+A+QYOJpcJ/w1nX0+/6OtKHEG8X/G9ypIkT
X-Gm-Gg: AfdE7cnoiueII3Hu5qldUivjv++YCzHkeZQPILiKd+d3ZbaD7mY2WMApaZ/2RrJiWcb
	Mqb/KizDgs3OlIqej7MN6O8PTs9NzrNIx3KJcXpHkDD2D5uTh6/1BTRtVSeMgP977M9ctqgqGHe
	1nSmSWl4/mKUmjYdcmKXvJcDjYAMtv45UkRJYkzezSMgz+KwkE+q/EkTUoCdJhNlyyEBK87GscY
	Q9VthGYbAojgieU+UqGm41rOL2nc1pxqHIFiz1yQveKl1dFXVjcCgI4U8DHW0HF4nG2sNxmVxzx
	3VomH7Ibcr+nEsk7m0338WT1Wi5m9Lc6WloCxbdANgXDkaUc+6lXAUEiZ/xbVdSLYZGFq3ytPRS
	JMSBHmWdbg5/rnM1TV+nZISuHznPR/XEhS+zywOUvwRywraGePCNTDtE/No37aAc7M43q9VuNOc
	8H1LPSXBxheQE=
X-Received: by 2002:a17:903:3550:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c6e527622dmr16575975ad.20.1781752297602;
        Wed, 17 Jun 2026 20:11:37 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:37 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:13 +0800
Subject: [PATCH v3 02/13] sched/isolation: Add housekeeping_update_types()
 for kernel-noise masks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-2-28f1a4d83b68@gmail.com>
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

Introduce housekeeping_update_types(), which updates the cpumask for
each specified housekeeping type atomically using an RCU pointer swap.

For each type in @type_mask the trial mask is computed as
(base & ~isol_mask), where the base depends on the type:

  - Most types use the current housekeeping cpumask as base.  For
    types that are only set at boot this is equivalent to the boot
    mask, so trial = (boot_mask & ~isol_mask).

  - HK_TYPE_KERNEL_NOISE always uses cpu_possible_mask as base.  Its
    semantics are "all possible CPUs minus the currently-isolated set";
    using the current HK mask instead would leave it stuck at its last
    non-trivial value after de-isolation, breaking subsequent isolation
    cycles.

HK_TYPE_KERNEL_NOISE also supports runtime first-enable: if it was not
registered at boot (no nohz_full= on the kernel command line),
housekeeping_update_types() registers it in housekeeping.flags on the
first call.  All other types must already be boot-enabled.

For each type the function validates the trial mask against
cpu_online_mask, runs registered pre_validate() callbacks (which may
reject the update), swaps all RCU cpumask pointers in a single pass,
calls synchronize_rcu(), frees the old masks, and then runs apply()
callbacks.

The existing housekeeping_update() continues to update only
HK_TYPE_DOMAIN and remains the entry point for the cpuset partition
path.  housekeeping_update_types() enables the partition path to also
drive the kernel-noise types (HK_TYPE_KERNEL_NOISE,
HK_TYPE_MANAGED_IRQ) through the explicit callback interface added in
the previous patch.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 include/linux/sched/isolation.h |   4 ++
 kernel/sched/isolation.c        | 112 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index f362876b3ebdf..eecbcbe802bd0 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -44,6 +44,8 @@ extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
 extern int housekeeping_update(struct cpumask *isol_mask);
+extern int housekeeping_update_types(unsigned long type_mask,
+				     struct cpumask *isol_mask);
 extern void __init housekeeping_init(void);
 
 /**
@@ -99,6 +101,8 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
 }
 
 static inline int housekeeping_update(struct cpumask *isol_mask) { return 0; }
+static inline int housekeeping_update_types(unsigned long type_mask,
+					    struct cpumask *isol_mask) { return 0; }
 static inline void housekeeping_init(void) { }
 static inline int housekeeping_register_cbs(enum hk_type type,
 					    struct housekeeping_cbs *cbs) { return 0; }
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index aae4dff7fbfc8..4eca18cc5e8ce 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -249,6 +249,118 @@ int housekeeping_update(struct cpumask *isol_mask)
 	return 0;
 }
 
+/**
+ * housekeeping_update_types - Update housekeeping masks for specified types
+ * @type_mask: Bitmask of housekeeping types to update
+ * @isol_mask: CPUs being added to the isolation set
+ *
+ * For each type in @type_mask that was enabled at boot, compute the
+ * trial mask as (boot mask & ~@isol_mask), validate it against
+ * @cpu_online_mask, invoke pre_validate() callbacks, swap the RCU
+ * mask pointer, and run apply() callbacks after synchronize_rcu().
+ *
+ * HK_TYPE_KERNEL_NOISE also supports runtime first-enable: when an
+ * isolated cpuset partition is created without nohz_full= at boot,
+ * cpu_possible_mask is used as the initial base and the type flag is
+ * set in housekeeping.flags on the first call.
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure, -EINVAL if
+ * a trial mask has no online CPUs.
+ */
+int housekeeping_update_types(unsigned long type_mask,
+			      struct cpumask *isol_mask)
+{
+	struct cpumask *trials[HK_TYPE_MAX] = {};
+	struct cpumask *old_masks[HK_TYPE_MAX] = {};
+	enum hk_type type;
+	int ret = 0;
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		const struct cpumask *base;
+
+		if (type == HK_TYPE_DOMAIN_BOOT)
+			continue;
+		if (!housekeeping_enabled(type)) {
+			/*
+			 * HK_TYPE_KERNEL_NOISE supports runtime first-enable
+			 * for DHM isolated partitions created without nohz_full=
+			 * at boot.  All other types must be boot-enabled.
+			 */
+			if (type != HK_TYPE_KERNEL_NOISE)
+				continue;
+		}
+
+		/*
+		 * HK_TYPE_KERNEL_NOISE always uses cpu_possible_mask as its
+		 * base.  Its semantics are exactly "cpu_possible minus the
+		 * currently-isolated set", so the base never shrinks across
+		 * successive isolation/de-isolation cycles.  If we used the
+		 * current HK mask instead, de-isolating all partitions would
+		 * leave the mask at its last non-trivial value rather than
+		 * reverting to cpu_possible, breaking subsequent isolations.
+		 */
+		if (type == HK_TYPE_KERNEL_NOISE)
+			base = cpu_possible_mask;
+		else
+			base = housekeeping_cpumask(type);
+		trials[type] = kmalloc(cpumask_size(), GFP_KERNEL);
+		if (!trials[type]) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+		cpumask_andnot(trials[type], base, isol_mask);
+		if (!cpumask_intersects(trials[type], cpu_online_mask)) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+	}
+
+	if (!housekeeping.flags) {
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		if (!trials[type])
+			continue;
+		ret = housekeeping_pre_validate_cbs(type,
+						    housekeeping_cpumask(type),
+						    trials[type]);
+		if (ret < 0)
+			goto err_free;
+	}
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		if (!trials[type])
+			continue;
+		old_masks[type] = housekeeping_cpumask_dereference(type);
+		/* First-time runtime enable: register the type now. */
+		if (!housekeeping_enabled(type))
+			WRITE_ONCE(housekeeping.flags,
+				   housekeeping.flags | BIT(type));
+		rcu_assign_pointer(housekeeping.cpumasks[type], trials[type]);
+		trials[type] = NULL;
+	}
+
+	synchronize_rcu();
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		if (housekeeping_cbs_table[type].nr == 0)
+			continue;
+		housekeeping_apply_cbs(type);
+	}
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX)
+		kfree(old_masks[type]);
+
+	return 0;
+
+err_free:
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX)
+		kfree(trials[type]);
+	return ret;
+}
+
 void __init housekeeping_init(void)
 {
 	enum hk_type type;

-- 
2.43.0

