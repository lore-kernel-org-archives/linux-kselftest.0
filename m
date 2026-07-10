Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65304367293
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 03:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654152; cv=none; b=bfr+3eNEHRQuh/NBpcztaQNbQ0d5cI7N5LI2HVLG3hqGyeOkRs8r4EbYwVU6fJWXltpIHAPerofdOirfG+NXzIEdWImT97pM+mdz1snh8EEt6T/PFkbKAj73p/FO/G62a427FHdoA7OQjXh2wuYvn6Q/L2NdSUieGyoXun8ibcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654152; c=relaxed/simple;
	bh=cZmplDdace8ka2XP9vD8p3ABtAIzwqaOpdlJ1+3LPG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7NwpEqSm6jtVbmQ7wrOG6ruFrmhpLKVaHlXYzqRqAnPoz7xQ1db7CW644LKLcs/nrs49SMfcUOfCNInSigEEFFf+l5JwwjLJzDBtQGp12TkekUlliX8ZrP/S4/JW8t+y0d2RC5iN1S9+QC6zHLOJJg+cvmQV6BM2YUvUyZNIm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJWYlpQe; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJWYlpQe"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc84e77e78so3364605ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654150; x=1784258950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v7qKSZXWIDgV3PiMinRsvjWO8t8BKfsRKjtUJUHEIk=;
        b=BJWYlpQePs5LgU89Ap/ztAaLrVUh9Ys/ozCiulN8O8u5mNxv1MOK3uzC1IYFUGz7wn
         eePjfSa4axkfO4knzEvIEYSVURceFD79DmS5bKamCHTBZcKVAfLPQootUhF/t4M3cSif
         I2FfqBksYwJagrKjOC6RdJkAJBu3hJK7HPdaQ3v1q8G1gp8ZN2Sf0nHGE86OkE25nw12
         4rwYkll3DLBPL96HWUv3lRes024hE5y8M4LjZP4Upsjp5wKXN00tRQ35qkRseaBbSQdn
         JEiYudHwzGv9o/BFNWuxuDE6R9bkC938pHlCfYFaH763xN2jocs6lsjMRLX3UE1qE0iJ
         88Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654150; x=1784258950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v7qKSZXWIDgV3PiMinRsvjWO8t8BKfsRKjtUJUHEIk=;
        b=Nwtf1q/RQk6ZufBWJwG5dtYjSxYSlXktYMV9Zb0IP9EDcm55tTu95jZTosgeJxvAti
         50FjYUjy6q3GHhiM3wcYfVBsqtO+hpEZ8tZ4x7xJEVzZzA9U9SaOKiLfUn0RUwV2L45a
         2h6ZvIIph3dUvgd1KNlK3AAFtz0Dvwmnn1DazlToxgvNL7K0gKtYufQSzHBwCfxjUk8+
         YUQrrL5o8bCAXstGiBajhnsXg4E8drCBMK/6HkcF+WvitKr5hWNYQ8B2RILfEZD3Dz8n
         0n7gZGm8FQjEudp5XgkWIysfvPzufUlw/creVfPjFbRkaAGAPFQH71Cob5aeGt6TgYHX
         KxyA==
X-Forwarded-Encrypted: i=1; AHgh+RqqbgFRdpEtAslXjcP9JOb43QsHPHALI2uDWIbie57qCBm14fnpimY6nCe8+x3yLZetOD0M8HAIYT74SZpmWLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyauS/ocZC440NgnsYVP+tLdbT8D4AC7HvnE7s4P0hmOmvD4sgZ
	K7FFFncF3BcaA4wgunXCV1cjaqPDLxXsaS74ilakn5dluPeCH4dSXEDD
X-Gm-Gg: AfdE7cm17/52AuTr9Q24352dG4Zqq2yqTtJJhrMyzXI1Wju/6IySsYIrTlCMU17zXOE
	/KY4JS2+YZUY9x2dualY3CgMLb402+zYrtYAOch+l3HNyuinU1EMlPMEIda11AROUNBZzHbGZZJ
	29xl2Cifa2NPsLFXO11EBeByFjfx4vJmFFslZbJg9L3USpIMV1FVDunAlPXQ9RXRZlU8F8jHwpW
	6JkC6RtpyJYHsAlqnMNg8HiX5usZBATroiZ2ubk2yiFsWH7e0iizuwUC6+3QpJCiZQP2S3YogHd
	NdfGBYLZ3uMEmKjzQJUduAnipKgzVvwjdP8atiIXo8gmtRqLWIjT1uhoNsEKeVmm0pUQVSGYZ6B
	abkCztN1tuMFOFkoMzgbD/QtQ0Sg7t334a94DmZQx6qB/sk9cZYjD0e4sGU2vNAqWtzlFD+VTqu
	bAbmhA0MYgSdU=
X-Received: by 2002:a17:903:3803:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2ccea45f203mr97612355ad.25.1783654149819;
        Thu, 09 Jul 2026 20:29:09 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm53436465ad.15.2026.07.09.20.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 20:29:08 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Fri, 10 Jul 2026 11:28:16 +0800
Subject: [PATCH v4 05/11] rcu/nocb: support lazy init for runtime CPU
 isolation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-wujing-dhm-v4-5-2e912e5d9645@gmail.com>
References: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
In-Reply-To: <20260710-wujing-dhm-v4-0-2e912e5d9645@gmail.com>
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
Cc: Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

When a cpuset isolated partition first requests kernel-noise isolation,
it needs to offload RCU callbacks from the affected CPUs. The existing
rcu_nocb_cpu_offload() requires rcu_nocbs= or nohz_full= at boot so
that rcu_organize_nocb_kthreads() has already set rdp->nocb_gp_rdp for
each CPU. Without a boot parameter, nocb_gp_rdp is NULL and offload
fails immediately.

