Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD64E0203
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121522; cv=none; b=gJE7x2kelqhsUrDCzPuj7Vk++s2AtS1HcNiviY/tJtikotpU+LRM+JaE2Uo86rog46Oqoqk3tBDHL05VWm7cYvvDiYBHL3g8qRwFDhYYQhNZ8k7J9tG4cOwVm6DKRAmhUUUguJ5wi7eURekvDNguuQzqcJY/obcRcIpkm3uhaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121522; c=relaxed/simple;
	bh=EK7vI9KcRnwekK8Ynl1zk9PVNmfiyEBbTFnZNQww8Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0DHO5wI4XVMCGpHmRo8OqrgfcfFZpN5TzHEJNFL5j81LP6IdhWhCvCiu0c+GNzlYpOUuf+GM1P+KvYVFFrah/emQaSvfPwWdMWCAzdoQRlMEn3q4PsvcHyvI1oCzFojdqql1F69Xv97/xGMvLIGDeMRE7YU9Vav+ITlppeaL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=kuchFlsf; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="kuchFlsf"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so4817831cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121518; x=1790726318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv67mS8beABpbmQAZ394RKqHc9TebilH66SXRMDKuYM=;
        b=kuchFlsfo8e/wdQdQUZBvc3/ALkKndlwQhowxd4RKdio+DBMgYD3jA/8H9dEnv+Woj
         E+77CsEAjJ1TMzuUwX+9BAsx0pMgkpTXufqGa1e0s6XwZVEGpdmmO4RHudb9M47V+cAe
         CtujIHn1BZ/Jlz5ISZB1ZPwEWLvg1xz7bxBJ16CjRIcwvOD82AtqGKuAjgc+lmgOWKtl
         PiM7gvCHrbAnqaTx5e+UUjmqyjDKsUyTMgy1ckmlNhJDQaUpbeMGpXle8+jdS1q7UN1Z
         tH5I6dpQ4Ayw/OPelgRMxfaZSk3Qv3nfUBPE+hoPv61xcSonF+ZV/ssQRb2H4AKiMYqE
         p1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121518; x=1790726318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cv67mS8beABpbmQAZ394RKqHc9TebilH66SXRMDKuYM=;
        b=2rB0BcnKlddQ2lMDg389rSA6ClhbzCNYyGUpDc8w/2qRz1dgR4njjF5Y9Sk2z/mGpC
         New1I+ldoz6gulBmvP7PEOZnBb30ORDL0wblbR4czn1rZd41x9XitjC1yBh4c5ScC5xH
         3XETNQJ+a0+hroBkdYBgWpnxhBKlMAMsQ5sFIRuY6h2B1v081KlLk+OM4ztsk+thS1oy
         BT9kGShYLm8AwjeJ7Z74jS707BhiQ+BJznZf6IJPnBpNkCwDBj8n8WiEzvUF5N+XRHI+
         min3PBWhGzEl/G8Iu+fhHmplkQfEW/T48Ep7lm3jCZ6Ntt1h9ViFrHYz5C7GkdTrU+Ev
         xROw==
X-Forwarded-Encrypted: i=1; AKwUvBxBWqvAfFKthYsux9sE0PyjxjPMjNsImuX+zaU+s+2xcf0yF4pQf3L5sL/LaIRegzGzS8M/OBZ9GCRT9/Vq7JU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7B8UX7xZU0+eZSurN10uwJN/GN6upOK++3VwcxItqeztwVpQU
	qGFGtP4v0AT+v+WTzavzWbtNM9KZrTiotPKf3Wd24bO20EsYOU+oG1Uaxg4QvmUEe2I=
X-Gm-Gg: AYBFou3V6vWe4Nz6Qn7ZQ7gRomNUPwawIopAG5Iq6pfYGLbuX6uTGmmji7fSsvOkqju
	y2JcN4/EADcc4d/oFV8mL+fFEf/6WZ4tyIl5e3hzrhIUQuvVFplCtDSIa2cH14GpMgKaUo1TLsZ
	kdpaVf8nHxhR1Fi62x2xu7YKzHulNLsafQ3IVVniY+B2H/T7rZALfv3dUAfAUmB8SGxUepoC6Iw
	83uh3kLYA1JWIPB91W+N0jN7YvFWXZ4cpLzdiuwgydzjqipGK30lShqWjalvsiCa/ES6CwR5nrt
	tGFwFiT2KCnyd/C4saUTmR7ORHjJ7LTwypWMsE8CB/QtpTXt6e9TueIKtteJphNokIcT8Nxmyem
	gMARR4O677gul6UulJ/b79I9mVCHrLWxnpsvO1nGb3YzsO4A7mSbzU7ycMDVVxlrovGDiq/4qng
	w9I8P2geaxSrhs5jpDfOcbF31DYLdLd2MYLCfQITZTQKld2xwk4XzTdKeEGCUMDUww9ck66avWo
	YA1GtQ8KPvsU+hiVpwAz+dkcBkVjIpfycJkvMouwLztV/BuCZ7sMNkntLD9
X-Received: by 2002:a05:622a:6101:b0:532:b08b:45cd with SMTP id d75a77b69052e-532eacd610fmr16957421cf.31.1790121517717;
        Tue, 22 Sep 2026 16:58:37 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:36 -0700 (PDT)
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
Subject: [PATCH 02/10] mm/madvise: name the shared LRU PMD callback
Date: Tue, 22 Sep 2026 19:58:22 -0400
Message-ID: <20260922235830.2350770-3-gourry@gourry.net>
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

The MADV_COLD and MADV_PAGEOUT page-walk callback is named after its PTE
implementation even though it is registered as a PMD callback and serves
both LRU operations.

Rename it to madvise_lru_pmd_entry() before separating the PMD and PTE
paths.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 00b1be655a8b5..83d54ab385da8 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -361,9 +361,8 @@ static inline int madvise_folio_pte_batch(unsigned long addr, unsigned long end,
 				     FPB_MERGE_YOUNG_DIRTY);
 }
 
-static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
-				unsigned long addr, unsigned long end,
-				struct mm_walk *walk)
+static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
+		unsigned long end, struct mm_walk *walk)
 {
 	struct madvise_walk_private *private = walk->private;
 	struct mmu_gather *tlb = private->tlb;
@@ -581,7 +580,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
 }
 
 static const struct mm_walk_ops cold_walk_ops = {
-	.pmd_entry = madvise_cold_or_pageout_pte_range,
+	.pmd_entry = madvise_lru_pmd_entry,
 	.walk_lock = PGWALK_RDLOCK,
 };
 
-- 
2.53.0-Meta

