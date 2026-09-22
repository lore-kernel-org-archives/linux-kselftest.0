Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361CF53B344
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121536; cv=none; b=jyps+nV6wllkc8LHbY3IsOS2Y4dZpzkmKkKdoiThMBFq/9c8YGJxtO3rMyBrnF/Q7JXKA2xp0dve636uDjJtlXNOts/C9NjtguM2tDAY1n6Ys/AzfLP6aHmNNFn0Jcx2XQHMGlbroOebiiWuE2MayTHV4Gc8dG30YqOlHwqQVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121536; c=relaxed/simple;
	bh=mdmK36Yhyq2qbhMWTlH9S7tlgVHXySzUY+72VZaX/r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giZ4bZu0wv8SAOa17RWNkKQPiV+eMxwaAPxg9aF+3M9f4T1AUF+OAhYjwj4sSdOUrxD1rqYwiZmopcRdruHTp3YgAn1gI+YXZWIonZtVqDvM2VGGzJXInwUJrhMU4beItzOXAdvUZubGQU4pVXZdzTfUPYcaKx1YZVGyVe2BT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hRBeDa3s; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hRBeDa3s"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5308fc4b716so3170211cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121529; x=1790726329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWLbjJuQ41hy5QZZXmUfMBTlvhCx61z13QEH9bWMQto=;
        b=hRBeDa3spPlForJHccFY2fZPouvuZwfEN8x/pEG8YONm7/r8x2KiLMPDn2zicof1Rm
         PymObrlPR/jkVQbvns/da6s0cNuYn0HuuVodBkslc6nfRxOmVpE3HOmmShEE4eytA/kC
         HmH9gUZnESZy0SqSWaOBIqkzvl0ejYPzDNs5XMZ4LNVeLfHyYCUx9iNPDDyOhquBf0Wd
         retmUcR+sM5O6FruUUnLybZhuTOfnvykGv+Op0/a1bX8mUgxlreXJK2eYDbg61mWwMFx
         HsrSDtGB9HPVXntZDTXv24VK+PhfNgc/bo2qSnMYqTW2f4IOJ1/k06n3fB4vd6UDnoom
         /j/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121529; x=1790726329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWLbjJuQ41hy5QZZXmUfMBTlvhCx61z13QEH9bWMQto=;
        b=WLXJGGc8qxKS+Gt3AJzlGVurzT+rtlfU8i6EcXG5oYfEZM0MGGPwT6Im7Oelf7+Wf8
         o1MV1ddL3HoOFjlVGDjdAMVMCnztMXhWpdRzFYXYsapgvdx7RoAm87Z/5VLzJIsuDTY+
         EIdr3yryaQEpBEoHdMq/ASAXfQCice5jGuuntdR+crK5aNqRoGm3Brn9s+SDRX8+GksQ
         i5JJRXlbAk0W4Aa7tjWdoRBikWvkYVUfp6XsiiDIqS8tioVfNJ8cOkknR0jtmY8vISln
         SkH0kBUGl8eCRJukgUnjXONs9BnDSU4OL3+/pRJ5zb6mqWBMhIZ0duLiK3cx3wZwTxsp
         /Scg==
X-Forwarded-Encrypted: i=1; AKwUvBz7nHFo4rL62tmkergbyI4YsZzka89V33tL4sgzb3K31+ZeGHtojUJIMwfCxnLHOORsu99riDgObCrRh25lkKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lCXjwXI+1h5IoyLuQcJqcZeCisRVGST6D6vo90St2c/3gqYqBu
	MK5/Ms6Nlp4L6K+QZw8lkA7esIIfdJIpKd8OCXSJzG41qmNn8VqXl6CuNAyq40ic3AU=
