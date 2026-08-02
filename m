Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF333B969;
	Sun,  2 Aug 2026 19:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700389; cv=none; b=Z4biQszcMePc4tQ/7M23ga/lV2p2SqK2dkfMoFNEK9ZRkrdlJYWsjmogwTv2z+bBicELoOo+ZDIYVsiQp5dvtuXZxg8vsawDujmpu8/2U6GLxfU3c8SNMEPt3+SAc2i+9CZjxseBe+LJZgQLup+HKMAY3aAmE5MxcfaZk0ZslC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700389; c=relaxed/simple;
	bh=yuS02wbrk5SjYQbmIiLyDHVXUtJHWVkqQiWY6etCn4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgh9cujNk7VRiwS/q+2nn2ylFEuKa6h1INEpfd6V/bI9CGg6GrEBoKJZtC75GKAT7HlGEKtm6dJ5VMimyIWEko8/F9fG2kbq6SNpbSwwK1p1/0JZllE55EDZsc9oFqCIyGDshL7M3QD0d0CtY7Scda4KyHfuTbL0vFnAtBAIayU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=0FFkWNBt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dOMh3TXg; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="0FFkWNBt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dOMh3TXg"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 1A4BBEC0098;
	Sun,  2 Aug 2026 15:53:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 15:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1785700386; x=
	1785786786; bh=X1lpufIc87OrnILbrU6i86Hc6Ve8zguy5RpXlRq4bUw=; b=0
	FFkWNBtuEAeEy7agVM5xXu/ZfKL2jk0304oi68XxN1udA5BoUYUbK4lTAyO/F+oe
	Q1CGxjk3wHF83cIUKVRTwaUfqYOuz2knSlhuFK1MvyX6g84JG0cEdZn6NKdR9a5a
	w3M2ytwlQNUFGVhwwn/SDENee0fNTT2Au4vWpo3G/W6iT0yQYmhJ7/tvfmdh3UTa
	naNwbVVVtZ/LzUouKnBt7Un+onnZbrj3iEaPx5hEMRwXLMsU6S3qzcGv9GU5tDDo
	/HESqvJbQWq2s1NZGCKL9GSH/28UuF5gmgH8VE4voRPoO08Tp52XoOyWiQU6g5Un
	TyJVPu+0pqtVCVxie1xuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1785700386; x=1785786786; bh=X
	1lpufIc87OrnILbrU6i86Hc6Ve8zguy5RpXlRq4bUw=; b=dOMh3TXgQ67ebPYjj
	H4bJFLFiOBfjVZsFO01sPcHaMNEBOGV/W8MV9aEHBmBVCjewrjlcp+zsYR1Gefn4
	wSctehEQvt5cEWXwUl4+cZ2KbOwhwm2THw2NZP/yajoOR4t39hjb4dp0/Y23Nl7x
	aIShhQt8Fa7FdUeYWTODXk9Tj9TB7GHQf1nuwl7RTg3879F9/7JrotJoszJIQ7Pf
	r2Tl22RKZgCavGei2o5DioNID/ERvUciD64WnKUhxftZ6STjvZPIrojHXSNglaQE
	XOJaEorGqubnSbeO5mXx4ypOuda8SVCk2aRZT4kmsX7lTi6jSsM+AhMgrUkcoAHr
	QbznQ==
X-ME-Sender: <xms:IaBvahQ44OsqpSybZ4M_wrE1Uj9scHLmhkUjlY1SgeeOIrKe-zCXCQ>
    <xme:IaBvalSABZYOqhneYzboOJz-A6gpd3JZZebni8iiPUDCshKgLgpsn2rY_gJF8K7Kx
    MOkvRHmBfVBntwDtv-QVDbXnZvgYIr-aUyblOzp-24tTQIuEnl31h8>
