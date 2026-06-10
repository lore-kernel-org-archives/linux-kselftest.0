Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECD3C109B;
	Wed, 10 Jun 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087384; cv=none; b=YtB8gC7tSqZmcRpV08BnTqj3igC7vOmXGr9NdjDweI6S7AVy7K/oOtVUywmVFrKSCyI5IiyYmMGn3BsKz3jWeF/a3ia371ZF2m4AEdo9DFcVUT4M6tVdrALcboiDNK3T8Sw7NABEpPaGa6ZpWwrbQLAJsd6hkWAXEQ6sDPlG6Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087384; c=relaxed/simple;
	bh=ZFU8zFpoaJ2EqlmsbSVqqhiGQA7AOddp0ISzQ/Qfias=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nI+K/IKTvtv6Ajmi6WppRuXNqABVl9Zp+H1M6C1yzFi5/LZL2xa2CmZFwzjS/4OBlsZWU8IAab4kvZg1y8613O2n6VyWrNsqULBQL9cJquhC7AHrDE6S5om60j3eaBT2VKIypJxRL6t6/7/hLHpkbCelpGWp1+GCy19g1aVOiE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=BZyYS8LB; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BZyYS8LB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781087373; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qEB/1EhxVw7xHTTvXrEFTFQel1qTuMuF1xr/NGxBIHM=;
	b=BZyYS8LBiPtLXe6DqtT9qNSmTrPy39HAJWRPzAYHP+ATOzdMnOV5UmQvLxZptJmrL/WxmX8wcEMfSuhYPWQ9KuGtEO2TwZ0Edv8vIeSK6GHTQovvaM+vKVrDku5LEagM0GsioIeL/aNXjJzJlO1/Qw54Dr5E0lm0YX5aC1Xajyo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X4aI8Vv_1781087371;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4aI8Vv_1781087371 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 18:29:31 +0800
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
Subject: [RFC PATCH v2 02/11] mm: khugepaged: generalize collapse_file() for shmem mTHP support
Date: Wed, 10 Jun 2026 18:29:10 +0800
Message-ID: <1274846e121e74f8db53950bec64f8f1938f2ec9.1781083630.git.baolin.wang@linux.alibaba.com>
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

Generalize the order of the collapse_file() function to support future
shmem mTHP collapse.

No functional changes in this patch.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/khugepaged.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 631459172e19..4adc8c6de062 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2214,6 +2214,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
  * @file: file that collapse on
  * @start: collapse start address
  * @cc: collapse context and scratchpad
+ * @order: folio order being collapsed to
  *
  * Basic scheme is simple, details are more complex:
  *  - allocate and lock a new huge page;
@@ -2232,15 +2233,17 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
  *    + unlock and free huge page;
  */
 static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
-		struct file *file, pgoff_t start, struct collapse_control *cc)
+		struct file *file, pgoff_t start, struct collapse_control *cc,
+		int order)
 {
-	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
+	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
 	struct address_space *mapping = file->f_mapping;
+	const unsigned long nr_pages = 1UL << order;
 	struct page *dst;
 	struct folio *folio, *tmp, *new_folio;
-	pgoff_t index = 0, end = start + HPAGE_PMD_NR;
+	pgoff_t index = 0, end = start + nr_pages;
 	LIST_HEAD(pagelist);
-	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
+	XA_STATE_ORDER(xas, &mapping->i_pages, start, order);
 	enum scan_result result = SCAN_SUCCEED;
 	int nr_none = 0;
 	bool is_shmem = shmem_file(file);
@@ -2252,9 +2255,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	 * mapping, the shmem check can be removed.
 	 */
 	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
-	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
+	VM_WARN_ON_ONCE(start & (nr_pages - 1));
 
-	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
+	result = alloc_charge_folio(&new_folio, mm, cc, order);
 	if (result != SCAN_SUCCEED)
 		goto out;
 
@@ -2591,12 +2594,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	}
 
 	if (is_shmem) {
-		lruvec_stat_mod_folio(new_folio, NR_SHMEM, HPAGE_PMD_NR);
+		lruvec_stat_mod_folio(new_folio, NR_SHMEM, nr_pages);
 		lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
 	} else {
 		lruvec_stat_mod_folio(new_folio, NR_FILE_THPS, HPAGE_PMD_NR);
 	}
-	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, HPAGE_PMD_NR);
+	lruvec_stat_mod_folio(new_folio, NR_FILE_PAGES, nr_pages);
 
 	/*
 	 * Mark new_folio as uptodate before inserting it into the
@@ -2604,14 +2607,14 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	 * unwritten page.
 	 */
 	folio_mark_uptodate(new_folio);
-	folio_ref_add(new_folio, HPAGE_PMD_NR - 1);
+	folio_ref_add(new_folio, nr_pages - 1);
 
 	if (is_shmem)
 		folio_mark_dirty(new_folio);
 	folio_add_lru(new_folio);
 
 	/* Join all the small entries into a single multi-index entry. */
-	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
+	xas_set_order(&xas, start, order);
 	xas_store(&xas, new_folio);
 	WARN_ON_ONCE(xas_error(&xas));
 	xas_unlock_irq(&xas);
@@ -2666,7 +2669,7 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
 	folio_put(new_folio);
 out:
 	VM_BUG_ON(!list_empty(&pagelist));
-	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, HPAGE_PMD_NR, result);
+	trace_mm_khugepaged_collapse_file(mm, new_folio, index, addr, is_shmem, file, nr_pages, result);
 	return result;
 }
 
@@ -2769,7 +2772,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 			result = SCAN_EXCEED_NONE_PTE;
 			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
 		} else {
-			result = collapse_file(mm, addr, file, start, cc);
+			result = collapse_file(mm, addr, file, start, cc, HPAGE_PMD_ORDER);
 		}
 	}
 
-- 
2.47.3

