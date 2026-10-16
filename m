Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C4239A04C
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135984; cv=none; b=FGbtR4ebpB9DdoriLCLNGMWNRWAvcz69dE1/1L/mPthgokrjL3TVve9G3b5T/cqYwVEL1Xa6/TT4g6KxGE5C9XgmSQb7WSg3f4GtxoEVikd6CxdsI6/3R35ZJvR4o9ISjZIzrW7TUryf+TiyhqVXQ0A7ggYHumMjOZrBIUbsA2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135984; c=relaxed/simple;
	bh=1UFzf7BnjxuTJMMsRGNzEo600moxklhxLQ+/r4XOoOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iveqtJEnkEH1OJFB4MGC6BKvQxQuclIpsGuttYabdFeXF9md+v4qtJwL7HBJRpLgRBdbrBj/b+R6/xd+p7WF9hER2arNCXowX4AzbnEvA9sB5QvEoKNJiPdUX9t30n4Un5ZQTrxZxgFKpjkVtkoKJsphTCA+tIzYEFdLN+vvkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg8evDs5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg8evDs5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1257182b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135982; x=1792740782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lzObHIWSDCCNYCjA2Ll3fvLIHrxT5aolRRJzJ0JUnI=;
        b=hg8evDs5f6g547/xgNERLEfhxp7+fQ9+3t5AJZ/+RRLDuGwMAOBP/2kwaagfLicWgm
         EyPechQUjxQXZeG5W6Gi4iynlBITevVdd+T8jifEMrKERGJtvfvjhAX2m8rkn2SDo2B5
         rpheeE7FK+xECqGtNhhvnwHzZY3qq7LqRVx6VVqV8B2LdBxE3ocImBexLUn4oTaiXQ8Y
         PPaDE7Q1AUoPjg5gEMJZe3xr/VUkupr0HhMlvx4IhHAXiTrdGxumjQ9GLgfYlTA8MpfD
         7ff34PEttz8rZjlfFTHmZXgjevlYS/sppgTyhMNBHAU8BoTfY9TYBeFk5Jnn9X5jEERC
         CKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135982; x=1792740782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lzObHIWSDCCNYCjA2Ll3fvLIHrxT5aolRRJzJ0JUnI=;
        b=c1yZLr9FuqBBZYfPcAo9UC4KoJYSq0Fse+vCmMx5mw/BkSmw8G32fMNu+RZ4qlcJEI
         DtRIyQge4Ff83iD6z4o2wMlTxA9hYONsK9tWqn8d0dcYgBT4yJ98zraeIPuda15DVXLU
         adWK5XDLd3P+ApMg9uephruFm69DV0sqXtgCclwo7nFbME4Hmo8wvZLElzunT2qY/F6Q
         ti6cDAYTzanYsziUxGwy7vrdlaJal7MhtBvv1eMb1vfSrzfQdnDXVMuKyXnvFB+R2mCa
         b6OXBLrgR65Rv3dH8TH0tUqncTbhPZww8Uz5yD1AppxoVXrZps8oUTC+qUCIA7VuGXx+
         tcEg==
X-Forwarded-Encrypted: i=1; AKwUvBzWmahBnx/lmXzbu/jHB1con/CnXRQqCvYirlkmBo+CijiUT3zedSsCOB57OHEEjjxi3HJqZUstA0Wt6QuZkI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7zMYYmS4xg8HEd4UvzGckanWzmYmFUesf5+hHYQAsqpdrGimx
	IHUEDBDfdO4tuR4TY3CKaB/ILdOPIqYdtPWLbDHVxH5OR4xsZLyZhFY=
