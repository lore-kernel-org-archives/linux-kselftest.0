Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E553A3B0
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121530; cv=none; b=VT4pcH6mA2aJH/Vpbu4d1RsCgcEjtEUi4PYJORZNA5WpMH7ozvidzfxn1oBA/V93YRcNDC4y7Sw5LK0PoxYGrEsGsXFIzidL2WD+S5Ijmg/Qio5/6Aox6EzgC5IKUaNqA+P1EMAdYgdPIodWPZ56+79ALcsy28F1+is+PXJvAGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121530; c=relaxed/simple;
	bh=D1jZ5yEljPoeJJ0ckwdQ1BT6N6s+ZZzFqlaHb94bagg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqNdbD/GZznWXSGnVqElHAzh0llj3iJweWA1LHjWths/fBt+lKOu5HX2eEvRCY9JD7jNvNsPo6MjCsiUPC2tBvTTlN4U/VziktR2yp43BMsgmqPNuWRyEKTbcuUUSjCdVyyMYp2sF2RdUNghyHqNHNdeBi4Fif2Cx09AVM4l6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iryWxFMR; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iryWxFMR"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so4081861cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121525; x=1790726325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obo7lHtS5J/HNUJlSapmyf6Vr5VJeymYNsQD5zlwwVs=;
        b=iryWxFMRMIDM1eYpZoWC4OmqlBlL98gpUES4nnPKD7lF05+2E6OAODPIOdnp6+8Baj
         /1Xzq9/Pu2JTL7jNkx+puo7upwImP0nEKlfeb8mRFWczyLlJfvzeTgeyiNWQUeG5MU6h
         pKY1wkS/mHhh2qjf5o2ZUlAoaw9h3lkjr2oCbY3A44WAF3KnY5VkGEpFscLacIi0zMF4
         bGk/tycgZQuVY312Yl9MreEE1rOywZi7AEDxSfv2cfQIPeWLtKBe4VgL6oEWYpG7raEB
         zk5uqVcSyj9OZ+P7gro8VSPDwqjkIbKJBz4cNtQqmyqbUcHCHedwSYxN7YtL5sdIsewd
         K4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121525; x=1790726325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Obo7lHtS5J/HNUJlSapmyf6Vr5VJeymYNsQD5zlwwVs=;
        b=UYwNvzVkN9nFUtrizWxuSaN4mSJgWUbImWIIZLYw2nJMk5N9vIxhW7Wdd9CamsFDSI
         2amDR7Ru17UqO1IdtOW5Tzc7+azAdBUG9KIpy4/hTBXa7T9MhwMxu+waVXkw8O0tYrcy
         W7+X9hTRzh+B8u7hh9ZGzSwLUOHhu2MsZlaI+me/OedPwaTFNaUONoM3DKpQi2tGcxPj
         hKe+hY5aHabET3Nx64zfY7G3FYCpZQWt6I3IvcDYn7typb2Du7tGgL2OTxfmBGKP8RiD
         iNFvjqGPOvrxd9kLSfrswSMvuqXvFemDv17BLfH7WX5lxh9eTK9PRm3ldyXYSp0/7V45
         SDXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc1CUwa+MR3i5O2n91xS2sm4uFVTf7G+Qn9djz5+8oHWMbKkr5pTeh5HCbH55DrI1QNB+G8YTazz2Lj0pRoG0=@vger.kernel.org
X-Gm-Message-State: AFuF++l2Tz56EUxh7MU06Xb5jZ8f2d+Vo6U/y4cM5he5iN668LzKeYN4
	IoDCwZfMXHN0M3DU9nIGAmzVpBX9T4CH5OhBgFQqTZYcJKNsfr2vOGEZdDZnNWYt4Bw=
