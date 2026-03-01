Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBE20E702
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Mar 2026 01:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327536; cv=none; b=ThYbwiNyPXbQiHQxB9hnrt8ZYAm8CDXS+lSuNeeiLGLdkl9WA/uSH44vgWpyoounXxQee8qm2A9sePElo06ujHsTUICVgDIewAPevJ/uc1DwP8fCuJn50s40ytibGZO714dEqkSE+ouhf+iGE1Wt4doILjk6pfx1LcNyekaZVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327536; c=relaxed/simple;
	bh=w4eclj6kdzdNsnSdB+1o3tuF5GnVygFxn6neXhOQL8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MP0af1s0+Exrb3EESG5+H9zB/BR40pQqy2xY7F73lheiBVl7+IPtHKkOMdlyXnkd5GrqZ/nkQNDnlPE4c6xq5JwvDvmRiREna+JsVxCeqzmJn+Ux0LtWKrIiM8gvrmLCri7ziqT7V6CuFyp9zAmX7un6to6PmsgG6HWG9/+ZkZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMjqIjww; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMjqIjww"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f10628so21559035e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 17:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772327532; x=1772932332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihdUIJ7l2jZWLbyOPaTctCE8ugQZGI6BqGQqEl0kh7w=;
        b=MMjqIjww586ZOQpFjO+CKu0bwSKyxvyR0rzeOUDegzXkvJcIvexl0nljugApXZiDVd
         MSJa887m68K2uRBF0S+69gP20ZMW5lfNl5Vhpfy2jNRydtT6xjHtt+CyKplTE3+vYAyr
         6wzuzMdP8PvcbK7VnOgUqEaF4yYqFT+eA3vHy5JgsYmh95J15Lk4ox4PGeQQBDCyQ62f
         uUJj10g/Jhs4rpIwbrZKsCYYq1GQuxoa/0JADhBuT4hGbFcIWSxIpn7+YNcZzaK/w7D7
         vfLbIbCGZ/ca4T5qBfaNdieIAuweo2dhpK6ns8BUaX0pEheOWm/4gyNS+hpn5TO0PDZ8
         QKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772327532; x=1772932332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihdUIJ7l2jZWLbyOPaTctCE8ugQZGI6BqGQqEl0kh7w=;
        b=NgWil/+CBkV2Joivi+R8DLv2UpQXnr8AgKjsi7gUrUDwA3zyHamSGkPYX7R0Y+tsqg
         U3MbsYVUJn8zvg5oDMzGz6JMc0qeab7E4ENMukHrZRnsFylTotr1wjOih9TM54C/m1sn
         tIs1f87ChsqydSO5GDR9zk96jBI9VJdsdg9yLG3fLxEKj5xCqkEAVDeDyzRP5QN++3MS
         YBIeQLRliICTwcD6GjY9ZiHKbtqtw5eJL3zAyli1yUjb5+r/6QBF7dkXQegKjROnMdZn
         FBWbLbb1TKRU92T1RbYPup/1HU5KGp7LPpbn9bDUbURu5KS93iBrOjJMvR6lSykF7mZz
         QnoQ==
X-Gm-Message-State: AOJu0Yynzel3foCO7S550VUxbbvzYSK18cPJTh09JWXTKHqI9My4MHNg
	AhtXp+njHY8cmajhgfGixHLWqR8AMO8q4BbNJWU5asGLH+WN5E3awfMb
X-Gm-Gg: ATEYQzzldZTsbzYzQkbQpIHJD0bOHRRUN6d8veP2LGzhTTELvRibPzTvPtOz0aYxT+d
	HBM17/4BbJ1RFgNyxE3Ub7A8rKGu9zA76RZF16gflyXK/c+0YGSWJwpRPJ+naK5rTPWzw6sdpek
	Of/cNwEfSBcQ7ItEsGxZC4KW+qrTfJGtDhZOWobJazPSR28BnaRAnGOrQYWGEvESQPq2T5XnF4+
	wZhNZzECLgit9UEZ2LYy4DioxVUr473it3Pcu5lLnqCuOXpml2L8dinag9nzcwTsuWZU3h2MQY/
	JlXPY65cl1UWtZmiP7bWocz8qxpqYx92BL+ZvRiT/4S7y2owdX/i1PG1C1Tsi5Wia0KdwWt5hqx
	2SQYjgL8CH4gETXkdfL0QtSJramKlDvkD0QkysHs6bsFWDhEA6BJML9YM1nHx1DYYUhQc8Xr6G8
	mujFBX1Di+gELQazzFYh2wekjlABP9HLMnSjjNMQ44GxIadtrYbbIwaAo+76YdphtYZQB6Vvtd
X-Received: by 2002:a05:600c:5392:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-483c9bde3famr123763355e9.21.1772327531839;
        Sat, 28 Feb 2026 17:12:11 -0800 (PST)
Received: from turbo.teknoraver.net (net-5-95-156-124.cust.vodafonedsl.it. [5.95.156.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c764546sm18825859f8f.29.2026.02.28.17.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 17:12:11 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
X-Google-Original-From: Matteo Croce <teknoraver@meta.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] KUnit: memcpy: add benchmark
Date: Sun,  1 Mar 2026 02:12:09 +0100
Message-ID: <20260301011209.4160-1-teknoraver@meta.com>
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
v5: rebase to fix a conflict with recent changes

 lib/Kconfig.debug        |   9 ++++
 lib/tests/memcpy_kunit.c | 107 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

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
index d36933554e46..e7588b868125 100644
--- a/lib/tests/memcpy_kunit.c
+++ b/lib/tests/memcpy_kunit.c
@@ -493,6 +493,109 @@ static void memmove_overlap_test(struct kunit *test)
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
+	kunit_info(test, "memcpy: %saligned copy of len %d: %lld MB/s\n",
+		   unalign ? "un" : "", size,
+		   (COPIES_NUM * size * 1000000000ULL / total_ns) / (1024 * 1024));
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
+	kunit_info(test, "memmove: %saligned move of len %d: %lld MB/s\n",
+		   unalign ? "un" : "", size,
+		   (COPIES_NUM * (size - shift) * 1000000000ULL / total_ns) / (1024 * 1024));
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
@@ -500,6 +603,10 @@ static struct kunit_case memcpy_test_cases[] = {
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

