Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973760;
	b=pz1qx6+IYSv6p0gc0ztqjZhU/bEOkv4tIFGmJ8OUrSUvFM0RZsehxZnOTUWzQVCpRoDq
	 0J6lx2j+eJzRLXSsgSIfTqGEpXpJEpHqdWyFEXFcT2NDPtcR7OYekVUxdyDgPtsICq39u
	 DS9UnquudQYMqa1S7BLjV4LfrFhyuDjG23bwUVjPUJfiN1iddtvxacvy0NZ1JU0flBRUY
	 jYD2hYzoqqbZeo7lDUkCN1LiEknH2zqi4tMoWOyq0h/EGBJbdwAT/dNkS9vaJ1pODslHH
	 5KvjpnNIHU6VgJcoh50dFMPkdIyIibXIvmzQmxfix01aJkYnBwCZwekrfcVPK8YS23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=N5yrhr43s9PBw8/9aJgZ66lOjzGo86Es81MCcpqW2oE=;
	b=xzfxybs52tHcBWWA3PFOsOUFsB5zu8Z5q40UKPE67hi8ocR38TWQf2lLn+TG/Il1jssD
	 lUFNxYaf6UmFL0BT+h9Czhaqbx4oLmts7cG/dZfAruW3CIgF1lMhF7BWZASIKtVeksrR+
	 1TtfdyDHUZlt+10DiwmQYwTS0ZR6qd9mzW2k0ropMvwvcvilbDTqx3FyUrrxFJTzP9SMM
	 uQjDaZ5tX0JKJSRnjttFPWRDsTN9wluC87yE3PZ+OAIERLUp3BhbBbC8y7cB4qQ5jAZw7
	 S2dBa3F/3Fm8zO5t5ASoPLi9ZsaYB3NS738tPgREt9d700ZK7iwzfctIm2Vu87zEyZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=op+B56y1;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D796082BE5
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 14:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D796082BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=op+B56y1
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b3299aed39so4136857b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 06:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973759; x=1794578559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5yrhr43s9PBw8/9aJgZ66lOjzGo86Es81MCcpqW2oE=;
        b=op+B56y1Ei2OhEcPyLuoK58o88/nSdEVJ5Zfv3atw6wOxRdB6FIkvbNCgEbSVkkqF2
         AsT9mtZuSC7spdEizP88kbUZJNwfn1toNczWp41UPwcMwf5KoK7+7BD/iY+cZ+2NTQ5B
         ithkrgOqXdSObLZdcEgl5pUE90/a8rMQVVa4CXLrVyMpCYbwcMU3Uk/lOflir79nvwfm
         fw6AtTG5pOKXX0M5Td+i2F5gmcLraVZHOcdGgK+oipI8pbo0Mcde8iOSdGcgLQETcumV
         /V//fsAwXIl1S9/I1HVz7sgzQECxajJ7ofLYqVdWZS3RGemrMO8P0kbwFZlmgHXXlRtc
         +P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973759; x=1794578559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5yrhr43s9PBw8/9aJgZ66lOjzGo86Es81MCcpqW2oE=;
        b=T3aULFvd7ofKSuROAlCZKiW30ub6CfhyHrLmSZ0dPzOJFIDHno+Ho25S1viJAkil/Q
         Do8s2pT2R0vF5Y4Y4rtAQzOfDBMFhy5E+YrpzzRhIHq6yC2t8UskW0ULxUIta3yLlCTG
         8QAE5U1lnnMo77x1ZxNZPQ8uFjZoilTGATDEtsQIemthl0tIGxTzdY2IS8/K7ymwojrz
         vUao/74ZFsK9SITx47pg0BNbja04hy+a0FvLq8tChreAOsl0xGoeubcYL5m2rEwtnVQo
         DtM3coUoz/4DZmB1R0nKpnbswtXxQVplRHPw0gplM6Uep2RQ5XoWIPDIC+Foxd+klBTR
         jZGA==
