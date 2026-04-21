Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB43D7D97;
	Tue, 21 Apr 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776780823; cv=none; b=FbmVFkSKuJvXWTL/xH8vmCa90cxVpBmwYkPp0e+rE+DJO4uH5U9tPea0RvbC5QPreayVYg3Ea1IJNi/Cj3FYr+JDHBh2V0y1LsE0fsql2Sq85nAHi33yZsiJ0c5TuZC5J3/kShufuYwuL0034+g5SF4HW3+3QpzbZAwo0bvIeOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776780823; c=relaxed/simple;
	bh=Z5xsKdbb1dj+8VU85SeZGqxL3277Mj5PEYA3E5O0VIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQmesqWW7t8RLcl+ZtdcqvNLMXHmsJWsa9TDm2GGB7NWh3xGMp6vpGfvgh8gMxpPeKhtdxxuZNKC09iXnuinM7XPqC/alROlm7KTtw8yH6o2XS2ia2V/Jsjrfh+avGarA5fzJrFyaBvkks/O8X1KwUAn/hR1jGmGScTU5iIBDYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Kz/rPGIC; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Kz/rPGIC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=hlUmsxjaOV8fnPvProkr8mAom/iLkQvq+HSacis3lno=; b=Kz/rPGICFxDLyCRvV90jgpuPDu
	kjBYcjuaD6NPfHMmE/1m0wqt4y5k3Q1h3l/7pRyye5a9qyWQtkwEqMcsao9BKI1N+Ehbv8Uhj/KBk
	y9KVDUv3vFcA9AaEZlKMynxrrvJ2Inc/7YDeRf6/52Ul5IIOyZ4/0khvM1d6XxUYwPmgQic4CBSK3
	Mt3zucxcoZPXJCuB6ocJTmEwmtPLQt3EYAljcsPnRmoJdNoVklsKOQhtuffGbWD31U5UPdOMhrG7h
	3eTMHuRll7QKm/8QN+74/U+7dWVh4aKE3aoMMgxJwaKnEbrLoAGSPdanip+mAPKEMsbdlPBLujrdr
	BjTj7kng==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wFBPm-000tUc-2j;
	Tue, 21 Apr 2026 13:45:23 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 21 Apr 2026 06:45:04 -0700
Subject: [PATCH 1/2] mm/kmemleak: dedupe verbose scan output by allocation
 backtrace
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-kmemleak_dedup-v1-1-65e31c6cdf0c@debian.org>
References: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
In-Reply-To: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=6885; i=leitao@debian.org;
 h=from:subject:message-id; bh=Z5xsKdbb1dj+8VU85SeZGqxL3277Mj5PEYA3E5O0VIk=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp539pHvLkqwsjZdrAzwLbngpwIt+uSSJa+hscd
 vA0i5jPifmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaed/aQAKCRA1o5Of/Hh3
 bbOIEACBYq4GRdQmktMUMzjqE5ShlIz8N7Qn+Za1YtGsepw7W330xwHkDDcLifcOSTzzUCDhg+B
 pbLcnEjQ/uXOtUDJLSVDMMYj2CmaOegwzDirJNhN7CRbDm22mxE+zJERoYANCgjWgDFNRzWIHdA
 XzGWWxOlZRWcOxPTfSTDSk3gKQvjtzy/vSF4BxQo6PBDcOJXdy/9vKBWqjXASjwPQ8x3TL676Yz
 3msodUO8fnglsbuY189K2iO9KkMySW4Tdb6Te/NoUsRtTS0LrOGJyFUh2BUtAb7YGGmblsTNHbM
 mwJ+DUGNbTQvpLfhR1wSLTjhpOyGOXMUA6Ka4s8qZlNGsdOoGu+iVhQN+pC0UQZ6/aUKo5mJY+p
 wwtXSrnQl/Coul0EPOJX332xd553GiFo5YIehv3lrlTz9eeOrwo1ucggto0rB6T5igdyKfANztr
 ThPQAIc+Hhw09ZMimNOwjB+X10U2DlbJR5V9t5q+kTtBKk8pO8Oy8ZGmYcTbFpQSOdzGPczb3Kj
 owng1CZxzk6rsZEBwV6butKtr7QyjSItXch7iNSdlUVpCjikE4/HSGT0p1P0TNZof/Y0SwI34oa
 tvRPfwL/jvZ+awi2sO2xPnX7c7T76iPkRXIWNa94x9oX6pW2llrFeyyW3PBkpXI7drmFfYtTkkc
 h7a2ayAs5VWueow==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

In kmemleak's verbose mode, every unreferenced object found during
a scan is logged with its full header, hex dump and 16-frame backtrace.
Workloads that leak many objects from a single allocation site flood
dmesg with byte-for-byte identical backtraces, drowning out distinct
leaks and other kernel messages.

Dedupe within each scan using stackdepot's trace_handle as the key: for
every leaked object, look up an entry in a per-scan xarray keyed by
trace_handle. The first sighting stores a representative object; later
sightings just bump a counter. After the scan, walk the xarray once and
emit each unique backtrace, followed by a single summary line when more
than one object shares it.

Important to say that the contents of /sys/kernel/debug/kmemleak are
unchanged - only the verbose console output is collapsed.

Note 1: The xarray operations and kmalloc(GFP_ATOMIC) for the dedup
entry must happen outside object->lock: object->lock is a raw spinlock,
while the slab path takes higher wait-context locks (n->list_lock),
which lockdep flags as an invalid wait context. trace_handle is read
under object->lock, which serialises with kmemleak_update_trace()'s
writer, so it is safe to capture and use after dropping the lock.

