Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111513E5585
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033460; cv=none; b=pECK+0b6zONMusN7SgoTMabh652hqlysi0Lns2yQp39a63j7q8K942WRCLFqmGCtPxbVTmvYt1S11RTUwdA8GXBVuYKvUf0rD0+Mw14T8og51EyREgVzZrOXloDr+8P6BELVuEbUIF80nM3N9DB+XT6PqgV/rFcPDgWfunHq9WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033460; c=relaxed/simple;
	bh=6pTbLyujulLWUYG01436SvB+x/PQR2vhTC8I2dX7k/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwwvwEQUkhW/i5S0vlIggV6mPmJv2hi43jfs5561CFuEHb9eWRMyB+xtaLREtDL/2ESU7XHKRa9Wb/uhGwWk1MaY91ugZK0X9Eux3jCi7DhlT3tDD9BJ42Xwc2uIFrWQ1RDCA7PfjWqdTNzG5kLbUHn3WA5m5bkG+sxdsBSlYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFn+6mkV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFn+6mkV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38f620399a0so3695831a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 23:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787033458; x=1787638258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DOBdbjG7wg0kpAdHn038dSyaMR4LfRYkZkjGzLFsJjk=;
        b=dFn+6mkV+9gAQCEW/+EE8jzGTekb5Gwgb80KhwdeqjuH6IKalJqExIP2KmcjfDvPbD
         dKbNPXAZXHXk7S2VeOEFPyDyfas3HA8te80QA97UIsQSzA2fh/5/TTD3YzsbkNoREzPL
         //zVKvA1HjVePNpOOBVn2u+K3fygHnLMevIyr9BJ0KkA9iMxVsVp/8vKhCWAKv7ojCMT
         fVU4REJwCbvtq3HSrj8FcEPm55H1HkG6MPdLjWLzoAqvhtruZDtvESGU/LS3lbPutnGs
         sLrWX8k84lb41XV1H0xvVlnWKcAhAxLkT/83OYqp/DSSJtYK2sEB689VJGS53G7iYWXR
         fXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033458; x=1787638258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOBdbjG7wg0kpAdHn038dSyaMR4LfRYkZkjGzLFsJjk=;
        b=XsuU58FS72dcB1SPbAlGGY7diP1GNG0sFqMMg+vHikE/tVHW489+UvQKuxptYTChKw
         ghA939wdMScYpS/gzWVTJihy4FNVWnwtNYnkUeMgdkffPx0fFeAKrs/ypfyLL9aamTpe
         f1+/82de/k+mT9Ap/MzM96Iwjv+YkSb4BrQbtmd5JP/yupqXazvlMemPMkFgATYByGHW
         aqm19fuL6lfj0FUQrZ1K5P/6TMn36BF3l48A2Q2OcWlW9mwB+YNScc0Jj6x6wHDBX4BJ
         s8H13JXh3xuXsmViBj1k0cRSw+IkfssKN1+AJZvAdHIl7CGGLQokbYIOwKYzONo1IIK/
         zdfg==
X-Forwarded-Encrypted: i=1; AHgh+RpRB4znKqmHJag7BE5mvhicL0lcyCA9Ld5IVwCqsN/1OsrXIBLFYP2/QaKRHkqBIrIABW5qmi/ILfU2alzaO24=@vger.kernel.org
X-Gm-Message-State: AOJu0YztIRBy6fZyFPDhjlxyV1+p+X6Ft5LLPkKF2J3Y6iiFZWRTU0o1
	FyCSG/6jIPheCe0ZNUPyqoCWa6Vn36FvohPUnpfmZRPy+TNCjgsVfC1u
X-Gm-Gg: AR+sD10YWx1t9lxHu3Qsph6KH6E/5Ei91zQL6yhkKvdDC4ki2IhjQPtf5yoi+YpcJdx
	OddrEqMn7Ia/pcPSmNqQ8SMwHRnzjLCAIkSrNReXggStDauN2E0UhagaA2pMbOUdNhSboGWQnqr
	EK4wX5ShM1UEEJMbqUH9vQD2Yx3QuPzVyvweQmGrIF6yu2vZ4xMiEx66fSFDK27p/P/Jsbgt6fn
	jEAXF1jbZrfHiEz48vEQZFlqHYSBcNppCGW5IbINauZHNg1r6iyNqZKRmwa/1YXmnAhARKkAH2q
	5XPIUjduJyhqjgYFmhX5mNcFWAkektLW5x3WlVH8b/2QecuWOhFChZmCwQzikJ3nyDUq5ObV/ft
	+szwQwlHhR4Hr99zo5UxfnOtbiAvnDGLzfZVXvsC3Ot7SaSdPjIrytzZCRn8ToitVPcMrrK3bv4
	PqyGjna6huuE5xpUaSlMzyjQUsKGVxo/DUDKMzEVbjElb6s5sFMq35ddKbl7ZLA7h8gUEzqgiCY
	3glLZY=
