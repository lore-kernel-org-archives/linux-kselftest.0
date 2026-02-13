Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DB34AAE6;
	Fri, 13 Feb 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974653; cv=none; b=ZU2lceO1w2fgbq4qPFq6PD7X+KFize65kXvQcZRZfnqZBGly2MP/wpLdW1GQ6auspJ64XUbbSMzEKQHtneDsc4fB9xmQoXoiUrw8D47Zb6CJaZzLrvbGPkg2UY0jdRqAzlHhl+2E0Oqf8p7tuVXYAU5J1FwxFyj/TpB137v56qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974653; c=relaxed/simple;
	bh=bgUkZPwQ4J6k3G4u/nvOcivOTHTI5sLpMQyEzYOEE28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X15gwi0PHkO45zGirR6nvVsSSbXRmsSEtwzIf/GH++5ymS3MrRC+44G8DdSL3+5ARRMvVpvsd8duudbULmVR1YKo+s5cHFcvsIB7XR0HfOO29/B4Nu0kVCeEcsuQyCgcBLRrCa814XAJHvQBLcOF2FmqwLFUWivMTBwLWedgvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVDFCi0L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVDFCi0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B1DC116C6;
	Fri, 13 Feb 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770974653;
	bh=bgUkZPwQ4J6k3G4u/nvOcivOTHTI5sLpMQyEzYOEE28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVDFCi0LewzNbTVI+9LvTciKC7UP4PSUSvt9pOnJsRmMtQPrDA8329xAEr1lV2kQt
	 dLb0wY6WykwaDyEconvrxvZ8Lt1i+9YfMsE568V7LgirVjZ5/LWcApC/CaOcSan22O
	 9/1WbWPn7oZk982PVUXVWG3PFCm8diyjCHW4GS8wJf2Xg9cQtwSXoMXmtlQWyZb1qe
	 BnVBNMAEzyRdVna2NXen8bqsspwszM/8TVRxF7NjId6bguW+7HHwt/5WNAPVD7fXW1
	 6diZhZrpubBFjlY9Dm1j2rHt+HZMbecZn9UHIR56IpQ6HxrkBgKFZrzSvB+fNsOJpF
	 sNbwM3VF8nZhQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v8 2/3] revocable: Add KUnit test cases
Date: Fri, 13 Feb 2026 09:23:06 +0000
Message-ID: <20260213092307.858908-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
In-Reply-To: <20260213092307.858908-1-tzungbi@kernel.org>
References: <20260213092307.858908-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit test cases for the revocable API.

The test cases cover the following scenarios:

- Basic: Verifies that a consumer can successfully access the resource.
- Revocation: Verifies that after the provider revokes the resource,
  the consumer correctly receives a NULL pointer on a subsequent access.
- Try Access Macro: Same as "Revocation" but uses the macro level
  helpers.
- Concurrent Access: Verifies multiple threads can access the resource.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v8:
- Squash:
  - c259cd7ea3c9 revocable: fix missing module license and description
  - a243f7fb11fe revocable: Add KUnit test for provider lifetime races
  - 988357628c2c revocable: Add KUnit test for concurrent access
- Change accordingly due to its dependency "revocable: Revocable resource
  management" changes.

v7: https://lore.kernel.org/all/20260116080235.350305-3-tzungbi@kernel.org
- "2025" -> "2026" in copyright.
- Rename the test name "macro" -> "try_access_macro".

v6: https://lore.kernel.org/chrome-platform/20251106152330.11733-3-tzungbi@kernel.org
- Rename REVOCABLE_TRY_ACCESS_WITH() -> REVOCABLE_TRY_ACCESS_SCOPED().
- Add tests for new REVOCABLE_TRY_ACCESS_WITH().

v5: https://lore.kernel.org/chrome-platform/20251016054204.1523139-3-tzungbi@kernel.org
- No changes.

v4: https://lore.kernel.org/chrome-platform/20250923075302.591026-3-tzungbi@kernel.org
- REVOCABLE() -> REVOCABLE_TRY_ACCESS_WITH().
- revocable_release() -> revocable_withdraw_access().

v3: https://lore.kernel.org/chrome-platform/20250912081718.3827390-3-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/chrome-platform/20250820081645.847919-3-tzungbi@kernel.org
- New in the series.

A way to run the test:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
        revocable_test