X-Gm-Gg: AYBFou1qLszO5H2d52J1ChQpeMaQMMMahsOyJf9Qq7z98ielT+YJkCvkTXsr3wupOmg
	eieoKDUlgoza57roMl15Ax021Cp0m0mmO8eNW+qe7dI8RP5mftILAqXJO3BORt/ZvLT4jTPyYWT
	DYQo34EEZyr1vtfVL9Hbr3WpEeZmkoMk4lJqY/042EJLuYkeicMzobTerxWWT2k5jhgrO6n3gDX
	qnBheMLLRp4CqoirUFnlGACubvXtQ33D4Fiv/8f7zqhi5YJy1HKmtl4AWyQ5cE6ry0U3CpMUcde
	/biBS1QYYrQq1A9w233q7W02ZH4l8q/6ZjiCaK/0qM1wAu734xFNRZSrB5z/R5bVuJvVVEu+mZk
	qH6i5Lp/47itATlongdwJU3OwtnfmcdlbBrQfhhXg2N7uBtfMLSsQcvPfwYSNel78WzTpVKehHk
	M7UCOaXNi+I8eft4isKVe+Uk8Y3g8fUNeftHbl2pCFTrcCC7yPB1W5OPPTHwT6usm7UdLVo6tlr
	NoWDI/v
X-Received: by 2002:a05:6a00:3cca:b0:874:708d:b631 with SMTP id d2e1a72fcca58-897c79dd8c6mr18756274b3a.29.1792135980952;
        Fri, 16 Oct 2026 00:33:00 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b30ec4sm674788b3a.4.2026.10.16.00.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:32:59 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	David Gow <david@davidgow.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH v2] lib/sbitmap: add KUnit test suite
Date: Fri, 16 Oct 2026 15:32:53 +0800
Message-Id: <20261016073253.520971-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d6ea208a-0b53-4da8-998f-817a0e0b7c61@davidgow.net>
References: <d6ea208a-0b53-4da8-998f-817a0e0b7c61@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sbitmap is the tag allocator used by blk-mq and the I/O schedulers
built on top of it, but the plain, synchronous part of its API has no
test coverage at all.

Add a KUnit suite covering initialisation, allocation and exhaustion,
deferred clears, round-robin ordering, resize, the bitmap helpers and
sbitmap_for_each_set(), so that the behaviour is checked on every boot.

The new file is added to the BLOCK LAYER entry in MAINTAINERS, next to
lib/sbitmap.c, so that it does not end up without a maintainer.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
v2:
 - Test sb.alloc_hint as a plain boolean: KUNIT_EXPECT_NOT_NULL() passes
   its argument through a const void *, which a __percpu pointer cannot do
   on architectures that keep percpu data in a separate address space, so
   the test did not build on x86 (David Gow).
 - Use a BITS_PER_LONG-relative bit number in sbitmap_test_iterate_set().
   The hardcoded 130 lies past the end of the test bitmap when
   BITS_PER_LONG is 32, so that bit was never visited and the test failed;
   assert the precondition while at it (David Gow).

Both issues were reproduced and the fixes verified:
  - x86_64 (gcc 15.2, CONFIG_USE_X86_SEG_SUPPORT=y): v1 fails to build
    with "comparison of pointers to disjoint address spaces" at the
    KUNIT_EXPECT_NOT_NULL(sb.alloc_hint); v2 builds clean.
  - i386, i.e. 32-bit (gcc): v1 fails sbitmap_test_iterate_set with
    nr_visited == 5, as the out-of-range bit 130 is never visited;
    v2 passes.
  - v2 runs the whole suite green (8/8) under KUnit/QEMU on arm64,
    i386 and x86_64.

Link: https://lore.kernel.org/r/20261014082704.33667-1-szwyb123@gmail.com
Link: https://lore.kernel.org/r/d6ea208a-0b53-4da8-998f-817a0e0b7c61@davidgow.net
 MAINTAINERS               |   1 +
 lib/Kconfig.debug         |  13 ++
 lib/tests/Makefile        |   1 +
 lib/tests/sbitmap_kunit.c | 308 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 323 insertions(+)
 create mode 100644 lib/tests/sbitmap_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..c8510e6f1817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4726,6 +4726,7 @@ F:	include/uapi/linux/blk*
 F:	include/uapi/linux/ioprio.h
 F:	kernel/trace/blktrace.c
 F:	lib/sbitmap.c