Introduce lazy nocb initialization so that the first call into the
isolation path triggers the one-time setup automatically:

  rcu_nocb_lazy_init() - allocates rcu_nocb_mask and calls
    rcu_organize_nocb_kthreads() (now without __init) to set
    nocb_gp_rdp for every possible CPU. Uses a dedicated mutex
    for serialization with a fast-path read of nocb_is_setup.

  rcu_nocb_cpu_isolate() - exported entry point called per-CPU
    while the CPU is offline. Calls rcu_nocb_lazy_init() for the
    one-time setup, spawns the GP and CB kthreads via the existing
    rcu_spawn_cpu_nocb_kthread(), then finalizes offload through
    rcu_nocb_cpu_offload(). Adding the CPU to the GP kthread's
    nocb_head_rdp list is handled by nocb_gp_toggle_rdp() in the
    GP kthread, so rcu_organize_nocb_kthreads() can run with an
    empty mask.

Remove __init from rcu_organize_nocb_kthreads() to allow this
runtime call path; the function itself has no __initdata dependencies.

Co-developed-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
Signed-off-by: Jing Wu <realwujing@gmail.com>
---
 include/linux/rcupdate.h |  2 ++
 kernel/rcu/tree.h        |  2 +-
 kernel/rcu/tree_nocb.h   | 43 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index bfa765132de85..5937485d59118 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -149,6 +149,7 @@ static __always_inline void rcu_irq_work_resched(void) { }
 void rcu_init_nohz(void);
 int rcu_nocb_cpu_offload(int cpu);
 int rcu_nocb_cpu_deoffload(int cpu);
+int rcu_nocb_cpu_isolate(int cpu);
 void rcu_nocb_flush_deferred_wakeup(void);
 
 #define RCU_NOCB_LOCKDEP_WARN(c, s) RCU_LOCKDEP_WARN(c, s)
@@ -158,6 +159,7 @@ void rcu_nocb_flush_deferred_wakeup(void);
 static inline void rcu_init_nohz(void) { }
 static inline int rcu_nocb_cpu_offload(int cpu) { return -EINVAL; }
 static inline int rcu_nocb_cpu_deoffload(int cpu) { return 0; }
+static inline int rcu_nocb_cpu_isolate(int cpu) { return -EINVAL; }
 static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 
 #define RCU_NOCB_LOCKDEP_WARN(c, s)
diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
index 7dfc57e9adb18..f3d31918ea322 100644
--- a/kernel/rcu/tree.h
+++ b/kernel/rcu/tree.h
@@ -517,7 +517,7 @@ static void rcu_nocb_unlock_irqrestore(struct rcu_data *rdp,
 				       unsigned long flags);
 static void rcu_lockdep_assert_cblist_protected(struct rcu_data *rdp);
 #ifdef CONFIG_RCU_NOCB_CPU
-static void __init rcu_organize_nocb_kthreads(void);
+static void rcu_organize_nocb_kthreads(void);
 
 /*
  * Disable IRQs before checking offloaded state so that local
diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 1047b30cd46b7..694fd615f1809 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1347,6 +1347,47 @@ void __init rcu_init_nohz(void)
 	rcu_organize_nocb_kthreads();
 }
 
+static DEFINE_MUTEX(rcu_nocb_lazy_mutex);
+
+/*
+ * Lazily initialize nocb infrastructure on the first call. Allocates
+ * rcu_nocb_mask and sets nocb_gp_rdp for every possible CPU so that
+ * rcu_nocb_cpu_isolate() can offload callbacks without rcu_nocbs= at boot.
+ */
+static noinline int rcu_nocb_lazy_init(void)
+{
+	if (rcu_state.nocb_is_setup)
+		return 0;
+
+	mutex_lock(&rcu_nocb_lazy_mutex);
+	if (!rcu_state.nocb_is_setup) {
+		if (!zalloc_cpumask_var(&rcu_nocb_mask, GFP_KERNEL)) {
+			mutex_unlock(&rcu_nocb_lazy_mutex);
+			return -ENOMEM;
+		}
+		rcu_organize_nocb_kthreads();
+		rcu_state.nocb_is_setup = true;
+	}
+	mutex_unlock(&rcu_nocb_lazy_mutex);
+	return 0;
+}
+
+/*
+ * Offload RCU callbacks for a CPU entering a kernel-noise isolated partition.
+ * @cpu must be offline. Lazily initializes nocb infrastructure on first use.
+ */
+int rcu_nocb_cpu_isolate(int cpu)
+{
+	int ret;
+
+	ret = rcu_nocb_lazy_init();
+	if (ret)
+		return ret;
+	rcu_spawn_cpu_nocb_kthread(cpu);
+	return rcu_nocb_cpu_offload(cpu);
+}
+EXPORT_SYMBOL_GPL(rcu_nocb_cpu_isolate);
+
 /* Initialize per-rcu_data variables for no-CBs CPUs. */
 static void __init rcu_boot_init_nocb_percpu_data(struct rcu_data *rdp)
 {
@@ -1439,7 +1480,7 @@ module_param(rcu_nocb_gp_stride, int, 0444);
 /*
  * Initialize GP-CB relationships for all no-CBs CPU.
  */
-static void __init rcu_organize_nocb_kthreads(void)
+static void rcu_organize_nocb_kthreads(void)
 {
 	int cpu;
 	bool firsttime = true;

-- 
2.43.0

