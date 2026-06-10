Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F693F8ED9;
	Wed, 10 Jun 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087391; cv=none; b=rffN7LS+HP3ENmkK95fTvjiSTNWwkzI/3/eNo0jgLs4wQ1mz/2Rf2KigFIOMTJ95LmXkVGO8aYnrEpG1QLa9xbdaGOI4Fi/NDrhC31Kb7rXV6vvWU6WLvI0tT04PLc7/OoMcr6vD0BGqH3+Yl4bj1Q+rT96GJ4g+31H2c+Acb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087391; c=relaxed/simple;
	bh=c8WQ7LEz5A/sQu8HpNo5YaboATo2t5p+f8IX3oQHR1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQo3E3qlLu4Fnwg9nTE3dl1pMDDFuuBaJUTj0rSrffXc3mlyRKWdD8BRgTr17wmLg3yJnmSOMHoI/59/UZavTLAUDHrUqVD+2XIu3b9rbV6Gbw2YZBvZw4cwBkzQgq5m8v6vFyu9S6JIgxDra7xa1WhMLZHRLRtyieylSY9yIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=TDMe8O6G; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TDMe8O6G"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087379; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=bh4A8aWubwzVF623+x5XXbydK4sCvs2okQ9F54Wtcac=;
	b=TDMe8O6G1oe6F8WV1Xaed0cxTwbxdHF/lrD8SBejZXJgmQ4Gn7JsGziPJuLpbEaxR+tNBGfbewL0YGxa29nNt+sSVTlpFuRoAPHEPYAKN40jiPlXxOEHGD93c0NbZ6GGGzqkcjMuT+ryxjSGtFTFaoJUrUJJkBbTOfRCpm3nHUU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R651e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aI8Xd_1781087377;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aI8Xd_1781087377 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:37 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com
Cc: willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 10/11] selftests: mm: implement the mTHP-sized hugepage check helpers
Date: Wed, 10 Jun 2026 18:29:18 +0800
Message-ID: <6f79e2194d5d4c5179fa954ea4968e8a76e931c2.1781083630.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
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
index b08bf655ab23..6d464d49f164 100644
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
@@ -352,7 +356,7 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
 	return entry;
 }
 
-bool __check_huge(void *addr, char *pattern, int nr_hpages,
+static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
 		  uint64_t hpage_size)
 {
 	char buffer[MAX_LINE_LENGTH];
@@ -370,19 +374,62 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
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

