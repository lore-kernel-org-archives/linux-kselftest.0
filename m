Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F137E5E7
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 03:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949312; cv=none; b=OR0TUD7QEh/gZ74bV7fZJgTCAnOJdVR0XsZr4IFKwVc8h7ah/BmGkVfRrlQM8KBD/f2TVKLmK5haoiJTCVAewdoVudWL3m85s5h79yHn8m6d8gBqevsxkLAJUTDzV8BA7gkx6eKlOAqYgKl00z9Wa+g38axSZRSka1VnI/L1fik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949312; c=relaxed/simple;
	bh=bdTqmskz5mv1jWPsF+CXZc/LhkLs8AwiNen2A2fppFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tLQvv1c66MMFqRuXfHWdnfX2Gv52GS5HPTsgVYlzLrySBGNU1rB6uvugd8P7w1QcpIOmHVBO0fbq7TZ3Gf8kT4wfwIICYLuUPXYJ+pqQ+DTzGiuB7qQwF/iyiOHLWwzS3aI6v8CmnpuvCN2lDmmoHm6vzofAhPUYVFt2/olS9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeU+Gee6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeU+Gee6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso1792767a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 20:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791949310; x=1792554110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PXQRvsOLSS4hbxhThmysqIOy/isWX8urpf5ih/mZZSE=;
        b=aeU+Gee65Xxng6XIRjLQAzSjHhhgyvzjOf+9tfNByf/0rbyN7TsRbi1dIAZJLEC0d2
         su4zlCWXUy2dZJzTyRp/2huVPhA1hmHtISgLYmRWRJtFL0ANLgeZCijYMUn8f9arUwGo
         4f533y/Ehlx9XDSDk959NExO9EOGwIfb8g8NquUjclkCOzH50+mg34qIG2p3/jOM0D8o
         tum7B8rw4pSD/jZy/X6qTWNDGlF58W9f50pCcbKaiEB1HElXHWuKfhxwV2d2VEq24eDk
         TFUwr7YO5oByyhKAAmwKAVgrBNTX2brgheL2WFyfk/sUqNH1aFRNiVsPk1QZVzDbiU9E
         y7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791949310; x=1792554110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXQRvsOLSS4hbxhThmysqIOy/isWX8urpf5ih/mZZSE=;
        b=s9Rx4Q2CdtP8dSBDQSAu94E3lUjuhvEoVzCadsw+wwjb62mE5NQQ/aqQJFuJA0Qq+j
         wfmaFqii714k3Kv/DYGZYBFDvaF6gJQjq0/8eODbMgSL1wJDhPe8h3Noy4prutaRz4so
         PydOnibRHXQfioj0IB8w/VOQCnfjIjLOk0ypyh4qXPv+E5rxhQZIR2k2AfzH8e0h409x
         bDNfelWeewdGQcGNLdHHfU7s2oOsDsDTuOvZXpgyjdZr9sQD8YIdwextNmPVOn7ahZXF
         FaiyFb0sUOsh/mPnshBqGy6gBXBheS19emp1WYIHFQtnmU9lFGYF/ZP/9ceFfsR9nCgn
         iL4w==
X-Forwarded-Encrypted: i=1; AKwUvBzTdHbMrE9n781WAD1dqqE8gpN3CdFlTZeAc/7XRMj7FV4LW4+ThCcc5A9vZBdxTCO4VkI4QVv4K1ZdZ9HOYq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIuKWoYdbjbs5a2UlBkUL2ttn0kiD+r0hy83+DnrS5pA1EBEET
	ewqSW+fKZe8CxBzw6xVDxOjIouww42agBEfdUqak1O3SOwhA9vjIORw=
X-Gm-Gg: AYBFou2Ud0j1s0TA4os/aNbB0mpHeyFMfIDjrT15ZvcSUrpgYH4HHTO6+Y11HX1IiB+
	hx1NbFr3NCy3PRJcgEx+ZMs8IE14XPVn66CxEaljEzPOlh6zz2czg/RCmRuUiNfQcxpcXG9RBZl
	KSLjiKIR1LHQhYWAtizq5pCSIifcBlE2bxWUXnp1ZBFcgvrLWFi261/J/Q43TST/PZ7jImBVTlH
	8cTz4Qcu6Y8LnfpOqS6j4ftFVt55abD3gttfFsAZBc7+kjlIBxmWrhbX/JWQEnSx5YAYmvyNxzS
	D9K2GuHTTR7tU3iWIX9RweUweNsgrJwwt9b8BAgfTJTFjz1dqCYgsRK6uq22iNC54vozHdQ9bbO
	XRJnuB2yJAAiFztp4vp6J8E0SfNDIlus9rf3rgfLWjEG1tjcf3JHTeheqEPQRjSvwrLvN8Xoggq
	WOLzRkHnOPW4VuZIPCklsEXdIE1Jys8Biz30y3H6uy+j8M2nW6Iheuf5OI0ZSlkffZzgTIcyIiC
	/cs/oDi
