Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811395;
	b=BSR8HI4bFSztcmmr6a5buGYfdI1K+/Vx5/yzMfQXyMXXWPd5zpHad4dnWCUh7hYWvZpy
	 bUEe+3/x4q2bQqQtD9ABr3JPzmKTnIdjnvKpB+0rxaLjMx6SioC90kAUhHghvflI8K8iM
	 1NDtNG1aoF+WurMola7SqXOFhC3kh1/xqgxNpnYimNyeaFFc6+xKrnYU5NQv3VtZpa19N
	 rxjIy9EUfxrbpCyc7fO7rpqL5e1vtrzh9lUzlWMkdwA8OYdij3Loin1Z+yHU4ni6wlb5o
	 xDJ4+zNabqHH6NiDfdlJjVMOvUWl4vQhTw3E/KHejE0gBUTW4iXiLrywthp/hxAMPJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P8jhzhdMxuYGAzmakVQAbRKMvL/Wa43vi3WcMVI8m4w=;
	b=TxNk+74elH7Xb7Z1toHf5UmTy4C3EdxJ+59UaCgoj5qL9c454PTgzM7tgOw+iQBJIWIa
	 a+QhkKfYk2AVduni0MFVdnjQZ4zFzA3Qh7tpbIr1YmHrV/bxZQ55y6NtnnVJc6uNnyOL6
	 s2wUdQ5uqmzvlBh+Fhi1j7C8DxZ+XvmH1T7av6tKF1mfHS+9La8iymhZ406zgEGMrwN58
	 1H5d+9qgJ5uQb8ArvVx8LkxbdTHIiit3aHpFf6yTijMVDn3h5eADQWyX7QKjjFlrRx01B
	 tQhFoMxbIy2xD7yDbPuiCu4lXQkdQ3o4ZrOtf8gsKqA42ej8Ld0tmloGWvForx3w5nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCHw+S6p;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAC606A330
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4AAC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCHw+S6p
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1671792eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811394; x=1794416194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8jhzhdMxuYGAzmakVQAbRKMvL/Wa43vi3WcMVI8m4w=;
        b=rCHw+S6pMFx7a6bB0zwg3pMwUXqAIJM1xFGrooI6UPMW6s4ELsym4sfptgqmXhtlBy
         v8FX/ojmua6TRr2qFvXbn6gBItIxjYdTaY0/N6JtUdkyGB4+0FO4bTKCID5J0qsyW72W
         AoHA0CxWwh831koTnXb0C6SUuSNkfXjrFhq8cP363COvLDJnVADRJpWaEiPyPty9wCMe
         nRPk3wv47iT2zbAVZcXBD2vOmhC7ryd3QUOdLYU8NX0N7cPgNdZhWNA1YwbPCSoDmxBZ
         vehYzjSpzhpQBCOZ66x7YWy6f3kfO4qq41U/BL/vZIfQpgyY4BpXWtRB48wV2vUswVBF
         9lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811394; x=1794416194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8jhzhdMxuYGAzmakVQAbRKMvL/Wa43vi3WcMVI8m4w=;
        b=MaRrk4k52owXvqL4pWqals/uFnzebshvedRKrLWlaE5rrj9urrdRT6GeBGJ8Tc/Bsd
         ICEruAyfsi8rJd8cRn6ENWo8mVD4hcXsiBOO5PWmdxYPL+5SLZCn8mR6I7K6O3m66Ijf
         s8UKUuQ3D2b2tbHOYd2srseAcXsJ6JRuh68b1wBhtaNbnbz4QZPAhvaXBYiNjNKxlLZL
         cQV/45IT/ZE8+LKcBjyuYgP6xPpMnkZWoc//rSM5QLIuLTLuhMbrmhy2W4rpAooLVvTU
         wm/mCbPU0AbtCK84PU0zStL68RTpt6D3ftVUzLOUpbdfOEFq65SovpfLN1mX/gJImrRS
         tKFw==
