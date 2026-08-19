Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0AF2F3C1F
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123152; cv=none; b=cqlsMhAWm30fniIqaKV7ukauAQiPt19Bfg6R1IZkrPwWYALaO8yhjfD5T1Q8fhuYX65ekvnwZka2fQG8w0QvaCg0BGBaQKDYmXgzt83V99mpGwSpTB9sCn8Dn6/5ShO1mIkX2LQmhzuCWFS4g1eusWRsUcIWoyFfL4mZ3zCsczE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123152; c=relaxed/simple;
	bh=PqYctq9OkbGbad376jXZa8QYf/yrQA5UAlv/R/RffpI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DNdvQy/VvAyS5hWSBD6yBjgtt7kQRLhJYH7hV8+oDXxoD00B+xrSAI+xaReLYf73CDoVfsWYVEQGuWnx1HTuGza+DBP+8lH1lTYiIr+/XH3jFIfHHs1VjSJaFq6dxaF1xPvxWouhFgfZ3GbNQhDwptP2uk4cfMxx1JPQ8sbDhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NGG8KOjE; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jasonmiu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NGG8KOjE"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso776576a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 00:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787123149; x=1787727949; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r13rbsEeTBQUt7C0+umCAD05cQ1RPgR2iUrqqxSlQbQ=;
        b=NGG8KOjE1gfzjPuxH+IHtKVRCI95Rg5cXD0FlrBLDsilVxsyjyNlOvaF6nhC535uQI
         tvLv6Whk8WrioYHUAmgt7umEcGeToRuAGCeP96pNm6ZYkdUxpZ5x5tujdbPj7niubnch
         MGPKhyqlWBWP8/LxAB15QyzydbWuZvMYZI02J3gHx0l3g6xwUSBlabihK2h6+Pxz4YhL
         GvVv94FzPmp/9K6kYejdMObBac16uzve3fEGrigQYHP+pmxE0TASys77YPm3oOJWJNkZ
         0TVAIm6VsM5xz6skR1EECoAiKXByVKyLqwWAoN2r3qzsEtxHi+TtqA3JDbGYbeO5GPCV
         w0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123149; x=1787727949;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r13rbsEeTBQUt7C0+umCAD05cQ1RPgR2iUrqqxSlQbQ=;
        b=S1cjD3Jhxu7zNV0OlGS1ty11G7NV55ogJhEc/zxWMW4hoGfqoP9qXj7+hYr90kYiqp
         kqjGNQpnnxSxis+9QiPLjv4zeQKnZFZcvJLHc15zbZI7t+YCVAcvBVravHRn4aeJRgvj
         stzW5NpPmcQSXpyPLM64fPCydhsH65PbOYAgFttaEBCHthLZMsNOAzVxM1b2uTljPOYh
         DuooCpruLi67lqJdzDe0pQyPx1k/V0sUL6XYBDdRbdAvzkX1ep0zn9e+GtsjvdUtbNWx
         mTz7Eh+qpzUmn0n+/q1W6ie6ZOQck++7W+Xd15PU0fDHhhz1aiqydLNibXOhp0xALbJq
         YY8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoOOSxTl8sfh7MgZkqSMxX6LGIipj+JbVqq5X7H1pyClmcl1w6B/7JLrxwCaYPXuvNQqduSHA6HNNWsHQnJ7O4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA88XrKnomBA/jlfi0u25g0/7DbNOW95VqGpQAnLmb91E7ua7P
	B+MpS8Vzv8NY0SAsFaT260IO4ALEIAMBbK4iynaRZgATWwMauStJ2k8VxJLKRU89Rgvggi4edM1
	OjCr+AKtNJI6n3Q==
