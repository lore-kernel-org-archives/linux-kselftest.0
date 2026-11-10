Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276989;
	b=OUAuj/uaet8YJ6ULXNH1ZwuHgVUliU3wp1K+K44b27riKPFjYljxe/fHARsm0y0EoXIY
	 /zVwpH4WzPQwRGj1r1rDIgNB4YzIqAoVL+LdaGRsTVN+ekojI+7cl9qKMS/Ol7f8NLFz/
	 EYGrgWXEmFtrIHIr8tLYY71UyBSW9CvEVSOLcmKz5jCj+hi4pGiSNCnlfloCOfzc2sym1
	 e5fiR9DN4Yyd6/CcUatr+aL9nkKiXgh+g7ZbDm+10ASSLQE3zWxTv3ucilnLxu00iA0MH
	 iPhxJWs6BFIzpXAHEPKTY+yrez17DWETXavqehb5Ql4+tzB9cjoxxqESEC7EmMhH0gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t5iHwKqCBQH6cGu8i0WtqCh8MXIsDvoUDWbirdC0v3I=;
	b=HocyC/jPn4oIcq5NWA55JMXwrDxyLbgH+K4mx3xT5ThIV4cuE0aPSBdd94eZGx8xqCzJ
	 mJDLAb2sNsiYQVzjVyocdff1EEbEUlZo40Iv1Qe8sUIUz29ZC4d3XLsbWt0Pe83pQ5hc3
	 93uOygLgo0FR6peVM4k+V5kW9CoGBdmEbHQArs1IxKqhTKA9T9T4EdfSOMYHNCVsXi+zO
	 wVyql0FcBT8YvV9RJfazZ4toGEf4I8Rx9z/udAj3MmIJN8kXCisbyL9w5muSLQexGZric
	 p9DMN81XOZ1oUvnUl5dq03dWOZn1ZA5GYJ/7HXCFIx9C0ihED6KWhzUGyh9iZJzVjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGvmsVH2;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D46606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGvmsVH2
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12850375e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 18:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276987; x=1794881787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5iHwKqCBQH6cGu8i0WtqCh8MXIsDvoUDWbirdC0v3I=;
        b=LGvmsVH2kb5LvFBz93PKj99CSkDIVjp5oSn6zmzfU0Lz4RHK9c5OtBlHkMrkD3HEKT
         zo0Hp/rb3EHAW7cJ6a4LmjHBGkdU6sOn47npTN7cz2TebjA7A7sMCYfhF9QdI6B0X1AW
         HuL8R95+F4oA47yVZc9L8Rs6S2umQfFKIzYdk3l6KOBkMzMwhzeEVFttVGpYFpQKRfKU
         T4B093S9p1fQ+1hC3P6yko6dDMhrVNUElDhGiEEQCNSwypwQLpo4y9W1VxC2hmjbJVCN
         dOLeGSIUDsVVSk8bQqU4occzpYU87YM34r2ILcgCdyRWRI7VeAZ8zzSiBv+KOdBr0rXe
         MPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276987; x=1794881787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5iHwKqCBQH6cGu8i0WtqCh8MXIsDvoUDWbirdC0v3I=;
        b=aq+kiIt/Kyv58sIxdqtAzt4L6/wiMOo3WRCKduwt6ieHc3nFvI88TMkn4IqdzyZITC
         r10DSM5MvgxG+zp/ZbzD78gp/zpkmGDTgcCc+vt2D+cCTh7wBEvD5IvEzwd6mNfGMRyR
         PK5O9RTIkZbnC6hJ5xzuAaUURUYT0ahuwKDpGqIruHdrDOtQ1aQbtTD+KyxCqwPQLg23
         5OKEke3HgSez4dICN9Inp6lPb1jh1iBYRwoqNixvx/6ke4RPxqFZpjJKnbG9Z1lp4d/r
         qi16hW6trUiFguL/dB+OOpKpHsGH6GwJNpMwwJXLHoVOY/s+DaCvBL55fxSjZKofE/o5
         17/Q==
X-Gm-Message-State: APuU4Z8luKjwM8eq8k5FG6HCxSLAatrkkc2Owuev4LdUs+ly0qD9Z2LU
	VVc0gVf5hjwlgxN7EawLdES51qtqqB8xynpIOTy0InxbMpVm5LfShA4B