+F:	lib/tests/sbitmap_kunit.c
 
 BLOCK LAYER DEVICE DRIVER API [RUST]
 M:	Andreas Hindborg <a.hindborg@kernel.org>
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6b24a2c89b84..f5fe7f5a0a4d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2456,6 +2456,19 @@ config PRINTF_KUNIT_TEST
 
 	  If unsure, say N.
 
+config SBITMAP_KUNIT_TEST
+	tristate "KUnit test for sbitmap" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on SBITMAP
+	default KUNIT_ALL_TESTS
+	help
+	  Enable to turn on sbitmap tests, running at boot or module load time.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config SCANF_KUNIT_TEST
 	tristate "KUnit test scanf() family of functions at runtime" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 3cac3b63a752..1f49555f94c3 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
 obj-$(CONFIG_PRANDOM_KUNIT_TEST) += random32_kunit.o
 obj-$(CONFIG_PRINTF_KUNIT_TEST) += printf_kunit.o
 obj-$(CONFIG_RANDSTRUCT_KUNIT_TEST) += randstruct_kunit.o
+obj-$(CONFIG_SBITMAP_KUNIT_TEST) += sbitmap_kunit.o
 obj-$(CONFIG_SCANF_KUNIT_TEST) += scanf_kunit.o
 obj-$(CONFIG_SEQ_BUF_KUNIT_TEST) += seq_buf_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
