Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119A136358;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274947; cv=none; b=Ucxh7P/m//VDiTwzqMTx3c2X/dzVgZdUm4vhaSB47gCSx/uQ5EC7xpWoQ/ca+2bgjE8vLYCMPi+Vltj1LkKUMfasdrkowtO1mJ5IzwIIoRpfmyH/M88wFLQWF4wE66W5fcUDKe90W4L4Q08BRU6EUQgEcVPp6TxBsag9K6U/bb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274947; c=relaxed/simple;
	bh=/pKKd+IYDc4vw1mjgnfkacHzUNBZc5JBxNk0zqIoN5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etT69PyfT+1i/mUsI+oskg5nTFCMbE58jAJYiH/LTh3PmEwYdxjNog4si4hRTGPprkxAnX8HB43tOrCyWndX7AyZa2TWom6wUhyDTgTyCqXzGyHKEfTKEkihcaUZKdkuXlFLrmBbULOX9ZDFcf5ozIaNcr7HMgMHI4rcf+mh1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2T4WnTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2T4WnTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E333C19425;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769274947;
	bh=/pKKd+IYDc4vw1mjgnfkacHzUNBZc5JBxNk0zqIoN5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2T4WnTcnMJXyYAJA/F9rYzGX4qzfKw7uWLwo34onvMR55n8Jo6GYjl7eR+GAF6zZ
	 AzuQfOvktxybv4F3P9kOuIjvCWvoT/dSXhO8Drh5cV6Pt4vip66ztGE4NGjPB0B85X
	 0jXn5mAzrJNgjWsaihuxzloZU8enZfHN7QAGTjGek7cTGyr5gKLulO1G61tAaFmgeN
	 F/XzFIMngUMXbSR0/lNtvZ46DHXuewyQewXgnHMttYUUecm2b/xEU4IqxuEweNPgEo
	 P8oK37UGvMCLPAKny+MWoj2vlHnMT2x7SHQ381REMQj+c9sZyCpf9t5S9WpTCzioBl
	 BeozkrzAIPFCw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vjhEg-000000003Hx-0Sja;
	Sat, 24 Jan 2026 18:15:46 +0100
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
Subject: [PATCH 2/3] Revert "revocable: Add Kunit test cases"
Date: Sat, 24 Jan 2026 18:05:34 +0100
Message-ID: <20260124170535.11756-3-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124170535.11756-1-johan@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d9a1ff40f5aa9b493f26812c8850423e386ba7c9.

The new revocable functionality is fundamentally broken and at a minimum
needs to be redesigned.

Drop the revocable Kunit tests to allow the implementation to be reverted.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 MAINTAINERS                   |   1 -
 drivers/base/Kconfig          |   8 --
 drivers/base/Makefile         |   3 -
 drivers/base/revocable_test.c | 142 ----------------------------------
 4 files changed, 154 deletions(-)
 delete mode 100644 drivers/base/revocable_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bf38181c07e4..fac638cbb40a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22375,7 +22375,6 @@ M:	Tzung-Bi Shih <tzungbi@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/base/revocable.c
-F:	drivers/base/revocable_test.c
 F:	include/linux/revocable.h
 
 RFKILL
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 8f7d7b9d81ac..1786d87b29e2 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -250,11 +250,3 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	  work on.
 
 endmenu
-
-# Kunit test cases
-config REVOCABLE_KUNIT_TEST
-	tristate "Kunit tests for revocable" if !KUNIT_ALL_TESTS
-	depends on KUNIT
-	default KUNIT_ALL_TESTS
-	help
-	  Kunit tests for the revocable API.
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 4185aaa9bbb9..bdf854694e39 100644
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
index 873a44082b6c..000000000000
--- a/drivers/base/revocable_test.c
+++ /dev/null
@@ -1,142 +0,0 @@
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
- */
-
-#include <kunit/test.h>
-#include <linux/revocable.h>
-
-static void revocable_test_basic(struct kunit *test)
-{
-	struct revocable_provider *rp;
-	struct revocable *rev;
-	void *real_res = (void *)0x12345678, *res;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
-
-	res = revocable_try_access(rev);
-	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	revocable_withdraw_access(rev);
-
-	revocable_free(rev);
-	revocable_provider_revoke(rp);
-}
-
-static void revocable_test_revocation(struct kunit *test)
-{
-	struct revocable_provider *rp;
-	struct revocable *rev;
-	void *real_res = (void *)0x12345678, *res;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
-
-	res = revocable_try_access(rev);
-	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	revocable_withdraw_access(rev);
-
-	revocable_provider_revoke(rp);
-
-	res = revocable_try_access(rev);
-	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-	revocable_withdraw_access(rev);
-
-	revocable_free(rev);
-}
-
-static void revocable_test_try_access_macro(struct kunit *test)
-{
-	struct revocable_provider *rp;
-	struct revocable *rev;
-	void *real_res = (void *)0x12345678, *res;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
-
-	{
-		REVOCABLE_TRY_ACCESS_WITH(rev, res);
-		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-	}
-
-	revocable_provider_revoke(rp);
-
-	{
-		REVOCABLE_TRY_ACCESS_WITH(rev, res);
-		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-	}
-
-	revocable_free(rev);
-}
-
-static void revocable_test_try_access_macro2(struct kunit *test)
-{
-	struct revocable_provider *rp;
-	struct revocable *rev;
-	void *real_res = (void *)0x12345678, *res;
-	bool accessed;
-
-	rp = revocable_provider_alloc(real_res);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
-
-	rev = revocable_alloc(rp);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rev);
-
-	accessed = false;
-	REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
-		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
-		accessed = true;
-	}
-	KUNIT_EXPECT_TRUE(test, accessed);
-
-	revocable_provider_revoke(rp);
-
-	accessed = false;
-	REVOCABLE_TRY_ACCESS_SCOPED(rev, res) {
-		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
-		accessed = true;
-	}
-	KUNIT_EXPECT_TRUE(test, accessed);
-
-	revocable_free(rev);
-}
-
-static struct kunit_case revocable_test_cases[] = {
-	KUNIT_CASE(revocable_test_basic),
-	KUNIT_CASE(revocable_test_revocation),
-	KUNIT_CASE(revocable_test_try_access_macro),
-	KUNIT_CASE(revocable_test_try_access_macro2),
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