X-Gm-Gg: AYBFou3XqSc67cGTDx0+Kz5geaUhN573R2C1MJRb2u59CP/0r5CoHyG69BF4y/wl7OI
	RNUQfnkSveNK/rWFcqAMY18prQyyfY9TWfSA8fSLDOHtYuygoc5/szGRqqfMl+qGCJ7yrIYLkRb
	3oz0r+Oqs2tcMLKyDMunM/apBOkFCdvjsM5LjYedNYedO92iM/Gu3Ab22O298yBKafFu1FUhJto
	cWJGTvGedQIK2o1cOCm1oDwZ5ysQGl0w5+DTeJ9QlS7HW5+YgfugF4wCHikgePDHrQ54QR1wD/0
	yYigICE3m6NuCWePD2ksNxfv95QNPV/rx0EBCQg2V25xgchJmP4W+bED8u5imX5VR0Pz/tYDVVY
	kk/JrWyXqx9smhMuGxbOx3rtlYXKtuC9NyQlCdtIUbqLiINJOPmvQVutehYmEAxt+pUlRq8l1U9
	quxw5jDh8vMbTMTsMxXYQUcq8YgNnh3JIckIF+ga/mQFaCp7QrpIIriFfpkiyB/H8iZ3VFGuNcb
	CdDRE5Ic1O+y+B0J+k2q5y3KAdrG8l1nYS2bz7zcXBgwF3/soLxf1GytYaXMFSvH7SGczl556ah
	Yaccj/iFgAzchhQc07sbzrTNK9skjs2Vq+VJonnB15zrZUdjqAmJtsLmcWoffy2/7A==
X-Received: by 2002:a05:600c:8b58:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba02349ddcmr13740545e9.24.1794276986688;
        Mon, 09 Nov 2026 18:16:26 -0800 (PST)
Received: from asahi.teknoraver.net ([195.182.211.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba023690f5sm20124365e9.3.2026.11.09.18.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:16:26 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7] kunit: memcpy: Add benchmark
Date: Tue, 10 Nov 2026 03:16:22 +0100
Message-ID: <20261110021622.122490-1-technoboy85@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add optional benchmarks for memcpy() and memmove(), enabled with
CONFIG_MEMCPY_KUNIT_BENCHMARK.

Each function is run over several buffer sizes, up to 4 MiB, with both
aligned and unaligned buffers, to spot platforms where unaligned
accesses have a noticeable performance impact.

The copy length is hidden from the compiler, so the architecture's
out-of-line implementation is always measured rather than an inlined
constant-size copy.

Sample output on a RISC-V machine:
	# modprobe memcpy_kunit
	KTAP version 1
	1..1
	    KTAP version 1
	    # Subtest: memcpy
	    # module: memcpy_kunit
	    1..8
	    [...]
	    # memcpy_bench_test: memcpy: aligned copy of len 2: 3 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 2: 4 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 64: 127 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 64: 117 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 256: 508 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 256: 542 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 4194304: 848 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 4194304: 699 MB/s
	    # memcpy_bench_test.speed: slow
	    ok 7 memcpy_bench_test
	    # memmove_bench_test: memmove: aligned move of len 64: 121 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 64: 104 MB/s
	    # memmove_bench_test: memmove: aligned move of len 256: 445 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 256: 410 MB/s
	    # memmove_bench_test: memmove: aligned move of len 4194304: 1419 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 4194304: 1360 MB/s
	    # memmove_bench_test.speed: slow
	    ok 8 memmove_bench_test
	# memcpy: pass:8 fail:0 skip:0 total:8
	# Totals: pass:8 fail:0 skip:0 total:8
	ok 1 memcpy

Signed-off-by: Matteo Croce <technoboy85@gmail.com>
---
v6 -> v7:
- subject: "KUnit: memcpy: add benchmark" -> "kunit: memcpy: Add benchmark"
- memmove: make the aligned case actually aligned
- fix int overflow in throughput calculation, cap max size to 4 MiB
- hide copy length from the compiler (OPTIMIZER_HIDE_VAR)
- always register the bench cases, kunit_skip() when disabled
- Kconfig: move under MEMCPY_KUNIT_TEST, reword prompt and help
- update sample output

v6: https://lore.kernel.org/all/20260302023052.73943-1-teknoraver@meta.com/

 lib/Kconfig.debug        |  12 ++++
 lib/tests/memcpy_kunit.c | 120 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6b24a2c89b84..7884a9a0f78f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3006,6 +3006,18 @@ config MEMCPY_KUNIT_TEST
 
 	  If unsure, say N.
 
+config MEMCPY_KUNIT_BENCHMARK
+	bool "Benchmark memcpy() and memmove() functions at runtime"
+	depends on MEMCPY_KUNIT_TEST
+	help
+	  Adds benchmark cases to the memcpy KUnit test suite, measuring
+	  the throughput of memcpy() and memmove() over several buffer
+	  sizes, with both aligned and unaligned buffers. This helps to
+	  spot architectures where unaligned accesses have a noticeable
+	  performance impact. Results are printed in the KUnit log.
+
+	  If unsure, say N.
+
 config MIN_HEAP_KUNIT_TEST
 	tristate "Min heap test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
index d36933554e46..7b7103a72ada 100644
--- a/lib/tests/memcpy_kunit.c
+++ b/lib/tests/memcpy_kunit.c
@@ -11,6 +11,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
@@ -493,6 +494,123 @@ static void memmove_overlap_test(struct kunit *test)
 	}
 }
 