X-Forwarded-Encrypted: i=1; AKwUvBwM88ejncffB1Uf5zJ0u434izVkzbOB4gJjOtPga5K0SrrkhY4pQfAPDm9L+5HvITHyzWPjGla27//S4G2cUa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XQnE0uP5XMpYNcf8mRFzKVbqyjGtsRCIqgCpSiwQy91qVKBE6
	szr/L1fAd7f49sxUJJ6XtaOzyPx6D7dFl+Wa+OXxYjUxa2QJr3XFyTVI
X-Gm-Gg: AYBFou1km4WjxQAIia5so+JwVAn4P5+S1aCwmymvdV9EZnjgzq4s6QbfdjWm/9l0uca
	DsRDGlUyL/P1LnapmPAHWTwfIxKnDjpylAMvqVbEdgV7x+EhsV12J00JEc3LlpFfvpGqkMcI3B9
	Afog6H0Y7XQkA6WDsOkKk3o/QoGuOb7edL6yZqihHE9BAzn6G2GhzRA3a1PG449Bo8c3vEBJPa4
	Uj6q2cM7ZLFdrZofnaqsWu7uO146KcXEsZPlviK3XdO6glPnGYP4h2rfqAYGooPy1n2e/ZGuZIx
	6r9/nsedtaCtn06HKmgqTbfbhCQbLwQbMqYbHpObIjLr4O6xshAHGGQbZEtkGi6B1ztl5RxWucN
	yDuYWuGt5X8UlRKGXu6HtH3+FQUMiAAI29/DD31/loNZQcYfjzRLcMVX9Ta3C+NuzmRW9lQ7TrR
	/opooaz2orXKPgx1Q28Spl8v04p08TthnmTqzGrbivwe8+Rnszp3dfZFYQBFMdHwBFG/brq/YGT
	4n3o8cwd45cCNwQ0Hy4Vy9sx5BiJGOcEnFZpTNxVV9v3FFFUQ37mg5mOj6289KFzLh//4wm/YTm
	WQ3QOrGhSEnluMNumjbVg86YpFp/mNn3arNh6uM=
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr27554863eec.12.1793811393534;
        Wed, 04 Nov 2026 08:56:33 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:33 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 08/28] hazptrtorture: Add slowpath and lockdep scenarios
Date: Thu,  5 Nov 2026 00:54:26 +0800
Message-ID: <20261104165504.2430480-9-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add SLOWPATH and LOCKDEP configs: SLOWPATH enables
CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH for slow-path stress; LOCKDEP
combines PROVE_LOCKING with wq_churn=1 so each alloc_workqueue/
destroy_workqueue pair exercises the lockdep hazptr paths.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/hazptrtorture.c                    | 48 ++++++++++++++++++-
 .../rcutorture/configs/hazptr/LOCKDEP         | 16 +++++++
 .../rcutorture/configs/hazptr/LOCKDEP.boot    |  1 +
 .../rcutorture/configs/hazptr/SLOWPATH        | 16 +++++++
 4 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH

diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index c8b7c208775b..fe09280d063c 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -23,6 +23,7 @@
 #include <linux/torture.h>
 #include <linux/hazptr.h>
 #include <linux/rcupdate.h>
+#include <linux/workqueue.h>
 
 #include "rcu.h"
 
@@ -51,6 +52,8 @@ torture_param(int, shutdown_secs, 0, "Shutdown time (s), <= zero to disable.");
 torture_param(int, stat_interval, 60, "Number of seconds between stats printk()s");
 torture_param(int, stutter, 5, "Number of seconds to run/halt test");
 torture_param(int, verbose, 1, "Enable verbose debugging printk()s");
+torture_param(bool, wq_churn, false,
+	      "Churn workqueues to exercise lockdep dynamic keys");
 
 static char *torture_type = "hazptr";
 module_param(torture_type, charp, 0444);
@@ -62,6 +65,7 @@ static struct task_struct *preempt_task;
 static struct task_struct **reader_tasks;
 static struct task_struct *do_pending_task;
 static struct task_struct *stats_task;
