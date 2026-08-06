Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C55346E7A;
	Thu,  6 Aug 2026 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785987286; cv=none; b=L1Q9EN+p4KI6UpYU0DUvo2qBmCaPos1Qae7g9dRD/wcBH1hsd5rd8fIo3XvAYN2k8soiHRGA7uIaEO1w5+DA9xELAOf1ANnUHnXSMKmBX4w5Vkh+aShldSftyC3H+rIgDefCGftnSsX883058RYDHO/Si8BgJz409D2T0zYTM/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785987286; c=relaxed/simple;
	bh=6m3LqiTH3to5XVoAe+K9dfrUghMuLZ2vGY9XnUYG5Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnjEXkyunEkVB2ZlbIq12hlxnkN8RWvBO8g74bUStbjKrPwBUBNqEyTp+nKO3Cw+p7x1/SqfFnFUbkoxJMBSTxeB6qNsOTijedykTDjzPe3drOdYzsuxvYENYnblUX0QPWN0s1ABAcZaTL437qc56igulyARXCWh/5aoKjD5vp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Sfocj12s; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Sfocj12s"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785987274; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6LrUd86Cka2Fg/6CzJjG2iZT3DCfqjLks/rpZbSOQ0w=;
	b=Sfocj12sLHtMLIga/CbjY5rX6WinINW6qKUN965yYNOOlfylFqrY0wCVkAn2gly1osdpVk/NghknuYyZvHdTAVSPEvrLmUXKwsq4qyElq+pZzTpGzqjLDVmtDYP3FY7P3vAu7nUge0TOdsqGr0dVbIzcvO9CGt/uQmE8JSk8bRs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X8SfgDs_1785987273;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SfgDs_1785987273 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 11:34:33 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] selftests: mm: implement the mTHP-sized hugepage check helpers
Date: Thu,  6 Aug 2026 11:34:14 +0800
Message-ID: <56b16691f605426b33b5cf47319233de6127a6b3.1785985999.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1785985999.git.baolin.wang@linux.alibaba.com>
References: <cover.1785985999.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement mTHP-sized hugepage checking helpers using gather_folio_orders().
Also rename the existing PMD-sized huge page check function to
__check_pmd_huge() for clarity.

Reviewed-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
Tested-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 tools/testing/selftests/mm/vm_util.c | 76 ++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 5a427f494cd8..13b5cff7dfe3 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -15,6 +15,9 @@
 #define SMAP_FILE_PATH "/proc/self/smaps"
 #define STATUS_FILE_PATH "/proc/self/status"
 #define MAX_LINE_LENGTH 500
+#define PAGEMAP_PATH "/proc/self/pagemap"
+#define KPAGEFLAGS_PATH "/proc/kpageflags"
+#define MAX_NR_ORDERS 20
 
 unsigned int __page_size;
 unsigned int __page_shift;
@@ -348,7 +351,7 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
-bool __check_huge(void *addr, char *pattern, int nr_hpages,
+static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
 		  uint64_t hpage_size)
 {
 	char buffer[MAX_LINE_LENGTH];
@@ -366,19 +369,84 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
 	return thp == (nr_hpages * (hpage_size >> 10));
 }
 
+static bool check_large_folios(void *addr, size_t len, int nr_hpages,
+		uint64_t hpage_size)
+{
+	int order = 0, pagesize = getpagesize();
+	unsigned int nr_pages = hpage_size / pagesize;
+	int orders[MAX_NR_ORDERS], status;
+	int pagemap_fd, kpageflags_fd;
+	bool ret = false;
+
+	if (!nr_pages)
+		ksft_exit_fail_msg("invalid hugepage size\n");
+
+	order = 31 - __builtin_clz(nr_pages);
+	if (!order || order >= MAX_NR_ORDERS)
+		ksft_exit_fail_msg("invalid order\n");
+
+	memset(orders, 0, sizeof(int) * MAX_NR_ORDERS);
+	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
+	if (pagemap_fd == -1)
+		ksft_exit_fail_msg("read pagemap fail\n");
+
+	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
+	if (kpageflags_fd == -1) {
+		close(pagemap_fd);
+		ksft_exit_fail_msg("read kpageflags fail\n");
+	}
+
+	status = gather_folio_orders(addr, len, pagemap_fd,
+			kpageflags_fd, orders, MAX_NR_ORDERS);
+	if (status)
+		goto out;
+
+	if (orders[order] == nr_hpages)
+		ret = true;
+
+out:
+	close(pagemap_fd);
+	close(kpageflags_fd);
+	return ret;
+}
+
 bool check_huge_anon(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	return __check_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+	uint64_t pmd_pagesize = read_pmd_pagesize();
+
+	if (!pmd_pagesize)
+		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+
+	if (hpage_size == pmd_pagesize)
+		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+
+	return check_large_folios(addr, len, nr_hpages, hpage_size);
 }
 
 bool check_huge_file(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	return __check_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+	uint64_t pmd_pagesize = read_pmd_pagesize();
+
+	if (!pmd_pagesize)
+		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+
+	if (hpage_size == pmd_pagesize)
+		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+
+	return check_large_folios(addr, len, nr_hpages, hpage_size);
 }
 
 bool check_huge_shmem(void *addr, size_t len, int nr_hpages, uint64_t hpage_size)
 {
-	return __check_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+	uint64_t pmd_pagesize = read_pmd_pagesize();
+
+	if (!pmd_pagesize)
+		ksft_exit_fail_msg("reading PMD pagesize failed\n");
+
+	if (hpage_size == pmd_pagesize)
+		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+
+	return check_large_folios(addr, len, nr_hpages, hpage_size);
 }
 
 int64_t allocate_transhuge(void *ptr, int pagemap_fd)
-- 
2.47.3