X-Received: by 2002:a17:90b:5343:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ab3a94f0dcmr11857100a91.14.1791949309086;
        Tue, 13 Oct 2026 20:41:49 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24af99sm2406443a91.8.2026.10.13.20.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:41:48 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/tests: convert test_memcat_p module to KUnit
Date: Wed, 14 Oct 2026 11:41:43 +0800
Message-Id: <20261014034143.551624-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move lib/test_memcat_p.c to lib/tests/memcat_p_kunit.c and convert it to
use KUnit.

This change switches the ad-hoc test code to standard KUnit test cases.
The test data remains the same, but the verification logic is updated to
use KUNIT_EXPECT_* macros.  All allocations are made test managed, so the
manual error unwinding paths and the empty module exit hook are no longer
needed, and a failure now reports which element mismatched instead of a
single pr_err() message.

CONFIG_TEST_MEMCAT_P keeps its name so that the defconfigs enabling it
stay valid; it now depends on KUNIT and defaults to KUNIT_ALL_TESTS, like
the other lib KUnit tests.  Those defconfigs already select KUNIT and
KUNIT_ALL_TESTS, so they keep turning the test on unchanged.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 lib/Kconfig.debug          |   4 +-
 lib/Makefile               |   1 -
 lib/test_memcat_p.c        | 116 -------------------------------------
 lib/tests/Makefile         |   1 +
 lib/tests/memcat_p_kunit.c |  83 ++++++++++++++++++++++++++
 5 files changed, 87 insertions(+), 118 deletions(-)
 delete mode 100644 lib/test_memcat_p.c
 create mode 100644 lib/tests/memcat_p_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6b24a2c89b84..66dfffa48fc3 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3314,7 +3314,9 @@ config TEST_DEBUG_VIRTUAL
 	  If unsure, say N.
 
 config TEST_MEMCAT_P
-	tristate "Test memcat_p() helper function"
+	tristate "KUnit test for memcat_p() helper function" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
 	help
 	  Test the memcat_p() helper for correctly merging two
 	  pointer arrays together.
diff --git a/lib/Makefile b/lib/Makefile
index dfab958327c5..d0e8dd7e364c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -97,7 +97,6 @@ obj-$(CONFIG_TEST_MAPLE_TREE) += test_maple_tree.o
 obj-$(CONFIG_TEST_PARMAN) += test_parman.o
 obj-$(CONFIG_TEST_KMOD) += test_kmod.o
 obj-$(CONFIG_TEST_DEBUG_VIRTUAL) += test_debug_virtual.o
-obj-$(CONFIG_TEST_MEMCAT_P) += test_memcat_p.o
 obj-$(CONFIG_TEST_OBJAGG) += test_objagg.o
 obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 obj-$(CONFIG_TEST_LOCKUP) += test_lockup.o
diff --git a/lib/test_memcat_p.c b/lib/test_memcat_p.c
deleted file mode 100644
index 62f1633b30f8..000000000000
--- a/lib/test_memcat_p.c
+++ /dev/null
@@ -1,116 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Test cases for memcat_p() in lib/memcat_p.c
- */
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/string.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-
-struct test_struct {
-	int		num;
-	unsigned int	magic;
-};
-
-#define MAGIC		0xf00ff00f
-/* Size of each of the NULL-terminated input arrays */
-#define INPUT_MAX	128
-/* Expected number of non-NULL elements in the output array */
-#define EXPECT		(INPUT_MAX * 2 - 2)
-
-static int __init test_memcat_p_init(void)
-{
-	struct test_struct **in0, **in1, **out, **p;
-	int err = -ENOMEM, i, r, total = 0;
-
-	in0 = kzalloc_objs(*in0, INPUT_MAX);
-	if (!in0)
-		return err;
-
-	in1 = kzalloc_objs(*in1, INPUT_MAX);
-	if (!in1)
-		goto err_free_in0;
-
-	for (i = 0, r = 1; i < INPUT_MAX - 1; i++) {
-		in0[i] = kmalloc_obj(**in0);
-		if (!in0[i])
-			goto err_free_elements;
-
-		in1[i] = kmalloc_obj(**in1);
-		if (!in1[i]) {
-			kfree(in0[i]);
-			goto err_free_elements;
-		}
-
-		/* lifted from test_sort.c */
-		r = (r * 725861) % 6599;
-		in0[i]->num = r;
-		in1[i]->num = -r;
-		in0[i]->magic = MAGIC;
-		in1[i]->magic = MAGIC;
-	}
-
-	in0[i] = in1[i] = NULL;
-
-	out = memcat_p(in0, in1);
-	if (!out)
-		goto err_free_all_elements;
-
-	err = -EINVAL;
-	for (i = 0, p = out; *p && (i < INPUT_MAX * 2 - 1); p++, i++) {
-		total += (*p)->num;
-
-		if ((*p)->magic != MAGIC) {
-			pr_err("test failed: wrong magic at %d: %u\n", i,
-			       (*p)->magic);
-			goto err_free_out;
-		}
-	}
-
-	if (total) {
-		pr_err("test failed: expected zero total, got %d\n", total);
-		goto err_free_out;
-	}
-
-	if (i != EXPECT) {
-		pr_err("test failed: expected output size %d, got %d\n",
-		       EXPECT, i);
-		goto err_free_out;
-	}
-
-	for (i = 0; i < INPUT_MAX - 1; i++)
-		if (out[i] != in0[i] || out[i + INPUT_MAX - 1] != in1[i]) {
-			pr_err("test failed: wrong element order at %d\n", i);
-			goto err_free_out;
-		}
-
-	err = 0;
-	pr_info("test passed\n");
-
-err_free_out:
-	kfree(out);
-err_free_all_elements:
-	i = INPUT_MAX;
-err_free_elements:
-	for (i--; i >= 0; i--) {
-		kfree(in1[i]);
-		kfree(in0[i]);
-	}
-
-	kfree(in1);
-err_free_in0:
-	kfree(in0);
-
-	return err;
-}
-
-static void __exit test_memcat_p_exit(void)
-{
-}
-
-module_init(test_memcat_p_init);
-module_exit(test_memcat_p_exit);
-
-MODULE_DESCRIPTION("Test cases for memcat_p() in lib/memcat_p.c");
-MODULE_LICENSE("GPL");
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 3cac3b63a752..8ba5fb73dc0b 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -38,6 +38,7 @@ CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
 
 obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
