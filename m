Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9713E49ED;
	Wed, 22 Jul 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711403; cv=none; b=YOoh3vbmLTpD2wIE1Wjk/4UwnBO42xK6uZH2Vs1/2jJcved8clPfzKXcku/E27Oaa6gC/J+3nyCzcyMhNfu8ndThaobWKIUYurqdV6ja8bcEe4e5IsIyNGP1InAUOJjOZ21Z3vTF+6kqEzCe/N+wdowALA2/qo8anw+ale4wEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711403; c=relaxed/simple;
	bh=0r0C9D0mfxL2AiUlPsM0pyeLcwtNb3baZZNoy/w5ubw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pFKWqPANnTJHTdvmixL31s30PGHVBJm/VAVI0SYstPBx5L0+qzwKSXcv2dIpxvI2x5AseWHKEc1rDzvImDGZ/O2OEHuyIkNhwp98CMuREcZZd9RChtH3csNLlrCSqVslymZSUXYvDa6QMVwyzUE2fSffeLdX4CKoFCWsk80Mk5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=pass smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=y1q1Q1sk; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="y1q1Q1sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784711389; bh=h6dWYlj5CbfoQlGCMPOx9K1HpD8J9nXPEjfkkiJDMMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=y1q1Q1skeNPCmLWXT8lIz4/mm+aYwJ+0dXV6/mavbOX7AJ2AEpz6eJVnr0h+R2YQz
	 DKgEUq3swAdqT5CXaB1ylO3a8zYGzZYe3BqP5+VupN8+pwFNRsDn639i/LBweQ7XAn
	 UKh2qIOTPJ6laVDkQ0v71mEEiEyexUzDKclnge9Q=
Received: from localhost.localdomain ([240e:37c:2242:cf00:5054:a3ff:fe89:345b])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 26DB9E5A; Wed, 22 Jul 2026 17:09:45 +0800
X-QQ-mid: xmsmtpt1784711386t4eyhdya9
Message-ID: <tencent_BE3412F2990AA2697B3AFEE1D6C5C484AC0A@qq.com>
X-QQ-XMAILINFO: MOnz+xTS1+9inM1CBaz9W4ULK2eHsYaTpl+qMM4rB9HaHyTaXyiYxWcrHx3P4W
	 w8ibug0boTt1+JAsa3q+Ay3V8jFSDqouCOD3odhB2Jf4GdxnK0gTFuSKINRNG0RE+a4yjGb64LaL
	 7TVV8NlWS8UHavVR7fVAyH0BdMkTS0XwHHl/xdRIskyUyXwxxB8/Ngkp2PFKKb8v5yEvk1RWm7fN
	 qf70ySncbILTqO8lsrdvxz8CENi9vJ+vCIKNIwFoe4sDHn4XPU/+RMM9E1+s/7jCsuAAWdJqP9FP
	 Z4u8dp46/1O9mBaIqkT7aP28TMrkgUr76B+oSq8AUtTcV8WNf5codfj+RhueuI/DjO/8MpEWC2KU
	 eCh8JA7a3JhzYW382ZqB9wtmDQMwHuQYR8NKCP0aUdTCbDdSJU5VjdaTNUypSVmknG4ZwsXSuK6X
	 L51Xak618YWK90TQsHjgZxiw31H+5kRNMPh0MP8++MpR2EFMqe/F0A1sXUgSWKOzTuzDA54dBAKl
	 YJFFsoT9oWuSSR/8t7mE6M/GSvgU4tJFEN3pJUCra8XA6rR64Niq4f0my+K7IRBVSH827oWILtI/
	 068sI0ToLBF/zQ7FP8Hksd3slzQcR3/caKsBlWDvHuZxeWaZMHQxA333CYzHfocoXUp059MxG8Nm
	 H465u5/la36AznSQ4wNyET7DWuecV8yGPrtw6KYR5K+1B+bqUZ4bGQXcCkH3v/lG1OjgbbIQxid0
	 6HmZuuj5g+figdz1jR16dJRPN7jBswCrnzO3dNCBjICMbv+KtfbnffhjPMaKEr5torUF8U1og6VO
	 y3rpEBwJVUjwrfWNldWmzpRwA//3ND78IBY6k/YKdAoArCIUUVuEvLEv/Td7fuEN7sIhPqIezDjr
	 JyOJg83HuMG+NYADUfOBJSaGAogogLieqN0ihVOfLitSVRNHVOPOLocgLaD+kM39Ar+MvPYZ+mb4
	 lSYNz+Tt0qWD3XF45U6Ju6zlQioZcuRWxCrr1jW6OncO62d/q7INRdmhN8psvI0eXc+uhKE3gbMW
	 1RzSydaAma6OhR2JP7h40mghxf8F4eljOFyucqaH2sW+XncNcB2Iyn7OeylufuFzTMeHFKodJRUW
	 5skOgs
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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
Subject: [PATCH 1/4] sched/cache: Split llc_aggr_tolerance into nr and size tolerances
Date: Wed, 22 Jul 2026 17:09:44 +0800
X-OQ-MSGID: <20260722090944.1591886-1-cyy@cyyself.name>
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

