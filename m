Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F1F53A3A2
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121523; cv=none; b=kO3W4idSnx9zUMfWvLBT0aocVNo035DG7BVnWMzdxY2ug6hFH+LEcSRSLAyIvQdwinb/sIXSeRfNzweoJTHnV499bV+lV8jb95fxvWD+YRh2zWUtglwSMBMAXmOtlS5fDqilFSk7WlIXf2t9Xrp4jjJimC9uvNWfUg3Jv6v4OZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121523; c=relaxed/simple;
	bh=Z+b3w7hN29ny0n+lgoibjklp6h6u1gN7hC/nkJ+vNU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIIicEHkczWpqCu5IqHgLJSc5baDWtW5UFBM+BeTMuYgEcWUTznxm5CjmhGhCLJ/tkUwxXV0K1eWt50GK+ITlwOfIWHNhHWqigUTykrnhFEkkJg2Kc8BwwSF/dX7cv3EAul4rjfYJPgh3KBtg5zFca/H4nZWLHHlea1j5aHLEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=h4a7kRms; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="h4a7kRms"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb76c9df1so4216291cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121519; x=1790726319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oNw9RPMr3V+/qUjJEYCXBc3lvf+tyCPjegYTQeEM3I=;
        b=h4a7kRms1pVwjzo/b9JB0U2KBFZevFmriKnNg9xWLUdLS4HzGrr7Hgq5DEYfM0CBtt
         ja1SI+7RiMU4DIxB9uFwo/rMyh78MRAwQlyFo2daQwwO+qsGgvYTrmplIRg2ogP6/oWh
         haOg5p534kDxTnhIiO0k+u37KE6dRuj31PJ5zwsEnsfz1+QTqX7S1H6pL+eDqKE8fqms
         eQHjfkpN2/C9RPQKwPAzzyKlEQ5F/Azhn9PgtX6UBmlaU0NJXQCqjLuzPcgJZtLbOebY
         SyDZdD6mfvMjznc5VvZxNrYF3adzn56iSpuTK6+dijswNE5ggT5Zv3lbONkUntKrvaI3
         yVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121519; x=1790726319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oNw9RPMr3V+/qUjJEYCXBc3lvf+tyCPjegYTQeEM3I=;
        b=uJS9ttujXnEwKKs8E4cDvmnWAzFQtAB7uoaBDZsdXU5NgHm5vhyN7Oa+hLUtnLK5g2
         rT28sWYYZ+RRoUDD5ZgU+4RkIQGIQSRnuEl+Kb60a5iWsrNKrAl1Hm/fayl4I35IR8Wj
         sYtMmdaB6yD2ClY53tfvP06C4tB7CLiwfwOe7usbMUYYUPmdrqe7QhQsl9gblgLcoyPM
         Q6NMatCYAYmBnzDQ/BvV/BLNd8EEqIIqZ4SITFobDkmZZrbc+1s+N484egWozJfWdtfJ
         elna1JzYFWmcOkuVpJn22UAAsNBt39yR5G9Wmp6pnkDbdZVnXe89XvBQ/oAzcNn0HJDG
         Tikg==
X-Forwarded-Encrypted: i=1; AKwUvBzPHF4XxG/9S4ZN8S4YmZ0EJRRzlFomOJ4Llbxvd8NiEyFhZCwpkZbECZpUZLvHUf5yzCsIanmDr4589yEgrEs=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Y85IHFddu7mNeNzSkGOzh8H01YE7DnHSuiPmdMxZQ3xHEBGK
	AC6ViAyXbJeGfMq8KdyMysZiudIONXhYk/XKpSEuUZt/RBX+0guZBIdzlB9RMNhcfRw=
X-Gm-Gg: AYBFou3AH8O4xX1UOuT3bvMYDf0wdGIg+tMhiFmLMnBnz0UkyJVc3TNxv3StJFdy7za
	RRYcb0lUEBxIA6AF0gzs9NDKVdpNh1Pa7MGd12qDTKaplltrm6FxIrLsaQwySmTBbVK8U3ywnFf
	jgLRKQX/DTKKy37XgsAudNhNOQKfsS4xRXN/khERpJDVlroLNPlGGxfiC2yZ4YdZfTbdpp4fF+F
	e/Ru7YDm6xzYliYjQ37XaNbwvmp18E53cu92GlWrxlCWS5w6fyqKYnaDr/lTeFy0IYf0DmQHJSI
	9cRwFHS1nBJXOBq8X9NcohT/RdDnghX5hVu/1Kom//J8dGyLyfTqWPkVaWNXy/1vk6XAJpNTKNh
	JBWMN6qOQkcxPjXlDHRoYiyykMD2MA1XK0KKcsTrPlr024bqPtz46NI23J8JaLqpqVs3DmpXA5Z
	9u0n7+o+8i9uprq6bL1QKwkppn6jauS+/FiRqc0gSGZ9H9e2teeSCEkGcLVzGGXpBJpqu5E3f/+
	ksWWxWhGEqWXqdyeXcezPtxZsfe+t5V/NWzWM035xKeznDetK3NR24MUfRhJZmgQo4jw6U=
X-Received: by 2002:a05:622a:305:b0:530:f77a:89aa with SMTP id d75a77b69052e-532eacb0064mr19428811cf.30.1790121519361;
        Tue, 22 Sep 2026 16:58:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:39 -0700 (PDT)
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
Subject: [PATCH 03/10] mm/madvise: factor shared LRU folio handling
Date: Tue, 22 Sep 2026 19:58:23 -0400
Message-ID: <20260922235830.2350770-4-gourry@gourry.net>
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

