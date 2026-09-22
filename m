Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865FD53976D
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121529; cv=none; b=nLHoJRfaswRQEXasrokODFjJQ5PgYga2KjbDVQ47fElcSQBVi8/px2XpXq6aWExy/fxXKz9W7pBoHqm/VTkfBs00JSHDKdTJDIttoXjjjRNhHx6Z5k/YG6F6ZAasusNEOGyLJgjxe1X1aW+MQ9dzOjbMLN0He63vob9v1mXS818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121529; c=relaxed/simple;
	bh=8CDetGO+wf6wYqZIC5YUwDIjZnqoRkQGXiEHkxcWWi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yq4W+ytTvt75eVC7kN4xhzleqv0MU0eZISEZmbe5FwhOQQvS9jjkpqOUtw2SLQD3WhX9yRQTSpJzzdtS2dczlU4sfL5e7HI9Rxh1PLlAfdqcE6D3eVMJ3L26RLIyvwbR+rXvrdhQL/eeYf9NTij/s0Z2N3KjKLfXmOf5ymF3EVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MHkzANJS; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MHkzANJS"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d8a00bcdso3171801cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121523; x=1790726323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5oF3nurCQ+QFDROgbfsMr6dUR727+FSjg6LodV8bBM=;
        b=MHkzANJS62tbMEU9gnOYp3Cqnankq2bCuDQIzaiuPLZuVSeUm/+4A+kMSj9MG+PUYF
         a251iGzm+Idj1Qaj6h/3U+sWu27m787YrrLoJYnhIFdTU5E9ojNG9HrrigSxEA7izkFG
         iVfEYAzOpO40e2FT12LxaBr9bKBBZH9YxMZH2D8zOarMdRpjjeNB4MHOamEFUymQHCWj
         Fuu8o339joB6Jj8DjeOqb/y0mfRq7CAMXXxSKXb9sJlylKUjC82NpmsilsyXPf1Y1ZCt
         QrKH5thuEZWfDoVXSBgYhTyq2BEBoYrBMH8cAudrELJCYybNK/+0tMEjpWb302L5JIJJ
         q5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121523; x=1790726323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5oF3nurCQ+QFDROgbfsMr6dUR727+FSjg6LodV8bBM=;
        b=nq5FMRKBbwZFVw4tj86ly883CZ92XVlbwvRFtYOWYtRlestYCRl1x4g+cRKMAjvxb6
         udgNddD+v8BtEeWKSQ9KtbkwtyodEk1oM1fBEsxx4hzqpmpvNYEcllOJeeZIfUf6xMma
         WqBSYLG104qBRWiP7aa7JaefrAUAXgUrMmT5T/3VFaTJPjf8EzajTR4Rh4gW4Jv0oMWB
         yFbLFqQbrwQ4R8E0fnNJuHWNV3q2v0bsUfA30VbmYk/S5ouQzz0pd4oJ4lOxATpqJcs7
         /jR7hz8J1EJWDuZHAqeZ1Pv+fkUdGh8jzQoofij1EfwcCImZ0mJb2AMCxAETvjZc0ezt
         KWaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVw6/VLUBostC8boSzytA8tqPAYnCh2jf3rR8T7i7/BCQKZVzEN09QuXMCznQbJJ6UQbuTQ5fjWGh7wXUi0+s=@vger.kernel.org
X-Gm-Message-State: AFuF++nh34ErHqedYZygpy+N2Uit9nUw113sc+GBUE6zShGEs+aubR75
	9bzndD+NK42nOvK3qfojf8v1CO5BdYfwxEwE+lRc1PnTGuua5uW14dTfvxOGntioXPo=
