Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709C4DD3B5
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220566; cv=none; b=lsuShivgbV+lM7xCIPo1lvqG/E2tyMOMbRrwtk8czgOOU9jktac6mHi0ljNQqE2FokLiTIr7WrDmjN1YdjtOxZUYJrukcqsQlIu95U/qA9D1cLRqg+eayqvHpjVU8kc6yNWqUoDSyho+bF8NMZrwMi9RlnAcm30AZYw5zQK/y9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220566; c=relaxed/simple;
	bh=NerSRQgPomHVGQsyQmO2Em3s0dFaIoYpp/fMfD73Ojo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJUMc6ztcd50DaMIsaeC/LFse6olp4JCmhwNTCgVhV0nmSLUoOZWF6ScAfzA1VbK8N2JeCRh6FEy5T6rQ7gIkI87l9rYWhRZfS6vvSj9+HbdgZaugaFZ+oxxl2FNdjEQVjdF8g62zp9OFe0uIdGalu04AwntIv1qLIQXayxXo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaORVZJj; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaORVZJj"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1227395a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220564; x=1791825364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfCwDuuYoLXczS4CwGW4NE2cKOD24/roRAYfYD5E8yk=;
        b=MaORVZJjCjFhaWaKbmq2F299NrK9VSTAhtBuohdeOqqNiCS4TgCk0N5nVbWr06t2dX
         /n4PdRmhlAsh5ramvwX3D1CmmfIH2/AuqakXePMSumlkHcn0Pl1apQPZ0+MNADS1ioq+
         3EOAiCwNxTZ4SFHeW/N2hF33e8Hyx99YbrrvML8CI6M6mhL3dOFVay6x/V171dx7UauV
         P46C1hSKNphVBvL6VEc0+FqlqZHivHhQ/fGK9KCSWsri1UKbSjmC7wD/zHGXiY6VjhuY
         CcKPHccfJhRznSeAXo0eWbQWzImrSDibHOIaZWPpbyL3JVRLF63FEJznn+QsM18rQKWv
         BD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220564; x=1791825364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfCwDuuYoLXczS4CwGW4NE2cKOD24/roRAYfYD5E8yk=;
        b=ADf45fFM42GXsQ1+oSfnbQHONtstG76J/GSedSNScpxau+qX0RtIYALFWaxkbGv90E
         JfHjtlDdmjSRsBOmywoQDN0NRHcTteS4MSnTdmmGJwOIkaM2eWGMTVIZfq7i50nF+1rB
         N+xXqK4Z9oWImSdI+g3qfM9aGkqqSLZQpOlW9FTbGO/8+xZazsEJn34WQoEMMwmBYZQx
         RP9fRMAqlavyL3ZG2hnwuQZpbXEa8zj4qYjYgr+TWa3kLRQ+rEJzsoBpjFGfluS0Bf5n
         LYKlGgznS/juZe7weOE7vr271sw+WU0kcs5BL3oSy8Utrj7XWLk59CN/oDudzl8NawHF
         WXmg==
X-Forwarded-Encrypted: i=1; AKwUvBy7lpfhOplTASOWfDMljXkCR0dlCJdAid9l2voMzyf8yi9N0/hdzyzmTfzxOqchbTF4OkkBCSQjVi0VrjKD5TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7EYXqtLYPAQ6NOBNTbqjR8IvOe+bWiKK0TUYSfC6mDXt/bO/q
	6b5PqFRtUpBCbFg50RJv4ILk3tIY7SOg+DEaikKr0rmO4R7UtO896rAm
X-Gm-Gg: AYBFou2USFjwcD1brwkru8aO0+DRiktSCBGbQg1cZ8psGPrwjG0kIMdXTk1BqciaEF5
	p7MfmJMuVgKWnln0N2gj1aWksHUSnZp++0vk7n7ReXXZ+/1x2GCcMcZxlBot+vp7iAJN9tZDW2d
	s9CL7G9eTDgM3Da0o2a3D98EEFtEoKNAnbNTo1+K2cH+RXYmvkEhn+5lXqRwo9CuJBw2vc2MrF2
	Qo2ybbhAk6B8roK3aD4LkNdEGMIHOA/JS/oyjFuGO8uKm84KMYDI6CEmTdn5f4v/2E/reCO1hpV
	oS6RcU/U3zr6Dzj2Gzt/shYDETknVrJE4jC+dwDW/+QJ47WaFUkPi6fvFv4xb7Is098C30RsJD7
	8Imxw5O31dGqcMpdyNi6HC0WaQ70Lwt0HWBTVU93pWB4CcXAjzdhVm9eWABjL383YX9RNKYAy46
	M6ffIYQML56/wHMJXWKcNLJ7k85fq2vWsk6ZL+AkD8P4LcThnF4rIzZhYdD6kYB9sTbbNjKsjiK
	Xp9J2tHWFswQzUaedj2GAckJfkuN3s=
X-Received: by 2002:a17:90b:3843:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a6ce6ca70bmr10121855a91.20.1791220563141;
        Mon, 05 Oct 2026 10:16:03 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:02 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 01/15] hazptr: add shared scan kthread
Date: Tue,  6 Oct 2026 01:15:15 +0800
Message-ID: <20261005171529.1378809-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Batch concurrent hazptr_synchronize() callers into a shared scan
cycle, avoiding redundant wildcard flips and slot scans.

Queue waiters to a kthread and perform a two-phase wildcard scan
once for all queued waiters.  After both phases, complete waiters
whose address is no longer held by any slot; waiters that remain
blocked are retried in a later cycle.

Waiters are embedded in the caller's stack frame, so no dynamic
allocation is needed in the synchronize path.

Fall back to the direct scan if the scan kthread is unavailable.

