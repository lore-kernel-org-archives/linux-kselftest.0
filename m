Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588223;
	b=cTQn3OGT3axnsuCvnVGTawnfGc+AF6e2u7mC2VLYJCsLIj10o3Cravm3dYvVBDoQtN/c
	 yccoDpRcsWn7SNMoMOjIwJjys6UwErOSWwuZ6u5JeX+ZuejPyruhZiES7VVGoGKCwUdOv
	 8ScAECkxWW0SSCLhktWbRuhF4ef8Mm3Af/xOiJjw3YuYliAyzyUFQlLLBapMdn29xxKS0
	 w1cm0sGfdcDg9WMOjGVgjHPqTaO6dVypuIPaF0MGHKgWE4qQkYj1ueB2Ob0+d6UcCtmBy
	 bOfWFUlrxNMI7+Ffk68xl0RtQ8jYr9a3QBIP6hocsUq8Cg1OdBVjKu8Dbd+uMGu6Y0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JZ2K+Osj5CGwdFpoUsq3gGFL7dbV984RRFXoZaP0g58=;
	b=hhuEEt4wxzrghRQmL/N8BXoJGSDiqJ82UWR9kQuiCh5DOHuMg4Ri6v6OFX0VUS1/bnn+
	 7tL8E89ZsBhflAEezi3Mn6jGi8XGlyYPCcwn3B/CBx+F/gcld00i9XnvgzYNGIBcIxMoH
	 Q3gffYR+j4QxwkLyOl9/PF3VcgTOhs/uRag0Y4oJC9yDR7erQwZFm56XV2MxrZOWPtbfE
	 sLzMsecMQZCWYeEFIEf44OE7gYDWh3+yxBRbQHAM11k3eTT/XLk8rAtPBdS23wmsv2yfA
	 KrtXDKddwj9FM60XHK+Hhif0cL410P7zzsXWSfyHoHk0fjuQpKiNQFt7H6YJYakzXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BVQI/exg";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C45D606A32F
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 02:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C45D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVQI/exg
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2053366a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 18:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793588223; x=1794193023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZ2K+Osj5CGwdFpoUsq3gGFL7dbV984RRFXoZaP0g58=;
        b=BVQI/exgTIjj0BMukq+7/lRjZCXiHFbiDMk9cu4WWF8wVDNd1EWn8ihLBNuuMlDIZA
         2+bSgyy82iLtkUmfJ4toiMoPS+efvSM4PpOBX5eboRjj3a6AiLgeMR0eKS8huFByhNHO
         RMUKQokAXy//KsWH5cqt2NtdmOLmnhrW2qQkfie30J7gfTHqyo4mhmtHzCOksDkPRS56
         2KIe9cyC9DLncRgr/Eh7M/430tLR4iHQUU8TexqW/X9OfNNWgrmOKruJZdaqWvMpx+hM
         8RmqCfXIjt57BueKM/0t3SCl5J3XnR7GLC5iBUX5uo4bkVewlZYvg4XGShzYnmHNCzQI
         xrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588223; x=1794193023;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JZ2K+Osj5CGwdFpoUsq3gGFL7dbV984RRFXoZaP0g58=;
        b=Dd7kg0U9f6Q39qHWa8fDmtbHBzYUTiem1x/gunuzrLYaB4SUf0obcqBJFG0gt/hiQO
         WgBJud7Py03w2P2KE7s7LRkmLGrIKkQrqPtxtmaBW1JT5VuiJy72c3fV8dQIvtH+ciEN
         4YIGZPH2yPrUBBhsT6V8KPBu0hFzA7jC8z3PnDWWSl3ydgqRz0h3WGy33GDi4hgnwMKZ
         GJrE8MOqFmxEZAAV90Czdx8Kkwa8H05OLldAxFcILQkEhLOqiCJYzHX0BoxGQ3Lt2dfK
         dClGwDEe337nBDuEqk8qRjO07VGcF+Yk0+tS+5kqKHeOmev/QRQJwlCXakul581F5gH/
         gGFg==
