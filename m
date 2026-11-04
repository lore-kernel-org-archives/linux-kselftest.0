Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811431;
	b=AeXJGMpAnjoUtGBu7CL1e46c4YKYjR8LRqC2EbdSYXainEYboC6PjTYp0rGWwZhoH3OE
	 Yha4uePu2nO0fd4p79ZF7was99KUdX5UXU76b90/4zd+hXEYDSSIKDTJcTl755YhaNOFq
	 UYOUMPFG7g/uQhea9G6IFxqXh1gH013odJhj+xwYmoqR1QJFc/hqU/BifMwY0Xl13tNQa
	 3lPTiSOsFJKWEJnbXWye98NtN11uuHcMMuZnU6rtr+DvIzuexFjwgUI47kMG7SYyEaqG6
	 +2N8PaLJzfTTOcBhk5/VC2Rbs2ug99IaN0q7qGXiatY0LVyYONLK5OkH2GA64JKZuMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tXppOOg9gP9zhrC6rnkPUZoXeQTDUJQYOVYW2OTPzPI=;
	b=VSWMnGW3ENrl4v7Vd9JbhFFreoPNP2sh3K7znVjaMP3meBW5l/KOyxKaLQIdegvhim/j
	 wpWEWSQSSw4kExFeWjYsaqG+vW/9fG6j6fkbAUTOC4IdNwzohUrZXKSKLN05wT0U9VPRE
	 onSzi07CIZ3uLdAPq5NSTURerQg0jc7XCuEbjCJwvFMfg9bMzU8Ga6V7hjStp2EMN3LQo
	 glHC+um/jTk9GcsDlATAuDI2g3IHqrNqC2SMBwKO8MATSQ1+Ndalo5ssumNYCzXtlV5lQ
	 CDPzWoe6HLg1L01OUBCNCUHleg0+pW0982BvGzOAbEvZySyFSKSfc9dPTcKMw7Oa5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4S2qj3Z;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8576E606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8576E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4S2qj3Z
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36cedf1bd63so972351eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811431; x=1794416231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXppOOg9gP9zhrC6rnkPUZoXeQTDUJQYOVYW2OTPzPI=;
        b=h4S2qj3Zw5mQsW0vUwapAB+pXGLcN8QJxvJq2jtKV39mp1Un3Bt/uQnthNho6H6T8L
         jVe25KmCUbTodqm3XKYbmR9sDEPANyP8yYf0bXQIIlRliFQ6QuSi/aqA0vM+htGngKio
         YlOFXqUGkMy/9ufjU7sonb51VeJRcZgWc9Sp8h8qaOvt3PcjRsWIHqgUwIJKZMllb96b
         QiIp1Dh0FkwAeuylqmsEwRMvnH37XX0B0G5mIv+Z91y4aD6WE4MiVEiXINhkPGnMjDbQ
         hWKsKfBmN5TOyVIlGQgSKearP35ODPiCHcvVC9fCcN4SFtryJX446kPf0shs9VayZYek
         uJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811431; x=1794416231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXppOOg9gP9zhrC6rnkPUZoXeQTDUJQYOVYW2OTPzPI=;
        b=eu/k73YXJNSLrs85qv0DiwP/717amJ+o6v1exUYTSUEUnDyLSRQkkFQNk9GAy6fAc9
         AFaP9Ah003FJqDEK9QmSwXPs5W1dFQ44E4q4PzDSc/xC3Myh+1WJ62UP6PiEgX/vrg+D
         u5uhkVGWr+H0B334m1ep0IRHLegjY7ljt0gGsWUYlcfu1Q/8QZu1zyrQAPwAKhCc2mWl
         7htPbWW4o53uai57bHLypwdtOhsuVlF+oqOKzCPOaqtAYyf4kGPskqj3Cl5wto5QPd4N
         QCA6bqnGOv/AYg4PciL3ydwC0X/TRwfMDN9+mbH4sSBSVnzKJJ7THSjOFdy8mWOPXt2i
         y4Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzVdj9gnw7BFd9Qa8T1D9rSBm07Tx4FaHbwW4ebIdrf0wpoDD2u8C2LC/jL0HSZQJ4a6eoatlNr4DvTDL2upyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVvYlj5gLR5gvjkQ+WCbT5QuAIltiB+unRziKBHLJ1YE5d7K3
	aVjgxMEfrewdi4Om1kCDrJtXKtEJzdXnTnLJjZKa6x2KS6JD5EL94fYS
