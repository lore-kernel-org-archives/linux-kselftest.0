Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AC492507;
	Wed, 22 Jul 2026 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711498; cv=none; b=TUMN9qIEZKR8wT4FJ8z92Ryyb7T+0wyKbHXOj41Sx7cL5Q9+xH9m8FiTwSg91J9MS1ez3pXz56kN3SYNLpxiDSODTAY42YHELrQMA2qIyf9PO5KgnEyojHV60K026nAXxHvx/wzZPpv3n8HuGbAdbDuqR4BXTK54pQjqpO8EqyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711498; c=relaxed/simple;
	bh=FleOJXrlCtujhY/pztO3ScnodOopKfJNGLR3/6VreNs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=V+FrEkg65KR74qTE/1d3PBQZl16VBr+fBetwHS6Hli+P3pMDD1buffG/XIqL1dOq8+bFUQr/GcdZZYBHdo8v8LEH2keyCuxm//57x+vp5gI/qkevtmpnKjoBQQv6VbXh5icrp/hEkBRETAEVaBWeuUB1USc8C6oMzrXyOkDJ+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=pass smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gqD/UTr7; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gqD/UTr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784711479; bh=pBceSZ87OtYFt6jo6r3CVmVMXRv/Zcf/pKvpkXkFoso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gqD/UTr7ZOqPuyNVwJeuNqc/Mu1cnzSx6D6qz9QMdErKQJHwpuKcNJP9AzMjFvibL
	 qgnCgY9d8tKP6V2Y0q5sAP12FAviyZ37D6fdLKfAIo4n2hM5OUGKaVinJ9v1J61LSu
	 6PFZf3I67G1UAayQwhOvqILc4Zx6VI4b/GYXz05A=
Received: from localhost.localdomain ([240e:37c:2242:cf00:5054:a3ff:fe89:345b])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 2878B841; Wed, 22 Jul 2026 17:10:07 +0800
X-QQ-mid: xmsmtpt1784711407tplekwvb1
Message-ID: <tencent_4F460FBE0B41016D2247455CEE988A90D707@qq.com>
X-QQ-XMAILINFO: Obw6anrw5fL41fkMqrg7zMZByN+QVzXMQcfldQjGYtr+rwTyu5o92iwqvHIFh6
	 riTlsN5e9Vs1QQXXEIQXhqcSOx+Np04ZJI1fdsYavcyVDExztZgTjDM91sL/WtmAJF4GdYfFfMWn
	 e38IoW2ExOak+HR5GndXJXHNi3AEBn1q4xGBDZUOEtA8br5caaXJfjTCwVrJTK0tZ6BrZl/FQtO1
	 pCVekQkezDQDhdizIM0oNoc9+hAPcSsNFZ9toNA9UrjDbUQ9Z6gnP4b06LfKFCqzPqYbcNPo+8Zp
	 sk0kZghQnQIq7rQcvCpxvWtPbfHpWurtJ+ugqdiFKstCUzDibmtB201LkcgsJlXzuqhp5UNSgxmw
	 HietZ/AgzH0n4vfqettqkZIhzKXNOy2Ee/obAfbxOL8OfjpJcmsGuUkPRLUlTata+icbtQ91EoRk
	 cbDBW7OG70sHMmHv7zzVB6IqOyzECOs4xzVyD3MfSvK08SUEcXFg47EKtd86ja+nPqV6C+iyOdgt
	 mYM34CFQMMYFBG5xngkTrPwx6/mrCKn78TMHvxTeKZjBjlRaYzW9WUWe07E0hXfNvTK/wM45Imyg
	 z1D0DIccX6DAtyKtVGo9tmNHjAsRzBzxZOz5YrwzMa3asdxEdPEfYf6G+I0HsPm05hitW2XiW8oO
	 aP4XnLBFofw026Nxb0r8oiN2gUT1L9quMpqkmQWmXCCaf7kpP+13lqq/ZOhMIipAVzaaoFVfoczz
	 tZwTBxzmgWPgATTRMnA3LsYlmjh5CUKpwWZdn2S93vHKkbZyGTrxu4lFXAfuk4AwrwUs2JDLXEU4
	 nPw4hQuFH4SBVWXqSOlEbr5PR5k0jgb2mhCprGzV67Y4CbbAjVfCQenP9vGoCVLNWYJRcjO5KAzz
	 jgkQiseviVJWM842vEHroZxnXlDHo2rmlBm6txXLwDR4/Svpg+wdQmXqXPn5YxWCfDk/ybZIRL1h
	 zGXZhM/emVzd04d6Boigg/7HxEd2Koqtg9vM3Bx7TsG/4BzASq7SsH5WG4gZRTaeu44U541qxDRe
	 j+EZ5qpH7UGJOaCqV/MoMb/pS9zMFPNqqKgITBFVpEigerHDzKivaGgT6Kw83H5/LyQJ0v4GkK9M
	 yS5w4dumGPqQi2SA4VTSm9AksR4/1tzkE4q7gnXpBSAhJUj4lweWx2F+N8bA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Yangyu Chen <cyy@cyyself.name>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yangyu Chen <yangyu.chen@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 2/4] sched/cache: Add PR_SCHED_CACHE prctl for per-mm control
