Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D59947C102;
	Mon, 21 Sep 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987223; cv=none; b=KoYC7bKP3xkf+8I4zVbUzYA4rrKtYQq9OaS60Wke2AeQPNAxYshy6L46eqJDVn6EPKHnm3/wPLeOANOtp3bjZ/NXrzq11MKkCCPzIYsSTguFQe2dwXGiP2D2zuHIZt+ZFpZfHdK1hpMeWKCfLMR2JPfXKi5TOulO93vTRk58gIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987223; c=relaxed/simple;
	bh=EdKZk9/jwDQIH8zFOg73ZY28l1qbx+55/Tqq3ekXyzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tog97e9IowUzGaOaBTAZP+VOTCdahn68ZAfIyP2LJvI4Zra1PfqAtcbFE9eJwJfMJ8dHpSbHZTM9yVeHxvFtbgk5nb+e3KShJz55WhKbAbWLRwTbNL52q+mY+RfmygBnkDyMKJLlin/myRKIIFEaRYyOZ4hFkqYwXzu3YWEHGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=edH+WGXv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="edH+WGXv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38BED2F;
	Mon, 21 Sep 2026 03:40:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B72DD3F86C;
	Mon, 21 Sep 2026 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789987220; bh=EdKZk9/jwDQIH8zFOg73ZY28l1qbx+55/Tqq3ekXyzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=edH+WGXvFOoqTmFzW/qAYeuRkSbYB6GoWYchgnXWGvg+ykyVLn72hrrdSESDJNbtg
	 SqvbwjgLAhzrP/wucnb1SJNssIUgMhCqFI6kvt7xa91iqxEvl6a9P42itW5mSsEcWt
	 KMinCG5BbLF0Jt7L9zI8coH2iDy5CZEbXUvOUYrE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:40:08 +0100
Subject: [PATCH v7 2/3] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-fix_split-v7-2-d25ec991159f@arm.com>
References: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
In-Reply-To: <20260921-fix_split-v7-0-d25ec991159f@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7429; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=EdKZk9/jwDQIH8zFOg73ZY28l1qbx+55/Tqq3ekXyzM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQmJmsEaafXH26QPIpE3mc5C7ESbc2MlpKPoS
 c7L30rdhyKJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEJiQAKCRBt1cPRWsUx
 MzXrC/0TBjJtiyR2c/wJJd55mqoYa7VS2P9VnxgPc6FtQX4KqIXS6rrQ9ffuNCJqGf2TJffEe3x
 6NnvLtDZcdMd4iPg6OUy5TZ59DQSlZdLMtiHfrsDi5TKjgqRzy0lFLXJiFYvFl4+Z9Wt0Vsur5i
 SMEWYViWoEvo/B+mNtThYRUYxReqj08ecc6cdO3pQy5SZ1/4MVVHjyGI5aMg96T1uxuEBHmUWrA
 MXPVICjJp9DVnCYs71frynxaS3TaZ84c/ooFFU3FUT0q+HPksl5msxvs7KdVGRCv7ZH0qjySf3S
 tyQmlgdWZUns2U1OVeRsKE3KiFdSd1xZq8LpeiP3OAboubkfBXXp8+HAHSQQ5Afks8R/1rlFyLr
 jBuRZaOq6PROy6ZPUGKuGyi4o7rsirU50HxLdzGUKQ6WY9xX9GzXwpGTec2HjU4NDkvxbqyFU80
 x4CZdTbOT40GThnn17nyNl+rU6L1/ay+tyJgsX8BtpgAMilEQeLn7BQYrMVwiF9NxPjrQ=
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

Since shmem pages are also file-backed, simply check whether the page
is file-backed.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c | 137 +++++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 53 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 4821a35630363..a7c5caf6925e0 100644
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
@@ -405,48 +378,106 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		ret = true;
 
 out:
-	close(pagemap_fd);
-	close(kpageflags_fd);
 	return ret;
 }
 
-bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
-{
-	uint64_t pmd_pagesize = read_pmd_pagesize();
+enum check_huge_type {
+	CHECK_HUGE_ANON,
+	CHECK_HUGE_FILE,
+};
 
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+static bool check_huge_type(uint64_t categories, uint64_t kpageflags,
+			    enum check_huge_type type)
+{
+	const bool file = categories & PAGE_IS_FILE;
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+	switch (type) {
+	case CHECK_HUGE_ANON:
+		return !file;
+	case CHECK_HUGE_FILE:
+		return file;
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
+	if (kpageflags_fd < 0)
+		ksft_exit_fail_msg("open kpageflags fail\n");
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
+	return __check_huge(addr, len, nr_hpages, hpage_size, CHECK_HUGE_FILE);
 }
 
 int64_t allocate_transhuge(void *ptr, int pagemap_fd)

-- 
2.43.0