The huge-PMD and PTE paths duplicate folio filtering, reference clearing,
deactivation and pageout isolation. Keeping both copies synchronized
obscures the page-table-specific control flow.

Factor the common filtering and LRU operation into helpers. Keep the
lock-before-reference sequence visible at each split site because an early
reference can prevent split_folio() from succeeding.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 90 +++++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 83d54ab385da8..c345fef23f15d 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -361,6 +361,39 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
+static inline void
+madvise_lru_folio(struct folio *folio, bool pageout,
+		struct list_head *folio_list)
+{
+	/*
+	 * Clear references before deactivating or reclaiming the folio. This can
+	 * make idle-page tracking miss recent accesses.
+	 */
+	folio_clear_referenced(folio);
+	folio_test_clear_young(folio);
+	if (folio_test_active(folio))
+		folio_set_workingset(folio);
+
+	if (!pageout) {
+		folio_deactivate(folio);
+		return;
+	}
+
+	if (!folio_isolate_lru(folio))
+		return;
+	if (folio_test_unevictable(folio))
+		folio_putback_lru(folio);
+	else
+		list_add(&folio->lru, folio_list);
+}
+
+static bool madvise_lru_folio_is_filtered(struct folio *folio,
+		bool pageout_anon_only)
+{
+	return folio_maybe_mapped_shared(folio) ||
+	       (pageout_anon_only && !folio_test_anon(folio));
+}
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -373,15 +406,14 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	spinlock_t *ptl;
 	struct folio *folio = NULL;
 	LIST_HEAD(folio_list);
-	bool pageout_anon_only_filter;
 	unsigned int batch_count = 0;
+	bool pageout_anon_only;
 	int nr;
 
 	if (fatal_signal_pending(current))
 		return -EINTR;
-
-	pageout_anon_only_filter = pageout && !vma_is_anonymous(vma) &&
-					!can_do_file_pageout(vma);
+	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
+				       !can_do_file_pageout(vma);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	if (pmd_trans_huge(*pmd)) {
@@ -407,11 +439,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		if (folio_is_zone_device(folio))
 			goto huge_unlock;
 
-		/* Do not interfere with other mappings of this folio */
-		if (folio_maybe_mapped_shared(folio))
-			goto huge_unlock;
-
-		if (pageout_anon_only_filter && !folio_test_anon(folio))
+		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
 			goto huge_unlock;
 
 		if (next - addr != HPAGE_PMD_SIZE) {
@@ -437,19 +465,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 		}
 
-		folio_clear_referenced(folio);
-		folio_test_clear_young(folio);
-		if (folio_test_active(folio))
-			folio_set_workingset(folio);
-		if (pageout) {
-			if (folio_isolate_lru(folio)) {
-				if (folio_test_unevictable(folio))
-					folio_putback_lru(folio);
-				else
-					list_add(&folio->lru, &folio_list);
-			}
-		} else
-			folio_deactivate(folio);
+		madvise_lru_folio(folio, pageout, &folio_list);
 huge_unlock:
 		spin_unlock(ptl);
 		if (pageout)
@@ -502,9 +518,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			if (nr < folio_nr_pages(folio)) {
 				int err;
 
-				if (folio_maybe_mapped_shared(folio))
-					continue;
-				if (pageout_anon_only_filter && !folio_test_anon(folio))
+				if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
 					continue;
 				if (!folio_trylock(folio))
 					continue;
@@ -537,7 +551,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		    folio_mapcount(folio) != folio_nr_pages(folio))
 			continue;
 
-		if (pageout_anon_only_filter && !folio_test_anon(folio))
+		if (pageout_anon_only && !folio_test_anon(folio))
 			continue;
 
 		if (!pageout && pte_young(ptent)) {
@@ -546,25 +560,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			tlb_remove_tlb_entries(tlb, pte, nr, addr);
 		}
 
-		/*
-		 * We are deactivating a folio for accelerating reclaiming.
-		 * VM couldn't reclaim the folio unless we clear PG_young.
-		 * As a side effect, it makes confuse idle-page tracking
-		 * because they will miss recent referenced history.
-		 */
-		folio_clear_referenced(folio);
-		folio_test_clear_young(folio);
-		if (folio_test_active(folio))
-			folio_set_workingset(folio);
-		if (pageout) {
-			if (folio_isolate_lru(folio)) {
-				if (folio_test_unevictable(folio))
-					folio_putback_lru(folio);
-				else
-					list_add(&folio->lru, &folio_list);
-			}
-		} else
-			folio_deactivate(folio);
+		madvise_lru_folio(folio, pageout, &folio_list);
 	}
 
 out:
@@ -651,8 +647,8 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 	 * owner nor write capable of the file. We allow private file mappings
 	 * further to pageout dirty anon pages.
 	 */
-	if (!vma_is_anonymous(vma) && (!can_do_file_pageout(vma) &&
-				(vma->vm_flags & VM_MAYSHARE)))
+	if (!vma_is_anonymous(vma) && !can_do_file_pageout(vma) &&
+	    (vma->vm_flags & VM_MAYSHARE))
 		return 0;
 
 	lru_add_drain();
-- 
2.53.0-Meta

