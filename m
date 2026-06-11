Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA1136F427
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 04:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154002; cv=none; b=hyDLYCL8tTA7ge+zAE+zAQkqQmc4LH+tLbvxBRoAPDc0H6ZhDmsupIL/R3xU554lnAWZ+jIRWWuwEN1gpDvr0aRr/g9zXJNGvEjpDaIic6GUV16WcoB7dDYDb1ZDOJOe0Q6mlOV5sI3rmhouRDB7OoLVK/jtsuDjiVkCjhL5vJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154002; c=relaxed/simple;
	bh=qNgZVSHO6L9PQdPnsf1V8V9TLY5bmZfTt0JvJbqm4Nk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bp18dD67Q0/iUOsGDYfg9WqMTbI0a1Ii/S8g2kRetdSgZ3Z+thiHUa7CApxp/YOPko3WwnLe4VGr2ZbwY4FuROA5rjci39pNzFlEI1L6J7WJuW8zS3QQzuIj/JHCOhpPirvxL16euSx6V7pm0la/mPT0BBCAZm6TCconsgs7ve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xVX77qgz; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xVX77qgz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781153986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olVhfg3NEWpQLGN9PkoN1WiRMMqgtasFHpPNFq+p3/Q=;
	b=xVX77qgzzWpB2dtGel2aOvtMbqt0SvebFBcvCIySMMutTS4cLsb27X1Ygp9iUvEZRiDeG9
	XDZPDpn9RB2qwVHRMe2W03ZegyAu8dnQk2h8d3K18Ae+pTCLWvuUakWdym7gbhPt7hiAYm
	cWVUoDuAQ4jlrxrL//sg4vMVkkNzj9Q=
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
Subject: Re: [RFC PATCH v2 07/11] mm: khugepaged: skip large folios that don't need to be collapsed
Date: Thu, 11 Jun 2026 12:59:25 +0800
Message-Id: <20260611045925.36457-1-lance.yang@linux.dev>
In-Reply-To: <9e05e5ca589e1156f75078951efe874118f88587.1781083630.git.baolin.wang@linux.alibaba.com>
References: <9e05e5ca589e1156f75078951efe874118f88587.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Wed, Jun 10, 2026 at 06:29:15PM +0800, Baolin Wang wrote:
[...]
>@@ -2843,6 +2853,11 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
> 		goto out;
> 	}
> 
>+	if (bitmap_empty(cc->mthp_present_ptes, MAX_PTRS_PER_PTE)) {
>+		result = SCAN_FAIL;
>+		goto out;
>+	}

This check seems to jump the gun a bit for MADV_COLLAPSE ...

shmem swap entries only bump "swap" during the scan in
collapse_scan_file():

		if (xa_is_value(folio)) {
			swap += 1 << xas_get_order(&xas);
			if (swap > max_ptes_swap) {
				result = SCAN_EXCEED_SWAP_PTE;
				count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
				break;
			}
			continue;
		}

Holes don't set the bitmap either. They just show up later through the
"present" check:

	if (present < HPAGE_PMD_NR - max_ptes_none) {
		result = SCAN_EXCEED_NONE_PTE;
		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
		count_mthp_stat(HPAGE_PMD_ORDER,
				MTHP_STAT_COLLAPSE_EXCEED_NONE);
		goto out;
	}

For MADV_COLLAPSE, both max_ptes_none and max_ptes_swap are HPAGE_PMD_NR,
so those checks still let this through.

So now we bail with SCAN_FAIL before collapse_file() ever sees the case,
even though that code still handles both: swap via shmem_get_folio(),
holes via nr_none.

Am I reading that right? If so, looks like a regression ...

>+
> 	result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);
> 	if (result == SCAN_SUCCEED && !cc->is_khugepaged) {
> 		/* If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp(). */
>-- 
>2.47.3
>

Cheers, Lance
