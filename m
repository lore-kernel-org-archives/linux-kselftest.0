Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B6441600
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121537; cv=none; b=uZw2JOdHDkot1/Qke+yNKkSxsEcFAfD4EQUR7yF9Vl+rl8ynEu59aCOfQ1gZ77v26tltC81KdqpkV1481NgRzUjdQtplU4McB78XZLnPf8WOyMFk85xOerJBWm9bJCa+owBfxvPxCxMku3F/SuRG9oYNRe+u2H2UsHGiGgUjr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121537; c=relaxed/simple;
	bh=CXRsgxYB/5yutOnrrQ4y8UUCmA9/hvuTy++ixQDxir4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSxhv3X/PgRoJq3d/7WmvsaLR/7mzpaS5bjNmb9pLawxtouqWY6t6leKPES5mlV/qFhUWuLVPVooBblJQhLNgyqsaHXSfw6A0DicYzrTcy5mfV4u3v3U30em+3Hi26Fy9CLoxbzXy2Hlk31XjwEWFh2ZrQY+eE9lxqj5p15GGxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=j1dHDMeR; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="j1dHDMeR"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so4818871cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121532; x=1790726332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndNxVkCk5WMhyvlnx4WQtybJ1XuSLrgG5RrCZvpyS/4=;
        b=j1dHDMeRzTL7SoTAwFc6Z9lbnP0//XP+NF4ttqyc7E5YzHOMhWoid90cUvnRdtneqY
         HfrqDs4aYGdO6fZevuovqeLK1IuYLvocXBYZaX4k0MmgOhPLFKMbupb2j6UKrAUGdVo3
         L1jf2rWH0DjWWNUWWV2EJyp5bZrVqo1OZWV7obFgGTcC4how8zP/5t0D7Nz1AvDsa1cZ
         qeWDV++W+h6WBGaHSb0C7OIjQByHEXjBHyljQErpR8/VYAxRGw1b51RqdF9mfoZsoSLG
         XkIGVKWgyJyrJkPquky1oMN41rThNkD3Xp0Wz0I+hacXrzy04lvYTXwduiIdvxiLroSb
         fdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121532; x=1790726332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndNxVkCk5WMhyvlnx4WQtybJ1XuSLrgG5RrCZvpyS/4=;
        b=mW8lrgDvOjg6BudZCbAaTWuoaNWyj4ZuYODawWQwfAxYGB6+S3pLjrFBBLeextFE9/
         6duaSNA6/nebKFRh75MIlbbe3KJZ3RrqlDFE+AG4VqMWAd6nAi3Y3HI7AJBr9NGM9nyQ
         HN6sJrLrX+0TPkfQVUaYEY7n7Q8YHLUw6yisfDMJCycOSn12iGeyufQh6UkPW0h4ncbU
         bZFYnAJnPLCvVfcU4uK00jtXjEdY4WWcouQmbePcGhA+1WgkqwSbIRWSXRYsDDdg5nEh
         7AI7R7LKLS1ESGG42MFxjmqtN1FH02KOQ7Vc/xPdV9Dby/P6E+hQlNuNzMSrDJCsoME4
         MZ2A==
X-Forwarded-Encrypted: i=1; AKwUvBwdh+5+cgP8WSKhWCxaPcKxdP0rLjpML8MYpYVDQ7HCvb+1qT5Dups2T6bFcTfMn5OOiHk18TXp5BTvbO5zjAs=@vger.kernel.org
X-Gm-Message-State: AFuF++lmDI2dOJ1lj6+3eIC4Mwq7JuPtPmS9V2+y7xPrzyhKFidWyHmX
	VP2saF0WCnzpLvDNecQcU7eMLmpFZy4Kl2MaR+l8MUse3K4zZ2q1JaS5NkoUwxWyCPU=