X-Gm-Gg: AYBFou2saJIlgJ8OTY6jbieEGE5VS61z+iDwBmrojxtFJ+fyjHjWeFyeyBbVbJBe6To
	GG74pdnkgYJeXcHpTTkBQnZhKeVQsHeCrd1VV96ZzytXrC83kvgfpIuYfSCIDakTWiSXR4BWw3s
	IPkRLhzD5AJiZCAqMRuVQaSSnfIccNqPKT9o4pSZoTDuyaLQQXdhX0YzlF5ceF4P02PeHvom/aN
	4rOvBkbVqn9nBxwK5Q+T/BIg+wtTFi+sc4hLuLqaToN/i97PKRgF1ZzkIuFat7VXyRWF/2P0xHc
	y+9MZjgPGL7bkasIizx7C7egonaDySpkvks39/CVGYGk+mxlICZgI7+Qp9BrQiUdPuQrz/zlCoP
	7xm07AjmHl3hPb6uA/CgU0se1GOAXHG9aLKqvvPWipFUBvsma2EoCMVM9piJ23qn7CIIlbmN9qz
	+GSrWawm0T4CE4lmQ+WpHhY1ncmr+8fry7bF9TsFPIvlSlWs/4xTeAKqdBab/ftvflzhcyRxiHX
	ktfUrzS5waG1CZNn5c/obmPIFn0g9o/p2cSqwZnnwlZmnWW26mi84FrPCNL60RanOXVUS8=
X-Received: by 2002:a05:622a:2b09:b0:531:1e27:90fd with SMTP id d75a77b69052e-532eac081e7mr17011201cf.30.1790121525263;
        Tue, 22 Sep 2026 16:58:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:44 -0700 (PDT)
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
Subject: [PATCH 06/10] mm/madvise: separate huge PMDs from the PTE walk
Date: Tue, 22 Sep 2026 19:58:26 -0400
Message-ID: <20260922235830.2350770-7-gourry@gourry.net>
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

The PMD callback still owns huge-PMD locking, splitting and reclaim along
with its PTE-table loop. This obscures the transition between the two
paths.

Move huge-PMD lock ownership into a dedicated helper. Return false after a
requested PMD split succeeds so the callback continues at PTE level. Use
the PMD boundary already supplied by walk_pmd_range().

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 85 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 6b518f7f73651..83b27258c9673 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -435,6 +435,52 @@ madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
 	madvise_lru_folio(folio, private->pageout, folio_list);
 	return NULL;
 }
+
+/* Return false when a requested split requires a PTE walk. */
+static bool madvise_lru_huge_pmd(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk,
+		bool pageout_anon_only)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct mmu_gather *tlb = private->tlb;
+	bool pageout = private->pageout;
+	LIST_HEAD(folio_list);
+	struct folio *folio = NULL;
+	spinlock_t *ptl;
+	pmd_t orig_pmd;
+
+	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
+	ptl = pmd_trans_huge_lock(pmd, walk->vma);
+	if (!ptl)
+		return true;
+
+	orig_pmd = *pmd;
+	if (unlikely(!pmd_present(orig_pmd))) {
+		VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
+	} else {
+		folio = madvise_lru_huge_pmd_locked(pmd, orig_pmd, addr, next,
+				walk, &folio_list, pageout_anon_only);
+	}
+	spin_unlock(ptl);
+
+	if (folio) {
+		int err = split_folio(folio);
+
+		folio_unlock(folio);
+		folio_put(folio);
+		return err != 0;
+	}
+	if (pageout)
+		reclaim_pages(&folio_list);
+	return true;
+}
+#else
+static bool madvise_lru_huge_pmd(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk,
+		bool pageout_anon_only)
+{
+	return false;
+}
 #endif
 
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
@@ -458,44 +504,9 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
 				       !can_do_file_pageout(vma);
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	if (pmd_trans_huge(*pmd)) {
-		pmd_t orig_pmd;
-		unsigned long next = pmd_addr_end(addr, end);
-
-		tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
-		ptl = pmd_trans_huge_lock(pmd, vma);
-		if (!ptl)
-			return 0;
-
-		orig_pmd = *pmd;
-		if (unlikely(!pmd_present(orig_pmd))) {
-			VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
-			goto huge_unlock;
-		}
-
-		folio = madvise_lru_huge_pmd_locked(pmd, orig_pmd, addr, next,
-				walk, &folio_list, pageout_anon_only);
-		if (folio) {
-			int err;
-
-			spin_unlock(ptl);
-			err = split_folio(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			if (!err)
-				goto regular_folio;
-			return 0;
-		}
-huge_unlock:
-		spin_unlock(ptl);
-		if (pageout)
-			reclaim_pages(&folio_list);
+	if (pmd_trans_huge(*pmd) &&
+	    madvise_lru_huge_pmd(pmd, addr, end, walk, pageout_anon_only))
 		return 0;
-	}
-
-regular_folio:
-#endif
 	tlb_change_page_size(tlb, PAGE_SIZE);
 restart:
 	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
-- 
2.53.0-Meta

