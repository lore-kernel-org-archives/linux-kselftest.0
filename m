Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55902D7D3A;
	Sat, 19 Sep 2026 00:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777519; cv=none; b=KB8wh026fg7//hIZKEJ15ChB6IooL8SrAyT50LAP+P/CIXtxpKf5pRoSs4qxQ4qqbwQu9hQR1CdDcEoG5sgM+Wt5ssZoOsBZGffsw3lMTvaRbvWrmSX1P4InChfGP51TCgkFRrUY52LTTb/YdF2kyFzJorGHuZ7JZG6Ha8UlLoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777519; c=relaxed/simple;
	bh=0tegOHLpniAeeRORXRa+2CjcFl6T3I2FlKK8XChS9NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q54SU+9a/3eM1epon1XKUyIWLZ+aRpE5U17ZBEk8ZMt0GTmdb+d+a1ZfjnmxU7S4HILvSKd0/REUKLvEi4H9A54+sQgOaBVx8nMuK7eTyioh//Zq79T3Kau+hx06Rnndb+s1FgjYEXSl1lxi0Rf+jWJqSPQ/lM0ZFm26AwvVjc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=He0n/kbf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cegSi7EI; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="He0n/kbf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cegSi7EI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 188E51400165;
	Fri, 18 Sep 2026 20:25:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 18 Sep 2026 20:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777516; x=
	1789863916; bh=JoUp1yN/qSNv1NBhj8IRdHW8JRjYh6PqAm057ehiBQc=; b=H
	e0n/kbfBbLnAEMjZSRXH0qlyrKZwW8xWxZ8J27bU1OkkXMqKMCjh40M+KE3KTGhR
	LKN2tWeD4BPhs1EsM/i3sXXxIEjH50QNuQyRZwxB4/CylPilQVrCMQ5ZVo+x7dt2
	QjY4J13QH+fVczJPjPpODHABUB9NhvSW1ZOoSHZ6Lf+xNPQ4XSHYKvt0ILLw7RTe
	SsAi/+2SfeOCU/muer/wI9Pha88pKR31AJ1Q+DmQmpWvuBMVTEgNDO5FEdwKyH8P
	QwTJ+PVoPIw59K/HAxYaXgP8GbvgPiZ348v8eMlbLZ4Xtcea5O25JSd1KIy2XYUT
	q50t89Tc0Qk05C1O/mazg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777516; x=1789863916; bh=J
	oUp1yN/qSNv1NBhj8IRdHW8JRjYh6PqAm057ehiBQc=; b=cegSi7EIBCDaGg6qY
	D6hu56p/UR3ekYX+I+xqQ0MdjtS+vDalshkbX89eq61EvugLKknY/lPLK2hKbLyl
	k6sG9oNjZX4Y5H6SOe2+Bn+dhYTp6S+P7xlxwWxoa1/ZekVacO6xdj3s0WGUAnxo
	o5CmmpHcATnFbteaCPMrfqtzkAWGWQa5v4P/Etfjw2fvD4ejElQeqnrPzUfdoiaz
	gogW9XX6GTWHUr063uoKl9K9o6tdf7VPN5CLHBeXnPH0nRwsgJJYDyxWqrwMyxwd
	V9QUzAlFLy5L9pk4WC1SVjRCtBfFQIQJjDGEOe6SKmemB2QEJSU5EYGBwDIbhM4u
	pdLZQ==
X-ME-Sender: <xms:bNatamjVvN76Pv5eo5CVK85fKeftYQ22wh72LerWpjcIESAB3FDgLA>
    <xme:bNatavblRtQ8j8xL0kQuJKawf9ySkavHl7BREhizpm1mgXvzWUB81TLVHZzp-Ttz1
    GLT90D4eaNrb5tT6m5mhJwp1Yc97Hhv7pmu0EYroydPoHc1eAteoKI>