diff --git a/lib/tests/sbitmap_kunit.c b/lib/tests/sbitmap_kunit.c
new file mode 100644
index 000000000000..284dcb5d7188
--- /dev/null
+++ b/lib/tests/sbitmap_kunit.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for the scalable bitmap (sbitmap) implementation.
+ *
+ * sbitmap is the tag allocator used by blk-mq and the I/O schedulers built on
+ * top of it, but it has no tests.  These tests pin down the observable
+ * behaviour of the plain, synchronous parts of the API.
+ *
+ * Copyright (C) 2026 Wang Yibo <szwyb123@gmail.com>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/gfp.h>
+#include <linux/sbitmap.h>
+
+#include <kunit/test.h>
+
+/*
+ * Big enough to span several words for any plausible BITS_PER_LONG, and not a
+ * power of two so that the last word is partially used.
+ */
+#define SBITMAP_TEST_DEPTH	(3 * BITS_PER_LONG + 5)
+
+static void sbitmap_test_init(struct kunit *test)
+{
+	const unsigned int depth = 97;
+	struct sbitmap sb;
+	int ret;
+
+	ret = sbitmap_init_node(&sb, depth, -1, GFP_KERNEL, NUMA_NO_NODE,
+				false, true);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, sb.depth, depth);
+	KUNIT_EXPECT_EQ(test, sb.shift,
+			(unsigned int)sbitmap_calculate_shift(depth));
+	KUNIT_EXPECT_EQ(test, sb.map_nr, DIV_ROUND_UP(depth, 1U << sb.shift));
+	KUNIT_EXPECT_FALSE(test, sb.round_robin);
+	/*
+	 * alloc_hint is a __percpu pointer, which the generic pointer
+	 * assertions cannot take: on x86, where percpu data lives in
+	 * __seg_gs, passing it through a const void * does not compile.
+	 * Test it as a plain boolean instead.
+	 */
+	KUNIT_EXPECT_TRUE(test, sb.alloc_hint);
+	KUNIT_EXPECT_FALSE(test, sbitmap_any_bit_set(&sb));
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), 0U);
+	sbitmap_free(&sb);
+
+	/* An explicitly requested shift is honoured. */
+	ret = sbitmap_init_node(&sb, depth, 3, GFP_KERNEL, NUMA_NO_NODE,
+				false, true);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, sb.shift, 3U);
+	KUNIT_EXPECT_EQ(test, sb.map_nr, DIV_ROUND_UP(depth, 1U << 3));
+	sbitmap_free(&sb);
+
+	/* BITS_PER_LONG bits per word is the largest representable granularity. */
+	ret = sbitmap_init_node(&sb, depth, ilog2(BITS_PER_LONG), GFP_KERNEL,
+				NUMA_NO_NODE, false, true);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, sb.shift, (unsigned int)ilog2(BITS_PER_LONG));
+	KUNIT_EXPECT_EQ(test, sb.map_nr, DIV_ROUND_UP(depth, BITS_PER_LONG));
+	sbitmap_free(&sb);
+
+	/* Anything above that cannot be represented and must be rejected. */
+	ret = sbitmap_init_node(&sb, depth, ilog2(BITS_PER_LONG) + 1,
+				GFP_KERNEL, NUMA_NO_NODE, false, true);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static void sbitmap_test_calculate_shift(struct kunit *test)
+{
+	/* Maps too small to spread over several words keep the default. */
+	KUNIT_EXPECT_EQ(test, sbitmap_calculate_shift(0), ilog2(BITS_PER_LONG));
+	KUNIT_EXPECT_EQ(test, sbitmap_calculate_shift(1), ilog2(BITS_PER_LONG));
+	KUNIT_EXPECT_EQ(test, sbitmap_calculate_shift(3), ilog2(BITS_PER_LONG));
+
+	/* Four bits map to one bit per word. */
+	KUNIT_EXPECT_EQ(test, sbitmap_calculate_shift(4), 0);
+
+	/* The shift grows back as the depth increases. */
+	KUNIT_EXPECT_EQ(test, sbitmap_calculate_shift(4 * BITS_PER_LONG - 1),
+			ilog2(BITS_PER_LONG) - 1);
+	KUNIT_EXPECT_EQ(test, sbitmap_calculate_shift(4 * BITS_PER_LONG),
+			ilog2(BITS_PER_LONG));
+}
+
+static void sbitmap_test_get_exhaust(struct kunit *test)
+{
+	DECLARE_BITMAP(seen, SBITMAP_TEST_DEPTH) = { 0 };
+	struct sbitmap sb;
+	unsigned int i;
+	int bit;
+
+	KUNIT_ASSERT_EQ(test, sbitmap_init_node(&sb, SBITMAP_TEST_DEPTH, -1,
+						GFP_KERNEL, NUMA_NO_NODE,
+						false, true), 0);
+
+	/* Every bit is handed out exactly once, then the map is empty. */
+	for (i = 0; i < SBITMAP_TEST_DEPTH; i++) {
+		bit = sbitmap_get(&sb);
+		KUNIT_ASSERT_GE(test, bit, 0);
+		KUNIT_ASSERT_LT(test, bit, (int)SBITMAP_TEST_DEPTH);
+		KUNIT_ASSERT_FALSE(test, test_bit(bit, seen));
+		__set_bit(bit, seen);
+	}
+
+	KUNIT_EXPECT_TRUE(test, sbitmap_any_bit_set(&sb));
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb),
+			(unsigned int)SBITMAP_TEST_DEPTH);
+	KUNIT_EXPECT_EQ(test, sbitmap_get(&sb), -1);
+
+	sbitmap_free(&sb);
+}
+
+static void sbitmap_test_put_reuse(struct kunit *test)
+{
+	struct sbitmap sb;
+	unsigned int i;
+	int bit;
+
+	KUNIT_ASSERT_EQ(test, sbitmap_init_node(&sb, BITS_PER_LONG, -1,
+						GFP_KERNEL, NUMA_NO_NODE,
+						true, true), 0);
+
+	for (i = 0; i < BITS_PER_LONG; i++)
+		KUNIT_ASSERT_GE(test, sbitmap_get(&sb), 0);
+
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), (unsigned int)BITS_PER_LONG);
+	KUNIT_EXPECT_EQ(test, sbitmap_get(&sb), -1);
+
+	/*
+	 * Freeing a single bit must make exactly that bit available again, no
+	 * matter which bit it was.
+	 */
+	for (i = 0; i < BITS_PER_LONG; i++) {
+		sbitmap_put(&sb, i);
+		KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb),
+				(unsigned int)BITS_PER_LONG - 1);
+		bit = sbitmap_get(&sb);
+		KUNIT_EXPECT_EQ(test, bit, (int)i);
+		KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb),
+				(unsigned int)BITS_PER_LONG);
+		KUNIT_EXPECT_EQ(test, sbitmap_get(&sb), -1);
+	}
+
+	sbitmap_free(&sb);
+}
+
+static void sbitmap_test_round_robin(struct kunit *test)
+{
+	struct sbitmap sb;
+	unsigned int i;
+	int bit, prev = -1;
+
+	KUNIT_ASSERT_EQ(test, sbitmap_init_node(&sb, SBITMAP_TEST_DEPTH, -1,
+						GFP_KERNEL, NUMA_NO_NODE,
+						true, true), 0);
+
+	/*
+	 * round_robin must hand out strictly increasing bit numbers while the
+	 * map fills up from empty.
+	 */
+	for (i = 0; i < SBITMAP_TEST_DEPTH; i++) {
+		bit = sbitmap_get(&sb);
+		KUNIT_ASSERT_GE(test, bit, 0);
+		KUNIT_ASSERT_LT(test, bit, (int)SBITMAP_TEST_DEPTH);
+		if (prev != -1)
+			KUNIT_ASSERT_GT(test, bit, prev);
+		prev = bit;
+	}
+
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb),
+			(unsigned int)SBITMAP_TEST_DEPTH);
+	KUNIT_EXPECT_EQ(test, sbitmap_get(&sb), -1);
+
+	sbitmap_free(&sb);
+}
+
+static void sbitmap_test_resize(struct kunit *test)
+{
+	const unsigned int depth = 4 * BITS_PER_LONG;
+	struct sbitmap sb;
+	unsigned int i;
+
+	KUNIT_ASSERT_EQ(test, sbitmap_init_node(&sb, depth, -1, GFP_KERNEL,
+						NUMA_NO_NODE, true, true), 0);
+
+	for (i = 0; i < depth; i++)
+		KUNIT_ASSERT_GE(test, sbitmap_get(&sb), 0);
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), depth);
+
+	/* Shrinking hides the bits past the new depth. */
+	sbitmap_resize(&sb, depth / 2);
+	KUNIT_EXPECT_EQ(test, sb.depth, depth / 2);
+	KUNIT_EXPECT_EQ(test, sb.map_nr,
+			DIV_ROUND_UP(depth / 2, 1U << sb.shift));
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), depth / 2);
+	KUNIT_EXPECT_EQ(test, sbitmap_get(&sb), -1);
+
+	/* Growing makes them visible again; they are still allocated. */
+	sbitmap_resize(&sb, depth);
+	KUNIT_EXPECT_EQ(test, sb.depth, depth);
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), depth);
+	KUNIT_EXPECT_EQ(test, sbitmap_get(&sb), -1);
+
+	sbitmap_free(&sb);
+}
+
+static void sbitmap_test_set_clear_bit(struct kunit *test)
+{
+	static const unsigned int bits[] = {
+		0, 1, BITS_PER_LONG - 1, BITS_PER_LONG,
+		2 * BITS_PER_LONG + 3, SBITMAP_TEST_DEPTH - 1
+	};
+	struct sbitmap sb;
+	unsigned int i;
+
+	KUNIT_ASSERT_EQ(test, sbitmap_init_node(&sb, SBITMAP_TEST_DEPTH, -1,
+						GFP_KERNEL, NUMA_NO_NODE,
+						false, true), 0);
+
+	KUNIT_EXPECT_FALSE(test, sbitmap_any_bit_set(&sb));
+
+	for (i = 0; i < ARRAY_SIZE(bits); i++) {
+		sbitmap_set_bit(&sb, bits[i]);
+		KUNIT_EXPECT_TRUE(test, sbitmap_test_bit(&sb, bits[i]));
+	}
+	KUNIT_EXPECT_TRUE(test, sbitmap_any_bit_set(&sb));
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), (unsigned int)ARRAY_SIZE(bits));
+
+	for (i = 0; i < ARRAY_SIZE(bits); i++) {
+		sbitmap_clear_bit(&sb, bits[i]);
+		KUNIT_EXPECT_FALSE(test, sbitmap_test_bit(&sb, bits[i]));
+	}
+	KUNIT_EXPECT_FALSE(test, sbitmap_any_bit_set(&sb));
+	KUNIT_EXPECT_EQ(test, sbitmap_weight(&sb), 0U);
+
+	sbitmap_free(&sb);
+}
+
+struct sbitmap_iter_ctx {
+	struct kunit *test;
+	DECLARE_BITMAP(visited, SBITMAP_TEST_DEPTH);
+	unsigned int nr_visited;
+};
+
+static bool sbitmap_iter_collect(struct sbitmap *sb, unsigned int bitnr,
+				 void *data)
+{
+	struct sbitmap_iter_ctx *ctx = data;
+
+	KUNIT_ASSERT_LT(ctx->test, bitnr, SBITMAP_TEST_DEPTH);
+	__set_bit(bitnr, ctx->visited);
+	ctx->nr_visited++;
+
+	return true;
+}
+
+static void sbitmap_test_iterate_set(struct kunit *test)
+{
+	static const unsigned int bits[] = {
+		0, 5, BITS_PER_LONG - 1, BITS_PER_LONG, 2 * BITS_PER_LONG + 3,
+		SBITMAP_TEST_DEPTH - 1
+	};
+	struct sbitmap_iter_ctx ctx = { .test = test };
+	struct sbitmap sb;
+	unsigned int i;
+
+	KUNIT_ASSERT_EQ(test, sbitmap_init_node(&sb, SBITMAP_TEST_DEPTH, -1,
+						GFP_KERNEL, NUMA_NO_NODE,
+						false, true), 0);
+
+	for (i = 0; i < ARRAY_SIZE(bits); i++) {
+		KUNIT_ASSERT_LT(test, bits[i], SBITMAP_TEST_DEPTH);
+		sbitmap_set_bit(&sb, bits[i]);
+	}
+
+	sbitmap_for_each_set(&sb, sbitmap_iter_collect, &ctx);
+
+	KUNIT_EXPECT_EQ(test, ctx.nr_visited, (unsigned int)ARRAY_SIZE(bits));
+	for (i = 0; i < ARRAY_SIZE(bits); i++)
+		KUNIT_EXPECT_TRUE(test, test_bit(bits[i], ctx.visited));
+
+	sbitmap_free(&sb);
+}
+
+static struct kunit_case sbitmap_test_cases[] = {
+	KUNIT_CASE(sbitmap_test_init),
+	KUNIT_CASE(sbitmap_test_calculate_shift),
+	KUNIT_CASE(sbitmap_test_get_exhaust),
+	KUNIT_CASE(sbitmap_test_put_reuse),
+	KUNIT_CASE(sbitmap_test_round_robin),
+	KUNIT_CASE(sbitmap_test_resize),
+	KUNIT_CASE(sbitmap_test_set_clear_bit),
+	KUNIT_CASE(sbitmap_test_iterate_set),
+	{}
+};
+
+static struct kunit_suite sbitmap_test_suite = {
+	.name = "sbitmap",
+	.test_cases = sbitmap_test_cases,
+};
+
+kunit_test_suite(sbitmap_test_suite);
+
+MODULE_DESCRIPTION("KUnit test for sbitmap");
+MODULE_LICENSE("GPL");

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.25.1