X-Gm-Gg: AYBFou3IW3mDVBkzVSKLH9Klrufe2gP/LpMKNnv4plkuqRy7ZaJ6PZGKQEo1ynPbCjC
	DCp5VZJqWqOsv7RW6HAF8+dtoXWKrHZwUcTecrHKXqxU1T1djv17WnQsrm/Ez3i/C0BSvbn27X6
	gnxQvTKHHaPFbrg8lLoYMgPsdh6HRQg6a6ENitFcvQIj7bga99CIaz0kcXM9eVl7UHLOl9vOLRz
	gfb5dnZXKMUHP+4ARODsTpv8iUEQFeVXhwqiR5HB+ekM1EMnXA0kqV+boK+gGyU5P2S8GbbDEce
	0MEIofNJh+ja5P8jkXxjB298/K1BuZ4tW81CE7UYCHAC0zN7fisOcZ1zQm2A2fb7iDypMrGfbmb
	SomLidf1qIaEMrXrimlG2L1l8HLdH3yY00g3yrhRTfFOKsuAKZIkUn43H50DoP2KvgGGq8vvYMM
	lBMuKJtgJ6BGu6WqAc+icFE2zSkMxR33+GD8xAoPHXtZyWeKWyKis+2d+ZZzfWZTd93DsWq7zRV
	SvNYIBw6OAFGdW3OP1qb/Isy4z4JkHIYVIfpmtwlJvER2CdWFqD53sZP6sbjy5LIEgrqSA=
X-Received: by 2002:a05:622a:1345:b0:532:d202:328e with SMTP id d75a77b69052e-532ead6aaffmr19546621cf.55.1790121529209;
        Tue, 22 Sep 2026 16:58:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:48 -0700 (PDT)
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
Subject: [PATCH 08/10] mm/madvise: separate the PTL-held PTE scan
Date: Tue, 22 Sep 2026 19:58:28 -0400
Message-ID: <20260922235830.2350770-9-gourry@gourry.net>
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

The PTE loop mixes its PTL-protected scan with the surrounding lock drops
for rescheduling and large-folio splitting.

Move the scan into a helper that runs entirely under the PTE lock. It
returns a locked and referenced split candidate, or stops at the existing
scheduling boundary so the caller can drop the lock before yielding.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 66 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 350b854ccc197..e3c3acfcd9b66 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -531,6 +531,28 @@ static bool madvise_lru_huge_pmd(pmd_t *pmd, unsigned long addr,
 }
 #endif
 
+static struct folio *
+madvise_lru_pte_range_locked(pte_t *pte, unsigned long *addr,
+		unsigned long end, struct mm_walk *walk,
+		struct list_head *folio_list, bool pageout_anon_only, int *nr,
+		unsigned int *batch_count)
+{
+	struct folio *folio;
+
+	for (; *addr < end; pte += *nr, *addr += *nr * PAGE_SIZE) {
+		if (++(*batch_count) == SWAP_CLUSTER_MAX) {
+			*batch_count = 0;
+			if (need_resched())
+				return NULL;
+		}
+		folio = madvise_lru_pte_batch_locked(pte, *addr, end, walk,
+				folio_list, pageout_anon_only, nr);
+		if (folio)
+			return folio;
+	}
+	return NULL;
+}
+
 static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		unsigned long end, struct mm_walk *walk)
 {
@@ -562,36 +584,26 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 		goto out;
 	flush_tlb_batched_pending(mm);
 	lazy_mmu_mode_enable();
-	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
-		if (++batch_count == SWAP_CLUSTER_MAX) {
-			batch_count = 0;
-			if (need_resched()) {
-				lazy_mmu_mode_disable();
-				pte_unmap_unlock(start_pte, ptl);
-				cond_resched();
-				goto restart;
-			}
-		}
-
-		folio = madvise_lru_pte_batch_locked(pte, addr, end, walk,
-				&folio_list, pageout_anon_only, &nr);
-		if (!folio)
-			continue;
-
+	folio = madvise_lru_pte_range_locked(pte, &addr, end, walk,
+			&folio_list, pageout_anon_only, &nr, &batch_count);
+	if (!folio && addr < end) {
 		lazy_mmu_mode_disable();
 		pte_unmap_unlock(start_pte, ptl);
-		start_pte = NULL;
-		if (!split_folio(folio))
-			nr = 0;
-		folio_unlock(folio);
-		folio_put(folio);
-		start_pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
-		if (!start_pte)
-			break;
-		pte = start_pte;
-		flush_tlb_batched_pending(mm);
-		lazy_mmu_mode_enable();
+		cond_resched();
+		goto restart;
 	}
+	if (!folio)
+		goto out;
+
+	lazy_mmu_mode_disable();
+	pte_unmap_unlock(start_pte, ptl);
+	start_pte = NULL;
+	if (!split_folio(folio))
+		nr = 0;
+	folio_unlock(folio);
+	folio_put(folio);
+	addr += nr * PAGE_SIZE;
+	goto restart;
 
 out:
 	if (start_pte) {
-- 
2.53.0-Meta

