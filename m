Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811331;
	b=1f6BmJymf4aF9yTTaNXevJds10jTu2XuhupQlroYa4S80tKp55ljii3cBezYuMyyyGmL
	 rH1FdLFtC7vA0d7ZMxQzsZOsTD+2gQtZ6OBRorze6Jzxj6WEnQo5CgM6W4SDZzUkIyoh7
	 zkm32DfUa0yRFnVTDtfK/L1EmudMbtfCF6++BrMPsxyMBaK2OA4CLjyLe5nQxpC4u0FK/
	 rhhvpYgp5hFEkcrNvNLC4QW6A5K32+LryGJnlO5h6pIlT7wPgdacKuGcfXzdCORLXKoyV
	 4AlY9F1I9yvIXgM+miEcx7zuSvSundK4/qdtQ7fLZa1+EZCrtdzKj+0SzLbGArQl6QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
	b=JchKBmgxPcKVr1E+tHyXD0bKhokYYFj7odEgY5Wm5ST9vdXnOpICLCgyF9J4al9ev40H
	 a4T44RZuVW/6dYUb/hK0JEcYei8oP3n47/6iMe0ORnT4g28CGpZYR3HPSZUkzXHVdp7PH
	 +AImrivNR1sLdkUrcz/omiAFhPf5LM3loZsp953Pagb4vFiUb+kENydIeR5Avl9MtGv5t
	 fgI8Tm1S5AlVLGaIuYIWlNW4r4y6iEm3hwPTvfeAO+BVVFOmhTovcs3oaQtTd2IAzWbHV
	 7p6AGCot/b1DUcqiKDEp3zXPKGRoFah+xYLA+THWeASzvYwmYMdFp3g6O05Qx1l+wcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0uqz35L;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BCE606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BCE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0uqz35L
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36d6e342f98so868121eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811330; x=1794416130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
        b=q0uqz35LO15DM4psgbOfG0V+FsAvkp5rl/pScZ0E/Zq8+SfrQji7h6wIFyIc7EcHTU
         Y+lSGlLv/WcQ80KJXV6uMP1oQUKWLoRAUEQvnRpkkrEVTV0eIWFLJMCj+COsZSOKAhV9
         Ph2AUvPaNZdKZwK7RhJvSBeA8edXi4plGh+ULoiBC58GpI+FrF7gPPNSwswEhmvMcjjs
         mP07hEwy3jZ/X/RXk2MggMcaps8ZB/l9D5TJclAtn5NFRsuYSh3mP8fOuT+JQ4UWeBvJ
         rKLlVf8objJ9AdWsPqUmuJSpI+5wM5qVRy+/FCa3HnqVQgdRSPMcwxd70SXcAbdcwATT
         B4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811330; x=1794416130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
        b=xuSTytU8Ex3cvsRb8AJPZJYSoV/b/G+8qkqhHmNVvpVjV1XbnuKJKLOpK6cw4kbxBx
         nj6/VMyparB/eRb4RC+kI3GKtnLsgNLdn7Ml1cW3dO9CIY3cAGFth8wIGpgIFvH9E+bl
         7JaTP/NbsLqyZRb1hZ+WDGZZTtHYYCDjnqkR82ldZXJIUoJt2z59HTso24VqGZMk2qz7
         hw7snYc+FBNEmriTkQBWhe+j14mvWESe82UyVWevSdBM3O9IJSdXNR1dyN1ejHhx4HG2
         KAVr+bXCgS8/xi9PlVRUUPNkvWOemJ+qLfLcMu5PJdjXC4iHOriXSR46fQdKyrZw+1J0
         LgEA==
X-Forwarded-Encrypted: i=1; AKwUvBw6tj1aZwgw7F8BCioiqgqVVbtDBIVj55GkAqtQlKnMwsXV714bxLuEg49O4+df99RUM1xccBDj05JByIVkR4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+D3C8kO7UKVAe92ZJQdMkjwJBmObPvCCpXN//oFtMGTb94Pv8
	vX7I7vMt8s/EQtj5K3SSMqkY++pGBib0KbCtqFJ8zrg1Ul9heQETfRs8Vx0czo5Ps/p1QA==
