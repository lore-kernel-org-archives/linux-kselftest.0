Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B8280CE5
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516635; cv=none; b=V41Zm+Xb4YuNIUO9d/weBMKaYNwAKuj8LyRWvHa8ZV+Q0I51W8DeN+bfbOP7HHEGJAcq70HUi+gXddd0YjpwxTm9IU2jsGDbPPclvOXBMmHDYvTZOIosdFXFZDWq681WcCdl1YkhahR4cK+qeiL7D+znfBZvDMhC8fL6lir7FDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516635; c=relaxed/simple;
	bh=nS+ihT8yiDs312RlqRcd39KPDyY9S4PRM4guYmebc9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C47rpVX6ZrN4OQpqxToQA2nHQXia0uBX4bQdpQ87rTg2vsBhHcWzG1qWddzyNDK6x9bQwW1AHeazQ+gThyyatxCRe9QRGvkc0wQ9t7B2wbYYcUiBzSYabC/0nBjYMml92EPtF788Xxa7ATKE/accmPFfUxV/iC9zRBSs3ktC1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVuhkggL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVuhkggL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc73e322dbso113438895ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 19 Jul 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516634; x=1785121434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+CN3F8GNJ49+wMCUtm6B3zkpBPb78+r1IbCrOzeLVY=;
        b=ZVuhkggLQeTrrcQo7xuaVftVKlVfYYI5NrbIaDUVtEkotIODt39SjBSVg1t1K9PImy
         nWp3qHDKz4AxCDiMxvdLhW48mFZlf6xS5varigeAgoSNeLeILOQfDkWcUfHX5JTFhnf4
         Jm0mLNnsbuxbAaOiDVI7MAQrhjNLB/HGnDIklSx43/0AGrZElQAXUtrRS5c0y7dx7VnW
         FyfREacoYQPgTFVtphHRyYFpjAUW2Vvqkv9HRhAerq9xLBwX119BonlZ3p4c0gs2KDsR
         7GWXBWUYcOdPfQkIi4DEdSKGdmt/2zDA0V6SknulidkOfQevEQIOUmFZD9Sc6RJHYVAr
         ZUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516634; x=1785121434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+CN3F8GNJ49+wMCUtm6B3zkpBPb78+r1IbCrOzeLVY=;
        b=EB7NAnwqe+VIYS1bEy4XKCy0K8a62wr1/gd6m+ZA0buhaOrBvkbohr4kdkjdC0mcvI
         +xhAcAJbq33xMDpXbxBZPvITPJURhVIYzvj5D541DyIAgdpHwFkMld5apfPfLc8MlhuW
         pE6sviIXYDTlckwByI+pbmC4w88SJbiFAeXYHMx1hh6w9Ol9sqztcHMrgjz2itur/A2I
         J1z/7RRgIUeXQZ4RuONLXv2BN/XliH5GABrd3CPWzCWG/y8Eq5A8GTv7+pZyK2Hg9/Jc
         HIZDkbhL7tPXZBiBqfV1Wa4TFTpOywFhHtuJl861yLdOY4NTufI4ez785h7KOTJxPWtb
         bnhA==
X-Forwarded-Encrypted: i=1; AHgh+RrkMx90+MmbTA4pXEZrLgY6kCSzfxFapeRBSiCJq9p8FjW2rQYbNoBY+eT8Aggc9QJUpQNFb/WFNsJgJ3SDBcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXuFB69+fNTp+lWDgl6cp04OyaM6mvu3enKnZGSujM2Cvee4u4
	K5oMdVu7QWFEh4Wc6mqmEIn6CsUrRZsovuMRJ0xxcmALbJ1Z2KWgIdHW
X-Gm-Gg: AfdE7ck8hGwoVxR05k7XtEWx0pB53bCUFl+dB3aOHhAl6h0dX8WWLbfmnHEYqPgbDy+
	VU9tiz3tBOgw4YVkcY7oAuUP3X+UeaA+kbDV/qavi7jDwSJBDl0UFA7DrOrMxllmEEC233I0aSj
	hB7dhtrIMsoZoR3UjNef3Zv59QOlF8/lN4HH6dGHAO3MLEv3Q+qY1Eqqts8A3jyWDnly2EpHeZ4
	AVSWqDYnVkzJkFIv46aX/xfY/BDqIuN24boc4jeESD/5kkEi2efKDGpITCUlvKi9vTj9MJkc6GO
	n7sLOOwJ0p87ozkqebcVREV/YMckpKsbJgPOlyE/2gXrFN42GjXZvsr0RBK8VcDFdoqwzLK/VcK
	jZZc0xESvGtMf3obwtHWlfr4CkrfVg6z2XYWR7kbn3JO4+mDE6+46jdE8vmwnadWU670nP/11kK
	wAOLtCQf5KlYy4Qs2TCOcirbUTU1A=
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr141397945ad.12.1784516633659;
        Sun, 19 Jul 2026 20:03:53 -0700 (PDT)
