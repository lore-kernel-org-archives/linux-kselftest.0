Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204A841A914;
	Wed, 26 Aug 2026 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747113; cv=none; b=qso4K9p1g4Y3da8SOuLM56m6UmH8TwlMoTTNzXQOKTf53Ahq/CJs3mTaXmHw/CSIkkKKoF9J16lrNqeytR/a3Jfcap8+6qG4n6r5iBuTtsCKJ9fSn1ttP5YyQEfzIt0QSdaPUOFMpN7Mz71z/f3tZOq6qrHKruubDpRdnVffwbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747113; c=relaxed/simple;
	bh=j7yzn2+ip7gaDbogI2HF7uGqF+si9ui1mIt3+JN8ZOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHWzPdqBZm47tgd5xXgpfvuGwML1y94wJPDy8dgRF+frSWb4VwNXKV8veB89fGvNAHsAiPRSQYHAOrI0Y3br7zgi15QulyOFLu6W7/46XMqpwyh0lhr+M9oBJlIL4ikN7bzN5ftvsY87ko0FvqIgFWioqI/ekcOW7RAoP6vSjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gLcxi1GC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gLcxi1GC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96DE41713;
	Wed, 26 Aug 2026 05:25:06 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73DA93F7D8;
	Wed, 26 Aug 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787747110; bh=j7yzn2+ip7gaDbogI2HF7uGqF+si9ui1mIt3+JN8ZOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gLcxi1GCoNWa/KSQheBTpWMJnIXEejun7+7KuWg4y2JktPJW5wDFYyP2OSk5yzsI2
	 geDvUhCW+qtcSlo21nDzy6QssLvr+yVHB0zozWBIeYtrir+W1zVTZUrXurz/1FN/fv
	 wS3PtMHvgpU3Y6BCLoc5N1mUxq9Z6AWw9/SZbjnY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 26 Aug 2026 13:24:40 +0100
Subject: [PATCH v2 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-fix_split-v2-2-71153c7f579a@arm.com>
References: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
In-Reply-To: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7240; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=j7yzn2+ip7gaDbogI2HF7uGqF+si9ui1mIt3+JN8ZOo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqjtscnI2PSSpeC1NV+a49cQWW7aq4gHufdTP8r
 IT22MsqHWeJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCao7bHAAKCRBt1cPRWsUx
 M3fwC/4wN69ja0RsRNlDZHSVZ1KLLaJerixhWSAn2QGJky3iQYr7Nmr/KfCO9EO2p+5BMPHtsNM
 5bFtLeY4VLCTTva5wuqXN55dxhzXvUptRLTdqRuYArp6hYS+1YfV5+Fk1PFWeGo0swETkD+NobW
 HiwGc7Xl6//VzPS37TkZmGcNs70QSGTz0RdyoNO3ieDMWSaBKY4IA4u7LqmHiIcCjtuzhceuL0V
 beVaDwYrJ+pHKOruVf9lAw9xrp0OBFeHSsZsPAeICLDPb3YF4ymk/Ymbn8sXCCOahTu+lO+yHIq
 NGzRKiKKdcn7lEOKIRxu0MXwysRSOIqrvKHpLQBFRN6XeduwqgfN5Q2004vVy2taCvqyLWlJvdh
 Q+pcnpcC0DsN18ah425OdQgNrLGQZuicKuHtbkN/vyA9S3Ek5IA4DR8kC3A1K86GNP5tYoqSKqR
 peOwxfk74qa27301wE0rSYMMtNFqErfapa3P6IrRbDE3ipRlB4wNA4KsBm83Vd0FwuZUg=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
made by memalign().

The underlying VMA may start at a different address from the aligned
address returned by memalign(). Furthermore, a subsequent
madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
already set.

This causes split_huge_page_test to fail because the check_huge_xxx()
helpers incorrectly require the address returned by memalign() to
match the VMA start address reported in /proc/self/smaps.

Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
/proc/self/smaps to detect huge pages.

Reported-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c | 130 ++++++++++++++++++++---------------
 tools/testing/selftests/mm/vm_util.h |   1 +
 2 files changed, 77 insertions(+), 54 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 4821a3563036..1d0959b3b9e8 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -351,31 +351,13 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
-static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
-		  uint64_t hpage_size)
-{
-	char buffer[MAX_LINE_LENGTH];
-	uint64_t thp = -1;
-	char *entry;
-
-	entry = __get_smap_entry(addr, pattern, buffer, sizeof(buffer));
-	if (!entry)
-		goto err_out;
-
-	if (sscanf(entry, "%9" SCNu64 " kB", &thp) != 1)
-		ksft_exit_fail_msg("Reading smap error\n");
-
-err_out:
-	return thp == (nr_hpages * (hpage_size >> 10));
-}
-
-static bool check_large_folios(void *addr, size_t len, int nr_hpages,
-		uint64_t hpage_size)
+static bool check_large_folios(int pagemap_fd, int kpageflags_fd,
+			       void *addr, size_t len, int nr_hpages,
+			       uint64_t hpage_size)
 {
 	int order = 0, pagesize = getpagesize();
 	unsigned int nr_pages = hpage_size / pagesize;
 	int orders[MAX_NR_ORDERS], status;
-	int pagemap_fd, kpageflags_fd;
 	bool ret = false;
 
 	if (!nr_pages)
@@ -386,15 +368,6 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		ksft_exit_fail_msg("invalid order\n");
 
 	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
-	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
-	if (pagemap_fd == -1)
-		ksft_exit_fail_msg("read pagemap fail\n");
-
-	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
-	if (kpageflags_fd == -1) {
-		close(pagemap_fd);
-		ksft_exit_fail_msg("read kpageflags fail\n");
-	}
 
 	status = gather_folio_orders(addr, len, pagemap_fd,
 			kpageflags_fd, orders, MAX_NR_ORDERS);
@@ -405,48 +378,97 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		ret = true;
 
 out:
-	close(pagemap_fd);
-	close(kpageflags_fd);
 	return ret;
 }
 
-bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+enum check_huge_type {
+	CHECK_HUGE_ANON,
+	CHECK_HUGE_FILE,
+	CHECK_HUGE_SHMEM,
+};
+
+static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
+			     uint64_t hpage_size, enum check_huge_type type)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
+	int pagemap_fd, kpageflags_fd;
+	uint64_t pmd_pagesize, granule;
+	uint64_t categories, kpf;
+	unsigned long pfn;
+	bool check_large, huge_mapped;
+	char *start = addr;
+	char *end = start + len;
 
+	pmd_pagesize = read_pmd_pagesize();
 	if (!pmd_pagesize)
 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+	if (nr_hpages > 0) {
+		check_large = true;
+		granule = hpage_size;
+	} else {
+		check_large = false;
+		granule = psize();
+	}
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
-}
+	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_msg("open pagemap fail\n");
 
-bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
-{
-	uint64_t pmd_pagesize = read_pmd_pagesize();
+	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+	if (kpageflags_fd < 0) {
+		close(pagemap_fd);
+		ksft_exit_fail_msg("open kpageflags fail\n");
+	}
 
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+	if (check_large && !check_large_folios(pagemap_fd, kpageflags_fd,
+					       addr, len, nr_hpages, hpage_size))
+		goto out;
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+	for (; start < end; start += granule) {
+		categories = pagemap_scan_get_categories(pagemap_fd, start);
+		pfn = pagemap_get_pfn(pagemap_fd, start);
+		if (pfn == -1UL) {
+			if (check_large)
+				goto out;
+			else
+				continue;
+		}
+		if (pageflags_get(pfn, kpageflags_fd, &kpf))
+			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
+		huge_mapped = categories & PAGE_IS_HUGE;
+		if (check_large != huge_mapped) {
+			if (!check_large || granule == pmd_pagesize)
+				goto out;
+		}
+		if (kpf & KPF_COMPOUND_TAIL)
+			continue;
+		if (!!(categories & PAGE_IS_FILE) != (type != CHECK_HUGE_ANON))
+			goto out;
+		if (type == CHECK_HUGE_ANON)
+			continue;
+		if (!!(kpf & KPF_SWAPBACKED) != (type != CHECK_HUGE_FILE))
+			goto out;
+	}
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+out:
+	close(pagemap_fd);
+	close(kpageflags_fd);
+	return start >= end;
 }
 
-bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
-
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+	return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_ANON);
+}
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+{
+	return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
+}
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+{
+	return __check_pmd_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_SHMEM);
 }
 
 int64_t allocate_transhuge(void *ptr, int pagemap_fd)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index 9a49af88702e..f19bd17817e5 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -18,6 +18,7 @@
 #define PM_SWAP                       BIT_ULL(62)
 #define PM_PRESENT                    BIT_ULL(63)
 
+#define KPF_SWAPBACKED                BIT_ULL(14)
 #define KPF_COMPOUND_HEAD             BIT_ULL(15)
 #define KPF_COMPOUND_TAIL             BIT_ULL(16)
 #define KPF_HWPOISON                  BIT_ULL(19)

-- 
2.43.0

