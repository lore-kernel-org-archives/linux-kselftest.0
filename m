Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D143F7878;
	Wed, 10 Jun 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087386; cv=none; b=SU57mo3Exf0nFjGbijKEJO8ZzOy1jnCvXD4Ud69Mh7rINpmm+ytXy+fgroyHY0KdJgiU2OShLCixkkIA+OKt1/xOATF+XFvE8ZcGRX0/2wTOqb6bbeMYengrD32J/HraXtoa+KhxqMr5Piic9G0wBNf7ch5cjG11/m7UD1BoM78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087386; c=relaxed/simple;
	bh=wHobtzCR1hOAstkHCejifG+Mt/lK6w99MKs1TZrg2bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwU6PUru177AXIcHdHGxg1Pxxhzd2cT26VNLfLAmEfqRC0MIiyfiVaglX73tYfvW6Ynzcv/OIaWWtQtH6n34EO/GqOUbVMd/3ykNTNFJJmbDdfDgSuzai3OpKIsmIjSq4wh3ruh22kqnTcJ8En26OgIo9XATNb17Y62MoVPqp/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=D29d5QTk; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="D29d5QTk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087377; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=CJahy7zB3OklBuIOghVRfBNSCYpp64IAvawu3272VZE=;
	b=D29d5QTkxb/C2yMCfF/Lbh7dMlS7VhvdNp2Xuv7PPCKnKnSzvVDWNeH2Y2Q/oJWDz/3eGM5W9E1JBo9apytKPLpSx7OCMnP5mbY9DHAguqos+lcODcb/x/FJAwPz1n/Oo+sJE0BA3Xd4vwFzQuHPuLtf1Qi53oGrwSxfzeScfZA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aHmig_1781087375;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aHmig_1781087375 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:35 +0800
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
Subject: [RFC PATCH v2 07/11] mm: khugepaged: skip large folios that don't need to be collapsed
Date: Wed, 10 Jun 2026 18:29:15 +0800
Message-ID: <9e05e5ca589e1156f75078951efe874118f88587.1781083630.git.baolin.wang@linux.alibaba.com>
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

If a VMA has already created a mapping of large folios after a successful
mTHP collapse, we can skip those folios that exceed the 'highest_enabled_order'
when scanning the VMA range again, as they can no longer be collapsed further.
This helps prevent wasting CPU cycles.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a87918b7e18c..a9664ac26f11 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2724,12 +2724,12 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
 	struct address_space *mapping = file->f_mapping;
 	XA_STATE(xas, &mapping->i_pages, start);
+	unsigned int highest_enabled_order = 0;
 	enum scan_result result = SCAN_SUCCEED;
 	unsigned long enabled_orders, nr_pages;
 	struct folio *folio = NULL;
 	int node = NUMA_NO_NODE;
 	int present, swap;
-	pgoff_t pgoff;
 
 	present = 0;
 	swap = 0;
@@ -2738,6 +2738,9 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	nodes_clear(cc->alloc_nmask);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
+	if (enabled_orders > 0)
+		highest_enabled_order = highest_order(enabled_orders);
+
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
 	 * scan all pages to populate the bitmap for mTHP collapse.
@@ -2814,10 +2817,17 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		/*
 		 * If there are folios present, keep track of it in the bitmap
 		 * for file/shmem mTHP collapse.
+		 *
+		 * Skip those folios whose order has already exceeded the
+		 * 'highest_enabled_order', meaning they cannot be collapsed
+		 * into larger order folios.
 		 */
-		pgoff = max_t(pgoff_t, start, folio->index) - start;
-		nr_pages = min_t(int, HPAGE_PMD_NR - pgoff, nr_pages);
-		bitmap_set(cc->mthp_present_ptes, pgoff, nr_pages);
+		if (folio_order(folio) < highest_enabled_order) {
+			pgoff_t pgoff = max_t(pgoff_t, start, folio->index) - start;
+
+			nr_pages = min_t(int, HPAGE_PMD_NR - pgoff, nr_pages);
+			bitmap_set(cc->mthp_present_ptes, pgoff, nr_pages);
+		}
 
 		folio_put(folio);
 
@@ -2843,6 +2853,11 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 		goto out;
 	}
 
+	if (bitmap_empty(cc->mthp_present_ptes, MAX_PTRS_PER_PTE)) {
+		result = SCAN_FAIL;
+		goto out;
+	}
+
 	result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);
 	if (result == SCAN_SUCCEED && !cc->is_khugepaged) {
 		/* If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp(). */
-- 
2.47.3

