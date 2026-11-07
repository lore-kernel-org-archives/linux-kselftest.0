Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030730;
	b=siCuNZNYWHT5N47JxuBpuPjUxREsGmDoQEjdttD6+b982QlxrJjHLwXMTs3EkYbU8VV9
	 BTJf0TUEdP5CAKKun/mb9NzXFZXYq74refe/8Ye7FwbYvebtdhqfb7k4KZaWVwwda6cuV
	 zr/mpigRhmFc4uXbLf4ltpFcjX+UdaCOmPAP6JW1K5FKgyP7/TFG/quV6rI82Hzv79kz/
	 UMlB9c4e51ng3bQIfK61E1rz0O8IONQ9RG025vMgOmNwCUXTRgkcZQGX1OGDdk5V/Xnhp
	 /5+2xu6KeO15UauxTly6ObmPszMt5/GTsEoBNRFnYuQaNSI8lxmOj5Nv6vMM1MpgIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OFqRzNE7c/9ftDw44+RvgDz2QlrmmPPw6Nalq+0fH5U=;
	b=u52p9tTr8JxsVd+a1FYHd8oDfVP2nsd3iLKQ2NJOJcH5BXAQzKHtiaamin0HYvwvqcda
	 kQZ/Lis5rI2nnQaF5xaYr+3posRsIlpM+IHsNTYFHjqMV8LkCS2QXJRkubGT7jAZ1Lbvc
	 tJgtar/BGfcGC7fDMezICn7abnpZ5CGXAs8bQqFHOHINBcp9eSwRW2rHUxHsIN2oAP8b3
	 zslz/Tcf5DT/wR9fFlbquaiAArH5tE2M33jYa03RFKL/lVm9RE8Vow7f6hLKObplp4RJ/
	 1OJaavo15M34M6RAqp/DYz7Ug7XiHVClmIGRHSQRZ28D3zEhO3/pDjLXIzYwZGuqVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4WDVBng;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A07606A32E
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 05:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A07606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4WDVBng
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed08b07213so5211455ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 21:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030729; x=1794635529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFqRzNE7c/9ftDw44+RvgDz2QlrmmPPw6Nalq+0fH5U=;
        b=j4WDVBngxZYRef12ufkeoRP/TLMECt+22kfF8Y0TjSR6f/uR3Qwe/+jJPEsVd4HI5i
         Exk6VzR0VvkCO+cfdaEggvv7sEcI51LJPq0gkbl8TL2OrWL88RMvS1ptP6ajHx133mKj
         NyMFVgD8LQt2RYQHBShK5eojEnm2Vt/hf8KBjJSjfyP6l5ia3AfrEA3K8dB4Y9vMHzak
         yKjYkCWX80WCrUgEsKu5ixT7BLjT19zD68kZq1vw4MzAwMigRdXev6dxGffC6/MsTzrj
         QIsq800rdY61w7S8YcYEnh/ZITbncTmTOhR09U3wWJIXveoj29YYDJRGUhrMaK6IzwMo
         fErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030729; x=1794635529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFqRzNE7c/9ftDw44+RvgDz2QlrmmPPw6Nalq+0fH5U=;
        b=GarcNSQqeJd1CmFAVIwy+6cLimKbGHm5lgshJCFjfpKQIZMXy0r2sQHXI3TZ0FAVQl
         ONlCC6dxO1i4pEaTlEsb0czt2MjFxR6wtD/Wy8Oo6zyl5jjiWSaELK/6mH8wOOEhK7Cy
         //5Tn6+vlg/EgHE9LmbAxioErHg6OGBpW6OHHEmCz922ZVj+C8MxQuAbPrapKwDATQ4/
         n/w05z9fxoYh/8c2emtrmzH2bkjCm7UuDv/S4mSTnD95AqZTPW1wrMKoJDHj/0q7G9R2
         lQ54DDKOy7Z2FqJg73Vwx6hnJyTPS4MxAprDGNbSp47RzbZEvmTOlQYdIWPOFxFNwwJw
         pUKQ==