Adapted from the scan-kthread approach in Boqun Feng's shazptr
implementation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index d3d1050d92cf..9e274a691af5 100644
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
 
 /*
  * The current hazard pointer wildcard. Flips between 1UL and 2UL to guarantee
@@ -209,12 +213,179 @@ void hazptr_scan_period(void *addr, void *scan_wildcard)
 	}
 }
 
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
+ * Check per-CPU slots before overflow-list slots to match the
+ * acquisition ordering of promoted slots.
+ */
+static bool hazptr_value_present(void *val)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+		unsigned int idx;
+
+		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
+			struct hazptr_slot_item *item = &percpu_slots->items[idx];
+
+			/* Pairs with smp_store_release in hazptr_release(). */
+			if (smp_load_acquire(&item->slot.addr) == val)
+				return true;
+		}
+		for (int i = 0; i < 2; i++) {
+			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
+			struct hazptr_backup_slot *b;
+			unsigned long flags;
+
+			raw_spin_lock_irqsave(&list->lock, flags);
+			hlist_for_each_entry(b, &list->head, overflow_node) {
+				/* Pairs with smp_store_release in hazptr_release(). */
+				if (smp_load_acquire(&b->slot.addr) == val) {
+					raw_spin_unlock_irqrestore(&list->lock, flags);
+					return true;
+				}
+			}
+			raw_spin_unlock_irqrestore(&list->lock, flags);
+		}
+	}
+	return false;
+}
+
+/*
+ * Wait until no per-CPU slot or overflow-list slot holds @wc.
+ * Callers must ensure that the wildcard value in use by new acquires
+ * differs from @wc, so that the set of slots holding @wc only
+ * shrinks, which guarantees forward progress.
+ */
+static void hazptr_drain_wildcard(void *wc)
+{
+	while (hazptr_value_present(wc))
+		cond_resched();
+}
+
+/*
+ * Move pending waiters to ->scanning and perform a two-phase
+ * wildcard scan shared by all waiters.
+ */
+static void hazptr_scan_do_cycle(void)
+{
+	void *scan_wildcard, *old_wildcard;
+	struct hazptr_waiter *w, *n;
+	LIST_HEAD(done);
+
+	mutex_lock(&hazptr_wildcard_lock);
+
+	mutex_lock(&hazptr_scan.lock);
+	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
+	mutex_unlock(&hazptr_scan.lock);
+
+	if (list_empty(&hazptr_scan.scanning)) {
+		mutex_unlock(&hazptr_wildcard_lock);
+		return;
+	}
+
+	/* Pass 1: drain the unpublished wildcard. */
+	scan_wildcard = flip_wildcard(READ_ONCE(hazptr_wildcard));
+	hazptr_drain_wildcard(scan_wildcard);
+
+	/* Flip so new acquires use the new generation. */
+	WRITE_ONCE(hazptr_wildcard, scan_wildcard);
+	old_wildcard = flip_wildcard(scan_wildcard);
+
+	/* Pass 2: drain the old wildcard. */
+	hazptr_drain_wildcard(old_wildcard);
+
+	/* Complete waiters whose address is no longer held by any slot. */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		if (!hazptr_value_present(w->addr))
+			list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_wildcard_lock);
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
+
+		hazptr_scan_do_cycle();
+
+		mutex_lock(&hazptr_scan.lock);
+		idle = list_empty(&hazptr_scan.pending) &&
+		      list_empty(&hazptr_scan.scanning);
+		if (idle)
+			WRITE_ONCE(hazptr_scan.wakeup, false);
+		mutex_unlock(&hazptr_scan.lock);
+
+		if (idle)
+			continue;
+		/* Waiters still blocked: retry after a short delay. */
+		schedule_timeout_idle(1);
+	}
+	return 0;
+}
+
+/*
+ * Queue @addr for the shared scan.  The waiter lives on the
+ * caller's stack, so no allocation is needed.
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
+	/* Enqueue and wake the scan kthread. */
+	mutex_lock(&hazptr_scan.lock);
+	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	if (!READ_ONCE(hazptr_scan.wakeup)) {
+		WRITE_ONCE(hazptr_scan.wakeup, true);
+		swake_up_one(&hazptr_scan.wq);
+	}
+	mutex_unlock(&hazptr_scan.lock);
+
+	/* Sleep until the scan kthread completes this waiter. */
+	wait_for_completion(&waiter.done);
+}
+
 /*
  * hazptr_synchronize: Wait until @addr is released from all slots.
  *
  * Wait to observe that each slot contains a value that differs from
  * @addr before returning.
  * Should be called from preemptible context.
+ *
+ * If available, queue the caller for a shared scan; otherwise use
+ * the direct scan path.
  */
 void hazptr_synchronize(void *addr)
 {
@@ -235,6 +406,13 @@ void hazptr_synchronize(void *addr)
 	/* Memory ordering: Store A before Load B. */
 	smp_mb();
 
+	/* Pairs with smp_store_release in hazptr_scan_init(). */
+	if (smp_load_acquire(&hazptr_scan.kthread)) {
+		hazptr_synchronize_queued(addr);
+		return;
+	}
+
+	/* Fallback: use the direct scan path. */
 	guard(mutex)(&hazptr_wildcard_lock);
 	scan_wildcard = flip_wildcard(hazptr_wildcard);
 	hazptr_scan_period(addr, scan_wildcard);
@@ -282,3 +460,26 @@ void __init hazptr_init(void)
 		}
 	}
 }
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
+		/* Pairs with smp_load_acquire in hazptr_synchronize(). */
+		smp_store_release(&hazptr_scan.kthread, t);
+	else
+		pr_warn("hazptr: scan kthread failed, using direct scan\n");
+	return 0;
+}
+core_initcall(hazptr_scan_init);
-- 
2.43.0

