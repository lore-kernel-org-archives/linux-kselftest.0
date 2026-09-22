Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA0653B33D
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121537; cv=none; b=Cxnv8N4HH1bnUnBf4wbeW48G636fwq2CjlLBXSfryJROrRvwmVpvMljbDyx2ZedLtPhtYWzWXbM4KLT1A7lulH2jKbAsgpfSIyhqWeCgPmL2WbFLz5XreF9i8b+JdAe8Mps2a7EswE5VMQ6YVRrVz3oMvoqFZiS4xpnmljD9Ox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121537; c=relaxed/simple;
	bh=4tfxaowEwyLcwym1ubVvN+8S1jtOYuzn6GPPLRK9Vaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwuQELfOhXKWTmeEpMLMAXUO/bqiB4G8eB7YF2aHLjzA39vroWdCztjIUbvDbbx/ENhD4cZRd6CCz4dw67AIjma5UfEDuiBZGKMPYGoJ56UAjePuCZIBRUEZf3Yy/5HE8P4WXBHi661GbMJHSjH0JGJfjsBxNH9tPnxeDm3UAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PLnFCRyG; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PLnFCRyG"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532d63f434fso5504831cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121530; x=1790726330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3xhM/OIBt/SuFbuoCQCsVkZeh3BpJl7fkoqP+MrWAM=;
        b=PLnFCRyG9XwSahqQaJvq0Fu5ThIzedEFNpa+UfG2Fw7NAJH7p9BJSOpShVDtFNPcr2
         BloihYSiRgceklrQsI2tRTTre+lky/GxWZVqCoIAaelx/YllZkk4o2NCerlzqW/WuERA
         uLcWdNMqwe5iGZMb7dUOrgn6CTcBSZVMeAwkImYOTiD9linvBba2Xze1C18omyWYo5jb
         m5ueaGqyI3gdE++U/lHQqf4KJcQCFmYHa8WS7Jl3g+FMTvjZvOR52lPd7LglYdmnF6gI
         maiHjTOMzyZSW8YOlG9nHr2BKYahUzEh1VaE6Y2RTF4F1Nd9c1aebWcjQXlgGv00b+4U
         s4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121530; x=1790726330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3xhM/OIBt/SuFbuoCQCsVkZeh3BpJl7fkoqP+MrWAM=;
        b=UQyVvFShB75p0KcIYi7LikZphgeoAm30L8LzgA45H58ApwF5FCGT4tKwGsLVcyXFkI
         SvYmQK9WV6Lh7cxuFSfObvehq/NSb3RZ1naPrIOUZctBMsZz1oWbDq5ACVYZlbQ65dDZ
         KkjsTVdEaAezoW4BHIbfOix46I9WBTHXTf1sxTXJAdlAxnMJe+xAvNjvY/V0HT5UVtig
         9TxKkb+NWRRIGUNG6dXWPIPDhRkB0v/jY8brGAc60iHFZBpciI7idsFkexKn6MFx/jxu
         syk4F8SkP6wXIshZJtcZpc2nJJVZgW074TcwfdAwdtc+1becpEFBQPvEJJDIEN8EzazC
         CWnA==
X-Forwarded-Encrypted: i=1; AKwUvBwwLiFbphHVdktitmHfIxUcZNl/AF/N6OZJA7i6yZz6FygQHoyHGLljMYnaMg82kK5G6e7L6XVH99pFC4dtWq4=@vger.kernel.org
X-Gm-Message-State: AFuF++kLFlyfOz9pCrEjotYEMxtnXZ+CHKPS05Ur0goIntjHzZtrG8kO
	JKXvR2epbxzbPV/vrKeUvRFP+DvVgElMChUrJaXm3QxbmfoBzCJIE5uyQgOTp94OgD0=
X-Gm-Gg: AYBFou0yVI1Ct+riM7AJl7/SKS4YlccwM/0sTQlGPpgur37cuAeT94zjCH9lVjb1Ol3
	a2hQxkBfHw7iibcrMLxrWyt2QjiaQuoNz90GyigApsxwnxM9ITNpNHzaU/0PKqbMkJ0jN+ecFfF
	Qfs3U1V2lbQa499Lv/7aFTOAYI9N7KSDO8mBEoApfKFh9iwaqZIBmV33QzfN+wEv3TF8tOZxZsP
	6zxuM75dxZhkJhXbpqdZktAli7xOD4SQjIA0QPNllfeZkNTxGGE9+pz2t+nrt34IDYqCa90ntvt
	ixZNN4nwF68FydKROPCBN15IzJvWgbvbPez0b35aLO8hbjgoLGW43erBc9rHF+w0uJCT1qhSKzQ
	BmbO2DxrbDAE4EAO91O78Toes1/iEsoOANA+wx92f43T4ScAqOYCDvkgOsHgyvKXlgDEd+mOexa
	DvPxo9csmhfdSYvrwq461lt5fhv3KXGDdUkJwBEr1AZ0OPV3/dL/dZqUsvkBhDHQazgCZyzcOqt
	gZySJ6hgXAsjsjMdOE7xl/Cr0DH70IyBRwxBcotIpryIimyWrTVg4+kFGhUJvTjF5TpX1g=