X-Forwarded-Encrypted: i=1; AL+hErGr2Bl3mWlchoOyvTDQg0P+3lVSPd7B3hrr2NkaMPRwEO58IOHZxZAYH7+iV0GCaCOxcHndmYBJq83ZaU4PVv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z//NCSE3HQp69Yur81Jl8WO8Ae2JHmo7Va5dtzwIWRSu7dAKNpd
	2A3cL6V6FaEQnnzN00t0Nmdv1WXcv2sZ1u6D3vq+WxffEvlHy5RUdNVI
X-Gm-Gg: AYBFou02jrPsm4LMnZARfz6A2MTMfXPn9vZqUTeXf3x2ZmDtjOkbpuy5qjlQ7Bfv9d/
	y+zf3x2Z0A/OvrOoDThziR0xbtO6A8ArBDkTCdcmWw3Y3Kw5TuhGAxU9w80c9B0irpJrBk+KTa0
	G/OMUl+0Ot5NquGHzXk+qGzZp1Fyc0DZl+J9I/haZL9sEAADs5kKnd+crkUsfGqn+vwRzCqHFZa
	M0/lonwMRtPGo6+uJ+lFO5ErK81ngw6Le+sL4EyxEGoL7CgI66AX00133lVAV6k+soklhP+zdzr
	pIXjw0+uXJoKwhiEbflTmsjw7+OMgK3YbMNc+L8vJjnVBOPP+E+ZjfQU2g7V7R9oG+EwYjLAzrw
	ujXrUoGeIeKUb5d/WR+ubeyUmOnpLpBL5hNmZ0faWQIBDADokh/KYRHCDJUMaeuBd7pKfySHv0W
	V4VPs44DqggtsoghsoVDFIGbNmKCm+qVu6bgDX3V2tFTkJ8KEiZPDJLPyGD7YfGoidsjbwmeULu
	1TT6xZPTjwAX0DCagy+6RQs9Svcgxg6GI3HOZXR5TYkGMqOMe0zsW8OJsOBBpm4eA7LUqlK8lyG
	2hec0ciHu8OHeZoCCgl1S0KmTUAviC0MUjEBoDH8sBm2vGZXP79W5EmmEOqu8WwsxZo7calayry
	CMI93Ylz2VM84H1K445oqIyO739F6VxkHvDYUiJl2CQr4liBT4FnUig7wNqYc
X-Received: by 2002:a05:690c:c1c2:b0:8b0:e07c:a9b6 with SMTP id 00721157ae682-8b341b301a4mr9135947b3.103.1793973758826;
        Fri, 06 Nov 2026 06:02:38 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f5f525fsm19090677b3.5.2026.11.06.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:02:38 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Fri, 06 Nov 2026 09:02:33 -0500
Subject: [PATCH 2/2] lib/tests: add KUnit tests for genalloc
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-kunit-genalloc-v1-2-ba1ea397dfd8@gmail.com>
References: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
In-Reply-To: <20261106-kunit-genalloc-v1-0-ba1ea397dfd8@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Fredrik Noring <noring@nocrew.org>
Cc: Christoph Hellwig <hch@lst.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

lib/genalloc.c is the allocator that drivers use for on-chip SRAM,
IRAM and other special memory (i.MX SDMA, CODA, Tegra BPMP, s390 CIO,
USB local memory and others), but it has no unit tests.

Add a KUnit suite that covers:

- gen_pool_size(), gen_pool_avail() and gen_pool_has_addr();
- allocation and freeing, rounding to the allocation granule, zero
  and oversized requests, and an exact fit;
- the first fit, best fit (including the tie-break between equal
  holes), first fit aligned, first fit order aligned and fixed
  offset algorithms, and gen_pool_set_algo(pool, NULL, NULL);
- aligned allocation from a chunk that does not start on the
  alignment boundary;
- pools with several chunks, gen_pool_virt_to_phys() and
  gen_pool_for_each_chunk();
- chunk owners;
- the DMA helpers, including zeroing, alignment and a NULL pool;
- devm_gen_pool_create() and gen_pool_get() with named and unnamed
  pools on a KUnit device.

