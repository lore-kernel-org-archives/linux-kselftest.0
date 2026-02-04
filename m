Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9D410D3A;
	Wed,  4 Feb 2026 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215638; cv=none; b=b7CarJFiy8RzaHqpsM7dXjR4BG/mWtH6mNGhZt+8+DrUpn5jUrl5WzOjUCU3wLEsaihGzRoyaT48QehBgQYVxxZGAmlDMbYzrwnfsD6QFSGPnBoRLK53WBUbJcj8Wo1HjCMMOhrlo8ZhbaEsLZa6CwgpZdZtZMeEQhDy/2gyCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215638; c=relaxed/simple;
	bh=buq3EIDdo9wXr4aeYSVwyZQgpkYSv7xmF9spkCQYSZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJlYJndAsyuPW+vXUE0Ao9w1P+oLY4YN+8I6IhrTDG3ffQl61aeuL8op2MpR5lQwBI1u/XtkrAfO80naESSF5mXhZiynMq8gUE/D+Ssuq8IRYgMa2AJM7fSqFEOmO41xjARIfyYSHVgC52JwvfGYrVBCBAMyjkRCTnWqk4aTEYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2vZX6HD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2vZX6HD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A292FC19423;
	Wed,  4 Feb 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770215637;
	bh=buq3EIDdo9wXr4aeYSVwyZQgpkYSv7xmF9spkCQYSZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2vZX6HD2mT3D3O7Oh0uZ7vOD10PjA6kTN0cNk9+g22QNdWEFaU6VBo+i0TsatPcU
	 /ZqmOkab83re39dMgz7yXIi4mAkKrvgreHsdL3OB9TtnLtjoh++W2jpWppUyyM92/O
	 2D1ICOzmDzSLNDOA6EEaa9pxlHw/5k9Tmvq6jokcqEVeUip6weatnezHCibMcZH/dI
	 EmWzQJmJN595O1owjZqQK5HcYfMfPpnhyyOO3YMY1LD8vzLjAcnnD7+sBe8c6UVmvU
	 6O66azdbERH6PnBPAEwx5xjs15fi9pPzLu+cYFv1xxIrXYNiNo1jGNL+dOS1i6VEP1
	 Ed6yMifkp5A5g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vndx1-000000005qA-1AII;
	Wed, 04 Feb 2026 15:33:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/3] Revert "revocable: Add Kunit test cases"
Date: Wed,  4 Feb 2026 15:28:48 +0100
Message-ID: <20260204142849.22055-3-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204142849.22055-1-johan@kernel.org>
References: <20260204142849.22055-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit cd7693419bb5abd91ad2f407dab69c480e417a61.

The new revocable functionality is fundamentally broken and at a minimum
needs to be redesigned.

Drop the revocable Kunit tests to allow the implementation to be reverted.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 MAINTAINERS                   |   1 -
 drivers/base/Kconfig          |   8 -
 drivers/base/Makefile         |   3 -
 drivers/base/revocable_test.c | 284 ----------------------------------
 4 files changed, 296 deletions(-)
 delete mode 100644 drivers/base/revocable_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7759e9103070..93c07c645c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22390,7 +22390,6 @@ M:	Tzung-Bi Shih <tzungbi@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/base/revocable.c
-F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
 
 RFKILL
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 9f318b98144d..1786d87b29e2 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -250,11 +250,3 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	  work on.
 
 endmenu
-
-# Kunit test cases
-config REVOCABLE_KUNIT_TEST
-	tristate "Kunit tests for revocable" if !KUNIT_ALL_TESTS
-	depends on KUNIT && BROKEN
-	default KUNIT_ALL_TESTS
-	help
-	  Kunit tests for the revocable API.
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 4c6607616a73..8074a10183dc 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -35,6 +35,3 @@ ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG
 # define_trace.h needs to know how to find our header
 CFLAGS_trace.o		:= -I$(src)
 obj-$(CONFIG_TRACING)	+= trace.o
