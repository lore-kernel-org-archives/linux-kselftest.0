Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB01B7F4
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772418664; cv=none; b=k8A5rwGUd9g2m5EKSXo/TkbPQJZTCmqD/2QRbrG8eNs1pfeasN3cybunS9c3zSCG4winD00iJeaxUoKR2DIoza8/mQaRGY7wZGzexMmH4jZf5oxggmmDNvmdc5P2xl54rtqdSwlV82VuLMn7OpY9xUfDx+RtnkKoqetSMjgDWJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772418664; c=relaxed/simple;
	bh=u3euo/mpfzq7bpYJZUZWX2vY3seyAu7wZYcM5iBuuBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hg776U+9TKO+X+dRR/jnPRqrlwJmViq/ye+01VkmPgiLJXzFjfKuHKNmrlFLkgfPtFgGb5rkO+2W63U+6D/gIUHn75npa+R2gOXxA6yvHmuDy7oo2bWZ/mVT3vN9mErAi+K7zg1snCCyrnrWPjfSVPssA6r67bVt+cs70heUB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk5lUGyO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk5lUGyO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso34290505e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 18:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772418661; x=1773023461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrRh6t/RdWKqG/BjR0id2zS6GqhG+1lVaxqoEpCdDJM=;
        b=bk5lUGyOyGLLPPD6BD4pDjAwXcE0OsLzT8UIVfaxZJECBifE43byFq/WFdPoxPJzmf
         /MiVRvvRE9kivQbzE8e1rniCWouKUIO1GsjkN/l9YFdhZLEEKmsDw5gQyfY6CXRgLEAM
         jL4C/Wiets3hbkCEszY9xSrFWMoNOoizAQPHadwGgjSeESSgwxu+bfzV8Vwsmp+A3hzN
         evUR1v+cvfRWwneg4nrAZTapkkfC6fyZvFQogSrQcr7TGLjy55IlcaHcj2JoNWpQKgKm
         NcPc889v9QH9c9yIVU4TCQ543uupbnktVgcS2dombHD14hS42TArkSvsgelqlf6m8UoJ
         7ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772418661; x=1773023461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrRh6t/RdWKqG/BjR0id2zS6GqhG+1lVaxqoEpCdDJM=;
        b=SZZabgQctubvxwi4dpcyd/3OLvZzfaZBP9Y/ONm8dqgvNd5yoPW/KBAhDV4LuF6dA3
         vU3bpyeAC1KdIvggUeWFT6FbLSYN9DzwbQSPVy7dD5V0fdw6jU9FSDuELnMXfbZfFQ8+
         7+LTVrJ6erHag5NgAKacztKAWk95JuHgdTu9qw7RfTiwuCljX0pqZoEAEDOAvpv5bpRA
         ReDAsdT5ytHLHHXsH6wvLOPNR581XZSrzYugMf08JNg0oHupLgKr898GX2y+F/Pz4+I6
         6o6GGcbZaWnldECkiFofh/ruzvhm6rG3qO6HhZ4Wxmm7WWISIBtBp3+pu/EptSkxET8S
         S/zg==
X-Gm-Message-State: AOJu0YwGudhFKpkvaBIvELduHJysFEIhg4j9KRs4R1XLHUjwFavnYPdk
	jEwfXOuBWSFuCab2Lbmaq+AxMGj5YiI1Ld9GSxpG1CKnVLqawDAEVAexJTy+ffMbJQY=
X-Gm-Gg: ATEYQzxSdS+i+O7YcoBbasIBFYxi5FVHPDtb8s4+2HgL4dvhkA+j2y3pWU8omewykWe
	aG3wzysl49XIvcZeEd1Ib/f+zp+gQQxMthhD5yUnLrymilo0BSGhdOHiFkcklxH9t3JnipuKGqA
	EzZytjOtd82gANFck4mTTNzOBANTYdRM+rh6RCId7a4JuY7jx7WpF19CAln+LWcrRz/BUPuLl87
	zEIv8x4VhK+6Y7gjfrDisz6HXWR7z/Lumh5ec3uPoE2Dzsbjb4i3diFJL8gYeH0170Nz+xfXm0u
	cMRF4UJ1peK5XsA/uBIZepWJRWlf6OLIWr+sQuBpjSS4SAXuxR6ZnXw5b9UVzGkRnX4mRWwQRDX
	BIZa9o1S9qet97pmIUNhJuO5gx3XgFr5V8CGvKbbHD3WWFwvh1LghbXQ0yi9tcYjB19doRiWXK8
	qWb2hfsKetXpqZPjUiqi2soMFFrdsPItIf/L4wm6T5hJ8Ap/TUjvxKrpAwVMKAiV/Q6WjLGm3W