X-Received: by 2002:a05:622a:411a:b0:52f:f73c:3269 with SMTP id d75a77b69052e-532ead1e0c5mr18771951cf.36.1790121530629;
        Tue, 22 Sep 2026 16:58:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:50 -0700 (PDT)
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
Subject: [PATCH 09/10] mm/madvise: make cold and pageout PTE lock ownership explicit
Date: Tue, 22 Sep 2026 19:58:29 -0400
Message-ID: <20260922235830.2350770-10-gourry@gourry.net>
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

The PMD callback still maps and unmaps the PTE table, drives split retries
and handles rescheduling after dispatching huge PMDs. This leaves PTE lock
ownership mixed with the page-walk callback.

Move that lifecycle into madvise_lru_pte_range(). Its outer loop drops the
lock before splitting or yielding and resumes at the current address,
leaving the PMD callback to select the huge-PMD or PTE path.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 94 ++++++++++++++++++++++++++--------------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index e3c3acfcd9b66..88a4a03dee04c 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -553,66 +553,66 @@ madvise_lru_pte_range_locked(pte_t *pte, unsigned long *addr,
 	return NULL;
 }
 
-static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
-		unsigned long end, struct mm_walk *walk)
+static void madvise_lru_pte_range(pmd_t *pmd, unsigned long addr,
+		unsigned long end, struct mm_walk *walk,
+		bool pageout_anon_only)
 {
-	struct madvise_walk_private *private = walk->private;
-	struct mmu_gather *tlb = private->tlb;
-	bool pageout = private->pageout;
-	struct mm_struct *mm = tlb->mm;
-	struct vm_area_struct *vma = walk->vma;
+	const struct madvise_walk_private *private = walk->private;
+	struct mm_struct *mm = private->tlb->mm;
+	LIST_HEAD(folio_list);
 	pte_t *start_pte, *pte;
 	spinlock_t *ptl;
-	struct folio *folio = NULL;
-	LIST_HEAD(folio_list);
+	struct folio *folio;
 	unsigned int batch_count = 0;
-	bool pageout_anon_only;
 	int nr;
 
-	if (fatal_signal_pending(current))
-		return -EINTR;
-	pageout_anon_only = pageout && !vma_is_anonymous(vma) &&
-				       !can_do_file_pageout(vma);
+	tlb_change_page_size(private->tlb, PAGE_SIZE);
+	while (addr < end) {
+		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (!start_pte)
+			break;
+		pte = start_pte;
+		flush_tlb_batched_pending(mm);
+		lazy_mmu_mode_enable();
+		folio = madvise_lru_pte_range_locked(pte, &addr, end, walk,
+				&folio_list, pageout_anon_only, &nr, &batch_count);
 
-	if (pmd_trans_huge(*pmd) &&
-	    madvise_lru_huge_pmd(pmd, addr, end, walk, pageout_anon_only))
-		return 0;
-	tlb_change_page_size(tlb, PAGE_SIZE);
-restart:
-	start_pte = pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
-	if (!start_pte)
-		goto out;
-	flush_tlb_batched_pending(mm);
-	lazy_mmu_mode_enable();
-	folio = madvise_lru_pte_range_locked(pte, &addr, end, walk,
-			&folio_list, pageout_anon_only, &nr, &batch_count);
-	if (!folio && addr < end) {
 		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
-		cond_resched();
-		goto restart;
-	}
-	if (!folio)
-		goto out;
 
-	lazy_mmu_mode_disable();
-	pte_unmap_unlock(start_pte, ptl);
-	start_pte = NULL;
-	if (!split_folio(folio))
-		nr = 0;
-	folio_unlock(folio);
-	folio_put(folio);
-	addr += nr * PAGE_SIZE;
-	goto restart;
-
-out:
-	if (start_pte) {
-		lazy_mmu_mode_disable();
-		pte_unmap_unlock(start_pte, ptl);
+		if (!folio && addr < end) {
+			cond_resched();
+			continue;
+		}
+		if (folio) {
+			if (!split_folio(folio))
+				nr = 0;
+			folio_unlock(folio);
+			folio_put(folio);
+			addr += nr * PAGE_SIZE;
+		}
 	}
-	if (pageout)
+	if (private->pageout)
 		reclaim_pages(&folio_list);
 	cond_resched();
+}
+
+static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
+		unsigned long next, struct mm_walk *walk)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	bool pageout_anon_only;
+
+	if (fatal_signal_pending(current))
+		return -EINTR;
+	pageout_anon_only = private->pageout && !vma_is_anonymous(vma) &&
+			    !can_do_file_pageout(vma);
+
+	if (pmd_trans_huge(*pmd) &&
+	    madvise_lru_huge_pmd(pmd, addr, next, walk, pageout_anon_only))
+		return 0;
+	madvise_lru_pte_range(pmd, addr, next, walk, pageout_anon_only);
 
 	return 0;
 }
-- 
2.53.0-Meta

