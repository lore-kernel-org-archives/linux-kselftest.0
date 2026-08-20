Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612083806DC;
	Thu, 20 Aug 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239422; cv=none; b=VWIHVqVg2M4L81znvHtT9pu2x9gxNBtYL35bWnE9Um6UoR30nRV25m8e9EP/LlYSEVhecJfydhJLIo5RXVBzQy8sHTzsAxubNVOSz+wRxvv2A05XigP4FqydluzUrgwdSkNZdVyX9cqzU4i4H7f/2T3wyrPRd3QVj3lebt/+ZI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239422; c=relaxed/simple;
	bh=S7qRTZlqwXfNF7x+B6/znvCPtA0nlYOj1914c8i9drI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IV1z0+H6Lz0JNSa0HOyPeKo0IIRkry/NTXwt1aATbJ0ivFKLQ7E+i/yQw1PiGphLlbElGZvEZObmpiuYnup+jBJ7n1BwGYoBVnWPFc8Ny+dFCT8tNw6/FxzWPf8g2m7bE6DXJtx0KVIv60MfTSHlHl6DIoYoWmqlgwtkhdBAM4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C711F000E9;
	Thu, 20 Aug 2026 15:23:38 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Xu Yang <xu.yang_2@nxp.com>
Cc: driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] drivers: base: test: DRIVER_PE_KUNIT_TEST should not select OF
Date: Thu, 20 Aug 2026 17:23:29 +0200
Message-ID: <8dfb4afaf70b59cd33af9296464395470405187e.1787239268.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling a (modular) test should not silently enable additional kernel
functionality, as that may increase the attack vector for a product.

Fix this by skipping the new test when OF support is disabled instead of
selecting OF support.

Note that when OF support is disabled, the compiler optimizes away the
then unused reference to of_fwnode_ops in of_node_init(), so linking
succeeds.

Fixes: 0e6f8ccd4618afdb ("device property: add test cases for fwnode_for_each_child_node()")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/base/test/Kconfig               | 1 -
 drivers/base/test/property-entry-test.c | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 542ce07530a1c5ea..1ecf0791241a1b2e 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -17,7 +17,6 @@ config DM_KUNIT_TEST
 config DRIVER_PE_KUNIT_TEST
 	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
 	depends on KUNIT
-	select OF
 	default KUNIT_ALL_TESTS
 
 config DRIVER_SWNODE_KUNIT_TEST
diff --git a/drivers/base/test/property-entry-test.c b/drivers/base/test/property-entry-test.c
index 855e73b9b21f2810..89cdfc2f8498d8c8 100644
--- a/drivers/base/test/property-entry-test.c
+++ b/drivers/base/test/property-entry-test.c
@@ -523,6 +523,9 @@ static void pe_test_child_iteration(struct kunit *test)
 	struct fwnode_handle *child;
 	int error, i, num;
 
+	if (!IS_ENABLED(CONFIG_OF))
+		kunit_skip(test, "requires CONFIG_OF");
+
 	static const struct software_node node = { .name = "sw" };
 	static const struct software_node node1 = { .name = "sw-1", .parent = &node};
 	static const struct software_node node2 = { .name = "sw-2", .parent = &node};
-- 
2.43.0

