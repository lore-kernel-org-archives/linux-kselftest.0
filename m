Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BABE313E31;
	Fri,  8 May 2026 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778278651; cv=none; b=fA0RVbxMRbTA9Y5jWoYs/3poyjptFwK8NEl3Sz10TMUbLUJR+vyxmJFjv1FfkKaMG0hhXEh71eyEf8pAFWEI3wr5DGqsAHiU9mCAUBiouIl70f5xI+nMvx4ExyJS/NCh3y8bki6GPv/YAoiQ/PBRQObLqnlzNlNCVuL1uDHjFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778278651; c=relaxed/simple;
	bh=ogzMc2HnWA6Fl9VQJKS6hplq8PjQCqBpKSJZksIJBvY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sUE2P4M1bmxcHMh6KI8PoXWu/z4pN45UfGW1nx6pMVkEU7SRVvaCbK2T+Mc+eTIoJiVJErfjbvcDcBjryzhayEdWMkNrDyFUq13hcQX2qm2m1W6Sv1lFqGvDM2iqeI+msGfOhzvc1wOUrilMMTlSpeFM+lBgi/WTuI0np+IH2Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C69JblI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C69JblI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3ACC2BCB0;
	Fri,  8 May 2026 22:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778278650;
	bh=ogzMc2HnWA6Fl9VQJKS6hplq8PjQCqBpKSJZksIJBvY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C69JblI1AIi/KI8VBmMJ963aaFKRyR5DT/nyFs+XsLBwqtIeTo/OgBq4s89mkptk8
	 MzGaMhnvnBhKwu6DAznvLBUhVmVtgrU9vCzQgfa3zSsbo0+BEiow1wayyxVWrKGfwe
	 rb/zKQpQO6EVl6hn9Z6da0fJHOv4xdoVzOVf25AY=
Date: Fri, 8 May 2026 15:17:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 0/2] mm/kmemleak: dedupe verbose scan output
Message-Id: <20260508151729.682551a2b2739e8b5d15ade2@linux-foundation.org>
In-Reply-To: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
References: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 06 May 2026 05:58:23 -0700 Breno Leitao <leitao@debian.org> wrote:

> In this version, I am not touching the kernel code, but, just fixing
> the selftest, as sashiko reported some issues, and I am addressing them
> in here.
> 
> https://sashiko.dev/#/patchset/20260424-kmemleak_dedup-v2-0-8bea649b2a92%40debian.org
> 
> NOTE: Additional testing has revealed that lockdep detects a potential lock
> inversion issue on kmemleak and legacy console.
> 
> The problem occurs because the function holds &object->lock (a raw spinlock)
> while invoking printk to report the leak. This printk requires the legacy
> console_owner lock, which remains in active use despite the ongoing transition
> to the nbcon framework.
> 
> Concurrently, console drivers such as hvc (hypervisor virtual console) acquire
> the console_owner lock and may subsequently free memory. This kfree() operation
> calls into kmemleak's __delete_object(), which in turn acquires object->lock.
> 
> Although these code paths hold locks from different object instances, lockdep
> operates on lock classes rather than individual instances. Since all
> kmemleak_object->lock instances belong to the same lock class, lockdep
> identifies this as a circular dependency, even though the actual deadlock
> scenario cannot occur in practice (?!).
> 
> This problem was not introduced by this patchset/selftest, but, it is exposing
> it. I plan to solve it once this patchset is done.

None of the above is usable for a [0/N] - it all pertains to the
ongoing development process and should formally be below the ^---$
separator.  Because it isn't relevant to the permanent kernel record.

The v2 series had a nice cover letter, so I stole that.  Please check
that the below remains the truth, the whole truth, etc.




From: Breno Leitao <leitao@debian.org>
Subject: mm/kmemleak: dedupe verbose scan output by allocation backtrace
Date: Wed, 06 May 2026 05:58:24 -0700

Patch series "mm/kmemleak: dedupe verbose scan output", v3.