Date: Wed, 22 Jul 2026 17:10:03 +0800
X-OQ-MSGID: <20260722091003.1593022-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
References: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache aware scheduling is currently controlled only through global
debugfs knobs, but the right aggressiveness is workload and platform
specific. A multi-threaded Verilator run is one example: its RSS is
large while only a small part of it is hot, so an RSS-based footprint
estimate should not decide whether it is aggregated; and packing its
threads onto the SMT siblings of one LLC beats spreading them across
LLCs on some platforms (e.g. AMD EPYC Turin) but not on others (e.g.
EPYC Milan). Such choices cannot be made globally for the whole
machine. Add a prctl interface to override the knobs per process
(per mm_struct):

  prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET, attr, value, 0);
  prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET, attr, &value, 0);

A single prctl command implements both directions, like
PR_RSEQ_SLICE_EXTENSION. The attributes are a per-process enable
(effective only while the feature is globally active), the two
aggregation tolerances, the overaggr percentage (applied where a
task's own migration is admitted; group level statistics span many
processes and keep using the global value), and an inherit mask
selecting which attributes an mm created by execve() keeps. fork()
always inherits everything, and the mask itself lives on the
task_struct so it survives both, which lets a numactl-like launcher
configure a workload and exec it.

The overrides live in mm->sc_stat with -1 meaning "follow the global
default"; GET stores the raw value through an int pointer so this
sentinel round-trips without being mistaken for an errno.
mm_init_sched() gains the creating task to tell fork (p != current)
from exec (p == current) apart. A disabled mm has its preferred LLC
invalidated at the existing invalidation points, so all group-level
statistics self-neutralize.

Also sync the tools/perf/trace/beauty copy of prctl.h.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 include/linux/mm_types.h                      |  10 +-
 include/linux/sched.h                         |  16 ++
 include/uapi/linux/prctl.h                    |  38 +++++
 kernel/fork.c                                 |   2 +-
 kernel/sched/fair.c                           | 149 +++++++++++++++---
 kernel/sched/syscalls.c                       | 120 ++++++++++++++
 kernel/sys.c                                  |   5 +
 .../trace/beauty/include/uapi/linux/prctl.h   |  37 +++++
 8 files changed, 352 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index b18c2b2e7d2c..eb8e77d6e476 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1609,10 +1609,11 @@ static inline unsigned int mm_cid_size(void)
 #endif /* CONFIG_SCHED_MM_CID */
 
 #ifdef CONFIG_SCHED_CACHE
-void mm_init_sched(struct mm_struct *mm,
+void mm_init_sched(struct mm_struct *mm, struct task_struct *p,
 		   struct sched_cache_time __percpu *pcpu_sched);
 
-static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
+static inline int mm_alloc_sched_noprof(struct mm_struct *mm,
+					struct task_struct *p)
 {
 	struct sched_cache_time __percpu *pcpu_sched =
 		alloc_percpu_noprof(struct sched_cache_time);
@@ -1620,7 +1621,7 @@ static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
 	if (!pcpu_sched)
 		return -ENOMEM;
 
-	mm_init_sched(mm, pcpu_sched);
+	mm_init_sched(mm, p, pcpu_sched);
 	return 0;
 }
 
@@ -1633,7 +1634,8 @@ static inline void mm_destroy_sched(struct mm_struct *mm)
 }
 #else /* !CONFIG_SCHED_CACHE */
 
