Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98E3597B;
	Thu, 11 Jun 2026 00:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781138557; cv=none; b=DcjhESr97G5VEKR1Cqi8yTZ0gzf/tnIq5qSKxvRdTALYs5c3MVSrDLN5Fkcb4YDwAJHFzP0tLqdFGRAhFxVowSdAlu9tNTV8e5wSJmjfD2pFcb+Ls06x/OSXrtUY6gcGoxCe1X841VMBqBnCn9MIjq9EW3fhBjZpVF96aZC+2Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781138557; c=relaxed/simple;
	bh=LbQqmoTmQ2NpHQXTGIaU8lzBx39/99OS2towVW2E72A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsWdSv1qYGTpGdL4PGZQIBEDkqZPzcBXg0TmSEVV11at1P+/AXDNXZRT8AHVQNbcH+BOKR3Rnb7b+FYObvgFn0AQrL9LjPs2nZ8oiM9cuKOrSoZIJ47DURIUKiXvLH23hDPfAFR24JEb3qKheCmZ2F+DG5YB0KGgDBhnCWd50wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bEibuqF8; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bEibuqF8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781138552; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=HPg16XQYQxUB6l1l5BG3Hl3GFHniv7jaa+CBSQKftD4=;
	b=bEibuqF8ceRNvZcUyQ8n4oqOm4sa8Bd0N/GJm8ys5Jpkqj/f+CjBghOfDqLC0QaZBjKmklNq404RqPOkzPnRZfYbj2G+wVjaT0d9dFygfaa7JRXVpC4Czh+v7t4GSrK+JrnwV3Y6kEiwZiCn6dz1TPa3k1B6T6zgFOcBwMSfAMo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4bqKN2_1781138549;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4bqKN2_1781138549 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 08:42:30 +0800
Message-ID: <0e431c06-b80e-4b4b-aeca-b9a0eacb6252@linux.alibaba.com>
Date: Thu, 11 Jun 2026 08:42:28 +0800
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
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260610124416.46522-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260610124416.46522-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/26 8:44 PM, Lance Yang wrote:
> 
> On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
> [...]
>> @@ -1512,8 +1517,12 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>> 			enum scan_result ret;
>>
>> 			collapse_address = address + offset * PAGE_SIZE;
>> -			ret = collapse_huge_page(mm, collapse_address, referenced,
>> -						 unmapped, cc, order);
>> +			if (file)
>> +				ret = collapse_file(mm, collapse_address, file,
>> +						start + offset, cc, order);
>> +			else
>> +				ret = collapse_huge_page(mm, collapse_address,
>> +						referenced, unmapped, cc, order);
>>
>> 			switch (ret) {
>> 			/* Cases where we continue to next collapse candidate */
>> @@ -1521,6 +1530,7 @@ static enum scan_result mthp_collapse(struct mm_struct *mm,
>> 				collapsed += nr_ptes;
>> 				fallthrough;
>> 			case SCAN_PTE_MAPPED_HUGEPAGE:
> 
> Looks like SCAN_PTE_MAPPED_HUGEPAGE from collapse_file() get lost for
> the PMD-order case.
> 
> Previously, collapse_file() returned it straight back to
> collapse_single_pmd(), so we would run try_collapse_pte_mapped_thp().
> 
> Now it hits mthp_collapse() fitst, and that case just goes to
> next_offset ...

This is the expected behavior. SCAN_PTE_MAPPED_HUGEPAGE is only returned 
when the MADV_COLLAPSE collapse succeeds. In this case, if 
collapse_file() still returns SCAN_PTE_MAPPED_HUGEPAGE, then 
mthp_collapse() will ultimately return SCAN_FAIL (because collapsed == 
0), even though the MADV_COLLAPSE collapse has already succeeded.

Additionally, the SCAN_PTE_MAPPED_HUGEPAGE logic is already handled in 
collapse_scan_file(), see:

result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);
if (result == SCAN_SUCCEED && !cc->is_khugepaged) {
         /* If MADV_COLLAPSE, adjust result to call 
collapse_pte_mapped_thp(). */
         result = SCAN_PTE_MAPPED_HUGEPAGE;
}