X-Forwarded-Encrypted: i=1; AL+hErEMw4CwrnoCbsr/eVex+idbZkmCcohz/8yVERowSReBBtq8C7hMwyhOakRYVmEyUMa3YuIi9ukf5q/4Tft2+CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z82X64sKupPysrigxtoWqGrkIMPM3w3ctiqs+yijXaM+HuPsBAL
	fWbFzfqbdUMLCZjmKq/+rfmb4h/mN6WGsCErexSy/PcsCLd8Le4RqQhP
X-Gm-Gg: AYBFou3seOruPfAgJrltICdtc1K/enLjYmwbHgDw6xVyeGvSsotbzBckBksAtW1AtAb
	yD2mjuWWml+i50HPGZiDrtDF9eGXf/U+Ew8DqVktp+F55q39WmKrlkikaQqZRBjcxlKloDXyMD/
	s9vG9cG6vFkXn/MRYX8RVJyWbOnH9J0WnSqLLrphjHtZ/1fz3Dke27bmyWr8gxAfvy//ZZFVWrw
	CctF2OTx0TNMYYowZtK5CWdsLuv7++16PbtYOzslZlCIuHjWbCs7Ick2tTQI4bFEN+Wml9fUWVq
	ReBJDUWaYIBJIt4pDuUWWMIWEqS3b8Nb+nHziPCDMDtaYUcmuWSjUlc6YzqH2OZ7qqT6gVYHhNA
	wJKJKnTpnMIdAl74k0ZVNrSm28iqN2R19ykF5YjyrErD4/Uj7cNYWPG9Hr3iCk8FBgjqCV/r9+z
	cWT/43NKrVRp/tocV+ztpq7t6tGRC9hK2LhsPrlWUm6RYnDfUGKN0FeixMGfy0Q5KsKHTVyTGon
	yek8Sl2HCN/1AWYPqsF07o+mP2XtbMhneK1KS3yKV4cmYAgAYzSaeMDLT3lb8eqcxJ88kwrIgTm
	zdevBedIL3WXQwIl4PsujZp8/EJHmWp4dWa39DuGFv8LlCy0+1ncF3yQ01d4eQ0eVsIvHg==
X-Received: by 2002:a17:902:ecd0:b0:2e3:1ed7:d5d3 with SMTP id d9443c01a7336-2ed40dfb879mr52441465ad.67.1794030729173;
        Fri, 06 Nov 2026 21:52:09 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm11189465ad.62.2026.11.06.21.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:52:08 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com,
	lkp@intel.com
Subject: [PATCH v8 1/5] tracing: Add lock-free stackmap for stack trace deduplication
Date: Sat,  7 Nov 2026 13:51:35 +0800
Message-Id: <20261107055139.3138633-2-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

A kernel stack costs 80-160 bytes per ftrace event, and the same stacks
recur. Add a preallocated hash map that stores each distinct stack once
and returns a 64-bit cookie, made of the map generation and the table
slot, that the stack recording path can record instead of the stack.

Lookup and insert are lock-free and may run in NMI context, so the map
depends on ARCH_HAVE_NMI_SAFE_CMPXCHG like tracing_map. Reset clears the
map in place and bumps the generation so that old cookies stop matching.
The stack_map file that resolves cookies is created by the next patch.

Assisted-by: LLM
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
---
 kernel/trace/Kconfig          |  13 ++
 kernel/trace/Makefile         |   1 +
 kernel/trace/trace.h          |   3 +
 kernel/trace/trace_stackmap.c | 382 ++++++++++++++++++++++++++++++++++
 kernel/trace/trace_stackmap.h |  22 ++
 5 files changed, 421 insertions(+)
 create mode 100644 kernel/trace/trace_stackmap.c
 create mode 100644 kernel/trace/trace_stackmap.h

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 084f34dc6c9f..a83c53c02eea 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -412,6 +412,19 @@ config STACK_TRACER
 
 	  Say N if unsure.
 