-static inline int mm_alloc_sched(struct mm_struct *mm) { return 0; }
+static inline int mm_alloc_sched(struct mm_struct *mm,
+				 struct task_struct *p) { return 0; }
 static inline void mm_destroy_sched(struct mm_struct *mm) { }
 
 #endif /* CONFIG_SCHED_CACHE */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 373bcc0598d1..5a3fd080676a 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1424,6 +1424,8 @@ struct task_struct {
 	int				preferred_llc;
 	/* 1: task was enqueued to its preferred LLC, 0 otherwise */
 	int				pref_llc_queued;
+	/* PR_SCHED_CACHE_INHERIT flags kept across execve() */
+	unsigned int			sched_cache_inherit;
 #endif
 
 	struct rseq_data		rseq;
@@ -2338,6 +2340,11 @@ static inline void sched_core_fork(struct task_struct *p) { }
 static inline int sched_core_idle_cpu(int cpu) { return idle_cpu(cpu); }
 #endif
 
+#ifdef CONFIG_SCHED_CACHE
+extern int sched_cache_prctl(unsigned long opt, unsigned long attr,
+			     unsigned long val, unsigned long arg5);
+#endif
+
 extern void sched_set_stop_task(int cpu, struct task_struct *stop);
 
 #ifdef CONFIG_MEM_ALLOC_PROFILING
@@ -2398,6 +2405,15 @@ struct sched_cache_stat {
 	unsigned long next_scan;
 	unsigned long footprint;
 	int cpu;
+	/*
+	 * Per-process overrides of the cache aware scheduling
+	 * knobs, set via prctl(PR_SCHED_CACHE). -1 makes an
+	 * attribute follow the system-wide default.
+	 */
+	int user_enabled;
+	int aggr_tolerance_nr;
+	int aggr_tolerance_size;
+	int overaggr_pct;
 } ____cacheline_aligned_in_smp;
 
 #else
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index b6ec6f693719..dbc1c511b284 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -416,4 +416,42 @@ struct prctl_mm_map {
 # define PR_CFI_DISABLE		_BITUL(1)
 # define PR_CFI_LOCK		_BITUL(2)
 
+/*
+ * Get or set the per-process (per address space) cache aware
+ * scheduling attributes.
+ *
+ * PR_SCHED_CACHE_GET stores the attribute selected by arg3 into the
+ * int pointed to by arg4. PR_SCHED_CACHE_SET sets the attribute
+ * selected by arg3 to the value in arg4.
+ */
+#define PR_SCHED_CACHE				82
+# define PR_SCHED_CACHE_GET			1
+# define PR_SCHED_CACHE_SET			2
+/* Attributes for PR_SCHED_CACHE_GET/PR_SCHED_CACHE_SET */
+# define PR_SCHED_CACHE_ENABLE			1
+# define PR_SCHED_CACHE_AGGR_TOLERANCE_NR	2
+# define PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE	3
+# define PR_SCHED_CACHE_OVERAGGR_PCT		4
+# define PR_SCHED_CACHE_INHERIT			5
+/*
+ * Attribute value that resets an attribute to the system default;
+ * an unset value attribute also reads back as this via
+ * PR_SCHED_CACHE_GET.
+ */
+# define PR_SCHED_CACHE_DEFAULT			(-1)
+/*
+ * Flags for PR_SCHED_CACHE_INHERIT: which attributes the new address
+ * space keeps across execve(). New address spaces created by fork()
+ * always inherit all attributes.
+ */
+# define PR_SCHED_CACHE_INHERIT_ENABLE			(1UL << 0)
+# define PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR	(1UL << 1)
+# define PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE	(1UL << 2)
+# define PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT		(1UL << 3)
+# define PR_SCHED_CACHE_INHERIT_MASK			\
+	(PR_SCHED_CACHE_INHERIT_ENABLE |		\
+	 PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR |	\
+	 PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE |	\
+	 PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT)
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/fork.c b/kernel/fork.c
index f0e2e131a9a5..3c7c979e1d3d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1135,7 +1135,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p)
 	if (mm_alloc_cid(mm, p))
 		goto fail_cid;
 