Note 2: Stashed object pointers carry a get_object() reference across
rcu_read_unlock() that dedup_flush() drops after printing, preventing
use-after-free if the underlying allocation is freed concurrently.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 2eff0d6b622b6..046847d372777 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -92,6 +92,7 @@
 #include <linux/nodemask.h>
 #include <linux/mm.h>
 #include <linux/workqueue.h>
+#include <linux/xarray.h>
 #include <linux/crc32.h>
 
 #include <asm/sections.h>
@@ -1684,6 +1685,82 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
 	put_object(object);
 }
 
+/*
+ * Per-scan dedup table for verbose leak printing. Each entry collapses all
+ * leaks that share one allocation backtrace (keyed by stackdepot
+ * trace_handle) into a single representative object plus a count.
+ */
+struct kmemleak_dedup_entry {
+	struct kmemleak_object *object;
+	unsigned long count;
+};
+
+/*
+ * Record a leaked object in the dedup table. The representative object's
+ * use_count is incremented so it can be safely dereferenced by dedup_flush()
+ * outside the RCU read section; dedup_flush() drops the reference. On
+ * allocation failure (or a concurrent insert) the object is printed
+ * immediately, preserving today's "always log every leak" guarantee.
+ * Caller must not hold object->lock and must hold rcu_read_lock().
+ */
+static void dedup_record(struct xarray *dedup, struct kmemleak_object *object,
+			 depot_stack_handle_t trace_handle)
+{
+	struct kmemleak_dedup_entry *entry;
+
+	entry = xa_load(dedup, trace_handle);
+	if (entry) {
+		/* This is a known beast, just increase the counter */
+		entry->count++;
+		return;
+	}
+
+	/*
+	 * A brand new report. Object will have object->use_count increased
+	 * in here, and released put_object() at dedup_flush
+	 */
+	entry = kmalloc(sizeof(*entry), GFP_ATOMIC);
+	if (entry && get_object(object)) {
+		if (xa_insert(dedup, trace_handle, entry, GFP_ATOMIC) == 0) {
+			entry->object = object;
+			entry->count = 1;
+			return;
+		}
+		put_object(object);
+	}
+	kfree(entry);
+
+	/*
+	 * Fallback for kmalloc/get_object(): Just print it straight away
+	 */
+	raw_spin_lock_irq(&object->lock);
+	print_unreferenced(NULL, object);
+	raw_spin_unlock_irq(&object->lock);
+}
+
+/*
+ * Drain the dedup table: print one full record per unique backtrace,
+ * followed by a summary line whenever more than one object shared it.
+ * Releases the reference dedup_record() took on each representative object.
+ */
+static void dedup_flush(struct xarray *dedup)
+{
+	struct kmemleak_dedup_entry *entry;
+	unsigned long idx;
+
+	xa_for_each(dedup, idx, entry) {
+		raw_spin_lock_irq(&entry->object->lock);
+		print_unreferenced(NULL, entry->object);
+		raw_spin_unlock_irq(&entry->object->lock);
+		if (entry->count > 1)
+			pr_warn("  ... and %lu more object(s) with the same backtrace\n",
+				entry->count - 1);
+		put_object(entry->object);
+		kfree(entry);
+		xa_erase(dedup, idx);
+	}
+}
+
 /*
  * Scan data sections and all the referenced memory blocks allocated via the
  * kernel's standard allocators. This function must be called with the
@@ -1834,10 +1911,19 @@ static void kmemleak_scan(void)
 		return;
 
 	/*
-	 * Scanning result reporting.
+	 * Scanning result reporting. When verbose printing is enabled, dedupe
+	 * by stackdepot trace_handle so each unique backtrace is logged once
+	 * per scan, annotated with the number of objects that share it. The
+	 * per-leak count below still reflects every object, and
+	 * /sys/kernel/debug/kmemleak still lists them individually.
 	 */
+	struct xarray dedup;
+
+	xa_init(&dedup);
 	rcu_read_lock();
 	list_for_each_entry_rcu(object, &object_list, object_list) {
+		depot_stack_handle_t trace_handle;
+
 		if (need_resched())
 			kmemleak_cond_resched(object);
 
@@ -1849,18 +1935,41 @@ static void kmemleak_scan(void)
 		if (!color_white(object))
 			continue;
 		raw_spin_lock_irq(&object->lock);
+		trace_handle = 0;
 		if (unreferenced_object(object) &&
 		    !(object->flags & OBJECT_REPORTED)) {
 			object->flags |= OBJECT_REPORTED;
 
 			if (kmemleak_verbose)
-				print_unreferenced(NULL, object);
+				trace_handle = object->trace_handle;
 
 			new_leaks++;
 		}
 		raw_spin_unlock_irq(&object->lock);
+
+		/*
+		 * Dedup bookkeeping must happen outside object->lock.
+		 * dedup_record() may call kmalloc(GFP_ATOMIC), and the slab
+		 * path takes locks (n->list_lock, etc.) at a higher
+		 * wait-context level than the raw_spinlock_t object->lock;
+		 *
+		 * Passing object without object->lock here is safe:
+		 *  - the surrounding rcu_read_lock() keeps the memory alive
+		 *    even if a concurrent kmemleak_free() drops use_count to
+		 *    zero and queues free_object_rcu();
+		 *  - dedup_record() only manipulates use_count via the atomic
+		 *    get_object()/put_object() helpers and stores the bare
+		 *    pointer into the xarray;
+		 *  - on the fallback print path it re-acquires object->lock
+		 *    before calling print_unreferenced().
+		 */
+		if (trace_handle)
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

