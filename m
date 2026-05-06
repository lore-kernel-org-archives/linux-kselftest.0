Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421A44E044;
	Wed,  6 May 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072332; cv=none; b=Bw7DK8AjqfmNZjq9Cfl1/ZVbpaFy2YJk3DDaQTVWipWcN8BuedqYtscVOgPt9Ot8yhhsZyJ6G4+yb0VQxpExOtIPst9EdNytJph3vL5Akze+J6gd2OkE1Mu4Gm5sD0kL+sFYcUvC2nH8JQOnpC9/e5gQJGDLFe3dqARDrSvIcNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072332; c=relaxed/simple;
	bh=1//t1UiSD1tR8+vfspZm6iRfOUIZdp28yzjcKy4mlKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RffqUgheJTExSb5mXbNRLUo8rQYZB0WdldDpeDv9uFsN/EKngFCczbDHkg4y+5h/8Y9swFLhi3eYCi+t8JyI/iLjwHUvsBZr7a2/hBjseE6zaZPkSiL1PqhhledqUeqBEWBhBzKbBDkacRPFDW+0Gpu0DPpsMqhfeEYHZLcLS1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=CirBYUWR; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="CirBYUWR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=SkJGOedf0aM8/IeMqaUUafwdx0GucTYJ0nkxHCNK3IU=; b=CirBYUWRDE1tPMN1IJdGTK+moX
	MYX+Qvu9pE+IQMlPV3pCmvCQAANx3l0OyfyX6kQxlE4phQzur5qQrxdWJNLXgMKTAiFjNbGwON3ty
	REASNYAaorfBFBDT8JDal9GNk8ccm8RnBExyL66s4qxH/Z8ZItDoBRVlE4MKadYQPusDyIiT9x6em
	zWR2akK5E5rgcm3DA4YO9k5DydHm0atwtk7wnsp6esErO0EP9HNRYAHMIn07dOwHw+1o599UPc4k6
	iZOCNMYRS7VccKO1rq0xW0IopY16DCeL2hk57kXzt0sWApXdaiUaezsEXj/U4T0IcOCUG2NGdch9P
	2pgxHiQg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wKbpq-003bX8-1W;
	Wed, 06 May 2026 12:58:42 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 06 May 2026 05:58:24 -0700
Subject: [PATCH v3 1/2] mm/kmemleak: dedupe verbose scan output by
 allocation backtrace
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-kmemleak_dedup-v3-1-2d36aafc34da@debian.org>
References: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
In-Reply-To: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=10743; i=leitao@debian.org;
 h=from:subject:message-id; bh=1//t1UiSD1tR8+vfspZm6iRfOUIZdp28yzjcKy4mlKM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp+zr4wIFH7CFobGJ9WhVeD/cZH9p5+/cccNFJo
 GHHr13TAqKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCafs6+AAKCRA1o5Of/Hh3
 bWXlEACjDipbj1q85MG0fw5uigq6W4GKdGmqVHvGmDtkl/uXNYQ2JEgjnVhg7C77XBMJOqdFprs
 q4vdWiWB/6uYe31xJfR6Gag14H91HrYfhoyJqv7dAH1hKYVP8blBgtZyU2N2eULmKjvXYIIpCXr
 YpkOiTMHams5V7tzBUalEpkNIP832npayCyyvi5O/QoF5TrJ6HI3Xxg3IXRw6kChPNaNDoq0sVj
 h1vAFg6hznC6pXgDV2IaJosXjRNe0B3A0dE9x7cv27xic/R8CrEg526FG+54RsloATDrhZDQKsf
 RusuwptrG66RTvSj49ySwaldYgNbEJlqVma8lBvYZk3kDmryC3eM8O9ge83xdkXEvju96S5L3H/
 /E/bRAMZ9Bt0oxyVdqfA0HZzMMXy4X2fBWHaTmMQjvYsRbVLqwvFivaZJ8Ib4/9hrjWy1kzrWDA
 QsJcCJYRUwNW9F/R1delQxAi/Kd7/pU9k/DsdP5XoR0J+G8fehH+DdwQ8ucQQ4NVziY7+bfagj5
 9aBOZSAsWTfb5Fd8Fa6pfoAVjEsUnWq66QLS7/OLkIHnQRVpZ6TOjN55vx3XNIT3uuasbN7WPub
 nfgu9QqF2U8B73ZtC2uKRLT3BDBWdlkeHRbmdrdLTi/0mvHxVS3INBZAcIkEDW2c/qCnWxX/0HB
 MUTBPPaofXx4ygA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

