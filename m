Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4263D8121
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669178; cv=none; b=e5IqFNBgp07Ia77EI5PbTKN447YWnv3lQ0SqSXQEVZ5i96lBN2m5DvAe9BVBYo2HZsH9DnVUjASdGb/hHwTsLWXCq5iz0Hbfesx4vREQaWKXSYINu4cWTFjuIvIzDyF9iqXDcGO6pMNkwRFTki5XkmHj5MnyBqbMfBgeg3hh0F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669178; c=relaxed/simple;
	bh=J3QZtuvE1lZ2QUWb/3XDrQaTozqcK1lsZfxrtY+rULk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KCs6GPm7q+HTYfBsD00b+7Fgn7I8vYpj0MhiMokG5rkJY6oU4KiHAhASYDrnV1d6fIi3hqlPDSHOQPMoAmbYikGK0zTF6r6gia/vGHMsCMsF/RxVqAvsVxqSvHUDjf4VnWynZsMYk7fFiWDwYknU50cEcOC/dWrUPibss0VOCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sH55dldc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sH55dldc"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b24308165dso2347855ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775669176; x=1776273976; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXBGnJ08RM3Dn6KYmVg3dZVgKAKRqoAR1kz7qqbY2VI=;
        b=sH55dldcsbWWuQDNHOOpviRIKYm9vXnAu9N36DbZGgujjMh7sK7jlLQvkMNeuLNoNo
         hG/Wab+3qaabwMTR5/oXKkSQnx9pHPUPxObcrP99E2uJ7lWU8lYGQEFKIVSv+2r4Xn5w
         GF+l3/eRgA0iVdzfsEa61beAzDKS30GkW042HXZGmxpgV4UCp0JsztLSjh07dVmVZGGo
         fuVBLzqyioGTx2ipvwBsxsmig8aZhysjXzBJwAVKW3J/idzKLNQTLxlNTmk+drkLqLQr
         ThWxOxLGmFQ8mumYkjxjhiG8d5i+QHsG69CLsV2req7dUztpkA0kpIRzxOeL0O+6rBUq
         lrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775669176; x=1776273976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cXBGnJ08RM3Dn6KYmVg3dZVgKAKRqoAR1kz7qqbY2VI=;
        b=MZej82JGPSVM9Bvc4+NEH/ADCxaAmwHeKgD2sZjO7jwAmyZbkLAVn4tu+9GiG9+fSb
         dvQPQA6fWDwBrjL2sS6n5lfHoxC4em01IX4DuNNFzmG+6ZpnxKyr3NDUBWnoOb60fnhP
         YOIzDRipqza7Cr2BYghzRvLQn2dIRXUnnnJyuQNErGNUKlmGmVkqr123Z3k5snNVhQCp
         VZ5N1Dy4Lu6zPTZEXsvVTfao8kJdp6sXLVJOrZ5DsNh6lCNCPcuGLWEw384dDdYRD3I1
         W7vsfDsNDcE0/Fwar2ZFALEClvsATp1GNQf2U0SJ0xQtZz5RzukfJlfiJjagHOW89y/+
         ne+w==
X-Forwarded-Encrypted: i=1; AJvYcCW4SSEGegin3ujqGN+9jTFasKdu0c1L84lSbTLpc+Yl8cZMJuv2q4jR3XNI33wHOIMqNFV7UCv9en/uvJuRFjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1eoENCK9PmdWg5Y1toilFvsNY+J807N8C/xwYJ/tBO+9B54j
	yG6mtkT4Aj5qB2+VvOstppxkTJxgteQ3i6fCazStnFgrzaXiIP1r+AgXCH1G2bS2D0tqBbKJ159
	CgvYlIQ==
X-Received: from pllo16.prod.google.com ([2002:a17:902:7790:b0:2b2:4331:5552])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3803:b0:2b2:4f43:b48c
 with SMTP id d9443c01a7336-2b2c7267313mr3087985ad.14.1775669176229; Wed, 08
 Apr 2026 10:26:16 -0700 (PDT)
Date: Wed, 08 Apr 2026 17:24:45 +0000
In-Reply-To: <20260408-memory-failure-mf-delayed-fix-rfc-v3-v3-0-718f45eb7c75@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-memory-failure-mf-delayed-fix-rfc-v3-v3-0-718f45eb7c75@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775669168; l=1543;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=J3QZtuvE1lZ2QUWb/3XDrQaTozqcK1lsZfxrtY+rULk=; b=ohyQXWxRZGPECeCqTFjtef8YZ+umakzibuW5apwDb2InHSLTkMGXhbBkBw+FaeA7lKNULxCbB
 XrJMn2cS9cmBHmXTKCX/+Omh2q/h6zyDLPCi7ZuJE70grdI7shFL2Gm
X-Mailer: b4 0.14.3
Message-ID: <20260408-memory-failure-mf-delayed-fix-rfc-v3-v3-4-718f45eb7c75@google.com>
Subject: [PATCH RFC v3 4/7] mm: memory_failure: Generalize extra_pins handling
 to all MF_DELAYED cases
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

Generalize extra_pins handling to all MF_DELAYED cases not only
shmem_mapping.

If MF_DELAYED is returned, the filemap continues to hold refcounts on the
folio. Hence, take that into account when checking for extra refcounts.

As clarified in an earlier patch, a return value of MF_DELAYED implies that
the page still has elevated refcounts. Hence, set extra_pins to true if the
return value is MF_DELAYED. This is aligned with the implementation in
me_swapcache_dirty(), where, if a folio is still in the swap cache, ret is
set to MF_DELAYED and extra_pins is set to true.

Signed-off-by: Lisa Wang <wyihan@google.com>
---
 mm/memory-failure.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index fd9ed2cd761d..d6628ad114a5 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1052,18 +1052,14 @@ static int me_pagecache_clean(struct page_state *ps, struct page *p)
 		goto out;
 	}
 
-	/*
-	 * The shmem page is kept in page cache instead of truncating
-	 * so is expected to have an extra refcount after error-handling.
-	 */
-	extra_pins = shmem_mapping(mapping);
-
 	/*
 	 * Truncation is a bit tricky. Enable it per file system for now.
 	 *
 	 * Open: to take i_rwsem or not for this? Right now we don't.
 	 */
 	ret = truncate_error_folio(folio, page_to_pfn(p), mapping);
+
+	extra_pins = ret == MF_DELAYED;
 	if (has_extra_refcount(ps, p, extra_pins))
 		ret = MF_FAILED;
 

-- 
2.53.0.1213.gd9a14994de-goog

