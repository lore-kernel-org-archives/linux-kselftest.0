Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB453A3BA
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121535; cv=none; b=D5yI3OjOrYeNsnOHX+CBlysl+JUtaJPB+0kJf6nui+l2eAj3B+FEobDijgAkNGr2Pu6qitn22MWB8zk1yMcjUHpwEmfvSCG7g6ICOMwdFfEM/PCTtWnFNd4O2jpzu+OLBSjtSSzhJmEGSDfjvcgjGlE4PNDVHiuagkwctg26RWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121535; c=relaxed/simple;
	bh=pC7CcSkiGbHApKl+B9rATKci8vcVThz5BEzv7IQiVAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BY+G4nGiKpZCQmPk+Pj1vUQRL0Ts7uk8xSCUGPOlGpSCj5XNLmaD6mDEAcVKgom7szsZvcCqqdCwiRRpW82H1udLx5fhTnNJlzulzS0s70bYtaTbAdRe/x6aoo7CUyKEg4XzFeK2PPNlNvvXPJMVpLF+3q8Sug3GtK00ZzpfoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XoJmyt1z; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XoJmyt1z"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so3360611cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121527; x=1790726327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeVENJt4LIsrgXUQ5UaykSbIE82DoLdeqUsQ6JLwyy0=;
        b=XoJmyt1zSoWwMe3FHt67O76tRyM3njd+eHjRaTWzLXpCQQ6bSHsp3ns/5kqnHChFQK
         ctVZdJgE3YxWl/d1luRFIGr7SFvB2xhPAQK9Iikclz/S3OhroWINIqhNkjb9jxsB3kwI
         8Erhi39x3Gu9L/cgeQOWlvNyDY8t2jm0Nf238iThmVxREPrU8RAne2Fmf5V8oTR7iRQ0
         zTK+yWGufbxTUz06KAgffqvFOsflOzOXoH6LjZ3hU3U1diN6632VOx97GF8B8fGAv2Cm
         9pgsEBZK/MQ1ZXdG0VJH2FUsTMLPyS00xyoG352uHr9YQFpdwJyhTautA2n0Zvv4becL
         a8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121527; x=1790726327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeVENJt4LIsrgXUQ5UaykSbIE82DoLdeqUsQ6JLwyy0=;
        b=BwYTadw60wmYX3OkCk6ZGSQ3XKEkZeBpq8OIyA0AXChLsRv5tvf25dYCcPBbmZjlt5
         FXcUFGwPMVMF0tHaNMRS6Qe8gFJBCHSPhtyTdyOmQvBs5HMnFUcfT1E9w1Op7rbgkoV4
         eS+bpfgkpeOYnBdVc0Y+O7OsJUu475hYOtdS+EnJLcF+gPH6ELxgN4Kdxy8xN2L3Ev7P
         TgX+MD3+80Tu4kQ4vr9/5SPDX6PAktVQ84Ov4PhFpND9ZsePFZAZz1p5cqD+NAoFvkDD
         k/C0vEfDUE+cKPxfeSWDpJ5quS7QJxFlV6hUh2jpTSvIlJLaxh9ntbV6ZjGIycWUZ1ZF
         nPvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKGgTSkk7hqQO699xVygww2tDciAdpXrLmgUK7ZxNwu0RUzH2FhCTIeOKbOJD75FMI6QzbnSWJUAchpxGrs0g=@vger.kernel.org
X-Gm-Message-State: AFuF++mH7ZpzGbm8ZWJnOdXaLsA1Dn40azvzTuXeS5//C56KtqRggqQk
	jzYgXFAmU+BKc0WxVc+o3KmxpiVW+bzeeHlcfNjFhTZpC4aNiFxkspMWJZvmU1OqU7k=
X-Gm-Gg: AYBFou0iMwvKmuAPm85dJqp+t4a4/d7BM/2KDJ4I9oleb3vV/6SWVdu0aXyDvZm1wYl
	e3cDmCEgGbx97nAyYgyvCygZO88nuydQ09yCCAO56CML58fG21dcu4n8eDEvXAKVe5sI4MWcQlQ
	+lyZdeH+EMHZxUlNRYJQkghvsYynRNNTh3vRgMD4KbQwXUmKIwZURSDQQ2ItFBiW2amHRXVaujn
	WR4udWDKOGIxdnumcyygsrU0NcM6ex+CNbQzje9SyrMTai9iOa5HjbAW0aF6P+C+Mxjbd/WdlKY
	LGdZcGIIlb4fD0wqIhnUMNpQcrlKGpKLzy28BpraYzwLQs/nqx71wkyw872sMt/qriPa9IwKeZJ
	Rw4O8isIOe893P82WuAv9gbyf9VNYCl7HXaMf1ebY/Kbi2ceHovDy20muiTT/5ZERhkhsT153l9
	sBuq6e+xqQldCxSzbkB/NVOd0S6txf0vm/BxvDCVziIhYEHvicvY68c4++5m53idpd86lqQNNFM
	BFc0NKcq6+vDyQsq3Xeu+K2Jyw8a3g6oRPRofZr3pe0ZVMdKczJ9WnY04K9xGb66yApeSM=
X-Received: by 2002:ac8:5986:0:b0:532:9adc:639d with SMTP id d75a77b69052e-532ead489d2mr18461111cf.65.1790121527246;
        Tue, 22 Sep 2026 16:58:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:46 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 07/10] mm/madvise: separate PTE-batch folio processing
Date: Tue, 22 Sep 2026 19:58:27 -0400
Message-ID: <20260922235830.2350770-8-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PTE loop combines page-table iteration with validation and
processing of each folio batch. This hides the batching rule for large
folios and the ownership transferred when a partial folio must be split.