X-Received: from dybhl1.prod.google.com ([2002:a05:7301:2701:b0:327:eee:4918])
 (user=jasonmiu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr4701528a91.4.1787123148550;
 Wed, 19 Aug 2026 00:05:48 -0700 (PDT)
Date: Wed, 19 Aug 2026 00:05:36 -0700
In-Reply-To: <20260819070538.2404983-1-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260819070538.2404983-1-jasonmiu@google.com>
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260819070538.2404983-2-jasonmiu@google.com>
Subject: [PATCH 1/3] lib/test_mempress_timer: add module to generate kernel
 allocation pressure
From: Jason Miu <jasonmiu@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Greg Thelen <gthelen@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Jason Miu <jasonmiu@google.com>
Content-Type: text/plain; charset="UTF-8"

Update lib/Kconfig.debug and lib/Makefile to introduce
test_mempress_timer, a kernel testing module designed to generate
synthetic memory allocation pressure within SoftIRQ contexts.

Bind independent timers to each online CPU to continuously execute
atomic page allocations (GFP_ATOMIC | __GFP_NOWARN). Provide this
workload generator to repeatedly emulate heavy kernel allocation demands.

Add a configurable termination threshold (test_duration_secs) to prevent
permanent test-node lockups, and provide batching control via the
allocs_per_iteration module parameter.

Signed-off-by: Jason Miu <jasonmiu@google.com>
---
 lib/Kconfig.debug         |  11 +++
 lib/Makefile              |   1 +
 lib/test_mempress_timer.c | 140 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 lib/test_mempress_timer.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1244dcac2294..00d32012e476 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2635,6 +2635,17 @@ config TEST_BITOPS
 
 	  If unsure, say N.
 
+config TEST_MEMPRESS_TIMER
+	tristate "Test module for memory pressure and allocation stall timing"
+	default n
+	help
+	  This builds the "test_mempress_timer" module that can be used to
+	  provoke and profile page allocation stalls and direct reclaim
+	  slowness. It periodically does a atomic page allocation to generate a
+	  memory pressure.
+
+	  If unsure, say N.
+
 config TEST_VMALLOC
 	tristate "Test module for stress/performance analysis of vmalloc allocator"
 	default n
diff --git a/lib/Makefile b/lib/Makefile
index 7f75cc6edf94..0f35c2b78970 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -78,6 +78,7 @@ CFLAGS_test_ubsan.o += $(call cc-disable-warning, unused-but-set-variable)
 UBSAN_SANITIZE_test_ubsan.o := y
 obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
 obj-$(CONFIG_TEST_LKM) += test_module.o
+obj-$(CONFIG_TEST_MEMPRESS_TIMER) += test_mempress_timer.o
 obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
 obj-$(CONFIG_TEST_WORKQUEUE) += test_workqueue.o
 obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
diff --git a/lib/test_mempress_timer.c b/lib/test_mempress_timer.c
new file mode 100644
index 000000000000..a102ac4f6725
--- /dev/null
+++ b/lib/test_mempress_timer.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * test_mempress_timer.c
+ *
+ * Simulates kernelspace memory allocation pressure via timers.
+ * This module binds individual timers to each online CPU to independently
+ * allocate and free physical pages concurrently. It serves as a workload
+ * generator to reproduce and measure page allocation stalls under system
+ * memory contention.
+ *
+ * Module Parameters:
+ *  - allocs_per_iteration: Number of atomic page allocations executed
+ *                          during each timer callback.
+ *                          Default: 1000
+ *  - test_duration_secs:   Total duration in seconds to run the pressure test
+ *                          before automatically disengaging.
+ *                          Default: 900 (15 minutes)
+ *
+ * Usage:
+ * insmod test_mempress_timer.ko test_duration_secs=900 allocs_per_iteration=1000
+ */
+
+#include <linux/gfp.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/timer.h>
+#include <linux/proc_fs.h>
+#include <linux/skbuff.h>
+#include <net/tcp.h>
+
+struct mempress_timer {
+	struct timer_list timer;
+	struct list_head list;
+	struct list_head page_list;
+	int cpu;
+};
+
+static LIST_HEAD(timers);
+static bool stop_timers;
+
+static unsigned long interval = 2;
+
+static unsigned long allocs_per_iteration = 1000;
+module_param(allocs_per_iteration, long, 0444);
+
+static unsigned long test_duration_secs = 900; /* 15 mins default */
+module_param(test_duration_secs, ulong, 0444);
+
+static unsigned long end_jiffies;
+
+static void alloc_pages_atomics(struct mempress_timer *test)
+{
+	int i;
+	struct page *page;
+
+	for (i = 0; i < allocs_per_iteration; i++) {
+		page = alloc_page(GFP_ATOMIC | __GFP_NOWARN);
+		if (!page) {
+			pr_warn("page allocation failure from cpu %d at iteration %d\n",
+				test->cpu, i);
+			break;
+		}
+		list_add(&page->lru, &test->page_list);
+	}
+}
+
+static void free_pages_atomics(struct mempress_timer *test)
+{
+	struct list_head *page;
+	struct list_head *iter;
+
+	list_for_each_safe(page, iter, &test->page_list)
+		__free_page(container_of(page, struct page, lru));
+	INIT_LIST_HEAD(&test->page_list);
+}
+
+static void atomic_timer_allocator(struct timer_list *timer)
+{
+	struct mempress_timer *test = timer_container_of(test, timer, timer);
+	bool is_expired = (test_duration_secs > 0 &&
+			   time_after(jiffies, end_jiffies));
+
+	if (list_empty(&test->page_list) && !is_expired)
+		alloc_pages_atomics(test);
+	else
+		free_pages_atomics(test);
+
+	if (!READ_ONCE(stop_timers) && !is_expired) {
+		test->timer.expires = jiffies + interval;
+		add_timer_on(&test->timer, test->cpu);
+	} else if (is_expired) {
+		pr_info_once("Duration (%lu secs) reached, stopping.\n", test_duration_secs);
+	}
+}
+
+static int __init mempress_timers_init(void)
+{
+	int cpu;
+	struct mempress_timer *test;
+
+	if (test_duration_secs > 0)
+		end_jiffies = jiffies + (test_duration_secs * HZ);
+
+	for_each_online_cpu(cpu) {
+		test = kzalloc(sizeof(*test), GFP_KERNEL | __GFP_NOFAIL);
+
+		timer_setup(&test->timer, atomic_timer_allocator, 0);
+		list_add(&test->list, &timers);
+		INIT_LIST_HEAD(&test->page_list);
+		test->cpu = cpu;
+
+		/* For start, use 90 seconds. */
+		test->timer.expires = jiffies + (90 * HZ);
+		add_timer_on(&test->timer, test->cpu);
+	}
+
+	return 0;
+}
+module_init(mempress_timers_init);
+
+static void mempress_timers_exit(void)
+{
+	struct mempress_timer *test, *n;
+
+	pr_crit("exiting\n");
+	stop_timers = true;
+
+	list_for_each_entry_safe(test, n, &timers, list) {
+		timer_delete_sync(&test->timer);
+		list_del(&test->list);
+		cond_resched();
+		free_pages_atomics(test);
+		kfree(test);
+	}
+}
+module_exit(mempress_timers_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Test memory pressure from timers");
-- 
2.55.0.691.gc56d675ccc-goog