X-Received: by 2002:a17:90b:5685:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-3955a799fcdmr8128358a91.11.1787033458228;
        Mon, 17 Aug 2026 23:10:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bf94sm4633942a91.9.2026.08.17.23.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:10:57 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	shuah@kernel.org,
	lianux.mm@gmail.com,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [RFC PATCH 2/7] mm/damon/perf: implement observe API and per-CPU statistics engine
Date: Tue, 18 Aug 2026 14:10:26 +0800
Message-ID: <20260818061031.827057-3-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818061031.827057-1-kunwu.chan@linux.dev>
References: <20260818061031.827057-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

Implement the observe_*() core: per-CPU monotonic counters, the
event-lifecycle hooks with lazily-allocated per-event per-CPU state
alongside the global per-CPU stage, NMI-safe sample classification,
ring enqueue/dequeue/peak, match/miss/update, and framework init.  The
global per-CPU stage advances monotonically so a late create/bind/
enable cannot regress a CPU that is already RUNNING.

damon_perf_observe_sample() records the execution context
(process/softirq/hardirq/NMI) so overflow callbacks can be verified to
fire in the expected context.

Co-developed-by: Lian Wang <lianux.mm@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/damon/perf/Makefile |   2 +
 mm/damon/perf/stats.c  | 295 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 297 insertions(+)
 create mode 100644 mm/damon/perf/stats.c