In kmemleak's verbose mode, every unreferenced object found during a
scan is logged with its full header, hex dump and 16-frame backtrace.
Workloads that leak many objects from a single allocation site flood
dmesg with byte-for-byte identical backtraces, drowning out distinct
leaks and other kernel messages.

Dedupe within each scan using stackdepot's trace_handle as the key: for
every leaked object with a recorded stack trace, look up the
representative kmemleak_object in a per-scan xarray keyed by
trace_handle. The first sighting stores the object pointer (with a
get_object() reference) and sets object->dup_count to 1; later
sightings just bump dup_count on the representative. After the scan,
walk the xarray once and emit each unique backtrace, followed by a
single summary line when more than one object shares it.

Leaks whose trace_handle is 0 (early-boot allocations tracked before
kmemleak_init() set up object_cache, or stack_depot_save() failures
under memory pressure) cannot be deduped, so they are still printed
inline via the same locked OBJECT_ALLOCATED-checked helper. The
contents of /sys/kernel/debug/kmemleak are unchanged - only the
verbose console output is collapsed.

Safety notes:

 - The xarray store happens outside object->lock: object->lock is a
   raw spinlock, while xa_store() may grab xa_node slab locks at a
   higher wait-context level which lockdep flags as invalid.
   trace_handle is captured under object->lock (which serialises with
   kmemleak_update_trace()'s writer), so it is safe to use after
   dropping the lock.

 - get_object() pins the kmemleak_object metadata across
   rcu_read_unlock(), but the underlying tracked allocation can still
   be freed concurrently. The deferred print path therefore re-acquires
   object->lock and re-checks OBJECT_ALLOCATED via print_leak_locked()
   before touching object->pointer; __delete_object() clears that flag
   under the same lock before the user memory goes away. The same
   helper is used by the trace_handle == 0 and xa_store() failure
   fallbacks, so every printer in the new path has identical safety
   guarantees.

 - If get_object() fails after we set OBJECT_REPORTED, the object is
   already being torn down (use_count hit zero); the leak count is
   still accurate but the verbose line is dropped, which is correct
   - the memory was freed concurrently and is no longer a leak.

 - If xa_store() fails to allocate an xa_node under memory pressure,
   we fall back to printing inline via print_leak_locked() instead of
   silently dropping the leak.

 - The hex dump is skipped for coalesced entries (dup_count > 1):
   bytes would differ across objects sharing a backtrace anyway, and
   skipping it removes the only remaining read of object->pointer's
   contents in the deferred path. The representative's reported size
   may also differ from the coalesced objects' sizes; the printed
   trace_handle reflects the representative's current value rather
   than the value used as the dedup key, which is normally - but not
   strictly - identical.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 148 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 140 insertions(+), 8 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 2eff0d6b622b6..7c7ba17ce7af0 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -92,6 +92,7 @@
 #include <linux/nodemask.h>
 #include <linux/mm.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>
 #include <linux/crc32.h>
 
 #include <asm/sections.h>
@@ -157,6 +158,8 @@ struct kmemleak_object {
 	struct hlist_head area_list;
 	unsigned long jiffies;		/* creation timestamp */
 	pid_t pid;			/* pid of the current task */
+	/* per-scan dedup count, valid only while in scan-local dedup xarray */
+	unsigned int dup_count;
 	char comm[TASK_COMM_LEN];	/* executable name */
 };
 
@@ -360,8 +363,9 @@ static const char *__object_type_str(struct kmemleak_object *object)
  * Printing of the unreferenced objects information to the seq file. The
  * print_unreferenced function must be called with the object->lock held.
  */
-static void print_unreferenced(struct seq_file *seq,
-			       struct kmemleak_object *object)
+static void __print_unreferenced(struct seq_file *seq,
+				 struct kmemleak_object *object,
+				 bool hex_dump)
 {
 	int i;
 	unsigned long *entries;
@@ -373,7 +377,8 @@ static void print_unreferenced(struct seq_file *seq,
 			   object->pointer, object->size);
 	warn_or_seq_printf(seq, "  comm \"%s\", pid %d, jiffies %lu\n",
 			   object->comm, object->pid, object->jiffies);
-	hex_dump_object(seq, object);
+	if (hex_dump)
+		hex_dump_object(seq, object);
 	warn_or_seq_printf(seq, "  backtrace (crc %x):\n", object->checksum);
 
 	for (i = 0; i < nr_entries; i++) {
@@ -382,6 +387,12 @@ static void print_unreferenced(struct seq_file *seq,
 	}
 }
 
+static void print_unreferenced(struct seq_file *seq,
+			       struct kmemleak_object *object)
+{
+	__print_unreferenced(seq, object, true);
+}
+
 /*
  * Print the kmemleak_object information. This function is used mainly for
  * debugging special cases when kmemleak operations. It must be called with
@@ -1684,6 +1695,103 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
 	put_object(object);
 }
 
+/*
+ * Print one leak inline. The hex dump is gated on OBJECT_ALLOCATED so it
+ * does not touch user memory that was freed concurrently; the rest of the
+ * report (backtrace, comm, pid) is always emitted since the kmemleak_object
+ * metadata is pinned by the caller.
+ */
+static void print_leak_locked(struct kmemleak_object *object, bool hex_dump)
+{
+	raw_spin_lock_irq(&object->lock);
+	__print_unreferenced(NULL, object,
+			     hex_dump && (object->flags & OBJECT_ALLOCATED));
+	raw_spin_unlock_irq(&object->lock);
+}
+
+/*
+ * Per-scan dedup table for verbose leak printing. The xarray is keyed by
+ * stackdepot trace_handle and stores a pointer to the representative
+ * kmemleak_object. The per-scan repeat count lives in object->dup_count.
+ *
+ * dedup_record() must run outside object->lock: xa_store() may take
+ * mutexes (xa_node slab allocation) which lockdep would flag against the
+ * raw spinlock object->lock.
+ */
+static void dedup_record(struct xarray *dedup, struct kmemleak_object *object,
+			 depot_stack_handle_t trace_handle)
+{
+	struct kmemleak_object *rep;
+	void *old;
+
+	/*
+	 * No stack trace to dedup against: early-boot allocation tracked
+	 * before kmemleak_init() set up object_cache, or stack_depot_save()
+	 * failure under memory pressure.
+	 */
+	if (!trace_handle) {
+		print_leak_locked(object, true);
+		return;
+	}
+
+	/* stack is available, now we can de-dup */
+	rep = xa_load(dedup, trace_handle);
+	if (rep) {
+		rep->dup_count++;
+		return;
+	}
+
+	/*
+	 * Object is being torn down (use_count already hit zero); the
+	 * tracked memory at object->pointer is unsafe to read, so skip.
+	 */
+	if (!get_object(object))
+		return;
+
+	object->dup_count = 1;
+	old = xa_store(dedup, trace_handle, object, GFP_ATOMIC);
+	if (xa_is_err(old)) {
+		/* xa_node allocation failed; fall back to inline print. */
+		print_leak_locked(object, true);
+		put_object(object);
+		return;
+	}
+	/*
+	 * scan_mutex serialises all writers to the dedup xarray, so xa_store()
+	 * after a NULL xa_load() must always overwrite an empty slot.
+	 */
+	WARN_ON_ONCE(old);
+}
+
+/*
+ * Drain the dedup table. Re-acquires object->lock and re-checks
+ * OBJECT_ALLOCATED before printing: while get_object() pins the
+ * kmemleak_object metadata, the underlying tracked allocation may have
+ * been freed since the scan walked it (kmemleak_free clears
+ * OBJECT_ALLOCATED under object->lock before the user memory goes away).
+ * The hex dump is skipped for coalesced entries since the bytes would
+ * differ across objects anyway.
+ */
+static void dedup_flush(struct xarray *dedup)
+{
+	struct kmemleak_object *object;
+	unsigned long idx;
+	unsigned int dup;
+	bool coalesced;
+
+	xa_for_each(dedup, idx, object) {
+		dup = object->dup_count;
+		coalesced = dup > 1;
+
+		print_leak_locked(object, !coalesced);
+		if (coalesced)
+			pr_warn("  ... and %u more object(s) with the same backtrace\n",
+				dup - 1);
+		put_object(object);
+		xa_erase(dedup, idx);
+	}
+}
+
 /*
  * Scan data sections and all the referenced memory blocks allocated via the
  * kernel's standard allocators. This function must be called with the
@@ -1694,6 +1802,7 @@ static void kmemleak_scan(void)
 	struct kmemleak_object *object;
 	struct zone *zone;
 	int __maybe_unused i;
+	struct xarray dedup;
 	int new_leaks = 0;
 
 	jiffies_last_scan = jiffies;
@@ -1834,10 +1943,18 @@ static void kmemleak_scan(void)
 		return;
 
 	/*
-	 * Scanning result reporting.
+	 * Scanning result reporting. When verbose printing is enabled, dedupe
+	 * by stackdepot trace_handle so each unique backtrace is logged once
+	 * per scan, annotated with the number of objects that share it. The
+	 * per-leak count below still reflects every object, and
+	 * /sys/kernel/debug/kmemleak still lists them individually.
 	 */
+	xa_init(&dedup);
 	rcu_read_lock();
 	list_for_each_entry_rcu(object, &object_list, object_list) {
+		depot_stack_handle_t trace_handle;
+		bool dedup_print;
+
 		if (need_resched())
 			kmemleak_cond_resched(object);
 
@@ -1849,18 +1966,33 @@ static void kmemleak_scan(void)
 		if (!color_white(object))
 			continue;
 		raw_spin_lock_irq(&object->lock);
+		trace_handle = 0;
+		dedup_print = false;
 		if (unreferenced_object(object) &&
 		    !(object->flags & OBJECT_REPORTED)) {
 			object->flags |= OBJECT_REPORTED;
-
-			if (kmemleak_verbose)
-				print_unreferenced(NULL, object);
-
+			if (kmemleak_verbose) {
+				trace_handle = object->trace_handle;
+				dedup_print = true;
+			}
 			new_leaks++;
 		}
 		raw_spin_unlock_irq(&object->lock);
+
+		/*
+		 * Defer the verbose print outside object->lock: xa_store()
+		 * may take xa_node slab locks at a higher wait-context level
+		 * which lockdep would flag against the raw_spinlock_t
+		 * object->lock. rcu_read_lock() keeps the kmemleak_object
+		 * alive across the call.
+		 */
+		if (dedup_print)
+			dedup_record(&dedup, object, trace_handle);
 	}
 	rcu_read_unlock();
+	/* Flush'em all */
+	dedup_flush(&dedup);
+	xa_destroy(&dedup);
 
 	if (new_leaks) {
 		kmemleak_found_leaks = true;

-- 
2.52.0