X-Gm-Gg: AYBFou2n2B/eBLC6XvBWIFdbtqfbYsnP55tLzOESl7+GHAimtUWXe0RUyhexS8GmiNc
	xtb24n60x4WEQIcXH3sRt8NkyBaFtIQydJx+4vAGO00/WvF8ZQ8hYibI/ciWqfTPYek9HUBx+B+
	t5LYQSBnGcU3EMD0VCmNx7czkd/vJ9rQ4NdAQ9gK6XmY+RXnxHHio6ZsGjJtGNCQ5Emp7AdqCvg
	whrCQLqCS+JF6DnZJiH8ZuVMJeT+BCAuzgqB7/Np0iL0Ufv8RQReNiHeoNqAzArevm+JvbNKOx0
	qsL9EOZ8N1qcdaDuW84IjX8C8GtQYyUSXDcNY0FwYUpWOEazbNLNrJhoWR03e/xKUC+k+vQd+WU
	S1yTJtNmKQtm1D60vZFju/2PmnJWiTj/0utT+OzAoYgPe24lxAaIi5cBqgQ7xipKb6shjJ8irmv
	XiB6DmXhJSaFELVBW0ddlfthYqfgcGQ/BTVpnbBppTPDV9ow/cD0llvgr1sLbCe6Wl/+yUYdM/o
	nqO536ULMXv/7qup7GhOy6i+m7M4ZI1wA6XtggWRfQ6veVMl7G7G+rPtN8HuBv0iIxuRY5IXxtY
	kLlsn+4hTEuSOa7o7lMT1ZLFHHeZ97J8nhggPGY=
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr23626146eec.5.1793811329298;
        Wed, 04 Nov 2026 08:55:29 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:28 -0800 (PST)
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
Subject: [PATCH 01/28] hazptr: Add shared scan kthread
Date: Thu,  5 Nov 2026 00:54:19 +0800
Message-ID: <20261104165504.2430480-2-kunwu.chan@gmail.com>
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

Batch concurrent hazptr_synchronize() callers into a single kthread
scan.  Waiters sleep on completions instead of busy-waiting.

The kthread processes queued waiters sequentially: for each waiter,
it scans per-CPU slots and both overflow-list phases until the
address is released.  This is the same scan the direct fallback
performs, delegated to a kthread.

Waiters are embedded in the caller's stack frame, so no dynamic
allocation is needed in the synchronize path.  Fall back to the
direct scan if the kthread is unavailable.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/hazptr.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index b06164aac3a7..013c24021c43 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -12,6 +12,10 @@
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/export.h>
+#include <linux/completion.h>
+#include <linux/kthread.h>
+#include <linux/swait.h>
+#include <linux/sched.h>
 
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
@@ -234,6 +238,145 @@ void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
 	}
 }
 
