Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6D648FF9D;
	Thu,  1 Oct 2026 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889496; cv=none; b=oH61zVYozt3T3GB7/gq7Sjpz6gIxhSer0HZmYEq2+zRCoVvqHfZEx0QyEkwvGh75WeBE5VF93gJ5VbL3JOSYM1sXue4UytSRNHNzSRkgImSDd8wP2uyBjQ7bXGX6v35utd2vUmq3HKFgGk/W57yUnwYoNipKV3VPO8LoaWq1nSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889496; c=relaxed/simple;
	bh=0FkiYTXFXeX4ri5wwdo8r1zDswEVykTKGJ/AokRyxDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzGIsQd+pY5112rmABFKOnBU5hNy8BQnsgVIyPaAxQ7pmh2aFebXMWr+TetgCo5Q8Kj3yG+akiLbXcAdiMD9bf4z6Hbvv452IkDZUz99Pn+A40simCAdL4LmE9ApLPRMUk6DKdSXnDSyYwZclsMXhm4twbDrAj3DVZHpB3mf8X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Auk2Sz0w; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Auk2Sz0w"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA94816F8;
	Thu,  1 Oct 2026 14:18:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32B523F86F;
	Thu,  1 Oct 2026 14:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790889493; bh=0FkiYTXFXeX4ri5wwdo8r1zDswEVykTKGJ/AokRyxDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Auk2Sz0wlnW2YUzEY0seFkGbJtuNi1gVERWfk1nWrvIGwydkd0ze+4yC7No5n9Hrs
	 YcfmL9hJPAycP3USSkPccQsJgnPppfjoZm9ogF5zCfZgS8GluLWQW+1KG795zQxUf/
	 W++hd50w9IDH1vTSsjde/uqUjF+jVWV3s7aVCm18=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Thu, 01 Oct 2026 22:17:52 +0100
Subject: [PATCH v9 2/4] kselftest: mm: replace usage of /proc/self/smaps
 for __check_pmd_huge()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261001-fix_split-v9-2-0f4ba8bbdbdf@arm.com>
References: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
In-Reply-To: <20261001-fix_split-v9-0-0f4ba8bbdbdf@arm.com>
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
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5409; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=0FkiYTXFXeX4ri5wwdo8r1zDswEVykTKGJ/AokRyxDI=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqvs4KSeP0+3vmIoY7ipzOig2DXg9K5T69uM/ce
 ct6vjHjeXmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCar7OCgAKCRBt1cPRWsUx
 M+JSDACCs32nf3pXyJRxfH9fUKZQ/1LzPeB55JxBVFBp76w2DM2vT/dT+1ThPa11jqosHEDplOQ
 MCS73R5MY6W3PS4MlSJgGigd5WeOH2+JP9+Irq8E5lh4jwBicNIb8qMtSfvsxMKRIM/KVZfXDIW
 hCnpPtMfwt1CFySYkVsXZ6SNvun9hbpBJuEtreAAK+TQVMKUZveZMXtSyTC6542Rm8lls5EidLx
 F03Zh+sRXnnk8rJ+xCZh594Zm7WrXgzZnrRFKBpi5JARwnQQQxJvsSU1kk/eLh578xF0aWuNCp6
 4fGtlWE9YPBFEHBM+hNk1bZH4iBimqCKy7+PCxpNBKp8U91/QY1yE3noAkn2x+AwDTml08z4wcs
 ok1MWeX5zlnM+s4+fJh/xkLtBcLdEiCie/rpPCEdRW91dgmbQ5/gfE2Sf+jr42oNhz0+9BtYOwh
 ou2LXpKXyeW283K8m6aQ1FZU4rNLRossrMztqx2+XTQGz22DdrOwHaGAf0Kiopoda4APM=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
made by memalign().

The underlying VMA may start at a different address from the aligned
address returned by memalign(). Furthermore, a subsequent
madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
already set.

This causes split_huge_page_test to fail because the check_pmd_huge()
helpers incorrectly require the address returned by memalign() to
match the VMA start address reported in /proc/self/smaps.

Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
/proc/kpageflags to detect huge-page mappings checking PAGE_IS_HUGE
and PAGE_IS_FILE according to type of huge page.

Since shmem pages are also file-backed, simply check whether the page
is file-backed.

Fixes: 642bc52aed9c ("selftests: vm: bring common functions to a new file")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/vm_util.c | 78 ++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index a0ab78ceedb1..a3c3a2706c22 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -351,24 +351,6 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
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
 static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 		uint64_t hpage_size)
 {
@@ -410,20 +392,51 @@ static bool check_large_folios(void *addr, size_t len, int nr_hpages,
 	return ret;
 }
 
-bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+enum check_huge_type {
+	CHECK_HUGE_ANON,
+	CHECK_HUGE_FILE,
+};
+
+static bool check_huge_type(uint64_t categories, enum check_huge_type type)
 {
-	uint64_t pmd_pagesize = read_pmd_pagesize();
+	const bool file = categories & PAGE_IS_FILE;
 
-	if (!pmd_pagesize)
-		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+	switch (type) {
+	case CHECK_HUGE_ANON:
+		return !file;
+	case CHECK_HUGE_FILE:
+		return file;
+	}
 
-	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+	return false;
+}
 
-	return check_large_folios(addr, len, nr_hpages, hpage_size);
+static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
+		  uint64_t hpage_size, enum check_huge_type type)
+{
+	int pagemap_fd;
+	int nr_pmd_mappings = 0;
+	uint64_t categories;
+	char *start = addr;
+	char *end = start + len;
+
+	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
+	if (pagemap_fd < 0)
+		ksft_exit_fail_perror("open pagemap");
+
+	for (; start < end; start += hpage_size) {
+		categories = pagemap_scan_get_categories(pagemap_fd, start);
+		if (!(categories & PAGE_IS_HUGE))
+			continue;
+		if (check_huge_type(categories, type))
+			nr_pmd_mappings++;
+	}
+	close(pagemap_fd);
+
+	return nr_hpages == nr_pmd_mappings;
 }
 
-bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
 	uint64_t pmd_pagesize = read_pmd_pagesize();
 
@@ -431,12 +444,13 @@ bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
 
 	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+		return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
+					CHECK_HUGE_ANON);
 
 	return check_large_folios(addr, len, nr_hpages, hpage_size);
 }
 
-bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
 	uint64_t pmd_pagesize = read_pmd_pagesize();
 
@@ -444,11 +458,17 @@ bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size
 		ksft_exit_fail_msg("reading PMD pagesize failed\n");
 
 	if (hpage_size == pmd_pagesize)
-		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+		return __check_pmd_huge(addr, len, nr_hpages, hpage_size,
+					CHECK_HUGE_FILE);
 
 	return check_large_folios(addr, len, nr_hpages, hpage_size);
 }
 
+bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
+{
+	return check_huge_file(addr, len, nr_hpages, hpage_size);
+}
+
 int64_t allocate_transhuge(void *ptr, int pagemap_fd)
 {
 	uint64_t ent[2];

-- 
2.43.0

