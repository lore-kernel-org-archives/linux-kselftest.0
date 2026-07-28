Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CCB3BB102;
	Tue, 28 Jul 2026 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226754; cv=none; b=PY517slNGyVE7Z2ZDIYBUJWpgHLQAMuFwLg4+7QRsrPl1BBHIezTWqja/NpkR409ndrwaBsQpnOLe6tcK46yGZEFy+6VX0Lp+XDaBvpPQ66nox6osf/QCcOZSKD23phnNrjnoaZhMq+5JgnZUM8upVzdPO+4xv2QgREkq8RLoEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226754; c=relaxed/simple;
	bh=antlL4Mcs7l1DinmTSm0gfMlY6bMNIyHkQyUF7nsHls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JO+rNiNKdLbCCyxp19r2QHeDkWIEOtjZJ9I6FMnO0ApjAgE/mbYQvPe1RfUzsnfNPpZRp5US8sX2ZH8TOASjYoX5Ma5WRwiIYofJUZcWpOKCDeIuSa9JB6aCeKb9CUdcCm/B7Y7cIfUMb4k1YfbbB5cq2K3MmP0wUyw8BCAyZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HB1w/lWM; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HB1w/lWM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785226746; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=lqDFCl7DalCEy9x0Yw1QNkF+tSzwo+I6FMPaEYjO+Uc=;
	b=HB1w/lWMaMupM+gxcfskaAERB67rhnNixSNaKA77gKRokfvexoXkEJQK6NoSYvkCHN9EAOK3iPtHKMB0MVlwMNzwOi6oMymI2r8t2AYBBTrAJxl9frcxDF9wXBwBsHURCMlLtxULZ/USvBwbbO+SrzMwqWgUOMoIsWNFnuGr1j4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X8-ElbU_1785226424;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8-ElbU_1785226424 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Jul 2026 16:13:44 +0800
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
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] selftests: mm: implement the mTHP-sized hugepage check helpers
Date: Tue, 28 Jul 2026 16:13:35 +0800
Message-ID: <8fd04f8c2f11390bf00058f9cd3d98d73544c75f.1785224928.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1785224928.git.baolin.wang@linux.alibaba.com>
References: <cover.1785224928.git.baolin.wang@linux.alibaba.com>
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

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 tools/testing/selftests/mm/vm_util.c | 55 ++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 09e5d5cabe21..a4ffaa0ca6fa 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -15,6 +15,10 @@
 #define SMAP_FILE_PATH "/proc/self/smaps"
 #define STATUS_FILE_PATH "/proc/self/status"
 #define MAX_LINE_LENGTH 500
+#define PAGEMAP_PATH "/proc/self/pagemap"
+#define KPAGEFLAGS_PATH "/proc/kpageflags"
+#define GET_ORDER(nr_pages)    (31 - __builtin_clz(nr_pages))
+#define NR_ORDERS 20
 
 unsigned int __page_size;
 unsigned int __page_shift;
@@ -348,7 +352,7 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
-bool __check_huge(void *addr, char *pattern, int nr_hpages,
+static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
 		  uint64_t hpage_size)
 {
 	char buffer[MAX_LINE_LENGTH];
@@ -366,19 +370,62 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
 	return thp == (nr_hpages * (hpage_size >> 10));
 }
 
+static bool check_large_folios(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
+{
+	int pagesize = getpagesize();
+	int order = GET_ORDER(hpage_size / pagesize);
+	int pagemap_fd, kpageflags_fd;
+	int orders[NR_ORDERS], status;
+	bool ret = false;
+
+	memset(orders, 0, sizeof(int) * NR_ORDERS);
+
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
+	status = gather_folio_orders(addr, size, pagemap_fd,
+			kpageflags_fd, orders, NR_ORDERS);
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
 bool check_huge_anon(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
 {
-	return __check_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+	if (hpage_size == read_pmd_pagesize())
+		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
+
+	return check_large_folios(addr, size, nr_hpages, hpage_size);
 }
 
 bool check_huge_file(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
 {
-	return __check_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+	if (hpage_size == read_pmd_pagesize())
+		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
+
+	return check_large_folios(addr, size, nr_hpages, hpage_size);
 }
 
 bool check_huge_shmem(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
 {
-	return __check_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+	if (hpage_size == read_pmd_pagesize())
+		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
+
+	return check_large_folios(addr, size, nr_hpages, hpage_size);
 }
 
 int64_t allocate_transhuge(void *ptr, int pagemap_fd)
-- 
2.47.3