X-ME-Received: <xmr:bNatagRGV5J81YaRScODasbq-KTtIH22ZOcA_DngImgMSWL7Clw6Piftqyc>
X-ME-Proxy-Cause: dmFkZTEzseHgHAxanvosBbYuJPOsY+n0X5UbYs0PPazNY//kQZ3NkUWvwvZaeFG4K6MaM1
    51QpOH4aelOmHBptEhruNIkMmEsuOQeZbGrvL7mQj2kdmmCNYrJ7V/Gxu8ar4BzJpo5rV7
    vKP2ia7U0+Vm59vAPsz2JcwivFHP+0OmSoqV+JfA3yKlcOkTPrhdGkX4AgOHLm4XJUt5mM
    HeqMESXl6ibr/xrgjBd4IZM9oAbU6DWk9Q3+fqdUek4rHv8tNSmXbmq+2iLXuPMZjgN42W
    gGRNasGU39A5UL6wnmEy31YC46agADHTZYQX6KPmc3+B0CXfmIhRtSns1d+buSvmpYlDQ1
    Nct0DJqYbFtgMLBwl0Mgq8h4lDVNt7z5slUUQuGUTarwDhgKg0aPdeteZazVyMm9CiA4mk
    tE4dt4mV9xRAYcebFPnbh8QDNGw9dlzxhAqpOEdyHhcfRGPnnU9J6vEXGzPPGEtJRINDqC
    MjmY0ZAinZrxX+DA8VHF13sgIl3c28QFzc0fO2nrcVUB7C30VnGnNGH6pB8T1shIN2dixa
    AyGX6eUBscu1tbWunQ8qNN81NNYQS6loqJbBKGnbLJrSZ8Pb+V8ikSaAGT6fHT5xBkC0Wf
    tamYsYP4AZSmYN4GLK5UiKP4j1tfXqC8iPxzBE74LuMSImTM2UI+wyyTitpw
X-ME-Proxy: <xmx:bNatanGZHq0i_zRQAYpUeGxtajSYCO_mXOCd3VsVT4hHfgr7mdGDsg>
    <xmx:bNatal1E4O-So9N3UdN8XhsaMQ0RNPRyOOgnENzmKIwjc9rXyUldrg>
    <xmx:bNatatsItI8cZhNdsbQcjLCM2Aesqh1dAFYHcKjJ4v-sF8r6-VgHeQ>
    <xmx:bNatakkxcqcwxluvUkyXQNkRvHQnAddG9UjF-bIJDihQTgCN_ux6aw>
    <xmx:bNataiKhTSk49bJURODFP6d9lI1dcwlXGGfEz7X5BQVPY_Vaoz-Bu4MG>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:15 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	kernel-team@meta.com
Subject: [PATCH v6 09/19] selftests/mm: add folio-order detection self-check
Date: Sat, 19 Sep 2026 01:24:39 +0100
Message-ID: <20260919002451.496763-10-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The khugepaged mTHP tests detect collapse results with the vm_util
folio-order helpers rather than smaps AnonHugePages, which only sees PMD
mappings.  If those helpers are wrong, every case built on them is wrong
the same way, and nothing says so.

Check them directly.  For every anon THP order the kernel supports, fault
memory in with only that order enabled.  Require the helpers to classify
the backing as exactly that order: not the order below it, and base-page
memory as order 0.

Run it in the thp category, ahead of ./khugepaged, so a broken helper is
reported as itself rather than as a collapse failure.  Verified on x86-64
4K (orders 0, 2-9) and arm64 64K (orders 0, 2-13).

The test needs ALIGN(), which hmm-tests.c and migration.c each defined
privately.  Move it to vm_util.h and drop both copies.

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/Makefile           |   1 +
 .../testing/selftests/mm/folio_order_check.c  | 122 ++++++++++++++++++
 tools/testing/selftests/mm/hmm-tests.c        |   1 -
 tools/testing/selftests/mm/migration.c        |   1 -
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +
 tools/testing/selftests/mm/vm_util.h          |   2 +
 6 files changed, 127 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/mm/folio_order_check.c

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7d69baeb93f4..cb32cf5d867e 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -105,6 +105,7 @@ TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
+TEST_GEN_FILES += folio_order_check
 TEST_GEN_FILES += soft-dirty
 
 ifeq ($(ARCH),x86_64)
