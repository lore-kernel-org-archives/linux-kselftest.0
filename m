Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334342E40C
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946716; cv=none; b=CV5EkmNdVr9lNnrcyzfjJHxVzVy6AB2bmskLyjTfYqe97b5ZXZmkVOapi+XSZn20bpGf0SioQCCCGkY+UpduOrkaIbstlBhgaqj9pZBfZUhCta8JCtEJkYMbtt0ZC/mAZ4OSQd9FyC5fTjw2EQ3koAOwuS/Ipu75qpZ46boSZ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946716; c=relaxed/simple;
	bh=ioHFspw6dBzml20bQjh5wqXld+9sMKkrChXphGvT8j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rynPhQvbblo8xqOxNpyuttKpcp5Uv4VC8GSqZSVUmG8Ih2v6wqch/QYRbDlxVNiL25nEwC3qA5usKW7ftUl0vyNtDf1Atm80hiF+tWjOGV+sVZ/nW+dwvTAU4lY2aIEzsgr1WZPVQ9UymXIA2zIP1+2mEVXiYUuzh/1+AVHFxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6xo5Vcf; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6xo5Vcf"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-1438cb9b3a3so6539335c88.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946707; x=1791551507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZG5fAQ0FiH64NGyRXubKr6Xz8RTMEKx2x1RgTKTW7s=;
        b=K6xo5VcfNZoeivzQxs3LR+sbDQwKIxZogzBCOgqHkneIVAXVAV3rmxD342nWtdlsdy
         BOEKtlhyLi8zGMfxv3kk1abWaQUm9NOcWoCFvbiWauYxDliCYbFoY3g3FSblTbd+THc0
         P722ylgCWkf76DWE8OrT8FFOjYnDT+Jmnh7/qz0cTCPbDuCnXT8eYl2yQ6ChVSqOYZRY
         KFOCgGz4oQYzEMelUPBcZDyyBO1X93jUNbfs8KDblK+8wEFTJwxmaZPI0ube+zuGOg2z
         /bt+y4LBahF3jrKVfQ8XBTBJfp33mbGjzOeOUnYjyVw+E+lhRIC616yhU6MoZP0240eO
         1uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946707; x=1791551507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZG5fAQ0FiH64NGyRXubKr6Xz8RTMEKx2x1RgTKTW7s=;
        b=DcCPW1CBMVc78EtidfIZUNAuOdXSGifhbS1iu8KUPJuPk+hx9K1sYRju1HHfN1Sz/l
         +zriXAnkbHiNrkpNtBHvFhkBXgwVB7208arp5Tn2sZl7/0dQuZngTSaykHDV7fpp4TAt
         9yXQv4t5JLkOvJT3Se0N20mbSvl7HpaONlDvZHdhEyVnX33LRKuCqd40ZONbXt5JhzM/
         kxqH6adbdKQEdZwwEH9r3I0BenI9fnpe+s28jMaxKAvwa4rfUhe0vSY1XH60gkq5K/db
         btBznrTyBGCEVAQTnH1w+R1qiaYgKBMZFh1MA8hxqP3mWa9Mko+wvAStRlizGzze5qsJ
         aong==
X-Forwarded-Encrypted: i=1; AKwUvBzx9Q5HtmCulMXo6cyDbSlHbhfoF/HVCIQMZ6OLNYToQqADwk59m/MboNlYe7Nhst9pH9dBn+SgVzUpn+zmL4k=@vger.kernel.org
X-Gm-Message-State: AFuF++mUVc7fULaRB8Deh1d+ipL1QoI0ajJ7GNl8As+yM7SVYElF4+Ml
	k2cmjY44mYJGA9W6FgN/K2v1qPjNT338w3Y0aI5TG2sWU3VG9pFr6kdB
X-Gm-Gg: AYBFou36vqCx6M+jE0SM0LMtDpuPHEKV2V56BlPI9X5snyxiC5KHyo9V0m/nWnYGYsY
	rqR+yea9NHkG0suNT5iljd5xkOFV9nxBoyfCz58nVjiJ+dNIKY7wieX7oW4Not//z5b7BMEKNOG
	06o8+I0ugIcy0jHBdX9pQD6zFs/2ZJj8n0XPfJLvEz1C3Z9+Ol2tfdlUPRt1TC5KVF1GqIa158V
	ob76TRnN0wW0XGD3LYheNN0IlqiG1Yvj7jFsbC9hqjEfO4ppMAHyqGppM5JxblI8xwAeFt3JRZH
	TS23Trro9yk9TfrBejflXnSn9JKbPgpE/Rn36xCTqDyS0l1d1KU6Dlkc5l3M6JtfZ0erjh4zfIR
	JJuGGFTpSBwIR9PILJWbSsXaAn1nbl4Iu7TQLi919IKSyoH7xYVDgMQ3HmbC0Z2NZNNXh/5ApYg
	qjSExGhrN6IykTWIaZyXRlqEqcdzPcRIghlkuvNLZjgZbnRNeOmJc7xZPwAqCtK2VOEA==