+config FTRACE_STACKMAP
+	bool "Ftrace stack map deduplication"
+	depends on TRACING
+	depends on STACKTRACE
+	depends on ARCH_HAVE_NMI_SAFE_CMPXCHG
+	help
+	  Store each distinct kernel stack recorded by ftrace once, in a
+	  table allocated when options/stackmap is enabled, and record a
+	  64-bit cookie in the ring buffer instead of the full stack.
+	  See Documentation/trace/ftrace-stackmap.rst.
+
+	  If unsure, say N.
+
 config TRACE_PREEMPT_TOGGLE
 	bool
 	help
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..7710ec2659e9 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_HWLAT_TRACER) += trace_hwlat.o
 obj-$(CONFIG_OSNOISE_TRACER) += trace_osnoise.o
 obj-$(CONFIG_NOP_TRACER) += trace_nop.o
 obj-$(CONFIG_STACK_TRACER) += trace_stack.o
+obj-$(CONFIG_FTRACE_STACKMAP) += trace_stackmap.o
 obj-$(CONFIG_MMIOTRACE) += trace_mmiotrace.o
 obj-$(CONFIG_FUNCTION_GRAPH_TRACER) += trace_functions_graph.o
 obj-$(CONFIG_TRACE_BRANCH_PROFILING) += trace_branch.o
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 80fe152af1dd..7b2cdc0dc253 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -453,6 +453,9 @@ struct trace_array {
 	struct cond_snapshot	*cond_snapshot;
 #endif
 	struct trace_func_repeats	__percpu *last_func_repeats;
+#ifdef CONFIG_FTRACE_STACKMAP
+	struct ftrace_stackmap __rcu	*stackmap;
+#endif
 	/*
 	 * On boot up, the ring buffer is set to the minimum size, so that
 	 * we do not waste memory on systems that are not using tracing.
diff --git a/kernel/trace/trace_stackmap.c b/kernel/trace/trace_stackmap.c
new file mode 100644
index 000000000000..e5ffd1850ebf
--- /dev/null
+++ b/kernel/trace/trace_stackmap.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Stack trace deduplication for ftrace: each distinct stack is stored once,
+ * and the ring buffer records a cookie (map generation << 32 | slot).
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/jhash.h>
+#include <linux/seq_file.h>
+#include <linux/vmalloc.h>
+#include <linux/atomic.h>
+#include <linux/random.h>
+#include <linux/rcupdate.h>
+#include <linux/refcount.h>
+
+#include "trace.h"
+#include "trace_stackmap.h"
+
+#define FTRACE_STACKMAP_BITS		14
+#define FTRACE_STACKMAP_MAX_PROBE	64
+
+struct stackmap_elt {
+	u32		nr;
+	atomic_t	ref_count;
+	unsigned long	ips[FTRACE_STACKMAP_MAX_DEPTH];
+};
+
+struct stackmap_entry {
+	u32			key;
+	struct stackmap_elt	*val;
+};
+
+struct ftrace_stackmap {
+	unsigned int		map_bits;
+	unsigned int		map_size;
+	unsigned int		max_elts;
+	u32			hash_seed;
+	atomic_t		next_elt;
+	struct stackmap_entry	*entries;
+	struct stackmap_elt	*elts;
+	atomic_t		resetting;
+	u32			generation;
+	refcount_t		ref;
+};
+
+/* Serializes tracefs readers against reset. */
+static DEFINE_MUTEX(stackmap_lock);
+
+static u32 stackmap_next_gen = 1;
+
+static struct ftrace_stackmap *stackmap_locked(struct trace_array *tr)
+{
+	return rcu_dereference_protected(tr->stackmap,
+					 lockdep_is_held(&trace_types_lock));
+}
+
+static struct stackmap_elt *stackmap_load_elt(struct stackmap_entry *entry)
+{
+	/* Pairs with smp_store_release() in ftrace_stackmap_get_cookie(). */
+	return smp_load_acquire(&entry->val);
+}
+
+static struct stackmap_elt *stackmap_get_elt(struct ftrace_stackmap *smap)
+{
+	int idx;
+
+	idx = atomic_fetch_add_unless(&smap->next_elt, 1, smap->max_elts);
+	return idx < smap->max_elts ? &smap->elts[idx] : NULL;
+}
+
+static void ftrace_stackmap_destroy(struct ftrace_stackmap *smap)
+{
+	vfree(smap->elts);
+	vfree(smap->entries);
+	kfree(smap);
+}
+
+static struct ftrace_stackmap *ftrace_stackmap_create(void)
+{
+	struct ftrace_stackmap *smap;
+
+	smap = kzalloc_obj(*smap, GFP_KERNEL);
+	if (!smap)
+		return ERR_PTR(-ENOMEM);
+
+	smap->map_bits = FTRACE_STACKMAP_BITS;
+	smap->max_elts = 1U << FTRACE_STACKMAP_BITS;
+	smap->map_size = 1U << (FTRACE_STACKMAP_BITS + 1);
+
+	smap->entries = __vcalloc(smap->map_size, sizeof(*smap->entries),
+				  GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!smap->entries)
+		goto fail;
+
+	smap->elts = __vcalloc(smap->max_elts, sizeof(*smap->elts),
+			       GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!smap->elts)
+		goto fail;
+
+	smap->hash_seed = get_random_u32();
+	smap->generation = stackmap_next_gen;
+	refcount_set(&smap->ref, 1);
+	return smap;
+
+fail:
+	ftrace_stackmap_destroy(smap);
+	return ERR_PTR(-ENOMEM);
+}
+
+int ftrace_stackmap_alloc(struct trace_array *tr)
+{
+	struct ftrace_stackmap *smap;
+
+	if (stackmap_locked(tr))
+		return 0;
+
+	smap = ftrace_stackmap_create();
+	if (IS_ERR(smap))
+		return PTR_ERR(smap);
+
+	rcu_assign_pointer(tr->stackmap, smap);
+	return 0;
+}
+
+static struct ftrace_stackmap *stackmap_get(struct trace_array *tr)
+{
+	struct ftrace_stackmap *smap;
+
+	guard(mutex)(&trace_types_lock);
+	smap = stackmap_locked(tr);
+	if (smap)
+		refcount_inc(&smap->ref);
+	return smap;
+}
+
+static void stackmap_put(struct ftrace_stackmap *smap)
+{
+	if (!smap)
+		return;
+	if (refcount_dec_and_test(&smap->ref))
+		ftrace_stackmap_destroy(smap);
+}
+
+static void stackmap_reset(struct trace_array *tr)
+{
+	struct ftrace_stackmap *smap = stackmap_locked(tr);
+
+	if (!smap)
+		return;
+
+	/* Keep new callers out, then wait for the ones already inside. */
+	atomic_set(&smap->resetting, 1);
+	synchronize_rcu();
+
+	scoped_guard(mutex, &stackmap_lock) {
+		memset(smap->entries, 0, sizeof(*smap->entries) * smap->map_size);
+		memset(smap->elts, 0, sizeof(*smap->elts) * smap->max_elts);
+		atomic_set(&smap->next_elt, 0);
+		smap->generation++;
+	}
+
+	/* Pairs with atomic_read_acquire() in ftrace_stackmap_get_cookie(). */
+	atomic_set_release(&smap->resetting, 0);
+}
+
+bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
+				unsigned long *ips, unsigned int nr_entries,
+				u64 *cookie)
+{
+	u32 key_hash, idx, test_key, trace_len;
+	struct stackmap_entry *entry;
+	struct stackmap_elt *val;
+	int probes = 0;
+
+	/* Pairs with atomic_set_release() in stackmap_reset(). */
+	if (atomic_read_acquire(&smap->resetting))
+		return false;
+
+	trace_len = nr_entries * sizeof(unsigned long);
+	key_hash = jhash2((const u32 *)ips, trace_len / sizeof(u32),
+			  smap->hash_seed);
+	/* Zero marks a free slot. */
+	if (key_hash == 0)
+		key_hash = 1;
+
+	idx = key_hash >> (32 - (smap->map_bits + 1));
+
+	while (probes < FTRACE_STACKMAP_MAX_PROBE) {
+		idx &= smap->map_size - 1;
+		entry = &smap->entries[idx];
+		test_key = READ_ONCE(entry->key);
+
+		if (test_key == key_hash) {
+			val = stackmap_load_elt(entry);
+			/* Insert in progress; from NMI it may be the interrupted one. */
+			if (!val)
+				return false;
+			if (READ_ONCE(val->nr) == nr_entries &&
+			    memcmp(val->ips, ips, trace_len) == 0) {
+				atomic_add_unless(&val->ref_count, 1, INT_MAX);
+				goto found;
+			}
+		} else if (!test_key) {
+			if (atomic_read(&smap->next_elt) >= smap->max_elts)
+				break;
+			/* Lost the race; the slot may now hold this stack. */
+			if (cmpxchg(&entry->key, 0, key_hash) != 0)
+				continue;
+
+			val = stackmap_get_elt(smap);
+			if (!val)
+				break;
+
+			val->nr = nr_entries;
+			atomic_set(&val->ref_count, 1);
+			memcpy(val->ips, ips, trace_len);
+			/* Pairs with stackmap_load_elt(). */
+			smp_store_release(&entry->val, val);
+			goto found;
+		}
+
+		idx++;
+		probes++;
+	}
+
+	return false;
+found:
+	*cookie = ((u64)smap->generation << FTRACE_STACKMAP_COOKIE_GEN_SHIFT) | idx;
+	return true;
+}
+
+struct stackmap_seq_private {
+	struct trace_array	*tr;
+	struct ftrace_stackmap	*smap;
+};
+
+static struct stackmap_entry *stackmap_seq_seek(struct ftrace_stackmap *smap,
+						loff_t *pos)
+{
+	loff_t i;
+
+	for (i = *pos; i < smap->map_size; i++) {
+		if (READ_ONCE(smap->entries[i].key) &&
+		    stackmap_load_elt(&smap->entries[i])) {
+			*pos = i;
+			return &smap->entries[i];
+		}
+	}
+	/* Advance past the end or seq_read() repeats the last entry. */
+	*pos = smap->map_size;
+	return NULL;
+}
+
+static void *stackmap_seq_start(struct seq_file *m, loff_t *pos)
+{
+	struct stackmap_seq_private *priv = m->private;
+
+	mutex_lock(&stackmap_lock);
+	if (!priv->smap)
+		return NULL;
+	return stackmap_seq_seek(priv->smap, pos);
+}
+
+static void *stackmap_seq_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	struct stackmap_seq_private *priv = m->private;
+
+	(*pos)++;
+	return stackmap_seq_seek(priv->smap, pos);
+}
+
+static void stackmap_seq_stop(struct seq_file *m, void *v)
+{
+	/* seq_file calls stop() even when start() returned NULL. */
+	mutex_unlock(&stackmap_lock);
+}
+
+static int stackmap_seq_show(struct seq_file *m, void *v)
+{
+	struct stackmap_entry *entry = v;
+	struct stackmap_seq_private *priv = m->private;
+	struct stackmap_elt *elt;
+	u32 idx = entry - priv->smap->entries;
+	u32 i, nr;
+
+	elt = stackmap_load_elt(entry);
+	if (!elt)
+		return 0;
+
+	nr = READ_ONCE(elt->nr);
+	if (nr > FTRACE_STACKMAP_MAX_DEPTH)
+		nr = FTRACE_STACKMAP_MAX_DEPTH;
+
+	seq_printf(m, "stack_id %u gen %u ref %u depth %u\n",
+		   idx, priv->smap->generation, atomic_read(&elt->ref_count), nr);
+	for (i = 0; i < nr; i++) {
+		unsigned long ip = elt->ips[i];
+
+		if (ip == FTRACE_TRAMPOLINE_MARKER)
+			seq_puts(m, " => [FTRACE TRAMPOLINE]\n");
+		else
+			seq_printf(m, " => %pS\n", (void *)ip);
+	}
+	return 0;
+}
+
+static const struct seq_operations stackmap_seq_ops = {
+	.start	= stackmap_seq_start,
+	.next	= stackmap_seq_next,
+	.stop	= stackmap_seq_stop,
+	.show	= stackmap_seq_show,
+};
+
+static int stackmap_open(struct inode *inode, struct file *file)
+{
+	struct trace_array *tr = inode->i_private;
+	struct stackmap_seq_private *priv;
+	struct seq_file *m;
+	int ret;
+
+	ret = tracing_check_open_get_tr(tr);
+	if (ret)
+		return ret;
+
+	ret = seq_open_private(file, &stackmap_seq_ops,
+			       sizeof(struct stackmap_seq_private));
+	if (ret) {
+		trace_array_put(tr);
+		return ret;
+	}
+
+	m = file->private_data;
+	priv = m->private;
+	priv->tr = tr;
+	if (file->f_mode & FMODE_READ)
+		priv->smap = stackmap_get(tr);
+	return 0;
+}
+
+static int stackmap_release(struct inode *inode, struct file *file)
+{
+	struct seq_file *m = file->private_data;
+	struct stackmap_seq_private *priv = m->private;
+	struct ftrace_stackmap *smap = priv->smap;
+	struct trace_array *tr = priv->tr;
+	int ret;
+
+	ret = seq_release_private(inode, file);
+	stackmap_put(smap);
+	trace_array_put(tr);
+	return ret;
+}
+
+static ssize_t stackmap_write(struct file *file, const char __user *ubuf,
+			      size_t count, loff_t *ppos)
+{
+	struct seq_file *m = file->private_data;
+	struct stackmap_seq_private *priv = m->private;
+	char buf[8];
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+	if (copy_from_user(buf, ubuf, count))
+		return -EFAULT;
+	buf[count] = '\0';
+
+	if (sysfs_streq(buf, "0")) {
+		guard(mutex)(&trace_types_lock);
+		stackmap_reset(priv->tr);
+		return count;
+	}
+	return -EINVAL;
+}
+
+const struct file_operations ftrace_stackmap_fops = {
+	.open		= stackmap_open,
+	.read		= seq_read,
+	.write		= stackmap_write,
+	.llseek		= seq_lseek,
+	.release	= stackmap_release,
+};
diff --git a/kernel/trace/trace_stackmap.h b/kernel/trace/trace_stackmap.h
new file mode 100644
index 000000000000..6699988da390
--- /dev/null
+++ b/kernel/trace/trace_stackmap.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _TRACE_STACKMAP_H
+#define _TRACE_STACKMAP_H
+
+#include <linux/types.h>
+
+#define FTRACE_STACKMAP_MAX_DEPTH	64
+
+/* A cookie holds the generation in its high half and the slot below. */
+#define FTRACE_STACKMAP_COOKIE_GEN_SHIFT	32
+
+struct trace_array;
+struct ftrace_stackmap;
+
+int ftrace_stackmap_alloc(struct trace_array *tr);
+bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
+				unsigned long *ips, unsigned int nr_entries,
+				u64 *cookie);
+
+extern const struct file_operations ftrace_stackmap_fops;
+
+#endif /* _TRACE_STACKMAP_H */
-- 
2.34.1