diff --git a/mm/damon/perf/Makefile b/mm/damon/perf/Makefile
index cc0d4f1d1d28..5c46d3da7ef8 100644
--- a/mm/damon/perf/Makefile
+++ b/mm/damon/perf/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Observability: per-CPU counters, tracepoints, debugfs perf_stats
+obj-$(CONFIG_DAMON_PERF_OBSERVE)	+= damon-perf.o
+damon-perf-objs			:= stats.o
diff --git a/mm/damon/perf/stats.c b/mm/damon/perf/stats.c
new file mode 100644
index 000000000000..a869f115bb26
--- /dev/null
+++ b/mm/damon/perf/stats.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DAMON Perf Observability — Per-CPU Statistics & Observe API
+ *
+ * All hardware-sampling backends funnel through the observe functions
+ * defined here.  Counters always increment when
+ * CONFIG_DAMON_PERF_OBSERVE=y; tracepoints are guarded by
+ * trace_*_enabled() for zero overhead when ftrace is not attached.
+ *
+ * Per-CPU counters are best-effort: individual u64 writes are atomic
+ * on 64-bit platforms, but no cross-field consistency is guaranteed.
+ * Snapshot reads may race with concurrent writers.  This is debug data
+ * — do not build policy on it.
+ */
+
+#include <linux/cpu.h>
+#include <linux/percpu.h>
+
+#include <trace/events/damon.h>
+
+#include "perf.h"
+
+/*
+ * Per-CPU statistics
+ */
+static DEFINE_PER_CPU(struct damon_perf_stats, damon_perf_stats);
+
+/*
+ * Per-CPU event state for the state machine — the maximum lifecycle
+ * stage ever reached on each CPU (any event).  Set by the NMI
+ * observe_sample() (ENABLED→RUNNING) and by lifecycle functions as a
+ * monotonic "best CPU so far".  Never reset to UNINIT — destroying one
+ * event must not hide that another event is still running on the same
+ * CPU.  Per-event per-CPU state (event->cpu_state) tracks individual
+ * event lifecycle for correctness when multiple events exist.
+ */
+static DEFINE_PER_CPU(int, damon_perf_cpu_state);
+
+/*
+ * Event lifecycle — process context (kdamond / cpuhp callbacks).
+ *
+ * Each event tracks its own per-CPU lifecycle state via
+ * event->cpu_state (allocated on first CREATED, freed on DESTROYED).
+ * The global damon_perf_cpu_state is also advanced (monotonic) so that
+ * debugfs perf_stats shows the "best" stage any event reached on each
+ * CPU.  Diagnostics are emitted via tracepoints, not dmesg.
+ */
+
+/*
+ * Advance the global per-CPU lifecycle state monotonically.  The global
+ * reflects the best stage any event ever reached on this CPU; a late
+ * create/bind/enable must not regress a CPU that is already RUNNING.
+ */
+static void damon_perf_cpu_state_advance(int cpu, int state)
+{
+	int cur = READ_ONCE(per_cpu(damon_perf_cpu_state, cpu));
+
+	if (state > cur)
+		WRITE_ONCE(per_cpu(damon_perf_cpu_state, cpu), state);
+}
+
+void damon_perf_observe_event_created(struct damon_perf_event *event, int cpu)
+{
+	if (!event->cpu_state) {
+		event->cpu_state = alloc_percpu(int);
+		if (!event->cpu_state)
+			return;
+	}
+	*per_cpu_ptr(event->cpu_state, cpu) = DAMON_PERF_STATE_CREATED;
+	damon_perf_cpu_state_advance(cpu, DAMON_PERF_STATE_CREATED);
+}
+
+void damon_perf_observe_event_bound(struct damon_perf_event *event,
+		int cpu, struct perf_event *perf_event)
+{
+	if (event->cpu_state)
+		*per_cpu_ptr(event->cpu_state, cpu) = DAMON_PERF_STATE_BOUND;
+	damon_perf_cpu_state_advance(cpu, DAMON_PERF_STATE_BOUND);
+}
+
+void damon_perf_observe_event_enabled(struct damon_perf_event *event,
+		int cpu, int state, int oncpu)
+{
+	if (event->cpu_state)
+		*per_cpu_ptr(event->cpu_state, cpu) = DAMON_PERF_STATE_ENABLED;
+	damon_perf_cpu_state_advance(cpu, DAMON_PERF_STATE_ENABLED);
+}
+
+void damon_perf_observe_event_disabled(struct damon_perf_event *event,
+		int cpu, int state)
+{
+	/* State unchanged: the event may be re-enabled later. */
+}
+
+void damon_perf_observe_event_destroyed(struct damon_perf_event *event, int cpu)
+{
+	/*
+	 * Reset only this CPU's slot.  The per-CPU array is owned by the
+	 * event as a whole and must NOT be freed here: destroyed() is
+	 * invoked from the per-CPU CPU-offline callback, so freeing the
+	 * whole array on the first offline CPU would leave every other
+	 * still-online CPU with a dangling pointer.  The array is freed
+	 * once by damon_perf_observe_event_free() at event teardown.
+	 */
+	if (event->cpu_state)
+		*per_cpu_ptr(event->cpu_state, cpu) = DAMON_PERF_STATE_UNINIT;
+}
+
+void damon_perf_observe_event_free(struct damon_perf_event *event)
+{
+	if (event->cpu_state) {
+		free_percpu(event->cpu_state);
+		event->cpu_state = NULL;
+	}
+}
+
+/*
+ * Sample observed — NMI-safe.
+ *
+ * The @cpu argument is the CPU the sample fired on; it is passed
+ * through to the tracepoint but stats are always written on the
+ * current CPU via this_cpu_ptr().
+ */
+
+void damon_perf_observe_sample(unsigned long addr, u64 data_src,
+		u64 period, int cpu, u8 reason,
+		u64 sample_flags, u64 sample_type)
+{
+	this_cpu_inc(damon_perf_stats.callback);
+
+	switch (reason) {
+	case 0:
+		this_cpu_inc(damon_perf_stats.sample_valid);
+		break;
+	case 1:
+		this_cpu_inc(damon_perf_stats.sample_null);
+		break;
+	case 2:
+		this_cpu_inc(damon_perf_stats.sample_addr_zero);
+		break;
+	case 3:
+		this_cpu_inc(damon_perf_stats.sample_kernel);
+		break;
+	case 4:
+		this_cpu_inc(damon_perf_stats.sample_invalid_phys);
+		break;
+	}
+
+	/* First callback advances state to RUNNING */
+	if (this_cpu_read(damon_perf_cpu_state) == DAMON_PERF_STATE_ENABLED)
+		this_cpu_write(damon_perf_cpu_state, DAMON_PERF_STATE_RUNNING);
+
+	/*
+	 * Record the execution context so callers can verify whether
+	 * overflow callbacks actually fire in the expected context
+	 * (e.g. NMI for IBS, process for SPE AUX drain).
+	 *
+	 * 0 = process, 1 = softirq, 2 = hardirq, 3 = NMI
+	 */
+	if (trace_damon_perf_sample_enabled())
+		trace_damon_perf_sample(addr, data_src, period, cpu, reason,
+				sample_flags, sample_type,
+				in_nmi() ? 3 : in_hardirq() ? 2 :
+				in_serving_softirq() ? 1 : 0);
+}
+
+/*
+ * Ring operations — enqueue / overflow are NMI-safe
+ */
+
+void damon_perf_observe_ring_enqueue(void)
+{
+	this_cpu_inc(damon_perf_stats.enqueue);
+}
+
+void damon_perf_observe_ring_overflow(int cpu)
+{
+	this_cpu_inc(damon_perf_stats.overflow);
+	if (trace_damon_perf_ring_overflow_enabled())
+		trace_damon_perf_ring_overflow(cpu);
+}
+
+void damon_perf_observe_ring_dequeue(int cpu)
+{
+	per_cpu_ptr(&damon_perf_stats, cpu)->dequeue++;
+}
+
+void damon_perf_observe_ring_peak(unsigned int occupancy)
+{
+	struct damon_perf_stats *st = this_cpu_ptr(&damon_perf_stats);
+
+	if (occupancy > READ_ONCE(st->ring_peak))
+		WRITE_ONCE(st->ring_peak, occupancy);
+}
+
+/*
+ * Matching — process context (kdamond drain loop)
+ */
+
+void damon_perf_observe_match(unsigned long addr, int cpu)
+{
+	per_cpu_ptr(&damon_perf_stats, cpu)->match++;
+}
+
+void damon_perf_observe_miss(unsigned long addr, int cpu, int reason)
+{
+	struct damon_perf_stats *st = per_cpu_ptr(&damon_perf_stats, cpu);
+
+	switch (reason) {
+	case DAMON_REPORT_MISS_TGID:
+		st->miss_tgid++;
+		break;
+	case DAMON_REPORT_MISS_NOREGION:
+		st->miss_region++;
+		break;
+	case DAMON_REPORT_MISS_BOUNDARY:
+		st->miss_boundary++;
+		break;
+	}
+
+	if (trace_damon_perf_report_missed_enabled())
+		trace_damon_perf_report_missed(addr, cpu, reason);
+}
+
+void damon_perf_observe_update(int cpu)
+{
+	per_cpu_ptr(&damon_perf_stats, cpu)->update++;
+}
+
+void damon_perf_observe_drain(unsigned int total, unsigned int matched)
+{
+	if (trace_damon_perf_drain_enabled())
+		trace_damon_perf_drain(total, matched);
+}
+
+/*
+ * Stats accessors (for debugfs)
+ */
+
+/*
+ * Best-effort per-CPU snapshot.  Individual u64 writes are atomic on
+ * 64-bit platforms; no cross-field consistency is guaranteed.  This is
+ * debug data only — do not build policy on it.
+ */
+void damon_perf_stats_snapshot(int cpu, struct damon_perf_stats *dst)
+{
+	struct damon_perf_stats *st = per_cpu_ptr(&damon_perf_stats, cpu);
+
+	*dst = *st;
+	dst->cpu_state = per_cpu(damon_perf_cpu_state, cpu);
+}
+
+void damon_perf_stats_aggregate(struct damon_perf_stats *dst)
+{
+	int cpu;
+
+	memset(dst, 0, sizeof(*dst));
+	dst->cpu_state = DAMON_PERF_STATE_RUNNING; /* start optimistic, take min */
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct damon_perf_stats *st = per_cpu_ptr(&damon_perf_stats, cpu);
+
+		dst->callback		+= st->callback;
+		dst->sample_valid	+= st->sample_valid;
+		dst->sample_null	+= st->sample_null;
+		dst->sample_addr_zero	+= st->sample_addr_zero;
+		dst->sample_kernel	+= st->sample_kernel;
+		dst->sample_invalid_phys += st->sample_invalid_phys;
+		dst->enqueue		+= st->enqueue;
+		dst->dequeue		+= st->dequeue;
+		dst->overflow		+= st->overflow;
+		dst->ring_peak		= max(dst->ring_peak, st->ring_peak);
+		dst->match		+= st->match;
+		dst->miss_tgid		+= st->miss_tgid;
+		dst->miss_region	+= st->miss_region;
+		dst->miss_boundary	+= st->miss_boundary;
+		dst->update		+= st->update;
+		/*
+		 * Aggregate per-CPU state: the pipeline hasn't passed a
+		 * stage until ALL CPUs have passed it, so take the min.
+		 */
+		dst->cpu_state = min_t(int, dst->cpu_state,
+				per_cpu(damon_perf_cpu_state, cpu));
+	}
+	cpus_read_unlock();
+}
+
+/*
+ * Subsystem init
+ */
+
+int damon_perf_framework_init(void)
+{
+	return 0;
+}
-- 
2.43.0