gen_pool_destroy() BUGs on outstanding allocations, so the cleanup
clears the chunk bitmaps first, and allocation results that are freed
later are checked with assertions; a failing test then fails cleanly
instead of crashing the kernel.

An AI coding assistant (Claude Opus 5.5) was used to draft the tests.
They were run with "tools/testing/kunit/kunit.py run" on UML (12/12
pass), built with W=1 without warnings, and checked against
deliberately broken versions of gen_pool_best_fit(),
gen_pool_first_fit_align() and the accounting in gen_pool_free_owner(),
each of which makes one test fail.

Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
 lib/Kconfig.debug          |  15 ++
 lib/tests/Makefile         |   1 +
 lib/tests/genalloc_kunit.c | 508 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 524 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..c66c3711e68c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3558,6 +3558,21 @@ config PRIME_NUMBERS_KUNIT_TEST
 
 	  If unsure, say N
 
+config GENALLOC_KUNIT_TEST
+	tristate "KUnit test for the general purpose allocator" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select GENERIC_ALLOCATOR
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for lib/genalloc.c, the
+	  allocator drivers use to manage on-chip SRAM and other special
+	  memory regions. The tests cover allocation and freeing, the
+	  first fit, best fit, aligned, order aligned and fixed offset
+	  algorithms, multiple chunks, virtual to physical translation,
+	  the DMA helpers and the device-managed pools.
+
+	  If unsure, say N.
+
 config GLOB_KUNIT_TEST
 	tristate "Glob matching test" if !KUNIT_ALL_TESTS
 	depends on GLOB
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index df0537e1b91f..f17e4241e148 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -23,6 +23,7 @@ CFLAGS_fortify_kunit.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
 CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) += test_fprobe.o
+obj-$(CONFIG_GENALLOC_KUNIT_TEST) += genalloc_kunit.o
 obj-$(CONFIG_GLOB_KUNIT_TEST) += glob_kunit.o
 obj-$(CONFIG_HASHTABLE_KUNIT_TEST) += hashtable_test.o
 obj-$(CONFIG_HASH_KUNIT_TEST) += test_hash.o