+static struct task_struct *wq_churn_task;
 
 #define HAZPTR_TORTURE_PIPE_LEN 10
 
@@ -83,6 +87,7 @@ static atomic_t n_hazptr_torture_alloc;
 static atomic_t n_hazptr_torture_alloc_fail;
 static atomic_t n_hazptr_torture_free;
 static atomic_t n_hazptr_torture_error;
+static atomic_t n_hazptr_torture_wq_churn;
 static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires);
 static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_releases);
 static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires_irq);
@@ -668,13 +673,14 @@ hazptr_torture_stats_print(void)
 		atomic_read(&n_hazptr_torture_alloc_fail),
 		atomic_read(&n_hazptr_torture_free));
 	torture_onoff_stats();
-	pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: %lld relundefer %lld\n",
+	pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: %lld relundefer %lld wqchurn: %d\n",
 		torture_sum_pcpu_atomic_long(&hazptr_torture_acquires),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_releases),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_acquires_irq),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_irq),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_defer),
-		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_undefer));
+		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_undefer),
+		atomic_read(&n_hazptr_torture_wq_churn));
 
 	pr_alert("%s%s ", torture_type, TORTURE_FLAG);
 	if (i > 1) {
@@ -788,6 +794,38 @@ static int hazptr_torture_preempt(void *unused)
 	return 0;
 }
 
+static void hazptr_torture_wq_churn_fn(struct work_struct *work)
+{
+}
+
+/*
+ * Repeatedly create and destroy workqueues.  Each workqueue creation
+ * registers a lockdep dynamic key and each destruction unregisters it,
+ * which exercises both is_dynamic_key() and lockdep_unregister_key().
+ */
+static int hazptr_torture_wq_churn(void *unused)
+{
+	VERBOSE_TOROUT_STRING("hazptr_torture_wq_churn task started");
+	do {
+		struct workqueue_struct *wq;
+		struct work_struct churn_work;
+
+		wq = alloc_workqueue("hazptr-torture-churn", WQ_PERCPU, 1);
+		if (!wq) {
+			torture_hrtimeout_ms(10, 10, NULL);
+			continue;
+		}
+		INIT_WORK(&churn_work, hazptr_torture_wq_churn_fn);
+		queue_work(wq, &churn_work);
+		flush_work(&churn_work);
+		destroy_workqueue(wq);
+		atomic_inc(&n_hazptr_torture_wq_churn);
+		stutter_wait("hazptr_torture_wq_churn");
+	} while (!torture_must_stop());
+	torture_kthread_stopping("hazptr_torture_wq_churn");
+	return 0;
+}
+
 static void
 hazptr_torture_cleanup(void)
 {
@@ -880,6 +918,7 @@ static int __init hazptr_torture_init(void)
 	atomic_set(&n_hazptr_torture_alloc_fail, 0);
 	atomic_set(&n_hazptr_torture_free, 0);
 	atomic_set(&n_hazptr_torture_error, 0);
+	atomic_set(&n_hazptr_torture_wq_churn, 0);
 	for (i = 0; i < HAZPTR_TORTURE_PIPE_LEN + 1; i++)
 		atomic_set(&hazptr_torture_wcount[i], 0);
 	for_each_possible_cpu(cpu) {
@@ -960,6 +999,11 @@ static int __init hazptr_torture_init(void)
 		if (torture_init_error(firsterr))
 			goto unwind;
 	}
+	if (wq_churn) {
+		firsterr = torture_create_kthread(hazptr_torture_wq_churn, NULL, wq_churn_task);
+		if (torture_init_error(firsterr))
+			goto unwind;
+	}
 
 	torture_init_end();
 	return 0;
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
new file mode 100644
index 000000000000..f0ff29925a54
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
new file mode 100644
index 000000000000..7b16720214bd
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
@@ -0,0 +1 @@
+hazptrtorture.wq_churn=1
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
new file mode 100644
index 000000000000..4d13028ca84c
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
+CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH=y
-- 
2.43.0