+#define COPIES_NUM	100
+#define BENCH_MAX_SIZE	min_t(size_t, SZ_4M, KMALLOC_MAX_SIZE)
+
+static void memcpy_bench_size_align(struct kunit *test, int size, bool unalign)
+{
+	u64 start, end, total_ns = 0;
+	char *dst, *src;
+	int ret = 0;
+
+	/* Prevent constant-size inlining: always call the arch memcpy() */
+	OPTIMIZER_HIDE_VAR(size);
+
+	dst = kzalloc(size, GFP_KERNEL);
+	if (!dst) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	src = kzalloc(size, GFP_KERNEL);
+	if (!src) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
+	for (int i = 0; i < COPIES_NUM; i++) {
+		local_irq_disable();
+		start = ktime_get_ns();
+		memcpy(dst + unalign, src, size - unalign);
+		end = ktime_get_ns();
+		local_irq_enable();
+		total_ns += end - start;
+	}
+
+	/* Avoid division by zero */
+	if (!total_ns)
+		total_ns = 1;
+
+	kunit_info(test, "memcpy: %saligned copy of len %d: %llu MB/s",
+		   unalign ? "un" : "", size,
+		   div64_u64((u64)COPIES_NUM * size * NSEC_PER_SEC,
+			     total_ns * 1024 * 1024));
+
+	kfree(src);
+
+out_free:
+	kfree(dst);
+
+out:
+	KUNIT_ASSERT_EQ(test, ret, 0);
+}
+
+static void memcpy_bench_size(struct kunit *test, int size)
+{
+	memcpy_bench_size_align(test, size, false);
+	memcpy_bench_size_align(test, size, true);
+}
+
+static void memcpy_bench_test(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_MEMCPY_KUNIT_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	memcpy_bench_size(test, 2);
+	memcpy_bench_size(test, 64);
+	memcpy_bench_size(test, 256);
+	memcpy_bench_size(test, BENCH_MAX_SIZE);
+}
+
+static void memmove_bench_size_align(struct kunit *test, int size, bool unalign)
+{
+	u64 start, end, total_ns = 0;
+	char *buf;
+	/* Keep the destination word aligned in the aligned case */
+	const int shift = ALIGN(size / 10, sizeof(long));
+
+	/* Prevent constant-size inlining: always call the arch memmove() */
+	OPTIMIZER_HIDE_VAR(size);
+
+	buf = kzalloc(size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	for (int i = 0; i < COPIES_NUM; i++) {
+		local_irq_disable();
+		start = ktime_get_ns();
+		memmove(buf + shift + unalign, buf, size - shift - unalign);
+		end = ktime_get_ns();
+		local_irq_enable();
+		total_ns += end - start;
+	}
+
+	if (!total_ns)
+		total_ns = 1;
+
+	kunit_info(test, "memmove: %saligned move of len %d: %llu MB/s",
+		   unalign ? "un" : "", size,
+		   div64_u64((u64)COPIES_NUM * (size - shift) * NSEC_PER_SEC,
+			     total_ns * 1024 * 1024));
+
+	kfree(buf);
+}
+
+static void memmove_bench_size(struct kunit *test, int size)
+{
+	memmove_bench_size_align(test, size, false);
+	memmove_bench_size_align(test, size, true);
+}
+
+static void memmove_bench_test(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_MEMCPY_KUNIT_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	memmove_bench_size(test, 64);
+	memmove_bench_size(test, 256);
+	memmove_bench_size(test, BENCH_MAX_SIZE);
+}
+
 static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE(memset_test),
 	KUNIT_CASE(memcpy_test),
@@ -500,6 +618,8 @@ static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE_SLOW(memmove_test),
 	KUNIT_CASE_SLOW(memmove_large_test),
 	KUNIT_CASE_SLOW(memmove_overlap_test),
+	KUNIT_CASE_SLOW(memcpy_bench_test),
+	KUNIT_CASE_SLOW(memmove_bench_test),
 	{}
 };
 
-- 
2.56.0

