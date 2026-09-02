Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154113BB115;
	Wed,  2 Sep 2026 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351000; cv=none; b=GEEttw8xOk57rnkZJtzznxKcAu06hNjFPfkjvPW1p/ARQWMmYuKETuKk4+62z06A7jwOYUodO85Urpv/t1a6YaxPJesInhCdev9WHN1vqG/6iukim1bGQdGlclGbacSy12DWUbJiLxwNtV+Acv3Mcv4JcY/IZtC2Ipc0mHQeiTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351000; c=relaxed/simple;
	bh=SjfNrQGkpA3X9nEyXuOHe2XZDuXDkedMucJlksznh2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oI4qRayGCLmpR8etBUjTW3w0e6ER9VlRtjVvq4w57dsU6WNU29vPf2WtebkrUqUwJHCROhhtngBKDgRkWoEURWNorlHupX4c7lp0P8N4mvWWqdKj7ehx2f0R+vCLLI/vCTHvFW+pwxuPD8yv6T6L3nSc8e68tBE+VCkzHeSEEnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cEIY3ZEQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cEIY3ZEQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC001684;
	Wed,  2 Sep 2026 05:09:49 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EBB93F8C6;
	Wed,  2 Sep 2026 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350993; bh=SjfNrQGkpA3X9nEyXuOHe2XZDuXDkedMucJlksznh2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cEIY3ZEQzPndMqZGE68WnJeWiFO21+8K0n+WqFQ73fBq3A6q/mhRdYUDCPlZ5vx3u
	 sahoLhvj79mb8YbKBGmiLOsQdS3R+775Og3Cw2oaD2ZSY7XNMMHrFJjAudImdwoZ0L
	 cRUuuDr2VsT2MPNqwrrQWn2o1AWjsTyBVCZh4qk8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 13:09:36 +0100
Subject: [PATCH v4 2/3] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260902-fix_split-v4-2-85f03905f7b1@arm.com>
References: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
In-Reply-To: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8322; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=SjfNrQGkpA3X9nEyXuOHe2XZDuXDkedMucJlksznh2E=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmBIGChN4Z/69/a8p/NDwEvJkPUxXNn52hUppN
 56OwlIXil2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgSBgAKCRBt1cPRWsUx
 MwckDACsk24Kt5Y9WNpyRadANFyOgMdwdOg1bJ2L7UYNeHQBnB98PQvTfy6CyJi2Vfbt5/ekH6U
 rxHRkn1wWDRj7MVRHYY8nIuDbJXtDw4rFRaeRlsx4YB6NnrQ6ldbLtD8/Zp3ryBAATb8S3t8t3O
 DBOKxQZfyVhjFNC9Dvulm38uonad/iNkoj9exikuxDbTYj3aMwA02oyxntPBsR4pfcM8f2Yl/sY
 arTg5AeamU2PgV4ZwBKny79p0Cx4w8EXKrrgUmn9DeVI2v+H0xrQ8s2i3kOvrpXM9E/oGZZiBSV
 pDC2QtuVUPgwIeH4A1eia+kH56Cvj3f6he2wwfgvk0v44SS23uVvS0dzL7r3YmRzHLa3Z1NwmkZ
 UHo1z/VSKAhv4iYVmxpigtH/gFcqw6cJ9NbGuh9AGLkW35ryQ74AeBz/d0veKddFM+bW9zwwRBH
 kyYBqLyghJG6+jiPf9wCTyA2P+Rr2ShrqqZbmMkJWAmdp4/Z6Zew3R+MnJFR/gn1jaIF0=
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

Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
/proc/kpageflags to detect huge-page mappings and large folios:

  1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of
     using check_large_folios(), since only the mapping type matters.
     This identifies PMD-mapped huge pages.
  2. Otherwise, use check_large_folios() to detect large folios. This
     covers mTHP cases.
  3. Check the folio flags according to the type of huge page.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c | 145 ++++++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |   1 +
 2 files changed, 92 insertions(+), 54 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 4821a3563036..dc62ce84e143 100644
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
@@ -405,48 +378,112 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		ret = true;
 
 out:
-	close(pagemap_fd);
-	close(kpageflags_fd);
 	return ret;
 }
 
-bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
-{
-	uint64_t pmd_pagesize = read_pmd_pagesize();
-
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+enum check_huge_type {
+	CHECK_HUGE_ANON,
+	CHECK_HUGE_FILE,
+	CHECK_HUGE_SHMEM,
+};
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
+			    enum check_huge_type type)
+{
+	const bool file = categories & PAGE_IS_FILE;
+	const bool swapbacked = kpageflags & KPF_SWAPBACKED;
+
+	switch (type) {
+	case CHECK_HUGE_ANON:
+		return !file;
+	case CHECK_HUGE_FILE:
+		return file && !swapbacked;
+	case CHECK_HUGE_SHMEM:
+		return file & swapbacked;
+	}
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+	return false;
 }
 
-bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+static bool __check_huge(void *addr, size_t len, int nr_hpages,
+			 uint64_t hpage_size, enum check_huge_type type)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
+	bool ret = false;
+	int pagemap_fd, kpageflags_fd;
+	int nr_pmd_mappings = 0;
+	uint64_t pmd_pagesize, scan_mapping_size;
+	uint64_t categories, kpf;
+	unsigned long pfn;
+	bool check_pmd_mapping, allow_nonpresent;
+	char *start = addr;
+	char *end = start + len;
 
+	pmd_pagesize = read_pmd_pagesize();
 	if (!pmd_pagesize)
 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+	check_pmd_mapping = (hpage_size == pmd_pagesize);
+	scan_mapping_size = (nr_hpages > 0) ? hpage_size : psize();
+	/* Some mTHP tests check a partially populated PMD-sized range. */
+	allow_nonpresent = (uint64_t)nr_hpages * hpage_size < len;
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_msg("open pagemap fail\n");
+
+	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+	if (kpageflags_fd < 0) {
+		close(pagemap_fd);
+		ksft_exit_fail_msg("open kpageflags fail\n");
+	}
+
+	if (!check_pmd_mapping &&
+	    !check_large_folios(pagemap_fd, kpageflags_fd,
+				addr, len, nr_hpages, hpage_size))
+		goto out;
+
+	for (; start < end; start += scan_mapping_size) {
+		categories = pagemap_scan_get_categories(pagemap_fd, start);
+		pfn = pagemap_get_pfn(pagemap_fd, start);
+		if (pfn == -1UL) {
+			if (!allow_nonpresent)
+				goto out;
+			else
+				continue;
+		}
+		if (pageflags_get(pfn, kpageflags_fd, &kpf))
+			ksft_exit_fail_msg("read kpageflags: %s\n", strerror(errno));
+		if (check_pmd_mapping && (categories & PAGE_IS_HUGE))
+			nr_pmd_mappings++;
+		if (kpf & KPF_COMPOUND_TAIL)
+			continue;
+		if (!check_huge_type(categories, kpf, type))
+			goto out;
+	}
+
+	if (check_pmd_mapping && (nr_pmd_mappings != nr_hpages))
+		goto out;
+	ret = true;
+
+out:
+	close(pagemap_fd);
+	close(kpageflags_fd);
+	return ret;
 }
 
-bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
-
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+	return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_ANON);
+}
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+{
+	return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
+}
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+{
+	return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_SHMEM);
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