X-Forwarded-Encrypted: i=1; AKwUvByECS9Hz9LA/jA6iHFNFGVu5RvH79p1d2QESSjmlXR+AALsman3rVENy69MPetxjIeE0nk3fCLA9EPZvDmHSqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JRvQPOCVyE8mIb1v9iDv37IAEAENW7nAQz+p9MAL17LKhM6od
	NkA7XHkGz0FF3ALnpDaIVkl5n2DHUWtuS8GIyIKsmT9Ei/1rbo4+Rhw=
X-Gm-Gg: AYBFou34Nw05h+CvGbzlkMis46KKuhTnrDO5M2fqMWmxJBx32G+mcULj85IKsu8syfq
	3JWKl5bt3A7qSkJRiz8hUezYHTXgmCkuzEahOGAgripAHOv4julWxqULL/aAm/0ukuHzGsFD1KN
	4BnV9XL24GqZ/2Rc34qNaQhlI7DZfDtGGI86s9V/8M4BFffQ2F2oklnpD0FBxeDSc2g5c5gDVo6
	+kfnN4n5T1sW7teS5vGYdF4XbYgd1qZXvzuoZDv6X+D/oehDppp+MrQYZ1ES04TQI+Cd0IXpdnM
	GHdIPe9bGZpLg8r3xUSeYo/YqXmwzElERYzV0AO92suz4gynXfr7DGFhxS3XQoPMuYSe4QnStzM
	8nKSQz8wIURmHknZpPmURJKG7YKlbl2XFis1xasHX1TqeL94ZWjHBuoivpBuac73xZ5/kJ43iH3
	bjR+ykA2rOr8kIRA40yAQI15AUwRZ0EjK2+Zs9olQKfLUS1FzN9RdrLskJVSRE/LVTmqjzkRghL
	k17oeaRbmFPy5/W8b6wfUv39onydBAIQtLBclh0bKfv085hqXIB0RjvxABt+nYJpm5gUjWqSDs7
	OXdkSqDAnuG71fHq+IY4yqgCxWs=
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr7446929a91.53.1793588222609;
        Sun, 01 Nov 2026 18:57:02 -0800 (PST)
Received: from [127.0.1.1] ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm15882317a91.16.2026.11.01.18.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:57:02 -0800 (PST)
From: Wang Yibo <szwyb123@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Gow <david@davidgow.net>,
 linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] lib/tests: convert test_memcat_p module to KUnit
Date: Sun, 01 Nov 2026 13:49:39 +0800
Message-ID: <20261101134939.32-1-szwyb123@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Both AI review questions are addressed; the changes are described
below the --- in the patch.

From 4ebf2dfe3e71066a3af1d6f53b85e3ce3ca3ed4d Mon Sep 17 00:00:00 2001
From: Wang Yibo <szwyb123@gmail.com>
Date: Tue, 13 Oct 2026 22:21:49 +0800
Subject: [PATCH v2] lib/tests: convert test_memcat_p module to KUnit

Move lib/test_memcat_p.c to lib/tests/memcat_p_kunit.c and convert it to
use KUnit.

This change switches the ad-hoc test code to standard KUnit test cases.
The test data remains the same, but the verification logic is updated to
use KUNIT_EXPECT_* macros, so a failure now reports which element
mismatched instead of a single pr_err() message.  The input arrays and
their elements are allocated with the kunit_kmalloc() family, which lets
the manual error unwinding paths and the empty module exit hook go away.

Three things are spelled out differently, because a KUnit assertion can
abandon the test half way through:

  - The array returned by memcat_p() is allocated with kmalloc_array()
    inside the function under test, so kunit_kfree() does not know about
    it and does nothing.  It is freed with kfree() through a registered
    test action instead, so that it is released even when a later
    assertion fails the test.

  - The check on the number of merged elements is a KUNIT_ASSERT_EQ():
    the element order loop that follows indexes out[] up to
    2 * INPUT_MAX - 3 without any bound check, so a shorter than expected
    array has to stop the test there rather than be walked off the end.

  - The counting loop compares against its limit before dereferencing, so
    that a missing terminator cannot be read past the last element.

