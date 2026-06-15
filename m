Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E0330662;
	Mon, 15 Jun 2026 06:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506287; cv=none; b=u8ky6mH+iExJw54W0LrmUPhYYOsYDnr4eDFshNVQ5fv8VmMnktaJYqms0wAK1Bc0/i/nPiWUhWff6z4fyBnh/AT0Lo4UXrltpn/bCRUsKONpcsDnT6b/JihT4dptx9Zus9O15YMXxo3zVw7m0slzwrdNw+T/QQFrq3xDTKP2rf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506287; c=relaxed/simple;
	bh=Vr+YiSg54QGBVZngXSIuL0UJ+D6sPZxNpJBvXwnTI2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbPb8cakGh9laogA6GvzUDBkaGCcN5qeA4Sc2feasupMD5f7MFH5hl/d9Th4i1+4FsJzusikAKIR2BDFmgxUtKUPLXSUIrURvxVwOHFDNShAhVpkFRW47WYn3o4qejhuUBnXu229d2vkqNFM/bnQOcZ90Pk606g9ULIfZYBsW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U6lYtNM4; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U6lYtNM4"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781506277; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hrkz43e0CktTxobQYWEmQydCF6benCwIbJSIRVKApEE=;
	b=U6lYtNM4VHS82osL29XiVYCc0oxmVAruMefgCJnAnERFVTsDkRF9CAEfqbIdEdjBsYSncY5Km3fIBxMtDg6P8K6plWpBBTKAiJDQb6UtsUq64Qcp7TkF1Vo5a5bBnjJDxQVT1gXMf4CNr+SGFQuTbkQ3+tN0TzRN4J5ASiy9UAw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4qX61x_1781506274;
Received: from 30.74.144.140(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4qX61x_1781506274 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Jun 2026 14:51:15 +0800
Message-ID: <01b9caf7-241a-4140-a05c-826756611e7b@linux.alibaba.com>
Date: Mon, 15 Jun 2026 14:51:14 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 08/11] selftests: mm: extend the check_huge() to
 support mTHP check
To: Nico Pache <npache@redhat.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com
Cc: willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <bbedc5afc56b0f7b2073324a3551159ed9cf5f9c.1781083630.git.baolin.wang@linux.alibaba.com>
 <9c424084-2223-4d69-87b9-cd21c443b396@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <9c424084-2223-4d69-87b9-cd21c443b396@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/26 6:32 PM, Nico Pache wrote:
> 
> 
> On 6/10/26 4:29 AM, Baolin Wang wrote:
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
>>   .../testing/selftests/mm/prctl_thp_disable.c  |  2 +-
>>   tools/testing/selftests/mm/soft-dirty.c       |  2 +-
>>   .../selftests/mm/split_huge_page_test.c       | 14 ++--
>>   tools/testing/selftests/mm/uffd-common.c      |  4 +-
>>   tools/testing/selftests/mm/vm_util.c          |  6 +-
>>   tools/testing/selftests/mm/vm_util.h          |  6 +-
>>   8 files changed, 55 insertions(+), 47 deletions(-)
>>

[snip]

>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
>> index 311fc5b4513e..b43adfa92116 100644
>> --- a/tools/testing/selftests/mm/vm_util.c
>> +++ b/tools/testing/selftests/mm/vm_util.c
>> @@ -247,17 +247,17 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
>>   	return thp == (nr_hpages * (hpage_size >> 10));
>>   }
>>   
>> -bool check_huge_anon(void *addr, int nr_hpages, uint64_t hpage_size)
>> +bool check_huge_anon(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
> 
> Whats the purpose of adding 'size' here?
> 
>>   {
>>   	return __check_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
>>   }
>>   
>> -bool check_huge_file(void *addr, int nr_hpages, uint64_t hpage_size)
>> +bool check_huge_file(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>>   {
>>   	return __check_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
> 
> Same?
> 
>>   }
>>   
>> -bool check_huge_shmem(void *addr, int nr_hpages, uint64_t hpage_size)
>> +bool check_huge_shmem(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>>   {
>>   	return __check_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
> 
> And here?
> 
> Perhaps I find out in the next patch :)

This is to specify the address range, so that when calling 
gather_folio_orders(), it can count the number of hugepages within that 
range.