Move one batch into a PTL-locked helper. A split candidate is returned
locked and referenced so the caller can release the PTE mapping before
calling split_folio().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 132 +++++++++++++++++++++++++--------------------------
 1 file changed, 65 insertions(+), 67 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 83b27258c9673..350b854ccc197 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -394,6 +394,54 @@ static bool madvise_lru_folio_is_filtered(struct folio *folio,
 	       (pageout_anon_only && !folio_test_anon(folio));
 }
 
+/* Return a split candidate locked and referenced for use after the PTL drop. */
+static struct folio *
+madvise_lru_pte_batch_locked(pte_t *pte, unsigned long addr,
+		unsigned long end, struct mm_walk *walk,
+		struct list_head *folio_list, bool pageout_anon_only, int *nr)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct folio *folio;
+	pte_t ptent;
+
+	*nr = 1;
+	ptent = ptep_get(pte);
+	if (pte_none(ptent) || !pte_present(ptent))
+		return NULL;
+
+	folio = vm_normal_folio(vma, addr, ptent);
+	if (!folio || folio_is_zone_device(folio))
+		return NULL;
+
+	/* Split PTE-mapped large folios before advising only part of them. */
+	if (folio_test_large(folio)) {
+		*nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
+		if (*nr < folio_nr_pages(folio)) {
+			if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
+				return NULL;
+			if (!folio_trylock(folio))
+				return NULL;
+			folio_get(folio);
+			return folio;
+		}
+	}
+
+	if (!folio_test_lru(folio) ||
+	    folio_mapcount(folio) != folio_nr_pages(folio))
+		return NULL;
+	if (pageout_anon_only && !folio_test_anon(folio))
+		return NULL;
+
+	if (!private->pageout && pte_young(ptent)) {
+		clear_young_dirty_ptes(vma, addr, pte, *nr, CYDP_CLEAR_YOUNG);
+		tlb_remove_tlb_entries(private->tlb, pte, *nr, addr);
+	}
+
+	madvise_lru_folio(folio, private->pageout, folio_list);
+	return NULL;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void madvise_cold_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		pmd_t *pmd, unsigned long addr, pmd_t orig_pmd)
@@ -491,7 +539,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	bool pageout = private->pageout;
 	struct mm_struct *mm = tlb->mm;
 	struct vm_area_struct *vma = walk->vma;
-	pte_t *start_pte, *pte, ptent;
+	pte_t *start_pte, *pte;
 	spinlock_t *ptl;
 	struct folio *folio = NULL;
 	LIST_HEAD(folio_list);
@@ -515,9 +563,6 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	flush_tlb_batched_pending(mm);
 	lazy_mmu_mode_enable();
 	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
-		nr = 1;
-		ptent = ptep_get(pte);
-
 		if (++batch_count == SWAP_CLUSTER_MAX) {
 			batch_count = 0;
 			if (need_resched()) {
@@ -528,71 +573,24 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			}
 		}
 
-		if (pte_none(ptent))
-			continue;
-
-		if (!pte_present(ptent))
-			continue;
-
-		folio = vm_normal_folio(vma, addr, ptent);
-		if (!folio || folio_is_zone_device(folio))
-			continue;
-
-		/*
-		 * If we encounter a large folio, only split it if it is not
-		 * fully mapped within the range we are operating on. Otherwise
-		 * leave it as is so that it can be swapped out whole. If we
-		 * fail to split a folio, leave it in place and advance to the
-		 * next pte in the range.
-		 */
-		if (folio_test_large(folio)) {
-			nr = madvise_folio_pte_batch(addr, end, folio, pte, &ptent);
-			if (nr < folio_nr_pages(folio)) {
-				int err;
-
-				if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
-					continue;
-				if (!folio_trylock(folio))
-					continue;
-				folio_get(folio);
-				lazy_mmu_mode_disable();
-				pte_unmap_unlock(start_pte, ptl);
-				start_pte = NULL;
-				err = split_folio(folio);
-				folio_unlock(folio);
-				folio_put(folio);
-				start_pte = pte =
-					pte_offset_map_lock(mm, pmd, addr, &ptl);
-				if (!start_pte)
-					break;
-				flush_tlb_batched_pending(mm);
-				lazy_mmu_mode_enable();
-				if (!err)
-					nr = 0;
-				continue;
-			}
-		}
-
-		/*
-		 * Do not interfere with other mappings of this folio and
-		 * non-LRU folio. If we have a large folio at this point, we
-		 * know it is fully mapped so if its mapcount is the same as its
-		 * number of pages, it must be exclusive.
-		 */
-		if (!folio_test_lru(folio) ||
-		    folio_mapcount(folio) != folio_nr_pages(folio))
-			continue;
-
-		if (pageout_anon_only && !folio_test_anon(folio))
+		folio = madvise_lru_pte_batch_locked(pte, addr, end, walk,
+				&folio_list, pageout_anon_only, &nr);
+		if (!folio)
 			continue;
 
-		if (!pageout && pte_young(ptent)) {
-			clear_young_dirty_ptes(vma, addr, pte, nr,
-					       CYDP_CLEAR_YOUNG);
-			tlb_remove_tlb_entries(tlb, pte, nr, addr);
-		}
-
-		madvise_lru_folio(folio, pageout, &folio_list);
+		lazy_mmu_mode_disable();
+		pte_unmap_unlock(start_pte, ptl);
+		start_pte = NULL;
+		if (!split_folio(folio))
+			nr = 0;
+		folio_unlock(folio);
+		folio_put(folio);
+		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (!start_pte)
+			break;
+		pte = start_pte;
+		flush_tlb_batched_pending(mm);
+		lazy_mmu_mode_enable();
 	}
 
 out:
-- 
2.53.0-Meta

