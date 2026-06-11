Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562FC31F9A2
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 06:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158010; cv=none; b=kMSWSeYTuOIgDnpH4LBBml24qEpyeSIIGZjnA0abuyEgcSPpx5JzQMTo3xnbR7CHNhpwiPXxXo6MHp9Zv1PZJwfOwJioK0tbgbW4dYZOg2hb5+mMNnrLjSeIlCNWnUEydkCiN3CxTo/IZzWJIPopzNoE5BNSEE4G76IrBIEQezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158010; c=relaxed/simple;
	bh=6K1KmKxftW3kJ6RH18iQHO5/hizlCzrk051fFhx3s0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZ5DATn5Dh0fX4c2lhn5vkLLq4fp8YbmzZp93tLl1423gEJM7KvyxkzmKvcvbFZb6u6Yg4keqJ4I0E61l+PnGhQpN+fnQjmMT1ko1sL0WbI4h6wEutoqszOg6ZdjrmRs1YkVsNaRFt20V8308MZevZzIJ4a91uSK+QPM6s/cnBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ftEQ4RdY; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ftEQ4RdY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781158007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VY6cPLdBFMgAfHoRWeR+QE2M/b9diN2t5Veaeaq+jOM=;
	b=ftEQ4RdY3JzZb61UAxo9N15nCfYeH1ESPtYqnyAjeynqSBo43LkPMTTqO9JcKjiEFqHWVF
	S69PLmCZYqmxG/x0wEF7QkOO2QdjEdRsGD0fs8us2gXWZ7jVGOYvplIaqm9zA46Hyvejsb
	buz1f6cyS40AP9fHbkhYLyXLvaPrPKA=
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse support
Date: Thu, 11 Jun 2026 14:06:19 +0800
Message-Id: <20260611060619.94738-1-lance.yang@linux.dev>
In-Reply-To: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
[...]
>@@ -2768,15 +2827,23 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
> 	else
> 		cc->progress += HPAGE_PMD_NR;
> 
>-	if (result == SCAN_SUCCEED) {
>-		if (present < HPAGE_PMD_NR - max_ptes_none) {
>-			result = SCAN_EXCEED_NONE_PTE;
>-			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>-		} else {
>-			result = collapse_file(mm, addr, file, start, cc, HPAGE_PMD_ORDER);
>-		}
>+	if (result != SCAN_SUCCEED)
>+		goto out;
>+
>+	if (present < HPAGE_PMD_NR - max_ptes_none) {
>+		result = SCAN_EXCEED_NONE_PTE;
>+		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>+		count_mthp_stat(HPAGE_PMD_ORDER,
>+				MTHP_STAT_COLLAPSE_EXCEED_NONE);
>+		goto out;
> 	}
> 
>+	result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);

Feels like the second 0 wants to be "swap", no?

>+	if (result == SCAN_SUCCEED && !cc->is_khugepaged) {
>+		/* If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp(). */
>+		result = SCAN_PTE_MAPPED_HUGEPAGE;
>+	}
>+out:
> 	trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result);
> 	return result;
> }
>@@ -2808,7 +2875,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
> 	mmap_read_unlock(mm);
> 	*lock_dropped = true;
> retry:
>-	result = collapse_scan_file(mm, addr, file, pgoff, cc);
>+	result = collapse_scan_file(mm, vma, addr, file, pgoff, cc);
> 
> 	/*
> 	 * For MADV_COLLAPSE, when encountering dirty pages, try to writeback,
>-- 
>2.47.3
>
>