X-ME-Received: <xmr:IaBvajy5OD24ExYjN8f9x_HTQJlWiDzDQNbLK5Wh70XX9IbnJ1ALiFup8uM>
X-ME-Proxy-Cause: dmFkZTFcbv35QwNbwWPHQBcJdrWasH4YRFOBaNWig98oa0GgLD3LmQrthvyDgK5JnDhp96
    dBkNywOXlTP9Hby+cm0vRQHofuB4BhsdtVcBrMer/A2AOpegfr9Hr7RYzI6OqquxWhxeXC
    aB5bOw4cR5G6EDzO4v2r94SJnXRDYvi2NMwyCB/quID+suEuw0TjLUMYjjQ5pFm1F3OqpQ
    Ctej7rOharBpUeBz9hjZojzUlseCYYYMV+BulSa6+jD3O5m4ZOeULsSyQlLb9bciCyrhiP
    bT+z0cGYr8PFizBGTpPnPZCe+jZkx/DQlEsoaoSV2SjHlZpE6q2+n/t1AcZaLqu1qPGmVx
    CMMjXLzjYN36YxfWnhiv4XcXVDFVH+QfDI8mV8HA2XV6Jt2xBvmsyuX+fq1a2CuTBLcIeO
    gqn9K2eRet/mR8/5QWcY73Z9uPBqhfttiYT1CIUo8F2pKQB4z6jeB6/WRzzvAkdmN5hql4
    BAbVNgbizKm1GzsbQnfIyuDQ+gMMDcB0R3FiaJnj1cWqJkfrgeh42uFo3c8WyqZ1a8cvuf
    r7u1Yk4I9DIrDAXoLL9c6tyz4vO8e5JhPFT9DUIKpdl36ARtLETAQS1zF2EFZUCmoOnTGv
    B889LX947NZdGckA/k96rmNnbScoJNl1iTRElq8TApmf1wVKCNrw0abNqjiA
X-ME-Proxy: <xmx:IaBvaruNT-4jGeASZnCrxg2ewUiWM9y7WbmtRKUkCSecjyJ59euPcw>
    <xmx:IaBvaiyeV5iTPNsSPvLwgWMZZZyEZQ24SMoyXShacQFO6UFxcjvFPQ>
    <xmx:IaBvarc3MqRu27pyxTi6D7X-u_7lWV36z_cstFC4WMgWNVZHdgxm3Q>
    <xmx:IaBvao2b2w2UwtggzLcs73tMvPMUCg9UhbBz0ALwbii2eSJ7CjsqRg>
    <xmx:IqBvanO_TDXpZUFay-JWtpnRsUrjl7V3uHSbGNqtuizW9HTJL3_Yx7Xh>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:05 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nico Pache <nico.pache@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 03/16] selftests/mm: add folio-order detection self-check
Date: Sun,  2 Aug 2026 20:52:35 +0100
Message-ID: <20260802195254.1937477-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The upcoming khugepaged mTHP tests detect collapse results with the
vm_util folio-order helpers instead of smaps AnonHugePages, which only
sees PMD mappings. Before any collapse test trusts those helpers, make
sure they agree with the kernel about what backs a mapping.

For every anon THP order the kernel supports, fault memory in with
only that order enabled and require the helpers to classify the
backing as exactly that order: not a neighbouring order, and 4K-backed
memory as order 0.

Runs in the thp category of run_vmtests.sh. Verified on x86-64 4K
(orders 0, 2-9) and arm64 64K (orders 0, 2-13).

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   1 +
 .../testing/selftests/mm/folio_order_check.c  | 138 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +
 4 files changed, 142 insertions(+)
 create mode 100644 tools/testing/selftests/mm/folio_order_check.c

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 9ccd9e1447e6..54eefd8f97bc 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -66,3 +66,4 @@ merge
 prctl_thp_disable
 rmap
 folio_split_race_test