+obj-$(CONFIG_TEST_MEMCAT_P) += memcat_p_kunit.o
 obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
 CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
 obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
diff --git a/lib/tests/memcat_p_kunit.c b/lib/tests/memcat_p_kunit.c
new file mode 100644
index 000000000000..261ec2e69787
--- /dev/null
+++ b/lib/tests/memcat_p_kunit.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test cases for memcat_p() in lib/memcat_p.c
+ */
+
+#include <kunit/test.h>
+
+#include <linux/slab.h>
+#include <linux/string.h>
+
+struct test_struct {
+	int		num;
+	unsigned int	magic;
+};
+
+#define MAGIC		0xf00ff00f
+/* Size of each of the NULL-terminated input arrays */
+#define INPUT_MAX	128
+/* Expected number of non-NULL elements in the output array */
+#define EXPECT		(INPUT_MAX * 2 - 2)
+
+static void memcat_p_test(struct kunit *test)
+{
+	struct test_struct **in0, **in1, **out, **p;
+	int i, r, total = 0;
+
+	in0 = kunit_kcalloc(test, INPUT_MAX, sizeof(*in0), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, in0);
+
+	in1 = kunit_kcalloc(test, INPUT_MAX, sizeof(*in1), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, in1);
+
+	for (i = 0, r = 1; i < INPUT_MAX - 1; i++) {
+		in0[i] = kunit_kmalloc(test, sizeof(**in0), GFP_KERNEL);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, in0[i]);
+
+		in1[i] = kunit_kmalloc(test, sizeof(**in1), GFP_KERNEL);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, in1[i]);
+
+		/* lifted from test_sort.c */
+		r = (r * 725861) % 6599;
+		in0[i]->num = r;
+		in1[i]->num = -r;
+		in0[i]->magic = MAGIC;
+		in1[i]->magic = MAGIC;
+	}
+
+	in0[i] = NULL;
+	in1[i] = NULL;
+
+	out = memcat_p(in0, in1);
+	KUNIT_ASSERT_NOT_NULL(test, out);
+
+	for (i = 0, p = out; *p && (i < INPUT_MAX * 2 - 1); p++, i++) {
+		total += (*p)->num;
+		KUNIT_EXPECT_EQ(test, (*p)->magic, MAGIC);
+	}
+
+	KUNIT_EXPECT_EQ(test, total, 0);
+	KUNIT_EXPECT_EQ(test, i, EXPECT);
+
+	for (i = 0; i < INPUT_MAX - 1; i++) {
+		KUNIT_EXPECT_PTR_EQ(test, out[i], in0[i]);
+		KUNIT_EXPECT_PTR_EQ(test, out[i + INPUT_MAX - 1], in1[i]);
+	}
+
+	kunit_kfree(test, out);
+}
+
+static struct kunit_case memcat_p_test_cases[] = {
+	KUNIT_CASE(memcat_p_test),
+	{}
+};
+
+static struct kunit_suite memcat_p_test_suite = {
+	.name = "memcat_p",
+	.test_cases = memcat_p_test_cases,
+};
+
+kunit_test_suite(memcat_p_test_suite);
+
+MODULE_DESCRIPTION("Test cases for memcat_p() in lib/memcat_p.c");
+MODULE_LICENSE("GPL");

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.25.1