+/* Helper: scan both overflow-list phases. */
+static void hazptr_scan_overflow_list_all(void *addr)
+{
+	unsigned int scan_idx = READ_ONCE(hazptr_overflow_list_phase);
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+
+		hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx], addr);
+		hazptr_synchronize_overflow_list(&overflow_list_flip->array[flip_list_phase(scan_idx)], addr);
+	}
+}
+
+/*
+ * Shared scan: batch concurrent hazptr_synchronize() callers into a
+ * single kthread-driven scan, avoiding redundant per-CPU and
+ * overflow-list walks per caller.  Waiters sleep on completions
+ * instead of busy-waiting.
+ */
+
+struct hazptr_waiter {
+	struct list_head node;
+	void *addr;
+	struct completion done;
+};
+
+struct hazptr_scan_state {
+	struct task_struct *kthread;
+	struct swait_queue_head wq;
+	bool wakeup;
+	struct mutex lock;
+	struct list_head pending;
+	struct list_head scanning;	/* kthread only */
+};
+static struct hazptr_scan_state hazptr_scan;
+
+/*
+ * Queue @addr for the shared scan.  The waiter lives on the caller's
+ * stack, so no allocation is needed.
+ */
+static void hazptr_synchronize_queued(void *addr)
+{
+	struct hazptr_waiter waiter = {
+		.addr = addr,
+	};
+
+	init_completion(&waiter.done);
+	INIT_LIST_HEAD(&waiter.node);
+
+	mutex_lock(&hazptr_scan.lock);
+	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	if (!READ_ONCE(hazptr_scan.wakeup)) {
+		WRITE_ONCE(hazptr_scan.wakeup, true);
+		swake_up_one(&hazptr_scan.wq);
+	}
+	mutex_unlock(&hazptr_scan.lock);
+
+	wait_for_completion(&waiter.done);
+}
+
+static void hazptr_scan_do_cycle(void)
+{
+	struct hazptr_waiter *w, *n;
+	LIST_HEAD(done);
+
+	mutex_lock(&hazptr_phase_lock);
+	mutex_lock(&hazptr_scan.lock);
+	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
+	mutex_unlock(&hazptr_scan.lock);
+
+	if (list_empty(&hazptr_scan.scanning)) {
+		mutex_unlock(&hazptr_phase_lock);
+		return;
+	}
+
+	/*
+	 * Process each waiter: scan per-CPU slots and overflow lists
+	 * until the waiter's address is released.  This is the same
+	 * scan the direct fallback performs, delegated to a kthread so
+	 * callers sleep instead of busy-waiting.
+	 */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		hazptr_scan_cpu_slots(w->addr);
+		hazptr_scan_overflow_list_all(w->addr);
+		list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_phase_lock);
+
+	list_for_each_entry_safe(w, n, &done, node) {
+		list_del_init(&w->node);
+		complete(&w->done);
+	}
+}
+
+static int hazptr_scan_kthread(void *unused)
+{
+	for (;;) {
+		bool idle;
+
+		swait_event_idle_exclusive(hazptr_scan.wq,
+					   READ_ONCE(hazptr_scan.wakeup));
+		hazptr_scan_do_cycle();
+		mutex_lock(&hazptr_scan.lock);
+		idle = list_empty(&hazptr_scan.pending) &&
+		      list_empty(&hazptr_scan.scanning);
+		if (idle)
+			WRITE_ONCE(hazptr_scan.wakeup, false);
+		mutex_unlock(&hazptr_scan.lock);
+		if (idle)
+			continue;
+		schedule_timeout_idle(1);
+	}
+	return 0;
+}
+
+/*
+ * Initialize the scan kthread.  Failure falls back to the
+ * direct scan.
+ */
+static int __init hazptr_scan_init(void)
+{
+	struct task_struct *t;
+
+	init_swait_queue_head(&hazptr_scan.wq);
+	mutex_init(&hazptr_scan.lock);
+	INIT_LIST_HEAD(&hazptr_scan.pending);
+	INIT_LIST_HEAD(&hazptr_scan.scanning);
+
+	t = kthread_run(hazptr_scan_kthread, NULL, "hazptr_scan");
+	if (!IS_ERR(t))
+		smp_store_release(&hazptr_scan.kthread, t);
+	else
+		pr_warn("hazptr: scan kthread failed, using direct scan\n");
+	return 0;
+}
+core_initcall(hazptr_scan_init);
+
 /*
  * hazptr_synchronize: Wait until @addr is released from all slots.
  *
@@ -261,6 +404,12 @@ void hazptr_synchronize(void *addr)
 	/* Memory ordering: Store A before Load B. */
 	smp_mb();
 
+	/* Pairs with smp_store_release in hazptr_scan_init(). */
+	if (smp_load_acquire(&hazptr_scan.kthread)) {
+		hazptr_synchronize_queued(addr);
+		return;
+	}
+
 	guard(mutex)(&hazptr_phase_lock);
 
 	/* Scan per-CPU slots. */
-- 
2.43.0