+folio_order_check
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 25d10ced3b3b..33917c76b871 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -104,6 +104,7 @@ TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
+TEST_GEN_FILES += folio_order_check
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
diff --git a/tools/testing/selftests/mm/folio_order_check.c b/tools/testing/selftests/mm/folio_order_check.c
new file mode 100644
index 000000000000..f70d766ff3eb
--- /dev/null
+++ b/tools/testing/selftests/mm/folio_order_check.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Self-check for the vm_util folio-order detection helpers,
+ * is_backed_by_folio() and is_range_backed_by_folio_orders().
+ *
+ * For every anon THP order the kernel supports, fault memory in with only
+ * that order enabled and verify the helpers report exactly that order:
+ * not a neighbouring order, and plain 4K memory as order 0. The helpers
+ * are what the khugepaged mTHP tests use to detect collapse results, so
+ * they must agree with the kernel's own idea of the backing before any
+ * collapse test relies on them.
+ */
+#define _GNU_SOURCE
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+#include "vm_util.h"
+#include "hugepage_settings.h"
+
+static int pagemap_fd;
+static int kpageflags_fd;
+
+/* mmap an anon VMA of exactly @size bytes at a @size-aligned address. */
+static char *alloc_aligned(size_t size)
+{
+	size_t len = size * 2;
+	uintptr_t aligned;
+	char *p;
+
+	p = mmap(NULL, len, PROT_READ | PROT_WRITE,
+		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (p == MAP_FAILED)
+		ksft_exit_fail_perror("mmap()");
+
+	aligned = ((uintptr_t)p + size - 1) & ~(size - 1);
+	if (aligned != (uintptr_t)p)
+		munmap(p, aligned - (uintptr_t)p);
+	if (aligned + size != (uintptr_t)p + len)
+		munmap((char *)aligned + size,
+		       (uintptr_t)p + len - aligned - size);
+
+	return (char *)aligned;
+}
+
+/*
+ * Enable only @order (order 0: nothing), fault one aligned window in and
+ * check the helpers see exactly @order.
+ */
+static void check_order(int order)
+{
+	struct thp_settings settings = *thp_current_settings();
+	size_t size = psize() << order;
+	bool ok = true;
+	char *p;
+	int i;
+
+	for (i = 0; i < NR_ORDERS; i++)
+		settings.hugepages[i].enabled = THP_NEVER;
+	if (order)
+		settings.hugepages[order].enabled = THP_ALWAYS;
+	thp_push_settings(&settings);
+
+	p = alloc_aligned(size);
+	*p = 1;
+
+	if (!is_range_backed_by_folio_orders(p, size, order,
+					     pagemap_fd, kpageflags_fd)) {
+		ksft_print_msg("order %d not detected after fault\n", order);
+		ok = false;
+	}
+
+	/* A lower order must be rejected: the folio is larger. */
+	if (order && is_range_backed_by_folio_orders(p, size, order - 1,
+						     pagemap_fd,
+						     kpageflags_fd)) {
+		ksft_print_msg("order %d also reported as order %d\n",
+			       order, order - 1);
+		ok = false;
+	}
+
+	/* Order 0 pages must not look like any large folio, and vice versa. */
+	if (order && is_range_backed_by_folio_orders(p, size, 0,
+						     pagemap_fd,
+						     kpageflags_fd)) {
+		ksft_print_msg("order %d also reported as order 0\n", order);
+		ok = false;
+	}
+
+	munmap(p, size);
+	thp_pop_settings();
+
+	ksft_test_result(ok, "order %d classified\n", order);
+}
+
+int main(void)
+{
+	struct thp_settings settings;
+	unsigned long orders;
+	int order;
+
+	ksft_print_header();
+
+	if (!thp_available())
+		ksft_exit_skip("Transparent Hugepages not available\n");
+
+	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_perror("open(\"/proc/self/pagemap\")");
+	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
+	if (kpageflags_fd < 0)
+		ksft_exit_skip("open(\"/proc/kpageflags\") requires root\n");
+
+	orders = thp_supported_orders();
+	if (!orders)
+		ksft_exit_skip("No supported THP orders\n");
+
+	ksft_set_plan(__builtin_popcountl(orders) + 1);
+
+	thp_save_settings();
+	thp_read_settings(&settings);
+	/* Base of the settings stack; the bottom entry is never popped. */
+	thp_push_settings(&settings);
+
+	check_order(0);
+	for (order = 1; order < NR_ORDERS; order++) {
+		if (!(orders & (1UL << order)))
+			continue;
+		check_order(order);
+	}
+
+	thp_restore_settings();
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 687d115e3bd8..8bf898b71350 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -402,6 +402,8 @@ CATEGORY="pfnmap" run_test ./pfnmap
 # COW tests
 CATEGORY="cow" run_test ./cow
 
+CATEGORY="thp" run_test ./folio_order_check
+
 CATEGORY="thp" run_test ./khugepaged
 
 CATEGORY="thp" run_test ./khugepaged -s 2
-- 
2.54.0

