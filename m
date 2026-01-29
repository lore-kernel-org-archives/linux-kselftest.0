Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329322EBDD0;
	Thu, 29 Jan 2026 14:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697491; cv=none; b=InlhS24aXjgXd+5/DdJ1Mjylj/iZv15gVfQGW/wPHNdfitgZVebGM0ZBCKG8VoCKzdyJf8h5dCRfO7qPVX1z6rucVmqOqgq6+RZ//zW90hnuZdUfnGom+5YPjh5ksEG2wu7nSWSX/D+3pnDnxKe0vhjNqhY0cJ8gTYs4FCIjhDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697491; c=relaxed/simple;
	bh=dOJ6JKliJBVh7PxmWDkV41V8SWn5nzmEj9VT88rYn38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAqxj7Lrm7u64VwSHa7wat3Kz7I3Ik+UtKXz/PXAwMr7ectlKE8JAUxs2jsssQfQcFEhMN7xlgr36kaXVyYPa80NaQgv7AA5TCHgWasBP4DIB7ETqbXxRZtDooe43DRvpxV1d3PJarx6lDiawZKNHTm9uFeeInLYaDL+wmg4CEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfEHdwX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfEHdwX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FA1C19422;
	Thu, 29 Jan 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697490;
	bh=dOJ6JKliJBVh7PxmWDkV41V8SWn5nzmEj9VT88rYn38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GfEHdwX+ryfGzRkhy9lx5n8b5mUbp2mPpyVwp82fdH5DqnDlnax94XfJPcB7nQcWo
	 GRkmlEo+dGCw1a21lVEQ9HwrohEjA0azwkiMahzwvQC8I25yijxRvnPYKd3/mijRB7
	 hML6UF0SnfKrsT5bzvQTZPyiBiP2Q6GdEL30s1u3ADgIClqkAMtohuJr4khjIFL4M9
	 CysURdIEjS8Z21bJsuQJ07YOfUQnSPNMBKtAh9nxmQtFA9yk45L13qqotHYF1Tyeyi
	 3IxxZp6qEgNqLGNmROQSy56OcA9TzTDIU+rwr7vnQ3FswutkJYRon+bfkx8AcupzFG
	 no8t92vzEvIoA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH 4/4] revocable: Add KUnit test for concurrent access
Date: Thu, 29 Jan 2026 14:37:33 +0000
Message-ID: <20260129143733.45618-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
In-Reply-To: <20260129143733.45618-1-tzungbi@kernel.org>
References: <20260129143733.45618-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test case to verify correct synchronization between concurrent
readers and a revocation.

The test setup involves:
1. Consumer 1 enters the critical section (SRCU read lock) and verifies
   access to the resource.
2. Provider attempts to revoke the resource.  This should block until
   Consumer 1 releases the lock.
3. Consumer 2 attempts to enter the critical section while revocation
   is pending.  It should see the resource as revoked (NULL).
4. Consumer 1 exits, allowing the revocation to complete.

This ensures that the SRCU mechanism correctly enforces grace periods
and that new readers are properly prevented from accessing the resource
once revocation has begun.

A way to run the test:
$ ./tools/testing/kunit/kunit.py run \
	--kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
	--kconfig_add CONFIG_PROVE_LOCKING=y \
	--kconfig_add CONFIG_DEBUG_KERNEL=y \
	--kconfig_add CONFIG_DEBUG_INFO=y \
	--kconfig_add CONFIG_DEBUG_INFO_DWARF5=y \
	--kconfig_add CONFIG_KASAN=y \
	--kconfig_add CONFIG_DETECT_HUNG_TASK=y \
	--kconfig_add CONFIG_DEFAULT_HUNG_TASK_TIMEOUT="10" \
	--arch=x86_64 --raw_output=all \
	revocable_test

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/base/revocable_test.c | 104 ++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
index a2818ec01298..27f5d7d96f4b 100644
--- a/drivers/base/revocable_test.c
+++ b/drivers/base/revocable_test.c
@@ -17,9 +17,14 @@
  *
  * - Provider Use-after-free: Verifies revocable_init() correctly handles
  *   race conditions where the provider is being released.
+ *
+ * - Concurrent Access: Verifies multiple threads can access the resource.
  */
 
 #include <kunit/test.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
 #include <linux/refcount.h>
 #include <linux/revocable.h>
 
@@ -160,12 +165,111 @@ static void revocable_test_provider_use_after_free(struct kunit *test)
 	KUNIT_EXPECT_NE(test, ret, 0);
 }
 
+struct test_concurrent_access_context {
+	struct kunit *test;
+	struct revocable_provider __rcu *rp;
+	struct revocable rev;
+	struct completion started, enter, exit;
+	struct task_struct *thread;
+	void *expected_res;
+};
+
+static int test_concurrent_access_provider(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	revocable_provider_revoke(&ctx->rp);
+	KUNIT_EXPECT_PTR_EQ(ctx->test, unrcu_pointer(ctx->rp), NULL);
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
+	struct revocable_provider __rcu *rp;
+	void *real_res = (void *)0x12345678;
+	struct test_concurrent_access_context *ctx;
+	int ret, i;
+
+	rp = revocable_provider_alloc(real_res);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	for (i = 0; i < 3; ++i) {
+		ctx[i].test = test;
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+		init_completion(&ctx[i].exit);
+
+		if (i == 0) {
+			ctx[i].rp = rp;
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_provider, ctx + i,
+				"revocable_provider_%d", i);
+		} else {
+			ret = revocable_init(rp, &ctx[i].rev);
+			KUNIT_ASSERT_EQ(test, ret, 0);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_consumer, ctx + i,
+				"revocable_consumer_%d", i);
+		}
+		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
+
+		wait_for_completion(&ctx[i].started);
+	}
+	ctx[1].expected_res = real_res;
+	ctx[2].expected_res = NULL;
+
+	/* consumer1 enters read-side critical section */
+	complete(&ctx[1].enter);
+	msleep(100);
+	/* provider0 revokes the resource */
+	complete(&ctx[0].enter);
+	msleep(100);
+	/* consumer2 enters read-side critical section */
+	complete(&ctx[2].enter);
+	msleep(100);
+
+	/* consumer{1,2} exit read-side critical section */
+	complete(&ctx[1].exit);
+	complete(&ctx[2].exit);
+
+	for (i = 0; i < 3; ++i)
+		kthread_stop(ctx[i].thread);
+	for (i = 1; i < 3; ++i)
+		revocable_deinit(&ctx[i].rev);
+}
+
 static struct kunit_case revocable_test_cases[] = {
 	KUNIT_CASE(revocable_test_basic),
 	KUNIT_CASE(revocable_test_revocation),
 	KUNIT_CASE(revocable_test_try_access_macro),
 	KUNIT_CASE(revocable_test_try_access_macro2),
 	KUNIT_CASE(revocable_test_provider_use_after_free),
+	KUNIT_CASE(revocable_test_concurrent_access),
 	{}
 };
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