X-Received: by 2002:a05:600c:3542:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483c9bc5596mr195144855e9.2.1772418660419;
        Sun, 01 Mar 2026 18:31:00 -0800 (PST)
Received: from turbo.teknoraver.net (net-5-95-156-124.cust.vodafonedsl.it. [5.95.156.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4175fd2sm7606417f8f.14.2026.03.01.18.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:30:59 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
X-Google-Original-From: Matteo Croce <teknoraver@meta.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] KUnit: memcpy: add benchmark
Date: Mon,  2 Mar 2026 03:30:52 +0100
Message-ID: <20260302023052.73943-1-teknoraver@meta.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add optional benchmarks for memcpy() and memmove() functions.
Each benchmark is run with different size and both aligned and unaligned
buffers, to spot unaligned issues on platforms where they have a noticeable
performance impact.

Sample output on a RISC-V machine:
	# modprobe memcpy_kunit
	KTAP version 1
	1..1
	    KTAP version 1
	    # Subtest: memcpy
	    # module: memcpy_kunit
	    1..8
	    [...]
	    # memcpy_bench_test: memcpy: aligned copy of len 2: 6 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 2: 6 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 64: 179 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 64: 170 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 256: 697 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 256: 421 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 4194304: 935 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 4194304: 333 MB/s
	    # memcpy_bench_test.speed: slow
	    ok 7 memcpy_bench_test
	    # memmove_bench_test: memmove: aligned move of len 64: 162 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 64: 162 MB/s
	    # memmove_bench_test: memmove: aligned move of len 256: 647 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 256: 647 MB/s
	    # memmove_bench_test: memmove: aligned move of len 4194304: 1540 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 4194304: 1557 MB/s
	    # memmove_bench_test.speed: slow
	    ok 8 memmove_bench_test
	# memcpy: pass:8 fail:0 skip:0 total:8
	# Totals: pass:8 fail:0 skip:0 total:8
	ok 1 memcpy

Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
v6: fixed u64 div on 32-bit architectures

 lib/Kconfig.debug        |   9 ++++
 lib/tests/memcpy_kunit.c | 110 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 318df4c75454..a61774690362 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2986,6 +2986,15 @@ config MIN_HEAP_KUNIT_TEST
 
 	  If unsure, say N
 
+config MEMCPY_KUNIT_BENCHMARK
+	bool "Benchmark string functions"
+	depends on MEMCPY_KUNIT_TEST
+	help
+	  A benchmark for memcpy() and memmove() functions,
+	  with both aligned and unaligned buffers.
+
+	  If unsure, say N.
+
 config IS_SIGNED_TYPE_KUNIT_TEST
 	tristate "Test is_signed_type() macro" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
index d36933554e46..ea9877e4985a 100644
--- a/lib/tests/memcpy_kunit.c
+++ b/lib/tests/memcpy_kunit.c
@@ -493,6 +493,112 @@ static void memmove_overlap_test(struct kunit *test)
 	}
 }
 
+#ifdef CONFIG_MEMCPY_KUNIT_BENCHMARK
+
+#define COPIES_NUM	100
+
+static void memcpy_bench_size_align(struct kunit *test, int size, bool unalign)
+{
+	u64 start, end, total_ns = 0;
+	char *dst, *src;
+	int ret = 0;
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
+		   div64_u64(COPIES_NUM * size * 1000000000ULL,
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
+	memcpy_bench_size(test, 2);
+	memcpy_bench_size(test, 64);
+	memcpy_bench_size(test, 256);
+	memcpy_bench_size(test, PAGE_SIZE << MAX_PAGE_ORDER);
+}
+
+static void memmove_bench_size_align(struct kunit *test, int size, bool unalign)
+{
+	u64 start, end, total_ns = 0;
+	char *buf;
+	const int shift = size / 10;
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
+		   div64_u64(COPIES_NUM * (size - shift) * 1000000000ULL,
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
+	memmove_bench_size(test, 64);
+	memmove_bench_size(test, 256);
+	memmove_bench_size(test, PAGE_SIZE << MAX_PAGE_ORDER);
+}
+#endif
+
 static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE(memset_test),
 	KUNIT_CASE(memcpy_test),
@@ -500,6 +606,10 @@ static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE_SLOW(memmove_test),
 	KUNIT_CASE_SLOW(memmove_large_test),
 	KUNIT_CASE_SLOW(memmove_overlap_test),
+#ifdef CONFIG_MEMCPY_KUNIT_BENCHMARK
+	KUNIT_CASE_SLOW(memcpy_bench_test),
+	KUNIT_CASE_SLOW(memmove_bench_test),
+#endif
 	{}
 };
 
-- 
2.53.0