llc_aggr_tolerance scales two independent gates with a single value:
the number of cores in an LLC compared against the process's active
thread count in invalid_llc_nr(), and the LLC size compared against
the process's memory footprint in exceed_llc_capacity().

The right settings are workload and platform specific. A Verilator
run is one example: its RSS is large while only a small part of it
is hot, so an RSS-based footprint estimate overstates its cache
usage and should not decide whether it is aggregated. And running
its threads on the SMT siblings of a single LLC can beat spreading
them across LLCs on some platforms (e.g. AMD EPYC Turin) but not on
others (e.g. EPYC Milan). Tuning for such a workload means a larger
thread-count tolerance while the footprint tolerance keeps its own
setting - which a single combined knob cannot express.

Split the knob into llc_aggr_tolerance_nr for the thread-count gate
and llc_aggr_tolerance_size for the footprint gate, and let
get_sched_cache_scale() take the tolerance value from the caller.
Both new debugfs files keep the semantics of the old knob (0 disables
aggregation for that gate, values >= 100 mean unlimited).

While making the tunables independently settable, also make the
percentage knobs safe for any value: llc_overaggr_pct and llc_imb_pct
are exposed via debugfs as unbounded u32 values and feed percentage
multiplications:

	util * 100 < max * aggr_pct               (fits_llc_capacity())
	util1 * 100 > util2 * (100 + llc_imb_pct) (util_greater())

CONFIG_SCHED_CACHE only depends on SMP, so this also builds on 32-bit
where unsigned long is 32 bits: a large enough percentage makes
max * aggr_pct (or util2 * (100 + pct)) wrap and produce a garbage
comparison, and the SMT-1 bump aggr_pct * 3 / 2 can wrap the u32
itself. Rather than capping the tunables, detect the overflow at the
point of use with check_mul_overflow()/check_add_overflow() and fall
back to the saturated meaning of the comparison: an overflowing
threshold is effectively unlimited (the LLC always has room), and an
overflowing bias is effectively infinite (the destination utilization
is never considered noticeably greater).

Assisted-by: Claude:claude-fable-5
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 kernel/sched/debug.c |  6 +++--
 kernel/sched/fair.c  | 62 +++++++++++++++++++++++++++++++-------------
 kernel/sched/sched.h |  3 ++-
 3 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 40584b27ea0c..b7be245b9fc2 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -672,8 +672,10 @@ static __init int sched_init_debug(void)
 	llc = debugfs_create_dir("llc_balancing", debugfs_sched);
 	debugfs_create_file("enabled", 0644, llc, NULL,
 			    &sched_cache_enable_fops);
-	debugfs_create_u32("aggr_tolerance", 0644, llc,
-			   &llc_aggr_tolerance);
+	debugfs_create_u32("aggr_tolerance_nr", 0644, llc,
+			   &llc_aggr_tolerance_nr);
+	debugfs_create_u32("aggr_tolerance_size", 0644, llc,
+			   &llc_aggr_tolerance_size);
 	debugfs_create_u32("epoch_period", 0644, llc,
 			   &llc_epoch_period);
 	debugfs_create_u32("epoch_affinity_timeout", 0644, llc,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d78467ec6ee1..c31acbfa3247 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1404,7 +1404,8 @@ static void set_next_buddy(struct sched_entity *se);
  */
 #define EPOCH_PERIOD	(HZ / 100)	/* 10 ms */
 #define EPOCH_LLC_AFFINITY_TIMEOUT	5	/* 50 ms */
-__read_mostly unsigned int llc_aggr_tolerance	= 1;
+__read_mostly unsigned int llc_aggr_tolerance_nr	= 1;
+__read_mostly unsigned int llc_aggr_tolerance_size	= 1;
 __read_mostly unsigned int llc_epoch_period	= EPOCH_PERIOD;
 __read_mostly unsigned int llc_epoch_affinity_timeout = EPOCH_LLC_AFFINITY_TIMEOUT;
 __read_mostly unsigned int llc_imb_pct		= 20;
@@ -1418,10 +1419,8 @@ static int llc_id(int cpu)
 	return per_cpu(sd_llc_id, cpu);
 }
 