X-Gm-Gg: AYBFou2570fOFx2XlEWU+sfF+SPjbBv88MJflb7L0Np7AL3WL/4X+3CvR4FmW3WxBY9
	RDcTqHolxJKIhhkC8Hx8uk3G9HJw3zdDQAFkBtSjLsyoM3NZSjB9qi96SouPqpZUfd+Lm55xlh1
	0Saycc/9kiEO1GjR2p5FHIOseHBiY9jUx+slvDduUljwpF0GKu7fcZbBgHeDFj0EYEj3vmFpvwS
	Wq8MnvQW4YehGTiZeEXgUKhS+fYByKyerEZz/F7+ud80cgocQcugm8FID2dqC23K48QV9NGeQ/J
	dOKhqKgfWi43SsURSPe1TQztWgtKLGtxLgedMkQ6tMd8YMLyppWNPgcetY89nFXbhSSZdRjm7qt
	bdL7z045tZaMFXtsl42U/9BVC01MCWEDWunUYlaPz2UDc8VzHL6Wd2Tu+elbwYQ8butSeJy3pPE
	0TDf+B1MAhlfVJkPVjv1/nyLB4p/Z5f86CRuQBDrmXFuTQgLgfXRszr+prf+xPND3NM9KFWRIeL
	fa40TNn9BYmTzDPH+DoFTJoFEv28ajjkOgpstbsDJp0X2ZjvfCdyIP3AnqP
X-Received: by 2002:a05:622a:1e06:b0:532:9ade:b6ef with SMTP id d75a77b69052e-532eadc3523mr18790541cf.69.1790121532255;
        Tue, 22 Sep 2026 16:58:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:51 -0700 (PDT)
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
Subject: [PATCH 10/10] mm/madvise: share cold and pageout walk setup
Date: Tue, 22 Sep 2026 19:58:30 -0400
Message-ID: <20260922235830.2350770-11-gourry@gourry.net>
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

The MADV_COLD and MADV_PAGEOUT entry points duplicate the TLB and page-walk
setup while initializing equivalent private state.

Use one madvise_lru_vma_range() helper for the shared TLB lifecycle. Keep
operation-specific validation and policy in the two entry points.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 49 +++++++++++++++++--------------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 88a4a03dee04c..37e3d3a205a76 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -622,21 +622,19 @@ static const struct mm_walk_ops cold_walk_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
-static void madvise_cold_page_range(struct mmu_gather *tlb,
-		struct madvise_behavior *madv_behavior)
-
+static void
+madvise_lru_vma_range(struct madvise_behavior *madv_behavior,
+		struct madvise_walk_private *walk_private)
 {
 	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_behavior_range *range = &madv_behavior->range;
-	struct madvise_walk_private walk_private = {
-		.pageout = false,
-		.tlb = tlb,
-	};
 
-	tlb_start_vma(tlb, vma);
+	tlb_gather_mmu(walk_private->tlb, madv_behavior->mm);
+	tlb_start_vma(walk_private->tlb, vma);
 	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
-			&walk_private);
-	tlb_end_vma(tlb, vma);
+			    walk_private);
+	tlb_end_vma(walk_private->tlb, vma);
+	tlb_finish_mmu(walk_private->tlb);
 }
 
 static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
@@ -647,39 +645,28 @@ static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
 static long madvise_cold(struct madvise_behavior *madv_behavior)
 {
 	struct vm_area_struct *vma = madv_behavior->vma;
-	struct mmu_gather tlb;
+	struct madvise_walk_private walk_private = {
+		.tlb = madv_behavior->tlb,
+		.pageout = false,
+	};
 
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, madv_behavior->mm);
-	madvise_cold_page_range(&tlb, madv_behavior);
-	tlb_finish_mmu(&tlb);
+	madvise_lru_vma_range(madv_behavior, &walk_private);
 
 	return 0;
 }
 
-static void madvise_pageout_page_range(struct mmu_gather *tlb,
-		struct vm_area_struct *vma,
-		struct madvise_behavior_range *range)
+static long madvise_pageout(struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
 	struct madvise_walk_private walk_private = {
+		.tlb = madv_behavior->tlb,
 		.pageout = true,
-		.tlb = tlb,
 	};
 
-	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
-			    &walk_private);
-	tlb_end_vma(tlb, vma);
-}
-
-static long madvise_pageout(struct madvise_behavior *madv_behavior)
-{
-	struct mmu_gather tlb;
-	struct vm_area_struct *vma = madv_behavior->vma;
-
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -694,9 +681,7 @@ static long madvise_pageout(struct madvise_behavior *madv_behavior)
 		return 0;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, madv_behavior->mm);
-	madvise_pageout_page_range(&tlb, vma, &madv_behavior->range);
-	tlb_finish_mmu(&tlb);
+	madvise_lru_vma_range(madv_behavior, &walk_private);
 
 	return 0;
 }
-- 
2.53.0-Meta