-	if (mm_alloc_sched(mm))
+	if (mm_alloc_sched(mm, p))
 		goto fail_sched;
 
 	if (percpu_counter_init_many(mm->rss_stat, 0, GFP_KERNEL_ACCOUNT,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c31acbfa3247..d085a8438d3d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -44,6 +44,7 @@
 #include <linux/memory-tiers.h>
 #include <linux/mempolicy.h>
 #include <linux/mutex_api.h>
+#include <linux/prctl.h>
 #include <linux/profile.h>
 #include <linux/psi.h>
 #include <linux/ratelimit.h>
@@ -1430,6 +1431,61 @@ static inline int get_sched_cache_scale(unsigned int tol, int mul)
 	return (1 + (tol - 1) * mul);
 }
 
+/*
+ * Effective cache aware scheduling state of @mm. The per-process
+ * prctl(PR_SCHED_CACHE_ENABLE) attribute overrides the global
+ * default. Only meaningful when sched_cache_enabled().
+ */
+static bool sched_cache_mm_enabled(struct mm_struct *mm)
+{
+	int enabled;
+
+	/*
+	 * Statically allocated mms (init_mm, efi_mm) never go through
+	 * mm_init_sched(): their sc_stat is zero-initialized rather
+	 * than set up, recognizable by the NULL pcpu_sched. Treat them
+	 * as disabled instead of interpreting the zeroes (e.g.
+	 * sc_stat.cpu == 0 would read as a valid preferred CPU).
+	 */
+	if (!mm || !mm->sc_stat.pcpu_sched)
+		return false;
+
+	/*
+	 * -1 means no per-process override: follow the global enable,
+	 * which is on in every path that reaches this - they are all
+	 * behind sched_cache_enabled().
+	 */
+	enabled = READ_ONCE(mm->sc_stat.user_enabled);
+
+	return enabled != 0;
+}
+
+/*
+ * The following helpers return the effective value of a cache aware
+ * scheduling knob for @mm: the per-process attribute if one was set
+ * via prctl(PR_SCHED_CACHE), the global tunable otherwise.
+ */
+static inline unsigned int mm_aggr_tolerance_nr(struct mm_struct *mm)
+{
+	int tol = mm ? READ_ONCE(mm->sc_stat.aggr_tolerance_nr) : -1;
+
+	return tol >= 0 ? tol : READ_ONCE(llc_aggr_tolerance_nr);
+}
+
+static inline unsigned int mm_aggr_tolerance_size(struct mm_struct *mm)
+{
+	int tol = mm ? READ_ONCE(mm->sc_stat.aggr_tolerance_size) : -1;
+
+	return tol >= 0 ? tol : READ_ONCE(llc_aggr_tolerance_size);
+}
+
+static inline unsigned int mm_overaggr_pct(struct mm_struct *mm)
+{
+	int pct = mm ? READ_ONCE(mm->sc_stat.overaggr_pct) : -1;
+
+	return pct >= 0 ? pct : READ_ONCE(llc_overaggr_pct);
+}
+
 static bool exceed_llc_capacity(struct mm_struct *mm, int cpu)
 {
 #ifdef CONFIG_NUMA_BALANCING
@@ -1468,7 +1524,7 @@ static bool exceed_llc_capacity(struct mm_struct *mm, int cpu)
 		 * ignore the footprint and do the aggregation
 		 * anyway.
 		 */
-		scale = get_sched_cache_scale(READ_ONCE(llc_aggr_tolerance_size), 256);
+		scale = get_sched_cache_scale(mm_aggr_tolerance_size(mm), 256);
 		if (scale == INT_MAX)
 			return false;
 
@@ -1490,7 +1546,7 @@ static bool invalid_llc_nr(struct mm_struct *mm, struct task_struct *p,
 	 * Scale the number of 'cores' in a LLC by llc_aggr_tolerance_nr
 	 * and compare it to the task's active threads.
 	 */
-	scale = get_sched_cache_scale(READ_ONCE(llc_aggr_tolerance_nr), 1);
+	scale = get_sched_cache_scale(mm_aggr_tolerance_nr(mm), 1);
 	if (scale == INT_MAX)
 		return false;
 
@@ -1571,7 +1627,7 @@ static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
 	}
 }
 
-void mm_init_sched(struct mm_struct *mm,
+void mm_init_sched(struct mm_struct *mm, struct task_struct *p,
 		   struct sched_cache_time __percpu *_pcpu_sched)
 {
 	unsigned long epoch = 0;
@@ -1593,6 +1649,34 @@ void mm_init_sched(struct mm_struct *mm,
 	mm->sc_stat.next_scan = jiffies;
 	mm->sc_stat.nr_running_avg = 0;
 	mm->sc_stat.footprint = 0;
+	mm->sc_stat.user_enabled = -1;
+	mm->sc_stat.aggr_tolerance_nr = -1;
+	mm->sc_stat.aggr_tolerance_size = -1;
+	mm->sc_stat.overaggr_pct = -1;
+
+	/*
+	 * A new mm created by fork() (@p is the new child) inherits all
+	 * of the parent's prctl(PR_SCHED_CACHE) attributes. Across
+	 * execve() (@p is current) only the attributes marked in the
+	 * calling thread's PR_SCHED_CACHE_INHERIT mask survive.
+	 */
+	if (current->mm) {
+		struct sched_cache_stat *src = &current->mm->sc_stat;
+		unsigned int inherit = ~0U;
+
+		if (p == current)
+			inherit = READ_ONCE(current->sched_cache_inherit);
+
+		if (inherit & PR_SCHED_CACHE_INHERIT_ENABLE)
+			mm->sc_stat.user_enabled = READ_ONCE(src->user_enabled);
+		if (inherit & PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR)
+			mm->sc_stat.aggr_tolerance_nr = READ_ONCE(src->aggr_tolerance_nr);
+		if (inherit & PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE)
+			mm->sc_stat.aggr_tolerance_size = READ_ONCE(src->aggr_tolerance_size);
+		if (inherit & PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT)
+			mm->sc_stat.overaggr_pct = READ_ONCE(src->overaggr_pct);
+	}
+
 	/*
 	 * The update to mm->sc_stat should not be reordered
 	 * before initialization to mm's other fields, in case
@@ -1713,10 +1797,12 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	}
 
 	/*
-	 * If this process hasn't hit task_cache_work() for a while invalidate
-	 * its preferred state.
+	 * If this process hasn't hit task_cache_work() for a while, or
+	 * has cache aware scheduling disabled via prctl(PR_SCHED_CACHE),
+	 * invalidate its preferred state.
 	 */
 	if ((long)(epoch - READ_ONCE(mm->sc_stat.epoch)) > llc_epoch_affinity_timeout ||
+	    !sched_cache_mm_enabled(mm) ||
 	    invalid_llc_nr(mm, p, cpu_of(rq)) ||
 	    exceed_llc_capacity(mm, cpu_of(rq))) {
 		if (READ_ONCE(mm->sc_stat.cpu) != -1)
@@ -1747,6 +1833,9 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
 	    !mm->sc_stat.pcpu_sched)
 		return;
 
+	if (!sched_cache_mm_enabled(mm))
+		return;
+
 	epoch = rq->cpu_epoch;
 	/* avoid moving backwards */
 	if (time_after_eq(mm->sc_stat.epoch, epoch))
@@ -1851,7 +1940,8 @@ static void task_cache_work(struct callback_head *work)
 		return;
 
 	curr_cpu = task_cpu(p);
-	if (invalid_llc_nr(mm, p, curr_cpu) ||
+	if (!sched_cache_mm_enabled(mm) ||
+	    invalid_llc_nr(mm, p, curr_cpu) ||
 	    exceed_llc_capacity(mm, curr_cpu)) {
 		if (READ_ONCE(mm->sc_stat.cpu) != -1)
 			WRITE_ONCE(mm->sc_stat.cpu, -1);
@@ -1918,7 +2008,14 @@ static void task_cache_work(struct callback_head *work)
 		}
 	}
 
-	if (m_a_occ > (2 * curr_m_a_occ)) {
+	/*
+	 * Re-check the per-mm enable after the scan: a concurrent
+	 * prctl() may have disabled cache aware scheduling for this
+	 * mm and reset sc_stat.cpu while we were scanning - do not
+	 * undo that reset. The check is best effort; a lost race is
+	 * corrected at the next tick.
+	 */
+	if (sched_cache_mm_enabled(mm) && m_a_occ > (2 * curr_m_a_occ)) {
 		/*
 		 * Avoid switching sc_stat.cpu too fast.
 		 * The reason to choose 2X is because:
@@ -10417,17 +10514,19 @@ static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_
  * done.
  * Derived from fits_capacity().
  *
+ * The per-mm percentage is bounded by the prctl, but the global
  * llc_overaggr_pct is an unbounded debugfs u32 and CONFIG_SCHED_CACHE
  * only depends on SMP, so max * aggr_pct can wrap on 32-bit. A
  * threshold large enough to overflow is effectively unlimited: the
  * LLC always has room, so treat that as "fits" rather than letting
  * the multiplication wrap.
  *
- * (default: ~50%, tunable via debugfs)
+ * (default: ~50%, tunable via debugfs and prctl(PR_SCHED_CACHE))
  */
-static bool fits_llc_capacity(unsigned long util, unsigned long max)
+static bool fits_llc_capacity(unsigned long util, unsigned long max,
+			      struct mm_struct *mm)
 {
-	u32 aggr_pct = READ_ONCE(llc_overaggr_pct);
+	u32 aggr_pct = mm_overaggr_pct(mm);
 	unsigned long thresh;
 	u32 bumped;
 
@@ -10549,7 +10648,8 @@ enum llc_mig {
  */
 static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 				    unsigned long tsk_util,
-				    bool to_pref)
+				    bool to_pref,
+				    struct mm_struct *mm)
 {
 	unsigned long src_util, dst_util, src_cap, dst_cap;
 
@@ -10560,8 +10660,8 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 	src_util = src_util < tsk_util ? 0 : src_util - tsk_util;
 	dst_util = dst_util + tsk_util;
 
-	if (!fits_llc_capacity(dst_util, dst_cap) &&
-	    !fits_llc_capacity(src_util, src_cap))
+	if (!fits_llc_capacity(dst_util, dst_cap, mm) &&
+	    !fits_llc_capacity(src_util, src_cap, mm))
 		return mig_unrestricted;
 
 	if (to_pref) {
@@ -10571,7 +10671,7 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 		 * than the src, in which case migration will
 		 * increase the imbalance too much.
 		 */
-		if (!fits_llc_capacity(dst_util, dst_cap) &&
+		if (!fits_llc_capacity(dst_util, dst_cap, mm) &&
 		    util_greater(dst_util, src_util))
 			return mig_forbid;
 	} else {
@@ -10582,7 +10682,7 @@ static enum llc_mig can_migrate_llc(int src_cpu, int dst_cpu,
 		 * of preferred LLC, leading to migration again
 		 * back to preferred LLC.
 		 */
-		if (fits_llc_capacity(src_util, src_cap) ||
+		if (fits_llc_capacity(src_util, src_cap, mm) ||
 		    !util_greater(src_util, dst_util))
 			return mig_forbid;
 	}
@@ -10608,8 +10708,9 @@ static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
 	if (cpu < 0 || cpus_share_cache(src_cpu, dst_cpu))
 		return mig_unrestricted;
 
-	/* skip cache aware load balance for too many threads */
-	if (invalid_llc_nr(mm, p, dst_cpu) ||
+	/* skip cache aware load balance for disabled mm or too many threads */
+	if (!sched_cache_mm_enabled(mm) ||
+	    invalid_llc_nr(mm, p, dst_cpu) ||
 	    exceed_llc_capacity(mm, dst_cpu)) {
 		if (READ_ONCE(mm->sc_stat.cpu) != -1)
 			WRITE_ONCE(mm->sc_stat.cpu, -1);
@@ -10624,7 +10725,7 @@ static enum llc_mig can_migrate_llc_task(int src_cpu, int dst_cpu,
 		return mig_unrestricted;
 
 	return can_migrate_llc(src_cpu, dst_cpu,
-			       task_util(p), to_pref);
+			       task_util(p), to_pref, mm);
 }
 
 /*
@@ -10663,8 +10764,12 @@ alb_break_llc(struct lb_env *env)
 		if (cur && cur->sched_class == &fair_sched_class)
 			util = task_util(cur);
 
+		/*
+		 * No stable mm context here: rq->curr's mm may be
+		 * dropped at any time, use the global threshold.
+		 */
 		if (can_migrate_llc(env->src_cpu, env->dst_cpu,
-				    util, false) == mig_forbid)
+				    util, false, NULL) == mig_forbid)
 			return true;
 	}
 
@@ -11775,9 +11880,13 @@ static inline bool llc_balance(struct lb_env *env, struct sg_lb_stats *sgs,
 	if (env->sd->nr_balance_failed >= env->sd->cache_nice_tries + 1)
 		return false;
 
+	/*
+	 * Group level statistics aggregate tasks of many processes,
+	 * there is no single owning mm: use the global threshold.
+	 */
 	if (sgs->nr_pref_dst_llc &&
 	    can_migrate_llc(cpumask_first(sched_group_span(group)),
-			    env->dst_cpu, 0, true) == mig_llc)
+			    env->dst_cpu, 0, true, NULL) == mig_llc)
 		return true;
 
 	return false;
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a6..dec114eff269 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -7,6 +7,7 @@
  *  Copyright (C) 1991-2002  Linus Torvalds
  *  Copyright (C) 1998-2024  Ingo Molnar, Red Hat
  */
+#include <linux/prctl.h>
 #include <linux/sched.h>
 #include <linux/cpuset.h>
 #include <linux/sched/debug.h>
@@ -1576,3 +1577,122 @@ SYSCALL_DEFINE2(sched_rr_get_interval_time32, pid_t, pid,
 	return retval;
 }
 #endif
+
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * PR_SCHED_CACHE_DEFAULT is the int -1. Depending on how userspace
+ * passed it (int through prctl()'s varargs, long, or from a 32-bit
+ * task) it arrives either sign-extended (the first comparison, -1
+ * converts to ULONG_MAX) or zero-extended to 0xffffffff (the second);
+ * accept both.
+ */
+static bool sched_cache_val_default(unsigned long val)
+{
+	return val == (unsigned long)PR_SCHED_CACHE_DEFAULT ||
+	       val == (unsigned int)PR_SCHED_CACHE_DEFAULT;
+}
+
+static int sched_cache_set_attr(unsigned long attr, unsigned long val)
+{
+	struct mm_struct *mm = current->mm;
+	bool def = sched_cache_val_default(val);
+	int ival = def ? -1 : (int)val;
+
+	switch (attr) {
+	case PR_SCHED_CACHE_ENABLE:
+		if (!def && val > 1)
+			return -EINVAL;
+		WRITE_ONCE(mm->sc_stat.user_enabled, ival);
+		/*
+		 * Drop the preferred LLC hint on any change: a process
+		 * that became disabled must stop being honored right
+		 * away, and one that became enabled re-establishes the
+		 * hint within an epoch anyway. This is best effort: an
+		 * in-flight task_cache_work() scan re-checks the enable
+		 * before publishing a new preference, and a lost race
+		 * is corrected at the next tick.
+		 */
+		WRITE_ONCE(mm->sc_stat.cpu, -1);
+		break;
+	case PR_SCHED_CACHE_AGGR_TOLERANCE_NR:
+		if (!def && val > 100)
+			return -EINVAL;
+		WRITE_ONCE(mm->sc_stat.aggr_tolerance_nr, ival);
+		break;
+	case PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE:
+		if (!def && val > 100)
+			return -EINVAL;
+		WRITE_ONCE(mm->sc_stat.aggr_tolerance_size, ival);
+		break;
+	case PR_SCHED_CACHE_OVERAGGR_PCT:
+		/*
+		 * Bound the percentage so that scaling an LLC capacity
+		 * by it cannot overflow, even on 32-bit. Anything in the
+		 * hundreds already means "never treat the LLC as busy".
+		 */
+		if (!def && val > 1000)
+			return -EINVAL;
+		WRITE_ONCE(mm->sc_stat.overaggr_pct, ival);
+		break;
+	case PR_SCHED_CACHE_INHERIT:
+		/* the default inherit mask is empty */
+		if (def)
+			val = 0;
+		if (val & ~PR_SCHED_CACHE_INHERIT_MASK)
+			return -EINVAL;
+		WRITE_ONCE(current->sched_cache_inherit, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sched_cache_get_attr(unsigned long attr, unsigned long uptr)
+{
+	struct mm_struct *mm = current->mm;
+	int val;
+
+	switch (attr) {
+	case PR_SCHED_CACHE_ENABLE:
+		val = READ_ONCE(mm->sc_stat.user_enabled);
+		break;
+	case PR_SCHED_CACHE_AGGR_TOLERANCE_NR:
+		val = READ_ONCE(mm->sc_stat.aggr_tolerance_nr);
+		break;
+	case PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE:
+		val = READ_ONCE(mm->sc_stat.aggr_tolerance_size);
+		break;
+	case PR_SCHED_CACHE_OVERAGGR_PCT:
+		val = READ_ONCE(mm->sc_stat.overaggr_pct);
+		break;
+	case PR_SCHED_CACHE_INHERIT:
+		val = READ_ONCE(current->sched_cache_inherit);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return put_user(val, (int __user *)uptr);
+}
+
+int sched_cache_prctl(unsigned long opt, unsigned long attr,
+		      unsigned long val, unsigned long arg5)
+{
+	if (arg5)
+		return -EINVAL;
+
+	if (!current->mm)
+		return -EINVAL;
+
+	switch (opt) {
+	case PR_SCHED_CACHE_GET:
+		return sched_cache_get_attr(attr, val);
+	case PR_SCHED_CACHE_SET:
+		return sched_cache_set_attr(attr, val);
+	default:
+		return -EINVAL;
+	}
+}
+#endif /* CONFIG_SCHED_CACHE */
diff --git a/kernel/sys.c b/kernel/sys.c
index df69bd71de03..e2b105d72c7e 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2807,6 +2807,11 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_SCHED_CORE:
 		error = sched_core_share_pid(arg2, arg3, arg4, arg5);
 		break;
+#endif
+#ifdef CONFIG_SCHED_CACHE
+	case PR_SCHED_CACHE:
+		error = sched_cache_prctl(arg2, arg3, arg4, arg5);
+		break;
 #endif
 	case PR_SET_MDWE:
 		error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
index 560f99bc4782..dbc1c511b284 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
@@ -416,5 +416,42 @@ struct prctl_mm_map {
 # define PR_CFI_DISABLE		_BITUL(1)
 # define PR_CFI_LOCK		_BITUL(2)
 
+/*
+ * Get or set the per-process (per address space) cache aware
+ * scheduling attributes.
+ *
+ * PR_SCHED_CACHE_GET stores the attribute selected by arg3 into the
+ * int pointed to by arg4. PR_SCHED_CACHE_SET sets the attribute
+ * selected by arg3 to the value in arg4.
+ */
+#define PR_SCHED_CACHE				82
+# define PR_SCHED_CACHE_GET			1
+# define PR_SCHED_CACHE_SET			2
+/* Attributes for PR_SCHED_CACHE_GET/PR_SCHED_CACHE_SET */
+# define PR_SCHED_CACHE_ENABLE			1
+# define PR_SCHED_CACHE_AGGR_TOLERANCE_NR	2
+# define PR_SCHED_CACHE_AGGR_TOLERANCE_SIZE	3
+# define PR_SCHED_CACHE_OVERAGGR_PCT		4
+# define PR_SCHED_CACHE_INHERIT			5
+/*
+ * Attribute value that resets an attribute to the system default;
+ * an unset value attribute also reads back as this via
+ * PR_SCHED_CACHE_GET.
+ */
+# define PR_SCHED_CACHE_DEFAULT			(-1)
+/*
+ * Flags for PR_SCHED_CACHE_INHERIT: which attributes the new address
+ * space keeps across execve(). New address spaces created by fork()
+ * always inherit all attributes.
+ */
+# define PR_SCHED_CACHE_INHERIT_ENABLE			(1UL << 0)
+# define PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR	(1UL << 1)
+# define PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE	(1UL << 2)
+# define PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT		(1UL << 3)
+# define PR_SCHED_CACHE_INHERIT_MASK			\
+	(PR_SCHED_CACHE_INHERIT_ENABLE |		\
+	 PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_NR |	\
+	 PR_SCHED_CACHE_INHERIT_AGGR_TOLERANCE_SIZE |	\
+	 PR_SCHED_CACHE_INHERIT_OVERAGGR_PCT)
 
 #endif /* _LINUX_PRCTL_H */
-- 
2.47.3