Or
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
        --kconfig_add CONFIG_PROVE_LOCKING=y \
        --kconfig_add CONFIG_DEBUG_KERNEL=y \
        --kconfig_add CONFIG_DEBUG_INFO=y \
        --kconfig_add CONFIG_DEBUG_INFO_DWARF5=y \
        --kconfig_add CONFIG_KASAN=y \
        --kconfig_add CONFIG_DETECT_HUNG_TASK=y \
        --kconfig_add CONFIG_DEFAULT_HUNG_TASK_TIMEOUT="10" \
        --arch=x86_64 \
        --make_options="C=1 W=1" \
        revocable_test

 MAINTAINERS                   |   1 +
 drivers/base/Kconfig          |   5 +
 drivers/base/Makefile         |   3 +
 drivers/base/revocable_test.c | 410 ++++++++++++++++++++++++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 drivers/base/revocable_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 01670bc4db8d..6ce7a5477f25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22414,6 +22414,7 @@ L:	driver-core@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	drivers/base/revocable.c
+F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
 
 RFKILL
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 1786d87b29e2..5c5dad850380 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -250,3 +250,8 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	  work on.
 
 endmenu
+
+config REVOCABLE_KUNIT_TEST
+	tristate "KUnit tests for revocable" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index bdf854694e39..5fd19abbc83e 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -35,3 +35,6 @@ ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG
 # define_trace.h needs to know how to find our header
 CFLAGS_trace.o		:= -I$(src)
 obj-$(CONFIG_TRACING)	+= trace.o