-static inline int get_sched_cache_scale(int mul)
+static inline int get_sched_cache_scale(unsigned int tol, int mul)
 {
-	unsigned int tol = READ_ONCE(llc_aggr_tolerance);
-
 	if (!tol)
 		return 0;
 
@@ -1453,23 +1452,23 @@ static bool exceed_llc_capacity(struct mm_struct *mm, int cpu)
 		footprint = READ_ONCE(mm->sc_stat.footprint);
 
 		/*
-		 * Scale the LLC size by 256*llc_aggr_tolerance
+		 * Scale the LLC size by 256*llc_aggr_tolerance_size
 		 * and compare it to the task's footprint.
 		 *
 		 * Suppose the L3 size is 32MB. If the
-		 * llc_aggr_tolerance is 1:
+		 * llc_aggr_tolerance_size is 1:
 		 * When the footprint is larger than 32MB, the
 		 * process is regarded as exceeding the LLC
-		 * capacity. If the llc_aggr_tolerance is 99:
+		 * capacity. If the llc_aggr_tolerance_size is 99:
 		 * When the footprint is larger than 784GB, the
 		 * process is regarded as exceeding the LLC
 		 * capacity:
 		 * 784GB = (1 + (99 - 1) * 256) * 32MB
-		 * If the llc_aggr_tolerance is 100:
+		 * If the llc_aggr_tolerance_size is 100:
 		 * ignore the footprint and do the aggregation
 		 * anyway.
 		 */
-		scale = get_sched_cache_scale(256);
+		scale = get_sched_cache_scale(READ_ONCE(llc_aggr_tolerance_size), 256);
 		if (scale == INT_MAX)
 			return false;
 
@@ -1488,10 +1487,10 @@ static bool invalid_llc_nr(struct mm_struct *mm, struct task_struct *p,
 		return true;
 
 	/*
-	 * Scale the number of 'cores' in a LLC by llc_aggr_tolerance
+	 * Scale the number of 'cores' in a LLC by llc_aggr_tolerance_nr
 	 * and compare it to the task's active threads.
 	 */
-	scale = get_sched_cache_scale(1);
+	scale = get_sched_cache_scale(READ_ONCE(llc_aggr_tolerance_nr), 1);
 	if (scale == INT_MAX)
 		return false;
 
@@ -10418,20 +10417,34 @@ static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_
  * done.
  * Derived from fits_capacity().
  *
+ * llc_overaggr_pct is an unbounded debugfs u32 and CONFIG_SCHED_CACHE
+ * only depends on SMP, so max * aggr_pct can wrap on 32-bit. A
+ * threshold large enough to overflow is effectively unlimited: the
+ * LLC always has room, so treat that as "fits" rather than letting
+ * the multiplication wrap.
+ *
  * (default: ~50%, tunable via debugfs)
  */
 static bool fits_llc_capacity(unsigned long util, unsigned long max)
 {
-	u32 aggr_pct = llc_overaggr_pct;
+	u32 aggr_pct = READ_ONCE(llc_overaggr_pct);
+	unsigned long thresh;
+	u32 bumped;
 
 	/*
 	 * For single core systems, raise the aggregation
 	 * threshold to accommodate more tasks.
 	 */
-	if (cpu_smt_num_threads == 1)
-		aggr_pct = (aggr_pct * 3 / 2);
+	if (cpu_smt_num_threads == 1) {
+		if (check_mul_overflow(aggr_pct, 3U, &bumped))
+			return true;
+		aggr_pct = bumped / 2;
+	}
+
+	if (check_mul_overflow(max, (unsigned long)aggr_pct, &thresh))
+		return true;
 
-	return util * 100 < max * aggr_pct;
+	return util * 100 < thresh;
 }
 
 /*
@@ -10439,10 +10452,23 @@ static bool fits_llc_capacity(unsigned long util, unsigned long max)
  * is 'util1' noticeably greater than 'util2'
  * Derived from capacity_greater().
  * Bias is in perentage.
+ *
+ * Allows dst util to be bigger than src util by up to bias percent.
+ * llc_imb_pct is an unbounded debugfs u32; a bias large enough to
+ * overflow util2 * (100 + llc_imb_pct) is effectively infinite, so
+ * util1 is never noticeably greater - treat that as "not greater"
+ * rather than letting the multiplication wrap.
  */
-/* Allows dst util to be bigger than src util by up to bias percent */
-#define util_greater(util1, util2) \
-	((util1) * 100 > (util2) * (100 + llc_imb_pct))
+static bool util_greater(unsigned long util1, unsigned long util2)
+{
+	unsigned long bias, rhs;
+
+	if (check_add_overflow(100UL, (unsigned long)READ_ONCE(llc_imb_pct), &bias) ||
+	    check_mul_overflow(util2, bias, &rhs))
+		return false;
+
+	return util1 * 100 > rhs;
+}
 
 static __maybe_unused bool get_llc_stats(int cpu, unsigned long *util,
 					 unsigned long *cap)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 56acf502ba26..0ebafdcf2c7f 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4095,7 +4095,8 @@ static inline void mm_cid_switch_to(struct task_struct *prev, struct task_struct
 DECLARE_STATIC_KEY_FALSE(sched_cache_present);
 DECLARE_STATIC_KEY_FALSE(sched_cache_active);
 extern int sysctl_sched_cache_user;
-extern unsigned int llc_aggr_tolerance;
+extern unsigned int llc_aggr_tolerance_nr;
+extern unsigned int llc_aggr_tolerance_size;
 extern unsigned int llc_epoch_period;
 extern unsigned int llc_epoch_affinity_timeout;
 extern unsigned int llc_imb_pct;
-- 
2.47.3

