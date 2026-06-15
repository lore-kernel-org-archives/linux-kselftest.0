Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8A2BE639;
	Mon, 15 Jun 2026 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505595; cv=none; b=Kl5dOU4Tj7GNCttZbj0upeQgs4oAMzpY8V3jTCSXjC9UGfMO1A3HWgFdcUdoSPS7FmArPqX+KUlZi1y3AJcPv0XQF8m7IJt6lUuJpm4qoz3RJ0k9bRhzW4/OX5rJHfvFG1iXWkxqZD1FNJSIK0ZeOkMhEYjLOGsdckz/gCtrthU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505595; c=relaxed/simple;
	bh=YXXZhbw39gDfUOa4pQH5j/YRIYVy6M5TppmAz/6jfVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7RnjouEr+6PsiBeVm5X5MYQHaJdYu5BnZT9CR6KcoybGVqHCAkhWKqK1XDlsE3e3RxFQ7DVNvofsk1eY2rx/EbliSWcVOUH+KIyxsr3axhsNEQajXXhkw80uo8DjA8G5mTApwz7/LlvI1I+nGtTo5ktvLzUsMEFphB+P0dTKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UCvHM2Vh; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UCvHM2Vh"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781505584; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hY8+k6kcJNKwzCIC9WhJ1T70bUQwv+uxIXjEOx4iuEY=;
	b=UCvHM2VhAcjUfBtcdCzPEH/vFbBK/WR4JHRD41J40+HwkS2BPxHhhxtNM/DpkugTf6IHeJBrYJPoLQYeaNgiGPcuAJFsitUwFkoCARZLGywtleB/RXPr+/m+t8pbEmtY+8esEATJDdUFA/mT1rzhTAxcGu3FhIPxMCSFperG6+g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4qIdAG_1781505581;
Received: from 30.74.144.140(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4qIdAG_1781505581 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Jun 2026 14:39:42 +0800
Message-ID: <3a724359-b80f-4344-9a01-74c9f1459503@linux.alibaba.com>
Date: Mon, 15 Jun 2026 14:39:40 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/11] mm: khugepaged: generalize collapse_file()
 for shmem mTHP support
To: Nico Pache <npache@redhat.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com
Cc: willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <1274846e121e74f8db53950bec64f8f1938f2ec9.1781083630.git.baolin.wang@linux.alibaba.com>
 <5eba8380-6fbc-4c0d-b267-cd39c24ffeea@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <5eba8380-6fbc-4c0d-b267-cd39c24ffeea@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/26 6:16 PM, Nico Pache wrote:
> 
> 
> On 6/10/26 4:29 AM, Baolin Wang wrote:
>> Generalize the order of the collapse_file() function to support future
>> shmem mTHP collapse.
>>
>> No functional changes in this patch.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   mm/khugepaged.c | 27 +++++++++++++++------------
>>   1 file changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 631459172e19..4adc8c6de062 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2214,6 +2214,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
>>    * @file: file that collapse on
>>    * @start: collapse start address
>>    * @cc: collapse context and scratchpad
>> + * @order: folio order being collapsed to
>>    *
>>    * Basic scheme is simple, details are more complex:
>>    *  - allocate and lock a new huge page;
>> @@ -2232,15 +2233,17 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
>>    *    + unlock and free huge page;
>>    */
>>   static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>> -		struct file *file, pgoff_t start, struct collapse_control *cc)
>> +		struct file *file, pgoff_t start, struct collapse_control *cc,
>> +		int order)
>>   {
>> -	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
>> +	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, order);
>>   	struct address_space *mapping = file->f_mapping;
>> +	const unsigned long nr_pages = 1UL << order;
>>   	struct page *dst;
>>   	struct folio *folio, *tmp, *new_folio;
>> -	pgoff_t index = 0, end = start + HPAGE_PMD_NR;
>> +	pgoff_t index = 0, end = start + nr_pages;
>>   	LIST_HEAD(pagelist);
>> -	XA_STATE_ORDER(xas, &mapping->i_pages, start, HPAGE_PMD_ORDER);
>> +	XA_STATE_ORDER(xas, &mapping->i_pages, start, order);
>>   	enum scan_result result = SCAN_SUCCEED;
>>   	int nr_none = 0;
>>   	bool is_shmem = shmem_file(file);
>> @@ -2252,9 +2255,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>>   	 * mapping, the shmem check can be removed.
>>   	 */
>>   	VM_WARN_ON_ONCE(!is_shmem && !mapping_pmd_folio_support(mapping));
>> -	VM_WARN_ON_ONCE(start & (HPAGE_PMD_NR - 1));
>> +	VM_WARN_ON_ONCE(start & (nr_pages - 1));
>>   
>> -	result = alloc_charge_folio(&new_folio, mm, cc, HPAGE_PMD_ORDER);
>> +	result = alloc_charge_folio(&new_folio, mm, cc, order);
>>   	if (result != SCAN_SUCCEED)
>>   		goto out;
>>   
>> @@ -2591,12 +2594,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>>   	}
>>   
>>   	if (is_shmem) {
>> -		lruvec_stat_mod_folio(new_folio, NR_SHMEM, HPAGE_PMD_NR);
>> +		lruvec_stat_mod_folio(new_folio, NR_SHMEM, nr_pages);
>>   		lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
> 
> Is this a accounting bug? (not your changes) but
> 
> lruvec_stat_mod_folio(new_folio, NR_SHMEM_THPS, HPAGE_PMD_NR);
> 
> If this stat is in THPs why are we iterating it by 512? shouldnt it just be +- 1

This is not a bug and this is intended behavior. Please refer to commit 
57b2847d3c1d ("mm: memcontrol: convert NR_SHMEM_THPS account to pages") 
for details.
