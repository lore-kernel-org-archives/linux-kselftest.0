Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055417A2EA
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781146046; cv=none; b=TvNZMmIiMTijcYyiocrWcHufIyevXM7MRebXQMiO7rLoRG7SROJJIux3oWBPCGk1zEKdR9KVsOfdVDXPSmXm51u9xBK6OzgYRysNAeoy2xRVy6qUWIoAb8xMrzaTIBCbAiZZYU6UEjIM5efJ1l+0H9UMRtSDQG1uw8SseImSjjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781146046; c=relaxed/simple;
	bh=mQEWrckvm4HphmuBIl1YfXsnn6HlZaXDSfu1TJ+63tM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gO2kdJxauw1DG4ztoHy4UmH2AgtrIyefdtm720Wp9kpmgkLlQ5ybbw13dAaf/ITGqQuHS5BPQ5PyHs8BijUAeH0TOWh26zAtWO9C3TdtTL5vR3mINKBFBm+jTkejmgYjgo/690OfvZp6CYMtduo6/lngBo1U8mtrypr0trr/kIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=StQ1nVUw; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="StQ1nVUw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781146042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9EUXg/9jzkqyqp4PuuzqslZeYUCH3d8eRt1rqr7ueg=;
	b=StQ1nVUwjNoPoPBt2M2i15wP5Ek9v27AAi6hKq5nJtqx+P/Y5YzF+BhppVP0KqnhjsOOEF
	6GzyjMsJ4Og+dUrBSEqbWdVjdQR3rTMeFZqiq1+a4SI/LbqIkunWWxVjm7lT375JDbgKvV
	SY2/Fo8mnot9CLLB/zJNFMjWl1paovQ=
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com
Cc: lance.yang@linux.dev,
	akpm@linux-foundation.org,
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
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse support
Date: Thu, 11 Jun 2026 10:47:06 +0800
Message-Id: <20260611024706.95748-1-lance.yang@linux.dev>
In-Reply-To: <0e431c06-b80e-4b4b-aeca-b9a0eacb6252@linux.alibaba.com>
References: <0e431c06-b80e-4b4b-aeca-b9a0eacb6252@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Thu, Jun 11, 2026 at 08:42:28AM +0800, Baolin Wang wrote:
>
>
>On 6/10/26 8:44 PM, Lance Yang wrote:
>> 
>> On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
>> [...]
>>> @@ -1512,8 +1517,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>>> 			enum scan_result ret;
>>>
>>> 			collapse_address = address + offset * PAGE_SIZE;
>>> -			ret = collapse_huge_page(mm, collapse_address, referenced,
>>> -						 unmapped, cc, order);
>>> +			if (file)
>>> +				ret = collapse_file(mm, collapse_address, file,
>>> +						start + offset, cc, order);
>>> +			else
>>> +				ret = collapse_huge_page(mm, collapse_address,
>>> +						referenced, unmapped, cc, order);
>>>
>>> 			switch (ret) {
>>> 			/* Cases where we continue to next collapse candidate */
>>> @@ -1521,6 +1530,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>>> 				collapsed += nr_ptes;
>>> 				fallthrough;
>>> 			case SCAN_PTE_MAPPED_HUGEPAGE:
>> 
>> Looks like SCAN_PTE_MAPPED_HUGEPAGE from collapse_file() get lost for
>> the PMD-order case.
>> 
>> Previously, collapse_file() returned it straight back to
>> collapse_single_pmd(), so we would run try_collapse_pte_mapped_thp().
>> 
>> Now it hits mthp_collapse() fitst, and that case just goes to
>> next_offset ...
>
>This is the expected behavior. SCAN_PTE_MAPPED_HUGEPAGE is only returned 
>when the MADV_COLLAPSE collapse succeeds. In this case, if 
>collapse_file() still returns SCAN_PTE_MAPPED_HUGEPAGE, then 
>mthp_collapse() will ultimately return SCAN_FAIL (because collapsed == 
>0), even though the MADV_COLLAPSE collapse has already succeeded.
>
>Additionally, the SCAN_PTE_MAPPED_HUGEPAGE logic is already handled in 
>collapse_scan_file(), see:
>
>result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);
>if (result == SCAN_SUCCEED && !cc->is_khugepaged) {
>         /* If MADV_COLLAPSE, adjust result to call 
>collapse_pte_mapped_thp(). */
>         result = SCAN_PTE_MAPPED_HUGEPAGE;
>}

Right, I agree for that case. The one I meant is a bit different.

I was looking at this earlier return from collapse_file():

		if (is_pmd_order(folio_order(folio))) {
			result = SCAN_PTE_MAPPED_HUGEPAGE;
			goto out_unlock;
		}

Old code let it bubble back up:

collapse_single_pmd()
  -> collapse_scan_file()
    -> collapse_file()
      -> SCAN_PTE_MAPPED_HUGEPAGE
    -> SCAN_PTE_MAPPED_HUGEPAGE
  -> try_collapse_pte_mapped_thp()

Not limited to !is_khugepaged. collapse_single_pmd() only checked the
result, then passed !cc->is_khugepaged as install_pmd.

Now the same return goes through mthp_collapse() first:

collapse_single_pmd()
  -> collapse_scan_file()
    -> mthp_collapse()
      -> collapse_file()
        -> SCAN_PTE_MAPPED_HUGEPAGE
      -> goto next_offset

So collapse_single_pmd() never sees SCAN_PTE_MAPPED_HUGEPAGE for this
case anymore. Hopefully Im not missing something here :)

Cheers, Lance
