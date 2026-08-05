Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A88432BCD;
	Wed,  5 Aug 2026 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928709; cv=none; b=hug7pdVr2x2TYuiCg4wB6z5wzsr2xolOX2G1pigUNqgBC/rYU+5vGv9/6aJVcWFJ35/k4g1GMbvu4fr8SAtXxBdmSTrOp+yvwpXwbRi36JHKioMfXFp2u0P6QvOzlTUlsDy20OAnMhX5OP6jAYac7L94S4TbAINoVweAV4rhFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928709; c=relaxed/simple;
	bh=UT1LepNEWbCDWJUaYqv5zlUitw1W3TiARj2cPHvoCUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNHIQ5x7SrFQkE1EkTAX0IGIKC/Zi+S/i+UJNolyrQq1te1w6+HED0SE2oSQQ/wq9MGgmDAy5y4y8n8MvFx/ZiKjpP1kwUc11P8PxIGKKEiRgAsJy0Sts6tJTchsPUozR1gN2EJapu0d7Rqx3FCf6KxOoi/71/Q3o/BFXpSXGyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4bnVzSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4bnVzSW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1C68C4AF09;
	Wed,  5 Aug 2026 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785928708;
	bh=UT1LepNEWbCDWJUaYqv5zlUitw1W3TiARj2cPHvoCUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t4bnVzSW253zztAizs4KD1n/F8LF6BjSGZqoXiLNUHLADW43SyAl+F4vGC3mLRJ+G
	 1VIsXo/OelgBOP2pLzTSSTfsGRvcaQ3YhdVpRZD0jjtkFz1kI4pROqRNOWDt5Q4x2o
	 ZGcrwwanX4CvtFlLtS0cTDmfxV+MQywibHlqLDQgZqK8tnpRDI0Xu8V2pUnVtBhDBx
	 1qghbEiFfddqgF+XYph7lFv3JglkGfCol5n0/SYZTF0mTTbQdU/iWK9RSP+RdaPJ82
	 CsG8jvkgSatiYLI88pIahlTv6hfJq9j+EFdjtAYRkXq9eNAbbyUNMLhv3xGIhfp0f9
	 bKMe0WZuzKzhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910CDC56203;
	Wed,  5 Aug 2026 11:18:28 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Wed, 05 Aug 2026 16:48:25 +0530
Subject: [PATCH 2/3] mm: add KUnit coverage for mappingless swapcache
 folios
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-b4-mappingless-swapcache-v1-2-b1d78ba257ca@zohomail.in>
References: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
In-Reply-To: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Nico Pache <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785928706; l=3587;
 i=shivamkalra98@zohomail.in; s=20260402; h=from:subject:message-id;
 bh=3IHZ3BPfu/ApButT5xoLEv/VnC/YC3Wow9MhmnAZMzc=;
 b=kwJo2F0rrfAhLwyUMaWx9mR8UMYCkW+NJtcJ+vkgWEVRteK7dzLUswl4dzXKcjsjnKaY7gy+o
 aZ7xqewrI1jABqzhx/4AhTC7/o5MsARKWLGAI5QWdu0WThzRY5Qn8TP
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=U8kQSxcte8P8iZ6zB7phIj+Yl+i/5ntifBGuclgypx8=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260402
 with auth_id=716
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

From: Shivam Kalra <shivamkalra98@zohomail.in>

Add focused coverage for the folio_check_splittable() eligibility checks.
Verify that an ordinary mappingless folio is rejected, a mappingless
swapcache folio is accepted, and unsupported target orders and split types
remain rejected.

Build the test only when KUnit is built in because
folio_check_splittable() is intentionally not exported.

Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
 mm/Kconfig                   | 14 ++++++++++++
 mm/Makefile                  |  1 +
 mm/tests/folio_split_kunit.c | 52 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 331daf7fcfab..164dc1438900 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1503,6 +1503,20 @@ config LAZY_MMU_MODE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config FOLIO_SPLIT_KUNIT_TEST
+	bool "KUnit tests for folio splitting" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y
+	depends on TRANSPARENT_HUGEPAGE
+	depends on SWAP
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test folio split eligibility checks. The tests
+	  verify support for mappingless folios in the swap cache and ensure
+	  that unsupported target orders and split types are still rejected.
+	  The tests are built into the kernel and run during KUnit execution.
+
+	  If unsure, say N.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index ab37ef428d98..f09057b40e1a 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -146,4 +146,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
+obj-$(CONFIG_FOLIO_SPLIT_KUNIT_TEST) += tests/folio_split_kunit.o
 obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
diff --git a/mm/tests/folio_split_kunit.c b/mm/tests/folio_split_kunit.c
new file mode 100644
index 000000000000..f91c1a320bbf
--- /dev/null
+++ b/mm/tests/folio_split_kunit.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/errno.h>
+#include <linux/mm.h>
+#include <linux/huge_mm.h>
+#include <linux/module.h>
+#include <linux/pagemap.h>
+
+static void folio_check_splittable_mappingless_swapcache(struct kunit *test)
+{
+	struct folio *folio;
+	int ret;
+
+	folio = folio_alloc(GFP_KERNEL, 2);
+	KUNIT_ASSERT_NOT_NULL(test, folio);
+	folio_lock(folio);
+
+	KUNIT_EXPECT_PTR_EQ(test, folio->mapping, NULL);
+	ret = folio_check_splittable(folio, 0, SPLIT_TYPE_UNIFORM);
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+
+	/* Only the eligibility check is exercised here. */
+	folio_set_swapbacked(folio);
+	folio_set_swapcache(folio);
+
+	ret = folio_check_splittable(folio, 0, SPLIT_TYPE_UNIFORM);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	ret = folio_check_splittable(folio, 1, SPLIT_TYPE_UNIFORM);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	ret = folio_check_splittable(folio, 0, SPLIT_TYPE_NON_UNIFORM);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	folio_clear_swapcache(folio);
+	folio_clear_swapbacked(folio);
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
+static struct kunit_case folio_split_test_cases[] = {
+	KUNIT_CASE(folio_check_splittable_mappingless_swapcache),
+	{}
+};
+
+static struct kunit_suite folio_split_test_suite = {
+	.name = "folio_split",
+	.test_cases = folio_split_test_cases,
+};
+
+kunit_test_suite(folio_split_test_suite);
+
+MODULE_DESCRIPTION("Tests for folio splitting");
+MODULE_LICENSE("GPL");

-- 
2.43.0


