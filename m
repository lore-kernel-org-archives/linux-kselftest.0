Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195BA2874F5;
	Thu, 29 Jan 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697486; cv=none; b=b6fLxhS3pLK2cWNjOAiNXXgKZ7NSJnv/Wve5joKFTSDUL29ApYXRNxysW4nm/OTqprw0o4dNkugngaXt6W1mWYewHm58dwBn7DLljAvQRWbYtONKWnAVQCXC5ufIvqBar2S65aZ5xY0xXITx5hwNLb7t1NrhF5fTdS8gJIesmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697486; c=relaxed/simple;
	bh=SUGfZS56d2WKVPFhyl+8hQaQtIjs8UXUWjfjEByZb14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irTtTLPZixme2VAk3ZRDe1CHp5ypn5APIhBDwPzlYZx/GPK8GdT8wYNCqbLFrRDV9NkKDW1X/IcrqcUGSpsWsIsabItijyTD8Qd3wS94Vm/U3WekYSkLCNGTvqhbn+MILIDe3L86I2w0kDGe/u+M6ID0uJrcJzxfyV1DwTAXT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT6fub4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT6fub4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67B8C19422;
	Thu, 29 Jan 2026 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697486;
	bh=SUGfZS56d2WKVPFhyl+8hQaQtIjs8UXUWjfjEByZb14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lT6fub4zYlgrI2eNTkAobf+9E0IMW11C5m7km178JRpAG1K1ZKxajTGNQBpcXA1qE
	 G439qoOy5wd1BMeTklPjcsXYDRN6F8JCEgqc7rh+87UyFb5BqSOJYHO8JJor3kYCft
	 zuk54l3izlFAfDeUKoqbK6B5Ez8ZzdSH+k+yvddVCxwccYTndRdKbDy2Vyfgn+eJhE
	 vzyefc8V1ErDmrxo9ftEYAhpG5gGHc3IPfkSLMDvbG1DoKMf1ttrxJVBywsqiaNCNs
	 uKf2fhuvfaJTlHkkqiZi+YXSqlvnjDZ95HzFQI/6QKJkCSMTJmaZQfsFyYhSXUCTMh
	 mX1MtnC/8dnAg==
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
Subject: [PATCH 2/4] revocable: Add KUnit test for provider lifetime races
Date: Thu, 29 Jan 2026 14:37:31 +0000
Message-ID: <20260129143733.45618-3-tzungbi@kernel.org>
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

Add a test to verify that revocable_alloc() correctly handles race
conditions where the provider is being released.

The test covers three scenarios:
1. Allocating from a NULL provider.
2. Allocating from a provider that has been detached (pointer is NULL).
3. Allocating from a provider that is in the process of destruction
   (refcount is 0), simulating a race between revocable_alloc() and
   revocable_provider_release().

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
 drivers/base/revocable_test.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
index 1622aae92fd3..7fc4d6a3dff6 100644
--- a/drivers/base/revocable_test.c
+++ b/drivers/base/revocable_test.c
@@ -14,9 +14,13 @@
  *
  * - Try Access Macro: Same as "Revocation" but uses the
  *   REVOCABLE_TRY_ACCESS_WITH() and REVOCABLE_TRY_ACCESS_SCOPED().
+ *
+ * - Provider Use-after-free: Verifies revocable_alloc() correctly handles
+ *   race conditions where the provider is being released.
  */
 
 #include <kunit/test.h>
+#include <linux/refcount.h>
 #include <linux/revocable.h>
 
 static void revocable_test_basic(struct kunit *test)
@@ -127,11 +131,48 @@ static void revocable_test_try_access_macro2(struct kunit *test)
 	revocable_free(rev);
 }
 
+static void revocable_test_provider_use_after_free(struct kunit *test)
+{
+	struct revocable_provider __rcu *rp;
+	struct revocable_provider *old_rp;
+	void *real_res = (void *)0x12345678;
+	struct revocable *rev;
+
+	rp = revocable_provider_alloc(real_res);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, rp);
+
+	rev = revocable_alloc(NULL);
+	KUNIT_EXPECT_PTR_EQ(test, rev, NULL);
+
+	/* Simulate the provider has been freed. */
+	old_rp = rcu_replace_pointer(rp, NULL, 1);
+	rev = revocable_alloc(rp);
+	KUNIT_EXPECT_PTR_EQ(test, rev, NULL);
+	rcu_replace_pointer(rp, old_rp, 1);
+
+	struct {
+		struct srcu_struct srcu;
+		void __rcu *res;
+		struct kref kref;
+		struct rcu_head rcu;
+	} *rp_internal = (void *)rp;
+
+	/* Simulate the provider is releasing. */
+	refcount_set(&rp_internal->kref.refcount, 0);
+	rev = revocable_alloc(rp);
+	KUNIT_EXPECT_PTR_EQ(test, rev, NULL);
+	refcount_set(&rp_internal->kref.refcount, 1);
+
+	revocable_provider_revoke(&rp);
+	KUNIT_EXPECT_PTR_EQ(test, unrcu_pointer(rp), NULL);
+}
+
 static struct kunit_case revocable_test_cases[] = {
 	KUNIT_CASE(revocable_test_basic),
 	KUNIT_CASE(revocable_test_revocation),
 	KUNIT_CASE(revocable_test_try_access_macro),
 	KUNIT_CASE(revocable_test_try_access_macro2),
+	KUNIT_CASE(revocable_test_provider_use_after_free),
 	{}
 };
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