X-Gm-Gg: AYBFou2o1ZSK4/KHRToOQJRzErJ6B8VCNXiF4QoIk8lgDraKPqSZ0OjLTzWaMct5Rgu
	QnaQX5eoxCdxuunOT09d8birbi3bdsIyp8fvlpO0sUx3u09KcGK2iRssIDx/TGghiSezx8rXqlF
	wIlFIYP+iu2LW1n6KwjW7q9l9MPaP3wIpVdaDV5AdVVWchB9qNVvLXlAWYjT71w1iO5tlM+C3sw
	yUPCHFus/mtwH6ze2NJVyR0FgA2zFaR4ratdB9S6bpQ8mUsfQ+oiAYg5vGPsXk0OTZmCl15LOT8
	VdhZQjygvd6OvvrK8eh7/x8Qv3KCi65aBOmmtWb4+s+eyji3aus/3GQ6j1hsKLzaVixMaFlXlot
	3bdGd8uwXu8KYmDM+rNy+1hIHjTUq1cWPTycXlGiXQQVZg2bKurujLpqiIE88TjkGiYMLYmgDHL
	12fnwoEpH36yOR8vTb5s4OHPEVBe0jSr22jgsPZAi7q/XRpiDNlZIcgW5cSotR3XyIAue+ZNeSI
	w/XKDitU1OK533h6NVRmLZmGuRByB5Kwg2SCrJ6hytZ9sX9K4PObnsnO0QaxVyS49GxyB5nBZJw
	Ag/TsxX0wtvLZaI1nFQsbEqDjci1fQrNEFDY9DI=
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr85786eec.6.1793811430093;
        Wed, 04 Nov 2026 08:57:10 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:09 -0800 (PST)
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
Subject: [PATCH 12/28] hazptr: Remove per-waiter scan fallback, simplify synchronize
Date: Thu,  5 Nov 2026 00:54:30 +0800
Message-ID: <20261104165504.2430480-13-kunwu.chan@gmail.com>
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

With try_acquire, per-CPU slots publish their target address
directly (no wildcard transient), so a single Bloom-walk pass
suffices.  Drop the per-waiter exact-match fallback that
busy-waited on remote slots; waiters whose address is in the
Bloom filter wait for the next scan cycle.

Extend hazptr_scan_walk() with an optional @watch parameter for
exact-match lookups (used by the upcoming stall detector).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 104 +++++++++++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 059c356ceaa7..4784df78be4e 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -39,10 +39,6 @@ struct hazptr_overflow_list {
  * successively iterates on both lists. Therefore, only list removals
  * can cause the iteration to retry, and the number of removals is
  * limited to the number of list elements.
- *
- * Due to the overflow list raw spin lock, the hazard pointer readers are
- * blocking, starvation-free with bounded waiting, assuming bounded critical
- * sections and no NMI or virtualization-induced holder preemption.
  */
 struct hazptr_overflow_list_flip {
 	struct hazptr_overflow_list array[2];
@@ -153,12 +149,12 @@ void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 EXPORT_SYMBOL_GPL(__hazptr_acquire);
 
 /*
- * Perform piecewise iteration on overflow list waiting until "addr" and
- * wildcard are not present. Raw spinlock is released and taken between each
- * list item and busy loop iteration. The overflow list generation is checked
- * each time the lock is taken to validate that the list has not changed before
- * resuming iteration or busy wait. If the generation has changed, retry the
- * entire list traversal.
+ * Perform piecewise iteration on overflow list waiting until "addr" is
+ * not present. Raw spinlock is released and taken between each list
+ * item and busy loop iteration. The overflow list generation is checked
+ * each time the lock is taken to validate that the list has not changed
+ * before resuming iteration or busy wait. If the generation has
+ * changed, retry the entire list traversal.
  */
 static
 void hazptr_synchronize_overflow_list(struct hazptr_overflow_list *overflow_list, void *addr)
@@ -228,8 +224,8 @@ void hazptr_scan_cpu_slots(void *addr)
 	}
 }
 
-static
-void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
+static void __maybe_unused
+hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
 {
 	int cpu;
 
@@ -310,15 +306,28 @@ static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, void *addr)
 }
 
 /*
- * Walk all slots and record observed non-wildcard addresses into
- * the Bloom filter.  A single pass suffices on the try_acquire
- * fast path (readers publish their target directly).
+ * Walk all slots and return true if @watch (non-NULL) is present.
+ * If @bloom is non-NULL, record observed non-wildcard addresses in it.
+ * A NULL @watch means pure collection mode: never early-returns on a
+ * match.
+ *
+ * A wildcard in an overflow-list slot means a slow-path acquire is in
+ * flight: that slot may resolve to any address (including @watch or a
+ * Bloom-collected one) after the walk.  To keep the single-pass
+ * completion decision safe, the caller must observe wildcards and
+ * defer completion decisions for one cycle; @wildcard (if non-NULL)
+ * is set to true in that case.  In watch mode, a wildcard also counts
+ * as "present" so exact-match callers do not complete.
  */