X-Gm-Gg: AYBFou3tnNhaVvCK0Bf6Qh8TscDiHiGM/eZPLwgcGTmdQuOv89yQCtd3bt/jTAq2Qyj
	qtGSyhLikciYAlbjV8Jh2TfG6ptA9t105LeY4czzjjey3e/lR9HyAUds0lXd2Ps90+lynD4U71W
	KF3LX/misW9EwSX+gg27UBtyChFtKDH5DQcFn00vn/oqz1PxWz7EjJhuY6svhN+HGegJYHMNNVd
	b7BdEZJyqv7udQ2jynCvBPUh7R2iZYA+ccos/5+1rW3s3bq0hY+YSha51C26QBQC3fvaSeFXAj7
	MHqPNRw716dXIPv3Bkm/7dwGs7GceWv1Vi0MPfGzrMpvw5BORdAwGwED1TxS8e7z7+ouemP3FGu
	Njsv8ymxvdLK9pjmtrAaXELpaQ+0NfLQ3kqlMuLaykODGTdhhxMF4Uuz/3ItXI6PQtJF6VlpCS7
	2o5tuNqsY9Wdckgd6+1it30aSiSZXzRRzTh14XSjHfqCCfnYkVSqHxnG24PcMAGY8sTwYui+jNV
	ualSbnHRd0su1gqhCR5qonhNKCUqIulEOwa53WMDOue+Q6em2hFj4tvFt+zdd6SSNdbeBAMON87
	qOMZQg==
X-Received: by 2002:ac8:7fc1:0:b0:51c:555:7dea with SMTP id d75a77b69052e-532eac6984emr21152101cf.30.1790121523008;
        Tue, 22 Sep 2026 16:58:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:42 -0700 (PDT)
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
Subject: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Date: Tue, 22 Sep 2026 19:58:25 -0400
Message-ID: <20260922235830.2350770-6-gourry@gourry.net>
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

The huge-PMD branch combines PMD validation and lock ownership with folio
filtering, splitting, aging and isolation.

Move the folio-specific work into a helper called with the PMD lock held.
Return a locked and referenced folio only when the caller must drop the PMD
lock and split it.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 70 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index b31b877c2c130..6b518f7f73651 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -394,6 +394,49 @@ static bool madvise_lru_folio_is_filtered(struct folio *folio,
 	       (pageout_anon_only && !folio_test_anon(folio));
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void madvise_cold_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		pmd_t *pmd, unsigned long addr, pmd_t orig_pmd)
+{
+	if (!pmd_young(orig_pmd))
+		return;
+
+	pmdp_invalidate(vma, addr, pmd);
+	orig_pmd = pmd_mkold(orig_pmd);
+	set_pmd_at(tlb->mm, addr, pmd, orig_pmd);
+	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
+}
+
+/* Return a locked, referenced folio only when it must be split. */
+static struct folio *
+madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
+		unsigned long addr, unsigned long next, struct mm_walk *walk,
+		struct list_head *folio_list, bool pageout_anon_only)
+{
+	const struct madvise_walk_private *private = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct folio *folio;
+
+	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
+	if (!folio || folio_is_zone_device(folio))
+		return NULL;
+	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
+		return NULL;
+
+	if (next - addr != HPAGE_PMD_SIZE) {
+		if (!folio_trylock(folio))
+			return NULL;
+		folio_get(folio);
+		return folio;
+	}
+
+	if (!private->pageout)
+		madvise_cold_pmd(private->tlb, vma, pmd, addr, orig_pmd);
+	madvise_lru_folio(folio, private->pageout, folio_list);
+	return NULL;
+}
+#endif
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -431,22 +474,11 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 			goto huge_unlock;
 		}
 
-		folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
-		if (!folio)
-			goto huge_unlock;
-
-		if (folio_is_zone_device(folio))
-			goto huge_unlock;
-
-		if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
-			goto huge_unlock;
-
-		if (next - addr != HPAGE_PMD_SIZE) {
+		folio = madvise_lru_huge_pmd_locked(pmd, orig_pmd, addr, next,
+				walk, &folio_list, pageout_anon_only);
+		if (folio) {
 			int err;
 
-			if (!folio_trylock(folio))
-				goto huge_unlock;
-			folio_get(folio);
 			spin_unlock(ptl);
 			err = split_folio(folio);
 			folio_unlock(folio);
@@ -455,16 +487,6 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 				goto regular_folio;
 			return 0;
 		}
-
-		if (!pageout && pmd_young(orig_pmd)) {
-			pmdp_invalidate(vma, addr, pmd);
-			orig_pmd = pmd_mkold(orig_pmd);
-
-			set_pmd_at(mm, addr, pmd, orig_pmd);
-			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
-		}
-
-		madvise_lru_folio(folio, pageout, &folio_list);
 huge_unlock:
 		spin_unlock(ptl);
 		if (pageout)
-- 
2.53.0-Meta