+
+# KUnit test cases
+obj-$(CONFIG_REVOCABLE_KUNIT_TEST)	+= revocable_test.o
diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
new file mode 100644
index 000000000000..4c097a843342
--- /dev/null
+++ b/drivers/base/revocable_test.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * KUnit tests for the revocable API.
+ *
+ * The test cases cover the following scenarios:
+ *
+ * - Basic: Verifies that a consumer can successfully access the resource.
+ *
+ * - Revocation: Verifies that after the provider revokes the resource,
+ *   the consumer correctly receives a NULL pointer on a subsequent access.
+ *
+ * - Try Access Macro: Same as "Revocation" but uses the macro level
+ *   helpers.
+ *
+ * - Concurrent Access: Verifies multiple threads can access the resource.
+ */
+
+#include <kunit/test.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/refcount.h>
+#include <linux/revocable.h>
+
+static int get_refcount(struct revocable *rp)
+{
+	return refcount_read(&rp->kref.refcount);
+}
+
+static void revocable_test_basic(struct kunit *test)
+{
+	struct revocable *rp;
+	struct revocable_consumer rev;
+	void *real_res = (void *)0x12345678, *res;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	revocable_init(rp, &rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+
+	res = revocable_try_access(&rev);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rev);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+	revocable_deinit(&rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+	revocable_revoke(rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+	revocable_put(rp);
+}
+
+static void revocable_test_revocation(struct kunit *test)
+{
+	struct revocable *rp;
+	struct revocable_consumer rev;
+	void *real_res = (void *)0x12345678, *res;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	revocable_init(rp, &rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+
+	res = revocable_try_access(&rev);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rev);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+	revocable_revoke(rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	res = revocable_try_access(&rev);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rev);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+	revocable_deinit(&rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+	revocable_put(rp);
+}
+
+static void revocable_test_try_access_macro1(struct kunit *test)
+{
+	struct revocable *rp;
+	void *real_res = (void *)0x12345678, *res;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	{
+		revocable_try_access_with(rp, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	revocable_revoke(rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	{
+		revocable_try_access_with(rp, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	revocable_put(rp);
+}
+
+static int call_revocable_try_access_or_return_err(struct revocable *rp)
+{
+	void *res;
+
+	revocable_try_access_or_return_err(rp, res, -ENXIO);
+	return 0;
+}
+
+static int call_revocable_try_access_or_return(struct revocable *rp)
+{
+	void *res;
+
+	revocable_try_access_or_return(rp, res);
+	return 0;
+}
+
+static void call_revocable_try_access_or_return_void(struct kunit *test,
+						     struct revocable *rp)
+{
+	void *res;
+
+	revocable_try_access_or_return_void(rp, res);
+	KUNIT_FAIL(test, "unreachable");
+}
+
+static void revocable_test_try_access_macro2(struct kunit *test)
+{
+	struct revocable *rp;
+	void *real_res = (void *)0x12345678, *res;
+	int ret;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	{
+		revocable_try_access_with(rp, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	revocable_revoke(rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	ret = call_revocable_try_access_or_return_err(rp);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return(rp);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void(test, rp);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+	revocable_put(rp);
+}
+
+static void revocable_test_try_access_macro3(struct kunit *test)
+{
+	struct revocable *rp;
+	void *real_res = (void *)0x12345678, *res;
+	bool accessed;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rp, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	revocable_revoke(rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rp, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	revocable_put(rp);
+}
+
+static int call_revocable_try_access_or_return_err_scoped(struct revocable *rp)
+{
+	void *res;
+
+	revocable_try_access_or_return_err_scoped(rp, res, -ENXIO) {}
+	return 0;
+}
+
+static int call_revocable_try_access_or_return_scoped(struct revocable *rp)
+{
+	void *res;
+
+	revocable_try_access_or_return_scoped(rp, res) {}
+	return 0;
+}
+
+static void call_revocable_try_access_or_return_void_scoped(struct kunit *test,
+							    struct revocable *rp)
+{
+	void *res;
+
+	revocable_try_access_or_return_void_scoped(rp, res) {}
+	KUNIT_FAIL(test, "unreachable");
+}
+
+static void revocable_test_try_access_macro4(struct kunit *test)
+{
+	struct revocable *rp;
+	void *real_res = (void *)0x12345678, *res;
+	bool accessed;
+	int ret;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rp, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rp), 3);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	revocable_revoke(rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	ret = call_revocable_try_access_or_return_err_scoped(rp);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return_scoped(rp);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void_scoped(test, rp);
+
+	accessed = false;
+	revocable_try_access_or_skip_scoped(rp, res)
+		accessed = true;
+	KUNIT_EXPECT_FALSE(test, accessed);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+	revocable_put(rp);
+}
+
+struct test_concurrent_access_context {
+	struct completion started, enter;
+	struct task_struct *thread;
+
+	union {
+		/* Used by test provider. */
+		struct revocable *rp;
+
+		/* Used by test consumer. */
+		struct {
+			struct completion exit;
+			struct revocable_consumer rev;
+			struct kunit *test;
+			void *expected_res;
+		};
+	};
+};
+
+static int test_concurrent_access_provider(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	revocable_revoke(ctx->rp);
+
+	return 0;
+}
+
+static int test_concurrent_access_consumer(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+	void *res;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	res = revocable_try_access(&ctx->rev);
+	KUNIT_EXPECT_PTR_EQ(ctx->test, res, ctx->expected_res);
+
+	wait_for_completion(&ctx->exit);
+	revocable_withdraw_access(&ctx->rev);
+
+	return 0;
+}
+
+static void revocable_test_concurrent_access(struct kunit *test)
+{
+	struct revocable *rp;
+	void *real_res = (void *)0x12345678;
+	struct test_concurrent_access_context *ctx;
+	int i;
+
+	rp = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rp);
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 2);
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	for (i = 0; i < 3; ++i) {
+		ctx[i].test = test;
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+
+		if (i == 0) {
+			/* Transfer the ownership of provider reference too. */
+			ctx[i].rp = rp;
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_provider, ctx + i,
+				"revocable_%d", i);
+		} else {
+			init_completion(&ctx[i].exit);
+			revocable_init(rp, &ctx[i].rev);
+			KUNIT_EXPECT_EQ(test, get_refcount(rp), 2 + i);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_consumer, ctx + i,
+				"revocable_consumer_%d", i);
+		}
+		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
+
+		wait_for_completion(&ctx[i].started);
+	}
+
+	ctx[1].expected_res = real_res;
+	/* consumer1 enters read-side critical section. */
+	complete(&ctx[1].enter);
+	msleep(100);
+
+	/* provider0 revokes the resource. */
+	complete(&ctx[0].enter);
+	msleep(100);
+	/* provider0 can't exit.  It's waiting for the grace period. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 4);
+
+	ctx[2].expected_res = NULL;
+	/* consumer2 enters read-side critical section. */
+	complete(&ctx[2].enter);
+	msleep(100);
+
+	/* consumer{1,2} exit read-side critical section. */
+	for (i = 1; i < 3; ++i) {
+		complete(&ctx[i].exit);
+		kthread_stop(ctx[i].thread);
+		revocable_deinit(&ctx[i].rev);
+	}
+
+	kthread_stop(ctx[0].thread);
+	/* provider0 exits as all readers exit their critical section. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rp), 1);
+
+	/* Drop the caller reference. */
+	revocable_put(rp);
+}
+
+static struct kunit_case revocable_test_cases[] = {
+	KUNIT_CASE(revocable_test_basic),
+	KUNIT_CASE(revocable_test_revocation),
+	KUNIT_CASE(revocable_test_try_access_macro1),
+	KUNIT_CASE(revocable_test_try_access_macro2),
+	KUNIT_CASE(revocable_test_try_access_macro3),
+	KUNIT_CASE(revocable_test_try_access_macro4),
+	KUNIT_CASE(revocable_test_concurrent_access),
+	{}
+};
+
+static struct kunit_suite revocable_test_suite = {
+	.name = "revocable_test",
+	.test_cases = revocable_test_cases,
+};
+
+kunit_test_suite(revocable_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tzung-Bi Shih <tzungbi@kernel.org>");
+MODULE_DESCRIPTION("KUnit tests for the revocable API");
-- 
2.53.0.310.g728cabbaf7-goog

