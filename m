Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197D2DC783;
	Thu,  6 Aug 2026 00:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785977267; cv=none; b=ov000L4kB/Vae7nHupHBS7ZnN+7M+SSDnQt11Tyh0KNfDUj9Jg7Ef+DNHo9T0k2yMGBjLwVXX6oBZp0BnrUNpHziKbkbws4J5hZGU7MK8zb26bSqq187QBxi/caqPzhupfZMBPDKi+FA80thKGA9UT+I3gBNDASvwfG6KRWZbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785977267; c=relaxed/simple;
	bh=7PtjdmlqkA9eY64qxhiXBWOHiNt50wGBTiFvKFFWuuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsRNV10pAse02szu1TRX2VBXsIOQqoS/5QP0ErV9berI5BLFFCaUiDqCrWcFG2anzCVkW0W2ijNu77qPz7GlPKwOUwM5020zecGc8dobWIjM8it7Im+gsuQwbbotD0Vf3QtVz6X0PqXnRcIraFZlNFWg/JuiiVd0WMh3nsALLiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Vwe18/D4; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Vwe18/D4"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785977261; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OKPwPKGJNzrSd7Eti/6rUaxXlZPULugR3ZSio0R9ypM=;
	b=Vwe18/D4XPmfZe5izgcaFeFiLqnZthdVQNBnjtsloDw6PdBCo2wVy7khE8MBS8sPCwaNiUL6vLULckQw1HvyrByTEsmFz3QQIDoOWEZRn7eTxmu2RsBRr6kj9ZEeRJG0Uk9BeC27xP3Ch7PS32a2ph5x9Y76lLg03FXQoZHjUOM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R441e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X8SEFVa_1785977259;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SEFVa_1785977259 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 08:47:40 +0800
Message-ID: <9a9b5563-9aae-4780-b628-d85b836f33cd@linux.alibaba.com>
Date: Thu, 6 Aug 2026 08:47:39 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] selftests: mm: extend the check_huge() to support
 mTHP check
To: Zi Yan <ziy@nvidia.com>, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org
Cc: liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <f2ad5bbe868dc7ed8642842ad2f9751a1ce79f70.1785564857.git.baolin.wang@linux.alibaba.com>
 <DKH49QGMDJGZ.1GN8OC454DA9U@nvidia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <DKH49QGMDJGZ.1GN8OC454DA9U@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/5/26 11:31 PM, Zi Yan wrote:
> On Sat Aug 1, 2026 at 2:26 AM EDT, Baolin Wang wrote:
>> To support checking for various sized mTHPs during mTHP collapse, extend the
>> check_huge() function prototype to accept two new parameters specifying the
>> address range and mTHP size, in preparation for the following patches.
>>
>> No functional changes.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   .../selftests/mm/folio_split_race_test.c      |  2 +-
>>   tools/testing/selftests/mm/khugepaged.c       | 66 ++++++++++---------
>>   tools/testing/selftests/mm/pagemap_ioctl.c    |  2 +-
>>   .../testing/selftests/mm/prctl_thp_disable.c  |  2 +-
>>   tools/testing/selftests/mm/soft-dirty.c       |  2 +-
>>   .../selftests/mm/split_huge_page_test.c       | 14 ++--
>>   tools/testing/selftests/mm/uffd-common.c      |  4 +-
>>   tools/testing/selftests/mm/vm_util.c          |  6 +-
>>   tools/testing/selftests/mm/vm_util.h          |  6 +-
>>   9 files changed, 56 insertions(+), 48 deletions(-)
>>
> 
> <snip>
> 
>> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
>> index 7799154b67ee..c7ae28dfda63 100644
>> --- a/tools/testing/selftests/mm/vm_util.h
>> +++ b/tools/testing/selftests/mm/vm_util.h
>> @@ -90,9 +90,9 @@ void clear_softdirty(void);
>>   bool check_for_pattern(FILE *fp, const char *pattern, char *buf, size_t len);
>>   uint64_t read_pmd_pagesize(void);
>>   unsigned long rss_anon(void);
>> -bool check_huge_anon(void *addr, int nr_hpages, uint64_t hpage_size);
>> -bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size);
>> -bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size);
>> +bool check_huge_anon(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size);
>> +bool check_huge_file(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size);
>> +bool check_huge_shmem(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size);
>>   int64_t allocate_transhuge(void *ptr, int pagemap_fd);
>>   int pageflags_get(unsigned long pfn, int kpageflags_fd, uint64_t *flags);
>>   
> 
> I get what "size" means only after I see Patch 3 where
> gather_after_split_folio_orders() is used. I think len is a better name
> if not addr_len and its type should be size_t to match
> gather_after_split_folio_orders()'s signature. The rest patches should
> have the same rename and type change. Thanks.

Will do.

> Otherwise, LGTM.
> 
> Acked-by: Zi Yan <ziy@nvidia.com>

Thanks.
