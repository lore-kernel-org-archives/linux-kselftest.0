Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB12D408229
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 23:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963062; cv=none; b=NPIUGvUaZ4cjMVN1e3JptAzIk5ntPu4icCLDmBE4rliLynPuvUAtCCo3txabSMMb8OE0AsvMq7NKJNIxzSwHR+91vDDWIbRmL6xMolQlPbOccZubKWkCfONs/CpNwapP3OxcbMFw6HeWJZ+STwUHOBcevMdq3Q4likckAdfGc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963062; c=relaxed/simple;
	bh=zHitcA41pFBEUJ383H8n8swfI4BJin4muVKIFkkU2XU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s5Rnhr4VFDARGDlOVAJa1HdXw1IkhFvz8HVnPgNJIsX5m+tLbhrJqEl+r5ETBJlfJqCszQXMLQ0+T0jHcP83iWB8lkKtbSGX5lqMb0/GIz+PRRrBpzQFQG/m2MhHeFPuWlIeCuzQKVFof5v/jljVGKsqXDuUtO3VOixTcPum3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZIFPnV6n; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZIFPnV6n"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354bc535546so94082a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773963061; x=1774567861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTc9DooR/2VPop6AXcvWPH42yPmf9OOMr5Mq1SUAhF8=;
        b=ZIFPnV6nmfhkxRoHm5zCORUYJWL+IprrPqQKD+F53fyZx/KDWk5IUOd/bvE1QefhCr
         f/FlMB4sOwyHjD8dM7ngB9/Ew/nXm1q0a11PTd+TtatXEjLVgSLyFfHpKAxIvWx228le
         HXjNCN1uQ5JZLkfqLng9Nr7XDp/0FDatfzkFCK8MZWYwuhafPOZY51ff2QAsLKKwGeNm
         4uuALBqy8TjPbpC94E3kq7AnFCEahx4R/xTlJpCcH6aMcDaS8t5wumqbMe5OXgFkoNUm
         5gZoDQyW2t3GIkpujoXMMjfax2aJsDnuusDLasxQfq5VKBliMKxAVGjifgMNXApneI2R
         M/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773963061; x=1774567861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTc9DooR/2VPop6AXcvWPH42yPmf9OOMr5Mq1SUAhF8=;
        b=REp5bR4O53yN9MxXQGDoWt311zT0ItD1zeXkE8PXinmYRXgT/Rx1lnDdrrKoNrbXKF
         wEFfhjRZNQpRlm7QZLhseQBhY49UfzsSkvhM1UMMefdn+ghpch/c2gwa0foi1gpGacUI
         ZwZHMLfyRZjvfx4OshkLyBxigcvAY6//Y4bKHv4mmJ65RG4j6/BhwynRbun/K0QOKOap
         UpgYzFHAhk2Fl43VYY7o5s51OZPzmeF+qEo4MrUMv2kEBGg21wPWEf5KCSewSeaBOjJ3
         zsKi8WoRELLDids0c0RntQvjJmDaL1KvWBd5vFjgvsAB5nA5izWywGw+kQlBczIjkDf6
         NEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW82HOTfjNU+eR1J7gWuo2tHSeQ2IS1DB7OG9cegPjKUJ7u1q5uzcRX8m+Jtwja3sxZpm8JY2LAfEP+W/dKYlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgizHPGGz/ZlW67GtajMuSTgXDfnB/Efn2tfXtUdWYiltDarin
	1y6s2kz5xuR+Bam+9NxdnbOwWxzBf9rukPx62qhME27am8pYiZAmwF97L073CwBsCQXEylebCKm
	tQUT2Kw==
X-Received: from pjbgz11.prod.google.com ([2002:a17:90b:ecb:b0:35a:624:7b40])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5405:b0:35b:9397:7073
 with SMTP id 98e67ed59e1d1-35bd2d668admr547168a91.30.1773963061106; Thu, 19
 Mar 2026 16:31:01 -0700 (PDT)
Date: Thu, 19 Mar 2026 23:30:31 +0000
In-Reply-To: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773963053; l=1542;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=zHitcA41pFBEUJ383H8n8swfI4BJin4muVKIFkkU2XU=; b=55H40VUL7GxMofCPXgAP+Uk3iLTL72SaLmREsmblKKl9G+ZOSJY8iKHX8YOxAFgnJqdH5XZzf
 fXaJWZTbAZmDgPciWDasEHmQx7TAolEylUlNZ3mq/X9WXooK2QChYEc
X-Mailer: b4 0.14.3
Message-ID: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-4-92c596402a7a@google.com>
Subject: [PATCH RFC v2 4/7] mm: memory_failure: Generalize extra_pins handling
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
index 57f7762e7418..86b6f7ba5d3a 100644
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
2.53.0.959.g497ff81fa9-goog