CONFIG_TEST_MEMCAT_P keeps its name so that the defconfigs enabling it
stay valid; it now depends on KUNIT and defaults to KUNIT_ALL_TESTS, like
the other lib KUnit tests.  Those defconfigs already select KUNIT and
KUNIT_ALL_TESTS, so they keep turning the test on unchanged.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
v2: address the AI review questions: free the memcat_p() result with
    kfree() (through a test action) instead of kunit_kfree(), which
    silently ignores memory KUnit does not own; and make the element
    count check fatal, so a short array cannot lead to an out-of-bounds
    read in the element order loop.  While at it, move the limit check in
    the counting loop before the dereference.
---
 lib/Kconfig.debug          |   4 +-
 lib/Makefile               |   1 -
 lib/test_memcat_p.c        | 116 -------------------------------------
 lib/tests/Makefile         |   1 +
 lib/tests/memcat_p_kunit.c |  91 +++++++++++++++++++++++++++++
 5 files changed, 95 insertions(+), 118 deletions(-)
 delete mode 100644 lib/test_memcat_p.c
 create mode 100644 lib/tests/memcat_p_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f754a24acd2c..65edbbabf075 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3364,7 +3364,9 @@ config TEST_DEBUG_VIRTUAL
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
index 3104710e1e68..f385888b1d50 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -97,7 +97,6 @@ obj-$(CONFIG_TEST_MAPLE_TREE) += test_maple_tree.o
 obj-$(CONFIG_TEST_PARMAN) += test_parman.o
 obj-$(CONFIG_TEST_KMOD) += test_kmod.o
 obj-$(CONFIG_TEST_DEBUG_VIRTUAL) += test_debug_virtual.o
-obj-$(CONFIG_TEST_MEMCAT_P) += test_memcat_p.o
 obj-$(CONFIG_TEST_OBJAGG) += test_objagg.o
 obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 obj-$(CONFIG_TEST_CSD_LOCK) += test_csd_lock.o
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
index df0537e1b91f..d44baa280126 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -40,6 +40,7 @@ CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
 
 obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
+obj-$(CONFIG_TEST_MEMCAT_P) += memcat_p_kunit.o
 obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
 CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
 obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
diff --git a/lib/tests/memcat_p_kunit.c b/lib/tests/memcat_p_kunit.c
new file mode 100644
index 000000000000..5fe2ac97c95e
--- /dev/null
+++ b/lib/tests/memcat_p_kunit.c
@@ -0,0 +1,91 @@
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
+KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
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
+	/*
+	 * memcat_p() allocates the result with kmalloc_array(), so it is not
+	 * known to kunit_kfree().  Register it by hand, so that an assertion
+	 * aborting the test cannot leak it.
+	 */
+	KUNIT_ASSERT_EQ(test, kunit_add_action(test, kfree_wrapper, out), 0);
+
+	/* Bound first, so a missing terminator is not dereferenced. */
+	for (i = 0, p = out; i < INPUT_MAX * 2 - 1 && *p; p++, i++) {
+		total += (*p)->num;
+		KUNIT_EXPECT_EQ(test, (*p)->magic, MAGIC);
+	}
+
+	KUNIT_EXPECT_EQ(test, total, 0);
+	/* The loop below indexes out[] up to 2 * INPUT_MAX - 3. */
+	KUNIT_ASSERT_EQ(test, i, EXPECT);
+
+	for (i = 0; i < INPUT_MAX - 1; i++) {
+		KUNIT_EXPECT_PTR_EQ(test, out[i], in0[i]);
+		KUNIT_EXPECT_PTR_EQ(test, out[i + INPUT_MAX - 1], in1[i]);
+	}
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
-- 
2.25.1