-static void hazptr_scan_walk(struct hazptr_bloom *bloom)
+static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom,
+			     bool *wildcard)
 {
 	int cpu;
 
-	hazptr_bloom_reset(bloom);
+	if (bloom)
+		hazptr_bloom_reset(bloom);
+	if (wildcard)
+		*wildcard = false;
 
 	for_each_possible_cpu(cpu) {
 		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
@@ -329,8 +338,11 @@ static void hazptr_scan_walk(struct hazptr_bloom *bloom)
 			struct hazptr_slot_item *item = &percpu_slots->items[idx];
 			void *v;
 
+			/* Pairs with smp_store_release in hazptr_release(). */
 			v = smp_load_acquire(&item->slot.addr);
-			if (v && !is_wildcard(v))
+			if (watch && (v == watch || is_wildcard(v)))
+				return true;
+			if (bloom && v && !is_wildcard(v))
 				hazptr_bloom_add(bloom, v);
 		}
 		for (int i = 0; i < 2; i++) {
@@ -342,16 +354,24 @@ static void hazptr_scan_walk(struct hazptr_bloom *bloom)
 			hlist_for_each_entry(b, &list->head, overflow_node) {
 				void *v;
 
+				/* Pairs with smp_store_release in hazptr_release(). */
 				v = smp_load_acquire(&b->slot.addr);
-				if (v && !is_wildcard(v))
+				if (watch && (v == watch || is_wildcard(v))) {
+					raw_spin_unlock_irqrestore(&list->lock, flags);
+					return true;
+				}
+				if (bloom && v && !is_wildcard(v))
 					hazptr_bloom_add(bloom, v);
+				else if (v && is_wildcard(v) && wildcard)
+					*wildcard = true;
 			}
 			raw_spin_unlock_irqrestore(&list->lock, flags);
 		}
 	}
+
+	return false;
 }
 
-/* Need is_wildcard for the Bloom filter */
 /*
  * Shared scan: batch concurrent hazptr_synchronize() callers into a
  * single kthread-driven scan, avoiding redundant per-CPU and
@@ -416,28 +436,32 @@ static void hazptr_scan_do_cycle(void)
 	}
 
 	/*
-	 * Walk all slots and record observed addresses into the
+	 * Scan all slots: record observed addresses into the
 	 * Bloom filter, then complete waiters whose address is
 	 * not present.  On the try_acquire fast path, readers
 	 * publish their target directly (no wildcard transient),
-	 * so a single pass suffices.
+	 * so a single pass suffices for per-CPU slots.
 	 */
-	hazptr_scan_walk(&hazptr_scan.bloom);
+	{
+		bool wildcard;
 
-	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
-		if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
-			list_move(&w->node, &done);
+		hazptr_scan_walk(NULL, &hazptr_scan.bloom, &wildcard);
+		/*
+		 * A wildcard in an overflow-list slot is a slow-path
+		 * acquire in flight: that slot can resolve to any
+		 * address after the walk, so defer completion
+		 * decisions to the next cycle.
+		 */
+		if (!wildcard)
+			/* Complete waiters whose address is not in the filter. */
+			list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+				if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
+					list_move(&w->node, &done);
+			}
 	}
 
 	mutex_unlock(&hazptr_phase_lock);
 
-	/* Waiters still blocked: their address was observed present. */
-	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
-		hazptr_scan_cpu_slots(w->addr);
-		hazptr_scan_overflow_list_all(w->addr);
-		list_move(&w->node, &done);
-	}
-
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
@@ -496,8 +520,6 @@ core_initcall(hazptr_scan_init);
  */
 void hazptr_synchronize(void *addr)
 {
-	unsigned int scan_list_phase;
-
 	/*
 	 * Busy-wait should only be done from preemptible context.
 	 */
@@ -521,18 +543,8 @@ void hazptr_synchronize(void *addr)
 	}
 
 	guard(mutex)(&hazptr_phase_lock);
-
-	/* Scan per-CPU slots. */
 	hazptr_scan_cpu_slots(addr);
-
-	/*
-	 * Scan overflow lists *after* scanning per-CPU slots. See
-	 * hazptr_promote_to_backup_slot() for scan ordering requirement.
-	 */
-	scan_list_phase = flip_list_phase(hazptr_overflow_list_phase);
-	hazptr_scan_overflow_list_period(addr, scan_list_phase);
-	WRITE_ONCE(hazptr_overflow_list_phase, scan_list_phase);	/* Flip the current list phase. */
-	hazptr_scan_overflow_list_period(addr, flip_list_phase(scan_list_phase));
+	hazptr_scan_overflow_list_all(addr);
 }
 EXPORT_SYMBOL_GPL(hazptr_synchronize);
 
-- 
2.43.0