diff --git a/tools/testing/selftests/mm/folio_order_check.c b/tools/testing/selftests/mm/folio_order_check.c
new file mode 100644
index 000000000000..5eafbcc1b4f3
--- /dev/null
+++ b/tools/testing/selftests/mm/folio_order_check.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Self-check for the vm_util folio-order helpers, is_backed_by_folio() and
+ * is_range_backed_by_order(), which the khugepaged mTHP cases use to detect
+ * collapse results.  For every anon THP order the kernel supports, fault
+ * memory in with only that order enabled and require the helpers to report
+ * exactly that order.
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
+#include <mm/hugepage_settings.h>
+
+static int pagemap_fd;
+static int kpageflags_fd;
+
+static char *alloc_aligned(size_t size)
+{
+	size_t len = size * 2;
+	char *p, *aligned;
+
+	p = mmap(NULL, len, PROT_READ | PROT_WRITE,
+		 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (p == MAP_FAILED)
+		ksft_exit_fail_perror("mmap()");
+
+	aligned = (char *)ALIGN((uintptr_t)p, size);
+	if (aligned != p)
+		munmap(p, aligned - p);
+	if (aligned + size != p + len)
+		munmap(aligned + size, p + len - aligned - size);
+
+	return aligned;
+}
+
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
+	if (!is_range_backed_by_order(p, size, order, pagemap_fd, kpageflags_fd)) {
+		ksft_print_msg("order %d not detected after fault\n", order);
+		ok = false;
+	}
+
+	/* A lower order must be rejected: the folio is larger */
+	if (order && is_range_backed_by_order(p, size, order - 1,
+					      pagemap_fd, kpageflags_fd)) {
+		ksft_print_msg("order %d also reported as order %d\n",
+			       order, order - 1);
+		ok = false;
+	}
+
+	/* A large folio must not pass as order 0 */
+	if (order && is_range_backed_by_order(p, size, 0,
+					      pagemap_fd, kpageflags_fd)) {
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
+		ksft_exit_fail_perror("open(/proc/self/pagemap)");
+	kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
+	if (kpageflags_fd < 0)
+		ksft_exit_skip("open(/proc/kpageflags) requires root\n");
+
+	orders = thp_supported_orders();
+	if (!orders)
+		ksft_exit_skip("No supported THP orders\n");
+
+	ksft_set_plan(__builtin_popcountl(orders) + 1);
+
+	thp_save_settings();
+	thp_read_settings(&settings);
+	/* Base of the settings stack; the bottom entry is never popped */
+	thp_push_settings(&settings);
+
+	check_order(0);
+	for (order = 1; order < NR_ORDERS; order++) {
+		if (!(orders & (1UL << order)))
+			continue;
+		check_order(order);
+	}
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index fa1a651963fd..e5f273ca84c1 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -65,7 +65,6 @@ enum {
 #define HMM_PATH_MAX    64
 #define NTIMES		10
 
-#define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
 /* Just the flags we need, copied from mm.h: */
 
 #ifndef FOLL_WRITE
diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index a35e2b57e05b..d1d0989ed2ca 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -20,7 +20,6 @@
 
 #define TWOMEG		(2<<20)
 #define RUNTIME		(20)
-#define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
 
 HUGETLB_SETUP_DEFAULT_PAGES(1)
 
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 4cc1d1a55ebf..3a111bc9c29e 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -382,6 +382,8 @@ CATEGORY="pfnmap" run_test ./pfnmap
 # COW tests
 CATEGORY="cow" run_test ./cow
 
+CATEGORY="thp" run_test ./folio_order_check
+
 CATEGORY="thp" run_test ./khugepaged
 
 CATEGORY="thp" run_test ./khugepaged -s 2
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 0172003c16dc..ea48e6a7527e 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -12,6 +12,8 @@
 #include <mm/hugepage_settings.h>
 
 #define BIT_ULL(nr)                   (1ULL << (nr))
+#define ALIGN(x, a)                   (((x) + (a) - 1) & ~((a) - 1))
+
 #define PM_SOFT_DIRTY                 BIT_ULL(55)
 #define PM_MMAP_EXCLUSIVE             BIT_ULL(56)
 #define PM_UFFD_WP                    BIT_ULL(57)
-- 
2.54.0

