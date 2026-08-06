Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A7233942;
	Thu,  6 Aug 2026 01:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979072; cv=none; b=YgFc2o9jhsR1Ben43h0ZqNjuXpWhr9+SiM40KfZppwW8xvPoYAdv6z2gHtWW84YBgnIJ2tV6jwfJyVoZmjfWeNhREFj0bUkuSrz24gtzQRwIiZRDTlhWbBYQU1oHstARy+OfGr9ONRqFi75m9/u3krO79wpifOK3lrzhaepCySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979072; c=relaxed/simple;
	bh=BGWXre3RBats7uaTjWc8n82q6DnLRCnZ+o/bUi4OcfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GV4p8R1D5Yxf9xq6ESgUa45JV3wlhJlueexXpoNClH+cx26HUb6TG0EAHKDJy+IxAP2kzPmBMeBZXJ4jaAU/wya9RAbb4+GweJH6tdOuTj5nSj5d90M/I0BGkMKr6xd8jwi5/AE2bfPx5bxLoun+VvQtZbDlijbrkUIqYfwqGUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=pPlMVO6N; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="pPlMVO6N"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785979067; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=++OVII9rPRuLo9kRAA6sts8kg/2BfkQm7kIApCaZIdA=;
	b=pPlMVO6NN9iqVzKg7njo49wo6ua1cHcE2El56flpuz68cZKfWE3oBSt5ogDTChfQk6TlBZEArjSX/w6cbBesiakmVpC9ePExz8B11neC13yaf/Idqp2f0FqPXrMTh/bU0+f4CUEMovr5ipovsoGl3WMtssHBveDfCYBO1qmgTgE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X8SHgJy_1785979066;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SHgJy_1785979066 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 09:17:46 +0800
Message-ID: <8551bb7d-945c-4be8-b7dc-01ff15fdbc76@linux.alibaba.com>
Date: Thu, 6 Aug 2026 09:17:45 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] selftests: mm: add mTHP collapse test cases
To: Zi Yan <ziy@nvidia.com>, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org
Cc: liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <dd8013c1ddada90913876e3bd912c07e613fba8d.1785564857.git.baolin.wang@linux.alibaba.com>
 <DKH5VECNN2LF.M3RGFY0NORWI@nvidia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <DKH5VECNN2LF.M3RGFY0NORWI@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 12:46 AM, Zi Yan wrote:
> On Sat Aug 1, 2026 at 2:26 AM EDT, Baolin Wang wrote:
>> Added a new command 'mthp_khugepaged' for mTHP collapse, along with the '-c'
>> parameter to specify the collapse order. Additionally, added mTHP collapse
>> test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_mthp'
>> for anonymous folios. All khugepaged test cases passed.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   tools/testing/selftests/mm/khugepaged.c   | 130 ++++++++++++++++++----
>>   tools/testing/selftests/mm/run_vmtests.sh |   2 +
>>   2 files changed, 113 insertions(+), 19 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>> index f69be6be0ecd..64d6da6aa90d 100644
>> --- a/tools/testing/selftests/mm/khugepaged.c
>> +++ b/tools/testing/selftests/mm/khugepaged.c
>> @@ -26,9 +26,11 @@
>>   
>>   #define BASE_ADDR ((void *)(1UL << 30))
>>   static unsigned long hpage_pmd_size;
>> +static int hpage_pmd_order;
>>   static unsigned long page_size;
>>   static int hpage_pmd_nr;
>>   static int anon_order;
>> +static int collapse_order;
> 
> <snip>
> 
>>   
>> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>> index 687d115e3bd8..d09f9f6a384e 100755
>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>> @@ -410,6 +410,8 @@ CATEGORY="thp" run_test ./khugepaged all:shmem
>>   
>>   CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
>>   
>> +CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
> 
> Why only testing collapse_order == 4? It is more useful to test all
> possible mTHP orders. -c can accept common separated order and a range.

This also follows the previous '-s' parameter configuration, which is 
used to specify the mTHP order allocation.

I think specifying a single order size already tests the overall mTHP 
collapse flow, so I'm not sure whether testing all orders is worthwhile. 
Maybe I can add a few more orders?
./khugepaged -c 2 mthp_khugepaged:anon
./khugepaged -c 4 mthp_khugepaged:anon
./khugepaged -c 8 mthp_khugepaged:anon

> Why only testing mthp_khugepaged:anon? IIRC, file and shmem are not
> supported, so khugepaged should reject them, right?

Currently, I have not added test cases for shmem mTHP collapse, so 
adding file or shmem would be no-ops and might mislead others. I will 
add the shmem/file mTHP collapse feature and test cases in a following 
patchset.
