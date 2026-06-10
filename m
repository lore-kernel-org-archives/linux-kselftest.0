Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49B405C5B
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781095486; cv=none; b=lOtl2B18deC8WxwjSYhngVJwO+WyOQgVuWpI6TFKHTSszjwRRte+lFPTt5pZdmFZD+VdMN7SRzCYbSZrtE1Hhvpq6AWiIhxOU7zxJhKPiHYndBtUDoa7n/J4F/YEVisTKx1Aw4Ik+XeNiNIbCWIKqSRH3Xv8FXHvjOlI54ePYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781095486; c=relaxed/simple;
	bh=/71fUSWRTKgBH4+4pEJ/O1jAFheHH/gxRrdczIj8DY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lq/ezCgrEfBatzpVe4sO5rGCAc9cP7qUgGdT8BNZTF4bM3OxMWDld2oAyHXs77Lyq9x2W4ZU5cpgwupcsaCdiORpaV7cT/Z6W+u3R6TGNEAS8l7u5QFDi0Kl8J2ESRIx6QLO6xZoc+RGo12SULCsG9lRUa66c3oFvsPM0W/gLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gGAqpLHi; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gGAqpLHi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781095473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hoo+J3C19/L3qqtvBUInYcwgth59RiEZ8NTdgfJnZfg=;
	b=gGAqpLHinpWJJIMY9244f7levClY2JlKxqRaam3js8ZUqYdvVO4BzvoMjdo4PEpMe8f/ik
	LTRhPWwq8lfm05w/iNz+U1AZIruvpGtRJqHjB01hEPWOt3adL6p4OCEYTREl2g/rO0Co2M
	kBSmP/e/a6a0S3mU0msPiGnFlH+lcgU=
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
Date: Wed, 10 Jun 2026 20:44:16 +0800
Message-Id: <20260610124416.46522-1-lance.yang@linux.dev>
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
>@@ -1512,8 +1517,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
> 			enum scan_result ret;
> 
> 			collapse_address = address + offset * PAGE_SIZE;
>-			ret = collapse_huge_page(mm, collapse_address, referenced,
>-						 unmapped, cc, order);
>+			if (file)
>+				ret = collapse_file(mm, collapse_address, file,
>+						start + offset, cc, order);
>+			else
>+				ret = collapse_huge_page(mm, collapse_address,
>+						referenced, unmapped, cc, order);
> 
> 			switch (ret) {
> 			/* Cases where we continue to next collapse candidate */
>@@ -1521,6 +1530,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
> 				collapsed += nr_ptes;
> 				fallthrough;
> 			case SCAN_PTE_MAPPED_HUGEPAGE:

Looks like SCAN_PTE_MAPPED_HUGEPAGE from collapse_file() get lost for
the PMD-order case.

Previously, collapse_file() returned it straight back to
collapse_single_pmd(), so we would run try_collapse_pte_mapped_thp().

Now it hits mthp_collapse() fitst, and that case just goes to
next_offset ...

>+			case SCAN_PAGE_COMPOUND:
> 				goto next_offset;
> 			/* Cases where lower orders might still succeed */
> 			case SCAN_ALLOC_HUGE_PAGE_FAIL:
[...]

Cheers, Lance