Received: from localhost.localdomain ([112.65.87.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344d80e6sm47783065ad.29.2026.07.19.20.03.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 20:03:53 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	npache@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	daichaobing@sangfor.com.cn,
	wangkefeng.wang@huawei.com,
	gutierrez.asier@huawei-partners.com,
	zengheng4@huawei.com,
	kasong@tencent.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	lianux.mm@gmail.com,
	lianux.wang@processmission.com,
	kunwu.chan@linux.dev
Subject: [RFC PATCH v3 2/3] mm/damon/vaddr: implement DAMOS_SPLIT handler
Date: Mon, 20 Jul 2026 11:03:26 +0800
Message-ID: <20260720030327.80153-3-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720030327.80153-1-lianux.mm@gmail.com>
References: <20260720030327.80153-1-lianux.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement DAMOS_SPLIT for the vaddr and fvaddr operations sets.  For
each large folio in the target region whose order exceeds the scheme's
order, split it down using split_folio_to_order() -- the same helper
used by truncation, migration, ksm and shmem.  No new core-mm code or
exported symbols are introduced.

split_folio_to_order() must not run under the page table lock, so the
folio is pinned (folio_trylock + folio_get), the walk is ended to drop
the page table lock, and the split runs while holding only mmap_read_lock.

The scheme's operations-layer filters are honoured, and the amount of
memory that passed those filters is reported via sz_filter_passed.



Co-developed-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Lian Wang (Processmission) <lianux.mm@gmail.com>
---
 mm/damon/vaddr.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index d10b8042adb5..a8607448584d 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) "damon-va: " fmt
 
 #include <linux/highmem.h>
+#include <linux/huge_mm.h>
 #include <linux/hugetlb.h>
 #include <linux/mman.h>
 #include <linux/mmu_notifier.h>
@@ -896,6 +897,111 @@ static unsigned long damos_va_stat(struct damon_target *target,
 	return 0;
 }
 
+/*
+ * damos_va_split() - Split large folios in a region down to @target_order
+ * using the existing split_folio_to_order().
+ *
+ * Locking: folio_walk_start() returns the folio with the page table lock
+ * held.  split_folio_to_order() must not run under the page table lock,
+ * so we pin the folio (reference + lock), end the walk to drop the page
+ * table lock, and split while holding only mmap_read_lock.
+ * split_folio_to_order() returns -EBUSY for a raced or pinned folio;
+ * we skip such folios.
+ */
+static unsigned long damos_va_split(struct damon_target *target,
+		struct damon_region *r, struct damos *s,
+		unsigned long *sz_filter_passed)
+{
+	unsigned int target_order = s->order;
+	unsigned long addr = ALIGN_DOWN(r->ar.start, PAGE_SIZE);
+	unsigned long end = r->ar.end;
+	unsigned long applied = 0;
+	struct mm_struct *mm;
+
+	mm = damon_get_mm(target);
+	if (!mm)
+		return 0;
+
+	while (addr < end) {
+		struct vm_area_struct *vma;
+		struct folio *folio;
+		struct folio_walk fw;
+		unsigned long folio_sz = 0;
+
+		if (mmap_read_lock_killable(mm))
+			break;
+
+		vma = vma_lookup(mm, addr);
+		if (!vma) {
+			/* Skip the gap to the next VMA, if any. */
+			vma = find_vma(mm, addr);
+			mmap_read_unlock(mm);
+			if (!vma || vma->vm_start >= end)
+				break;
+			addr = vma->vm_start;
+			continue;
+		}
+
+		/* Folios in these VMAs are not our business. */
+		if (vma->vm_flags & (VM_HUGETLB | VM_MIXEDMAP)) {
+			addr = vma->vm_end;
+			mmap_read_unlock(mm);
+			continue;
+		}
+
+		folio = folio_walk_start(&fw, vma, addr, 0);
+		if (!folio) {
+			mmap_read_unlock(mm);
+			addr += PAGE_SIZE;
+			continue;
+		}
+
+		folio_sz = folio_size(folio);
+
+		/*
+		 * For file-backed folios, @target_order may be below the
+		 * filesystem's minimum folio order (mapping_min_folio_order()).
+		 * split_folio_to_order() will simply fail in that case and
+		 * we skip the folio.  This is a safe no-op; future work can
+		 * adjust target_order upward like split_huge_pages_in_pid()
+		 * does when a specific filesystem needs it.
+		 */
+
+		/* Honour the scheme's operations-layer filters. */
+		if (damos_ops_has_filter(s)) {
+			if (damos_va_filter_out(s, folio, vma, addr,
+					fw.level == FW_LEVEL_PTE ? fw.ptep : NULL,
+					fw.level == FW_LEVEL_PMD ? fw.pmdp : NULL)) {
+				folio_walk_end(&fw, vma);
+				mmap_read_unlock(mm);
+				goto next;
+			}
+			*sz_filter_passed += folio_sz;
+		}
+
+		if (folio_order(folio) > target_order && folio_trylock(folio)) {
+			folio_get(folio);
+			/* Drop the page table lock before splitting. */
+			folio_walk_end(&fw, vma);
+
+			if (!split_folio_to_order(folio, target_order))
+				applied += folio_sz;
+
+			folio_unlock(folio);
+			folio_put(folio);
+		} else {
+			folio_walk_end(&fw, vma);
+		}
+		mmap_read_unlock(mm);
+next:
+		addr = ALIGN_DOWN(addr, folio_sz) + folio_sz;
+		cond_resched();
+	}
+
+	mmput(mm);
+	return applied;
+}
+
 static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 		struct damon_target *t, struct damon_region *r,
 		struct damos *scheme, unsigned long *sz_filter_passed)
@@ -926,6 +1032,8 @@ static unsigned long damon_va_apply_scheme(struct damon_ctx *ctx,
 		return damos_va_migrate(t, r, scheme, sz_filter_passed);
 	case DAMOS_STAT:
 		return damos_va_stat(t, r, scheme, sz_filter_passed);
+	case DAMOS_SPLIT:
+		return damos_va_split(t, r, scheme, sz_filter_passed);
 	default:
 		/*
 		 * DAMOS actions that are not yet supported by 'vaddr'.