-
-# Kunit test cases
-obj-$(CONFIG_REVOCABLE_KUNIT_TEST)	+= revocable_test.o
diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
deleted file mode 100644
index 27f5d7d96f4b..000000000000
--- a/drivers/base/revocable_test.c
+++ /dev/null
@@ -1,284 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright 2026 Google LLC
- *
- * Kunit tests for the revocable API.
- *
- * The test cases cover the following scenarios:
- *
- * - Basic: Verifies that a consumer can successfully access the resource
- *   provided via the provider.
- *
- * - Revocation: Verifies that after the provider revokes the resource,
- *   the consumer correctly receives a NULL pointer on a subsequent access.
- *
- * - Try Access Macro: Same as "Revocation" but uses the
- *   REVOCABLE_TRY_ACCESS_WITH() and REVOCABLE_TRY_ACCESS_SCOPED().
- *
- * - Provider Use-after-free: Verifies revocable_init() correctly handles
- *   race conditions where the provider is being released.
- *
- * - Concurrent Access: Verifies multiple threads can access the resource.
- */
-
-#include <kunit/test.h>
-#include <linux/completion.h>
-#include <linux/delay.h>
-#include <linux/kthread.h>
-#include <linux/refcount.h>
-#include <linux/revocable.h>
-
-static void revocable_test_basic(struct kunit *test)
-{
-	struct revocable_provider __rcu *rp;
-	struct revocable rev;
-	void *real_res = (void *)0x12345678, *res;
-	int ret;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	ret = revocable_init(rp, &rev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	res = revocable_try_access(&rev);
-	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	revocable_withdraw_access(&rev);
-
-	revocable_deinit(&rev);
-	revocable_provider_revoke(&rp);
-	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
-}
-
-static void revocable_test_revocation(struct kunit *test)
-{
-	struct revocable_provider __rcu *rp;
-	struct revocable rev;
-	void *real_res = (void *)0x12345678, *res;
-	int ret;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	ret = revocable_init(rp, &rev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-
-	res = revocable_try_access(&rev);
-	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	revocable_withdraw_access(&rev);
-
-	revocable_provider_revoke(&rp);
-	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
-
-	res = revocable_try_access(&rev);
-	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-	revocable_withdraw_access(&rev);
-
-	revocable_deinit(&rev);
-}
-
-static void revocable_test_try_access_macro(struct kunit *test)
-{
-	struct revocable_provider __rcu *rp;
-	void *real_res = (void *)0x12345678, *res;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	{
-		REVOCABLE_TRY_ACCESS_WITH(rp, res);
-		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	}
-
-	revocable_provider_revoke(&rp);
-	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
-
-	{
-		REVOCABLE_TRY_ACCESS_WITH(rp, res);
-		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-	}
-}
-
-static void revocable_test_try_access_macro2(struct kunit *test)
-{
-	struct revocable_provider __rcu *rp;
-	void *real_res = (void *)0x12345678, *res;
-	bool accessed;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	accessed = false;
-	REVOCABLE_TRY_ACCESS_SCOPED(rp, res) {
-		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-		accessed = true;
-	}
-	KUNIT_EXPECT_TRUE(test, accessed);
-
-	revocable_provider_revoke(&rp);
-	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
-
-	accessed = false;
-	REVOCABLE_TRY_ACCESS_SCOPED(rp, res) {
-		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-		accessed = true;
-	}
-	KUNIT_EXPECT_TRUE(test, accessed);
-}
-
-static void revocable_test_provider_use_after_free(struct kunit *test)
-{
-	struct revocable_provider __rcu *rp;
-	struct revocable_provider *old_rp;
-	struct revocable rev;
-	void *real_res = (void *)0x12345678;
-	int ret;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	ret = revocable_init(NULL, &rev);
-	KUNIT_EXPECT_NE(test, ret, 0);
-
-	/* Simulate the provider has been freed. */
-	old_rp = rcu_replace_pointer(rp, NULL, 1);
-	ret = revocable_init(rp, &rev);
-	KUNIT_EXPECT_NE(test, ret, 0);
-	rcu_replace_pointer(rp, old_rp, 1);
-
-	struct {
-		struct srcu_struct srcu;
-		void __rcu *res;
-		struct kref kref;
-		struct rcu_head rcu;
-	} *rp_internal = (void *)rp;
-
-	/* Simulate the provider is releasing. */
-	refcount_set(&rp_internal->kref.refcount, 0);
-	ret = revocable_init(rp, &rev);
-	KUNIT_EXPECT_NE(test, ret, 0);
-	refcount_set(&rp_internal->kref.refcount, 1);
-
-	revocable_provider_revoke(&rp);
-	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
-	ret = revocable_init(rp, &rev);
-	KUNIT_EXPECT_NE(test, ret, 0);
-}
-
-struct test_concurrent_access_context {
-	struct kunit *test;
-	struct revocable_provider __rcu *rp;
-	struct revocable rev;
-	struct completion started, enter, exit;
-	struct task_struct *thread;
-	void *expected_res;
-};
-
-static int test_concurrent_access_provider(void *data)
-{
-	struct test_concurrent_access_context *ctx = data;
-
-	complete(&ctx->started);
-
-	wait_for_completion(&ctx->enter);
-	revocable_provider_revoke(&ctx->rp);
-	KUNIT_EXPECT_PTR_EQ(ctx->test, unrcu_pointer(ctx->rp), NULL);
-
-	return 0;
-}
-
-static int test_concurrent_access_consumer(void *data)
-{
-	struct test_concurrent_access_context *ctx = data;
-	void *res;
-
-	complete(&ctx->started);
-
-	wait_for_completion(&ctx->enter);
-	res = revocable_try_access(&ctx->rev);
-	KUNIT_EXPECT_PTR_EQ(ctx->test, res, ctx->expected_res);
-
-	wait_for_completion(&ctx->exit);
-	revocable_withdraw_access(&ctx->rev);
-
-	return 0;
-}
-
-static void revocable_test_concurrent_access(struct kunit *test)
-{
-	struct revocable_provider __rcu *rp;
-	void *real_res = (void *)0x12345678;
-	struct test_concurrent_access_context *ctx;
-	int ret, i;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, ctx);
-
-	for (i = 0; i < 3; ++i) {
-		ctx[i].test = test;
-		init_completion(&ctx[i].started);
-		init_completion(&ctx[i].enter);
-		init_completion(&ctx[i].exit);
-
-		if (i == 0) {
-			ctx[i].rp = rp;
-			ctx[i].thread = kthread_run(
-				test_concurrent_access_provider, ctx + i,
-				"revocable_provider_%d", i);
-		} else {
-			ret = revocable_init(rp, &ctx[i].rev);
-			KUNIT_ASSERT_EQ(test, ret, 0);
-
-			ctx[i].thread = kthread_run(
-				test_concurrent_access_consumer, ctx + i,
-				"revocable_consumer_%d", i);
-		}
-		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
-
-		wait_for_completion(&ctx[i].started);
-	}
-	ctx[1].expected_res = real_res;
-	ctx[2].expected_res = NULL;
-
-	/* consumer1 enters read-side critical section */
-	complete(&ctx[1].enter);
-	msleep(100);
-	/* provider0 revokes the resource */
-	complete(&ctx[0].enter);
-	msleep(100);
-	/* consumer2 enters read-side critical section */
-	complete(&ctx[2].enter);
-	msleep(100);
-
-	/* consumer{1,2} exit read-side critical section */
-	complete(&ctx[1].exit);
-	complete(&ctx[2].exit);
-
-	for (i = 0; i < 3; ++i)
-		kthread_stop(ctx[i].thread);
-	for (i = 1; i < 3; ++i)
-		revocable_deinit(&ctx[i].rev);
-}
-
-static struct kunit_case revocable_test_cases[] = {
-	KUNIT_CASE(revocable_test_basic),
-	KUNIT_CASE(revocable_test_revocation),
-	KUNIT_CASE(revocable_test_try_access_macro),
-	KUNIT_CASE(revocable_test_try_access_macro2),
-	KUNIT_CASE(revocable_test_provider_use_after_free),
-	KUNIT_CASE(revocable_test_concurrent_access),
-	{}
-};
-
-static struct kunit_suite revocable_test_suite = {
-	.name = "revocable_test",
-	.test_cases = revocable_test_cases,
-};
-
-kunit_test_suite(revocable_test_suite);
-
-MODULE_DESCRIPTION("KUnit tests for the revocable API");
-MODULE_LICENSE("GPL");
-- 
2.52.0