I am starting to run with kmemleak in verbose enabled in some "probe
points" across the my employers fleet so that suspected leaks land in
dmesg without needing a separate read of /sys/kernel/debug/kmemleak.

The downside is that workloads which leak many objects from a single
allocation site flood the console with byte-for-byte identical backtraces.
Hundreds of duplicates per scan are common, drowning out distinct leaks
and unrelated kernel messages, while adding no signal beyond the first
occurrence.

This series collapses those duplicates inside kmemleak itself.  Each
unique stackdepot trace_handle prints once per scan, followed by a short
summary line when more than one object shares it:

  kmemleak: unreferenced object 0xff110001083beb00 (size 192):
  kmemleak:   comm "modprobe", pid 974, jiffies 4294754196
  kmemleak:   ...
  kmemleak:   backtrace (crc 6f361828):
  kmemleak:     __kmalloc_cache_noprof+0x1af/0x650
  kmemleak:     ...
  kmemleak:   ... and 71 more object(s) with the same backtrace

The "N new suspected memory leaks" tally and the contents of
/sys/kernel/debug/kmemleak are unchanged - the per-object detail is still
available on demand, only the verbose (dmesg) output is collapsed.

Patch 1 is the kmemleak change.

Patch 2 adds a selftest that loads samples/kmemleak's CONFIG_SAMPLE
kmemleak-test module to generate ten leaks sharing one call site and
checks that the printed count is strictly less than the reported leak
total.  Not sure if Patch 2 is useful or not, if not, it is easier to
discard.


This patch (of 2):

In kmemleak's verbose mode, every unreferenced object found during a scan
is logged with its full header, hex dump and 16-frame backtrace. 
Workloads that leak many objects from a single allocation site flood dmesg
with byte-for-byte identical backtraces, drowning out distinct leaks and
other kernel messages.

Dedupe within each scan using stackdepot's trace_handle as the key: for
every leaked object with a recorded stack trace, look up the
representative kmemleak_object in a per-scan xarray keyed by trace_handle.
The first sighting stores the object pointer (with a get_object()
reference) and sets object->dup_count to 1; later sightings just bump
dup_count on the representative.  After the scan, walk the xarray once and
emit each unique backtrace, followed by a single summary line when more
than one object shares it.

Leaks whose trace_handle is 0 (early-boot allocations tracked before
kmemleak_init() set up object_cache, or stack_depot_save() failures under
memory pressure) cannot be deduped, so they are still printed inline via
the same locked OBJECT_ALLOCATED-checked helper.  The contents of
/sys/kernel/debug/kmemleak are unchanged - only the verbose console output
is collapsed.

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

Link: https://lore.kernel.org/20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org
Link: https://lore.kernel.org/20260506-kmemleak_dedup-v3-1-2d36aafc34da@debian.org
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/kmemleak.c |  148 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 140 insertions(+), 8 deletions(-)

--- a/mm/kmemleak.c~mm-kmemleak-dedupe-verbose-scan-output-by-allocation-backtrace
+++ a/mm/kmemleak.c
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
 
@@ -360,8 +363,9 @@ static const char *__object_type_str(str
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
@@ -373,7 +377,8 @@ static void print_unreferenced(struct se
 			   object->pointer, object->size);
 	warn_or_seq_printf(seq, "  comm \"%s\", pid %d, jiffies %lu\n",
 			   object->comm, object->pid, object->jiffies);
-	hex_dump_object(seq, object);
+	if (hex_dump)
+		hex_dump_object(seq, object);
 	warn_or_seq_printf(seq, "  backtrace (crc %x):\n", object->checksum);
 
 	for (i = 0; i < nr_entries; i++) {
@@ -382,6 +387,12 @@ static void print_unreferenced(struct se
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
@@ -1685,6 +1696,103 @@ unlock_put:
 }
 
 /*
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
+/*
  * Scan data sections and all the referenced memory blocks allocated via the
  * kernel's standard allocators. This function must be called with the
  * scan_mutex held.
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
_