X-Received: by 2002:a05:701b:2512:b0:13d:974:a2c6 with SMTP id a92af1059eb24-14f5b9fbb86mr2985232c88.7.1790946706628;
        Fri, 02 Oct 2026 06:11:46 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c739sm7309347eec.3.2026.10.02.06.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:11:46 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 02 Oct 2026 21:10:29 +0800
Subject: [PATCH v5 09/12] cpuset: Add dhm_cycling_cpus mask to suppress
 transient invalidation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-wujing-dhm-v5-9-78a6996d87ad@gmail.com>
References: <20261002-wujing-dhm-v5-0-78a6996d87ad@gmail.com>
In-Reply-To: <20261002-wujing-dhm-v5-0-78a6996d87ad@gmail.com>
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
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

When the cpuset code cycles a CPU through hotplug to apply kernel-noise
isolation (remove_cpu followed by add_cpu), the CPU disappears from
cpu_active_mask temporarily. cpuset_hotplug_update_tasks() sees an
empty effective CPU set on the isolated partition and issues
partcmd_invalidate, tearing down the partition. The subsequent add_cpu
brings the CPU back online, but the partition has already been marked
invalid and requires manual user intervention to restore.

Add a global dhm_cycling_cpus cpumask protected by dhm_cycling_lock.
The isolation cycling path sets the bits for CPUs being cycled before
calling remove_cpu(), clears them after add_cpu() completes.
cpuset_hotplug_update_tasks() checks whether any of the cpuset's
effective exclusive CPUs are in dhm_cycling_cpus and skips the
invalidation command when they are, treating the transient empty-CPU
state as expected rather than an error.

A global cpumask avoids the need to walk the cpuset tree to find the
owning cpuset during the cycling loop which runs without cpuset locks.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/cgroup/cpuset.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 8b3bb034adf62..6213e63cf348d 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -157,6 +157,14 @@ static bool		update_housekeeping;	/* RWCS */
  */
 static cpumask_var_t	isolated_hk_cpus;	/* T */
 
+/*
+ * CPUs currently being cycled through hotplug for kernel-noise isolation.
+ * Protected by dhm_cycling_lock; read in cpuset_hotplug_update_tasks() to
+ * suppress transient partition invalidation during the offline step.
+ */
+static DEFINE_SPINLOCK(dhm_cycling_lock);
+static cpumask_var_t	dhm_cycling_cpus;
+
 /*
  * A flag to force sched domain rebuild at the end of an operation.
  * It can be set in
@@ -3906,6 +3914,7 @@ int __init cpuset_init(void)
 	BUG_ON(!zalloc_cpumask_var(&subpartitions_cpus, GFP_KERNEL));
 	BUG_ON(!zalloc_cpumask_var(&isolated_cpus, GFP_KERNEL));
 	BUG_ON(!zalloc_cpumask_var(&isolated_hk_cpus, GFP_KERNEL));
+	BUG_ON(!zalloc_cpumask_var(&dhm_cycling_cpus, GFP_KERNEL));
 
 	cpumask_setall(top_cpuset.cpus_allowed);
 	nodes_setall(top_cpuset.mems_allowed);
@@ -3991,6 +4000,20 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (remote && (cpumask_empty(subpartitions_cpus) ||
 			(cpumask_empty(&new_cpus) &&
 			 partition_is_populated(cs, NULL)))) {
+		bool cycling;
+
+		/*
+		 * Suppress transient invalidation when the offline is part
+		 * of a hotplug cycling step for kernel-noise isolation.
+		 */
+		spin_lock(&dhm_cycling_lock);
+		cycling = cpumask_available(dhm_cycling_cpus) &&
+			  cpumask_intersects(cs->effective_xcpus,
+					     dhm_cycling_cpus);
+		spin_unlock(&dhm_cycling_lock);
+		if (cycling)
+			goto unlock;
+
 		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
 		remote_partition_disable(cs, tmp);
 		compute_effective_cpumask(&new_cpus, cs, parent);
@@ -4008,8 +4031,21 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (is_local_partition(cs) &&
 	    (!is_partition_valid(parent) ||
 	     tasks_nocpu_error(parent, cs, &new_cpus) ||
-	     cpumask_empty(subpartitions_cpus)))
-		partcmd = partcmd_invalidate;
+	     cpumask_empty(subpartitions_cpus))) {
+		bool cycling;
+
+		/*
+		 * Suppress transient invalidation when the offline is part
+		 * of a hotplug cycling step for kernel-noise isolation.
+		 */
+		spin_lock(&dhm_cycling_lock);
+		cycling = cpumask_available(dhm_cycling_cpus) &&
+			  cpumask_intersects(cs->effective_xcpus,
+					     dhm_cycling_cpus);
+		spin_unlock(&dhm_cycling_lock);
+		if (!cycling)
+			partcmd = partcmd_invalidate;
+	}
 	/*
 	 * On the other hand, an invalid partition root may be transitioned
 	 * back to a regular one with a non-empty effective xcpus.

-- 
2.43.0

