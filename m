Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D393CAA5D;
	Thu, 11 Jun 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176542; cv=none; b=Oaw25cUNiosTOgtIr45gpjXBVUwIs/h0qIl/HZeBqfc4DYtVwp1mDfUAYccR6zTFOGxZ5CtvqS+yPauZErUraAm+o6f1a+ZpqD7jBjWsyliSbQgeNdKi7YYpwaftCwe2mIadWSmZHBXOvVzIfmV3x6kZEZ/7q3nIdwlciNnrXDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176542; c=relaxed/simple;
	bh=v+c6BgdkiM9JNllPDOWMLaoNENYUQ1FjsBaI8FQ/2ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kaHfDC1sACGOXlyWS2JoLlhViSe71XJYsCc9fIVY5VHjoQ+z3LsqSODZwarwip7t28AwZ/wpzy7yx/YVinxB99Jd1rvO1zhXIp0msNBxTkcW9rxyurVORan6RdMz4qgViOIh2x5neoI6PTRnTUQuDmv9iDmSzdwOe34EeHBPK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uvrm35v8; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uvrm35v8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781176537; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=yVOs9G7BhFCl2zXLY/E4s+NW4ToSbs9i+XEVCpRkH/s=;
	b=uvrm35v8wZ04KuyY5Bsxk5oi2AcLI/b3k0YI6zZqIQrVj42j0o3LzJGMEx4+voHWlgjr+S7dU/hr9kmAVk5HDzrZEXwl7MjJfbREbRK23bEkky/QOAuPTifNMWiQm/jMMYwNZHE10OtDz9zTE0iuht0BRJdLS4wRyCqYCFrjhOQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4dXY1r_1781176535;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4dXY1r_1781176535 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 19:15:35 +0800
Message-ID: <4292a25b-5707-401c-9c8d-2210a165ea7c@linux.alibaba.com>
Date: Thu, 11 Jun 2026 19:15:33 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse
 support
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <0e431c06-b80e-4b4b-aeca-b9a0eacb6252@linux.alibaba.com>
 <20260611024706.95748-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260611024706.95748-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/26 10:47 AM, Lance Yang wrote:
> 
> On Thu, Jun 11, 2026 at 08:42:28AM +0800, Baolin Wang wrote:
>>
>>
>> On 6/10/26 8:44 PM, Lance Yang wrote:
>>>
>>> On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
>>> [...]
>>>> @@ -1512,8 +1517,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>>>> 			enum scan_result ret;
>>>>
>>>> 			collapse_address = address + offset * PAGE_SIZE;
>>>> -			ret = collapse_huge_page(mm, collapse_address, referenced,
>>>> -						 unmapped, cc, order);
>>>> +			if (file)
>>>> +				ret = collapse_file(mm, collapse_address, file,
>>>> +						start + offset, cc, order);
>>>> +			else
>>>> +				ret = collapse_huge_page(mm, collapse_address,
>>>> +						referenced, unmapped, cc, order);
>>>>
>>>> 			switch (ret) {
>>>> 			/* Cases where we continue to next collapse candidate */
>>>> @@ -1521,6 +1530,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>>>> 				collapsed += nr_ptes;
>>>> 				fallthrough;
>>>> 			case SCAN_PTE_MAPPED_HUGEPAGE:
>>>
>>> Looks like SCAN_PTE_MAPPED_HUGEPAGE from collapse_file() get lost for
>>> the PMD-order case.
>>>
>>> Previously, collapse_file() returned it straight back to
>>> collapse_single_pmd(), so we would run try_collapse_pte_mapped_thp().
>>>
>>> Now it hits mthp_collapse() fitst, and that case just goes to
>>> next_offset ...
>>
>> This is the expected behavior. SCAN_PTE_MAPPED_HUGEPAGE is only returned
>> when the MADV_COLLAPSE collapse succeeds. In this case, if
>> collapse_file() still returns SCAN_PTE_MAPPED_HUGEPAGE, then
>> mthp_collapse() will ultimately return SCAN_FAIL (because collapsed ==
>> 0), even though the MADV_COLLAPSE collapse has already succeeded.
>>
>> Additionally, the SCAN_PTE_MAPPED_HUGEPAGE logic is already handled in
>> collapse_scan_file(), see:
>>
>> result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);
>> if (result == SCAN_SUCCEED && !cc->is_khugepaged) {
>>          /* If MADV_COLLAPSE, adjust result to call
>> collapse_pte_mapped_thp(). */
>>          result = SCAN_PTE_MAPPED_HUGEPAGE;
>> }
> 
> Right, I agree for that case. The one I meant is a bit different.
> 
> I was looking at this earlier return from collapse_file():
> 
> 		if (is_pmd_order(folio_order(folio))) {
> 			result = SCAN_PTE_MAPPED_HUGEPAGE;
> 			goto out_unlock;
> 		}
> 
> Old code let it bubble back up:
> 
> collapse_single_pmd()
>    -> collapse_scan_file()
>      -> collapse_file()
>        -> SCAN_PTE_MAPPED_HUGEPAGE
>      -> SCAN_PTE_MAPPED_HUGEPAGE
>    -> try_collapse_pte_mapped_thp()
> 
> Not limited to !is_khugepaged. collapse_single_pmd() only checked the
> result, then passed !cc->is_khugepaged as install_pmd.
> 
> Now the same return goes through mthp_collapse() first:
> 
> collapse_single_pmd()
>    -> collapse_scan_file()
>      -> mthp_collapse()
>        -> collapse_file()
>          -> SCAN_PTE_MAPPED_HUGEPAGE
>        -> goto next_offset
> 
> So collapse_single_pmd() never sees SCAN_PTE_MAPPED_HUGEPAGE for this
> case anymore. Hopefully Im not missing something here :)

Yes, you are right. I missed this case. Will fix. Thanks.