diff --git a/lib/tests/genalloc_kunit.c b/lib/tests/genalloc_kunit.c
new file mode 100644
index 000000000000..09b1bde9cf43
--- /dev/null
+++ b/lib/tests/genalloc_kunit.c
@@ -0,0 +1,508 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the general purpose allocator in lib/genalloc.c
+ */
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+#include <linux/bitmap.h>
+#include <linux/err.h>
+#include <linux/genalloc.h>
+#include <linux/module.h>
+#include <linux/numa.h>
+#include <linux/string.h>
+
+/* Allocation granule used by most tests: 16 bytes. */
+#define GP_ORDER	4
+#define GP_UNIT		BIT(GP_ORDER)
+#define GP_CHUNK	1024
+
+static void gp_clear_chunk(struct gen_pool *pool, struct gen_pool_chunk *chunk,
+			   void *data)
+{
+	size_t size = chunk->end_addr - chunk->start_addr + 1;
+
+	bitmap_zero(chunk->bits, size >> pool->min_alloc_order);
+}
+
+/*
+ * gen_pool_destroy() BUGs on outstanding allocations. Clear them first so
+ * that a test which fails half way does not take the whole run down.
+ */
+static void gp_destroy(void *data)
+{
+	struct gen_pool *pool = data;
+
+	gen_pool_for_each_chunk(pool, gp_clear_chunk, NULL);
+	gen_pool_destroy(pool);
+}
+
+static struct gen_pool *gp_create(struct kunit *test, int order)
+{
+	struct gen_pool *pool = gen_pool_create(order, NUMA_NO_NODE);
+
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, gp_destroy, pool),
+			0);
+	return pool;
+}
+
+/* Backing memory for a chunk, aligned to @size (a power of two). */
+static unsigned long gp_mem(struct kunit *test, size_t size)
+{
+	void *mem = kunit_kzalloc(test, size, GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_NULL(test, mem);
+	return (unsigned long)mem;
+}
+
+static void genalloc_size_avail_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+
+	KUNIT_EXPECT_EQ(test, gen_pool_size(pool), 0);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), 0);
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc(pool, GP_UNIT), 0);
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+	KUNIT_EXPECT_EQ(test, gen_pool_size(pool), GP_CHUNK);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK);
+
+	KUNIT_EXPECT_TRUE(test, gen_pool_has_addr(pool, base, GP_CHUNK));
+	KUNIT_EXPECT_TRUE(test, gen_pool_has_addr(pool, base + GP_CHUNK - 1, 1));
+	KUNIT_EXPECT_FALSE(test, gen_pool_has_addr(pool, base + GP_CHUNK - 4, 8));
+	KUNIT_EXPECT_FALSE(test, gen_pool_has_addr(pool, base + GP_CHUNK, 1));
+	KUNIT_EXPECT_FALSE(test, gen_pool_has_addr(pool, base - 1, 2));
+}
+
+static void genalloc_alloc_free_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	unsigned long a, b, c;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+
+	/* A zero-sized request fails. */
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc(pool, 0), 0);
+
+	a = gen_pool_alloc(pool, GP_UNIT);
+	KUNIT_ASSERT_EQ(test, a, base);
+
+	/* Sizes are rounded up to whole granules. */
+	b = gen_pool_alloc(pool, 1);
+	KUNIT_ASSERT_EQ(test, b, base + GP_UNIT);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK - 2 * GP_UNIT);
+
+	c = gen_pool_alloc(pool, GP_UNIT + 1);
+	KUNIT_ASSERT_EQ(test, c, base + 2 * GP_UNIT);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK - 4 * GP_UNIT);
+
+	/* The pool size never changes. */
+	KUNIT_EXPECT_EQ(test, gen_pool_size(pool), GP_CHUNK);
+
+	/* Freeing with the size used to allocate returns the whole granules. */
+	gen_pool_free(pool, b, 1);
+	gen_pool_free(pool, c, GP_UNIT + 1);
+	gen_pool_free(pool, a, GP_UNIT);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK);
+
+	/* Too large a request fails; an exact fit succeeds. */
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc(pool, GP_CHUNK + 1), 0);
+	a = gen_pool_alloc(pool, GP_CHUNK);
+	KUNIT_ASSERT_EQ(test, a, base);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), 0);
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc(pool, 1), 0);
+	gen_pool_free(pool, a, GP_CHUNK);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK);
+}
+
+static void genalloc_first_fit_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	unsigned long a, b, c, d;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+
+	a = gen_pool_alloc(pool, 4 * GP_UNIT);
+	b = gen_pool_alloc(pool, 4 * GP_UNIT);
+	c = gen_pool_alloc(pool, 4 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, a, base);
+	KUNIT_ASSERT_EQ(test, b, base + 4 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, c, base + 8 * GP_UNIT);
+
+	/* A hole left by a free is reused by the next request that fits. */
+	gen_pool_free(pool, b, 4 * GP_UNIT);
+	d = gen_pool_alloc(pool, 2 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, d, b);
+
+	/* A request too large for the hole goes after the last allocation. */
+	b = gen_pool_alloc(pool, 3 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, b, base + 12 * GP_UNIT);
+
+	gen_pool_free(pool, a, 4 * GP_UNIT);
+	gen_pool_free(pool, b, 3 * GP_UNIT);
+	gen_pool_free(pool, c, 4 * GP_UNIT);
+	gen_pool_free(pool, d, 2 * GP_UNIT);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK);
+}
+
+static void genalloc_best_fit_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	unsigned long big, sep, small, rest, addr;
+	size_t rest_size = GP_CHUNK - 14 * GP_UNIT;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+
+	/* Leave an 8 granule hole at the start and a 2 granule hole later. */
+	big = gen_pool_alloc(pool, 8 * GP_UNIT);
+	sep = gen_pool_alloc(pool, 4 * GP_UNIT);
+	small = gen_pool_alloc(pool, 2 * GP_UNIT);
+	rest = gen_pool_alloc(pool, rest_size);
+	KUNIT_ASSERT_EQ(test, small, base + 12 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, rest, base + 14 * GP_UNIT);
+	gen_pool_free(pool, big, 8 * GP_UNIT);
+	gen_pool_free(pool, small, 2 * GP_UNIT);
+
+	/* First fit takes the first hole... */
+	addr = gen_pool_alloc(pool, 2 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, addr, big);
+	gen_pool_free(pool, addr, 2 * GP_UNIT);
+
+	/* ...best fit takes the smallest hole that is large enough. */
+	gen_pool_set_algo(pool, gen_pool_best_fit, NULL);
+	addr = gen_pool_alloc(pool, 2 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, addr, small);
+
+	/* With that hole used, best fit falls back to the larger one. */
+	KUNIT_ASSERT_EQ(test, gen_pool_alloc(pool, GP_UNIT), big);
+
+	gen_pool_free(pool, addr, 2 * GP_UNIT);
+	gen_pool_free(pool, big, GP_UNIT);
+
+	/*
+	 * Of two equally good holes, best fit takes the first. Free the
+	 * separator so granules 0-13 are free, then carve them into two
+	 * three granule holes (0-2 and 4-6) with allocations in between.
+	 */
+	gen_pool_free(pool, sep, 4 * GP_UNIT);
+	big = gen_pool_alloc(pool, 3 * GP_UNIT);
+	sep = gen_pool_alloc(pool, GP_UNIT);
+	small = gen_pool_alloc(pool, 3 * GP_UNIT);
+	addr = gen_pool_alloc(pool, 7 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, big, base);
+	KUNIT_ASSERT_EQ(test, sep, base + 3 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, small, base + 4 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, addr, base + 7 * GP_UNIT);
+	gen_pool_free(pool, big, 3 * GP_UNIT);
+	gen_pool_free(pool, small, 3 * GP_UNIT);
+
+	small = gen_pool_alloc(pool, 2 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, small, base);
+
+	gen_pool_free(pool, small, 2 * GP_UNIT);
+	gen_pool_free(pool, sep, GP_UNIT);
+	gen_pool_free(pool, addr, 7 * GP_UNIT);
+	gen_pool_free(pool, rest, rest_size);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK);
+
+	/* Setting a NULL algorithm restores first fit. */
+	gen_pool_set_algo(pool, NULL, NULL);
+	KUNIT_EXPECT_TRUE(test, pool->algo == gen_pool_first_fit);
+}
+
+static void genalloc_first_fit_align_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long mem = gp_mem(test, 2 * GP_CHUNK);
+	/* A chunk that starts one granule past a 256 byte boundary. */
+	unsigned long base = mem + GP_UNIT;
+	struct genpool_data_align align = { .align = 256 };
+	unsigned long a, b;
+
+	KUNIT_ASSERT_EQ(test, mem & 255, 0);
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+
+	/* Alignment is of the address, not of the offset in the chunk. */
+	a = gen_pool_alloc_algo(pool, GP_UNIT, gen_pool_first_fit_align,
+				&align);
+	KUNIT_ASSERT_EQ(test, a, mem + 256);
+
+	b = gen_pool_alloc_algo(pool, GP_UNIT, gen_pool_first_fit_align,
+				&align);
+	KUNIT_ASSERT_EQ(test, b, mem + 512);
+
+	/* The space skipped for alignment is still free for plain requests. */
+	KUNIT_ASSERT_EQ(test, gen_pool_alloc(pool, GP_UNIT), base);
+
+	gen_pool_free(pool, a, GP_UNIT);
+	gen_pool_free(pool, b, GP_UNIT);
+	gen_pool_free(pool, base, GP_UNIT);
+}
+
+static void genalloc_order_align_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	unsigned long a, b, c;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+	gen_pool_set_algo(pool, gen_pool_first_fit_order_align, NULL);
+
+	a = gen_pool_alloc(pool, GP_UNIT);
+	KUNIT_ASSERT_EQ(test, a, base);
+
+	/* Three granules round up to an alignment of four granules. */
+	b = gen_pool_alloc(pool, 3 * GP_UNIT);
+	KUNIT_ASSERT_EQ(test, b, base + 4 * GP_UNIT);
+
+	/* A single granule needs no alignment and fills the first gap. */
+	c = gen_pool_alloc(pool, GP_UNIT);
+	KUNIT_ASSERT_EQ(test, c, base + GP_UNIT);
+
+	gen_pool_free(pool, a, GP_UNIT);
+	gen_pool_free(pool, b, 3 * GP_UNIT);
+	gen_pool_free(pool, c, GP_UNIT);
+}
+
+static void genalloc_fixed_alloc_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	struct genpool_data_fixed fixed = { .offset = 8 * GP_UNIT };
+	unsigned long a;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add(pool, base, GP_CHUNK, NUMA_NO_NODE),
+			0);
+
+	a = gen_pool_alloc_algo(pool, 2 * GP_UNIT, gen_pool_fixed_alloc, &fixed);
+	KUNIT_ASSERT_EQ(test, a, base + 8 * GP_UNIT);
+
+	/* The same offset cannot be handed out twice... */
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc_algo(pool, GP_UNIT,
+						  gen_pool_fixed_alloc, &fixed),
+			0);
+
+	/* ...nor an offset whose range overlaps it. */
+	fixed.offset = 7 * GP_UNIT;
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc_algo(pool, 2 * GP_UNIT,
+						  gen_pool_fixed_alloc, &fixed),
+			0);
+
+	/* An offset just before it, that fits, works. */
+	KUNIT_ASSERT_EQ(test, gen_pool_alloc_algo(pool, GP_UNIT,
+						  gen_pool_fixed_alloc, &fixed),
+			base + 7 * GP_UNIT);
+
+	gen_pool_free(pool, a, 2 * GP_UNIT);
+	gen_pool_free(pool, base + 7 * GP_UNIT, GP_UNIT);
+}
+
+static void genalloc_chunks_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long m1 = gp_mem(test, GP_CHUNK);
+	unsigned long m2 = gp_mem(test, GP_CHUNK / 4);
+	const phys_addr_t p1 = 0x100000, p2 = 0x200000;
+	unsigned long a;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add_virt(pool, m1, p1, GP_CHUNK,
+						NUMA_NO_NODE), 0);
+	KUNIT_ASSERT_EQ(test, gen_pool_add_virt(pool, m2, p2, GP_CHUNK / 4,
+						NUMA_NO_NODE), 0);
+
+	KUNIT_EXPECT_EQ(test, gen_pool_size(pool), GP_CHUNK + GP_CHUNK / 4);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK + GP_CHUNK / 4);
+
+	KUNIT_EXPECT_EQ(test, gen_pool_virt_to_phys(pool, m1), p1);
+	KUNIT_EXPECT_EQ(test, gen_pool_virt_to_phys(pool, m1 + 100), p1 + 100);
+	KUNIT_EXPECT_EQ(test, gen_pool_virt_to_phys(pool, m2 + GP_CHUNK / 4 - 1),
+			p2 + GP_CHUNK / 4 - 1);
+	KUNIT_EXPECT_EQ(test, gen_pool_virt_to_phys(pool, m2 + GP_CHUNK / 4),
+			(phys_addr_t)-1);
+
+	/* A request that only fits in the larger chunk is served from it. */
+	a = gen_pool_alloc(pool, GP_CHUNK / 2);
+	KUNIT_ASSERT_EQ(test, a, m1);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK / 2 + GP_CHUNK / 4);
+
+	KUNIT_EXPECT_TRUE(test, gen_pool_has_addr(pool, m2, GP_CHUNK / 4));
+	/* A range spanning two chunks is not in the pool. */
+	KUNIT_EXPECT_FALSE(test, gen_pool_has_addr(pool, m1, 2 * GP_CHUNK));
+
+	gen_pool_free(pool, a, GP_CHUNK / 2);
+	KUNIT_EXPECT_EQ(test, gen_pool_avail(pool), GP_CHUNK + GP_CHUNK / 4);
+}
+
+static void genalloc_count_chunk(struct gen_pool *pool,
+				 struct gen_pool_chunk *chunk, void *data)
+{
+	int *count = data;
+
+	(*count)++;
+}
+
+static void genalloc_chunk_walk_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	int i, count = 0;
+
+	for (i = 0; i < 3; i++)
+		KUNIT_ASSERT_EQ(test, gen_pool_add(pool, gp_mem(test, GP_CHUNK),
+						   GP_CHUNK, NUMA_NO_NODE), 0);
+
+	gen_pool_for_each_chunk(pool, genalloc_count_chunk, &count);
+	KUNIT_EXPECT_EQ(test, count, 3);
+}
+
+static void genalloc_owner_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	int token;
+	void *owner = NULL;
+	unsigned long a;
+
+	KUNIT_ASSERT_EQ(test, gen_pool_add_owner(pool, base, -1, GP_CHUNK,
+						 NUMA_NO_NODE, &token), 0);
+
+	a = gen_pool_alloc_owner(pool, GP_UNIT, &owner);
+	KUNIT_ASSERT_EQ(test, a, base);
+	KUNIT_EXPECT_PTR_EQ(test, owner, (void *)&token);
+
+	owner = NULL;
+	gen_pool_free_owner(pool, a, GP_UNIT, &owner);
+	KUNIT_EXPECT_PTR_EQ(test, owner, (void *)&token);
+
+	/* A failed allocation reports no owner. */
+	owner = &owner;
+	KUNIT_EXPECT_EQ(test, gen_pool_alloc_owner(pool, 2 * GP_CHUNK, &owner),
+			0);
+	KUNIT_EXPECT_NULL(test, owner);
+}
+
+static void genalloc_dma_test(struct kunit *test)
+{
+	struct gen_pool *pool = gp_create(test, GP_ORDER);
+	unsigned long base = gp_mem(test, GP_CHUNK);
+	const phys_addr_t phys = 0x40000000;
+	dma_addr_t dma = 0;
+	u8 *a, *b;
+	int i;
+
+	memset((void *)base, 0xa5, GP_CHUNK);
+	KUNIT_ASSERT_EQ(test, gen_pool_add_virt(pool, base, phys, GP_CHUNK,
+						NUMA_NO_NODE), 0);
+
+	a = gen_pool_dma_alloc(pool, 2 * GP_UNIT, &dma);
+	KUNIT_ASSERT_PTR_EQ(test, a, (u8 *)base);
+	KUNIT_EXPECT_EQ(test, dma, (dma_addr_t)phys);
+	/* gen_pool_dma_alloc() does not clear the memory. */
+	KUNIT_EXPECT_EQ(test, a[0], 0xa5);
+
+	b = gen_pool_dma_zalloc(pool, 2 * GP_UNIT, &dma);
+	KUNIT_ASSERT_PTR_EQ(test, b, (u8 *)base + 2 * GP_UNIT);
+	KUNIT_EXPECT_EQ(test, dma, (dma_addr_t)(phys + 2 * GP_UNIT));
+	for (i = 0; i < 2 * GP_UNIT; i++)
+		KUNIT_EXPECT_EQ(test, b[i], 0);
+	/* Only the requested memory is cleared. */
+	KUNIT_EXPECT_EQ(test, b[2 * GP_UNIT], 0xa5);
+
+	gen_pool_free(pool, (unsigned long)a, 2 * GP_UNIT);
+	gen_pool_free(pool, (unsigned long)b, 2 * GP_UNIT);
+
+	/* With the start in use, the aligned variant skips to 128 bytes. */
+	a = gen_pool_dma_alloc(pool, GP_UNIT, NULL);
+	KUNIT_ASSERT_PTR_EQ(test, a, (u8 *)base);
+	b = gen_pool_dma_alloc_align(pool, GP_UNIT, &dma, 128);
+	KUNIT_ASSERT_PTR_EQ(test, b, (u8 *)base + 128);
+	KUNIT_EXPECT_EQ(test, dma, (dma_addr_t)(phys + 128));
+	gen_pool_free(pool, (unsigned long)a, GP_UNIT);
+	gen_pool_free(pool, (unsigned long)b, GP_UNIT);
+
+	/* A NULL @dma is allowed, and so is a NULL pool. */
+	a = gen_pool_dma_alloc(pool, GP_UNIT, NULL);
+	KUNIT_ASSERT_PTR_EQ(test, a, (u8 *)base);
+	gen_pool_free(pool, (unsigned long)a, GP_UNIT);
+	KUNIT_EXPECT_NULL(test, gen_pool_dma_alloc(NULL, GP_UNIT, &dma));
+	KUNIT_EXPECT_NULL(test, gen_pool_dma_zalloc(NULL, GP_UNIT, &dma));
+	KUNIT_EXPECT_NULL(test, gen_pool_dma_alloc_align(NULL, GP_UNIT, &dma,
+							 128));
+
+	/* Exhaustion returns NULL. */
+	KUNIT_EXPECT_NULL(test, gen_pool_dma_zalloc(pool, 2 * GP_CHUNK, &dma));
+}
+
+static void genalloc_devm_test(struct kunit *test)
+{
+	struct gen_pool *named, *unnamed;
+	struct device *dev;
+
+	dev = kunit_device_register(test, "genalloc-kunit");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(dev));
+
+	KUNIT_EXPECT_NULL(test, gen_pool_get(dev, NULL));
+	KUNIT_EXPECT_NULL(test, gen_pool_get(dev, "sram"));
+
+	named = devm_gen_pool_create(dev, GP_ORDER, NUMA_NO_NODE, "sram");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(named));
+	KUNIT_EXPECT_STREQ(test, named->name, "sram");
+	KUNIT_EXPECT_EQ(test, named->min_alloc_order, GP_ORDER);
+	KUNIT_EXPECT_PTR_EQ(test, gen_pool_get(dev, "sram"), named);
+
+	/* An unnamed lookup does not match a named pool, nor the reverse. */
+	KUNIT_EXPECT_NULL(test, gen_pool_get(dev, NULL));
+	KUNIT_EXPECT_NULL(test, gen_pool_get(dev, "other"));
+
+	unnamed = devm_gen_pool_create(dev, GP_ORDER, NUMA_NO_NODE, NULL);
+	KUNIT_ASSERT_FALSE(test, IS_ERR(unnamed));
+	KUNIT_EXPECT_PTR_EQ(test, gen_pool_get(dev, NULL), unnamed);
+	KUNIT_EXPECT_PTR_EQ(test, gen_pool_get(dev, "sram"), named);
+
+	/* Each name, including no name, can only be used once per device. */
+	KUNIT_EXPECT_EQ(test, PTR_ERR(devm_gen_pool_create(dev, GP_ORDER,
+							   NUMA_NO_NODE,
+							   "sram")),
+			-EINVAL);
+	KUNIT_EXPECT_EQ(test, PTR_ERR(devm_gen_pool_create(dev, GP_ORDER,
+							   NUMA_NO_NODE, NULL)),
+			-EINVAL);
+
+	/* Both pools are destroyed when the device goes away. */
+}
+
+static struct kunit_case genalloc_test_cases[] = {
+	KUNIT_CASE(genalloc_size_avail_test),
+	KUNIT_CASE(genalloc_alloc_free_test),
+	KUNIT_CASE(genalloc_first_fit_test),
+	KUNIT_CASE(genalloc_best_fit_test),
+	KUNIT_CASE(genalloc_first_fit_align_test),
+	KUNIT_CASE(genalloc_order_align_test),
+	KUNIT_CASE(genalloc_fixed_alloc_test),
+	KUNIT_CASE(genalloc_chunks_test),
+	KUNIT_CASE(genalloc_chunk_walk_test),
+	KUNIT_CASE(genalloc_owner_test),
+	KUNIT_CASE(genalloc_dma_test),
+	KUNIT_CASE(genalloc_devm_test),
+	{}
+};
+
+static struct kunit_suite genalloc_test_suite = {
+	.name = "genalloc",
+	.test_cases = genalloc_test_cases,
+};
+
+kunit_test_suite(genalloc_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the general purpose allocator");
+MODULE_LICENSE("GPL");

-- 
2.43.5

