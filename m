Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9913AFCFD;
	Thu,  6 Aug 2026 01:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979822; cv=none; b=p8FPM4quIOjTEWVKOGkICMFxlMu48RIS/kFS8BIFbhIy8ACb0Xe5Z4XKyAm8HPc8O8i3aD9KIqMcMm0jBLpszVj+l7FyqVtff6Li/xe5+7uWYkK0/KlDo3H9eO2Zt/Udo/ukYCj6lvo6mZ66kHkd2e02rAdvhYd55c/HsccRFtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979822; c=relaxed/simple;
	bh=LVzR84VohNyS8HLG+uYy4MAtGMgu7yKKxZjsZZT/3OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thPa5hJZ++VTX/0ZcSgv0hTKzm02hJxKK33YsfRlI6RCZDI7Q862f2qhLObtmUti19o+nr9XcBoHNNRkl+d1O1zh6POCcM3W4sf7gGRM/3QmOE54N1As2zNX1x5kBcl/hT1BjqM30elLif42uh6+T/3n/BugASZLcRz6nzWf8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XNsHk37g; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XNsHk37g"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785979815; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IyxeyywyanPFlbyo+b+/1dTM4zZGbGAIjDiWbCcAXnw=;
	b=XNsHk37gTFmMi8I1UNu2hkaJqXiXHiDeSeROymkWu3us7/m07OCH5kEUB5VEXP9rMYc37HgpoVhQElzNKe75xPXF7iWFNCvqqajJvuag1Yof2SSt3bYfWjg3hLEqbCdchtQ23m5gUSfCrHtifdk3oiT4cAzd5HgZ60wUNL77s3E=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X8SLPHI_1785979813;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SLPHI_1785979813 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 09:30:14 +0800
Message-ID: <e17f9ee5-6606-46a4-a756-9d7a5462cd45@linux.alibaba.com>
Date: Thu, 6 Aug 2026 09:30:13 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] selftests: mm: add mTHP collapse test cases
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <dd8013c1ddada90913876e3bd912c07e613fba8d.1785564857.git.baolin.wang@linux.alibaba.com>
 <DKH5VECNN2LF.M3RGFY0NORWI@nvidia.com>
 <8551bb7d-945c-4be8-b7dc-01ff15fdbc76@linux.alibaba.com>
 <E5080E9F-980C-4445-9C19-9C792270A751@nvidia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <E5080E9F-980C-4445-9C19-9C792270A751@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/6/26 9:25 AM, Zi Yan wrote:
> On 5 Aug 2026, at 21:17, Baolin Wang wrote:
> 
>> On 8/6/26 12:46 AM, Zi Yan wrote:
>>> On Sat Aug 1, 2026 at 2:26 AM EDT, Baolin Wang wrote:
>>>> Added a new command 'mthp_khugepaged' for mTHP collapse, along with the '-c'
>>>> parameter to specify the collapse order. Additionally, added mTHP collapse
>>>> test cases for 'collapse_full', 'collapse_empty', and 'collapse_single_mthp'
>>>> for anonymous folios. All khugepaged test cases passed.
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    tools/testing/selftests/mm/khugepaged.c   | 130 ++++++++++++++++++----
>>>>    tools/testing/selftests/mm/run_vmtests.sh |   2 +
>>>>    2 files changed, 113 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>>>> index f69be6be0ecd..64d6da6aa90d 100644
>>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>>> @@ -26,9 +26,11 @@
>>>>     #define BASE_ADDR ((void *)(1UL << 30))
>>>>    static unsigned long hpage_pmd_size;
>>>> +static int hpage_pmd_order;
>>>>    static unsigned long page_size;
>>>>    static int hpage_pmd_nr;
>>>>    static int anon_order;
>>>> +static int collapse_order;
>>>
>>> <snip>
>>>
>>>>   diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>>>> index 687d115e3bd8..d09f9f6a384e 100755
>>>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>>>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>>>> @@ -410,6 +410,8 @@ CATEGORY="thp" run_test ./khugepaged all:shmem
>>>>     CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
>>>>   +CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
>>>
>>> Why only testing collapse_order == 4? It is more useful to test all
>>> possible mTHP orders. -c can accept common separated order and a range.
>>
>> This also follows the previous '-s' parameter configuration, which is used to specify the mTHP order allocation.
>>
>> I think specifying a single order size already tests the overall mTHP collapse
> 
> Got it. If a single order covers the flow, I am fine with it.
> 
>> flow, so I'm not sure whether testing all orders is worthwhile. Maybe I can add a few more orders?
>> ./khugepaged -c 2 mthp_khugepaged:anon
>> ./khugepaged -c 4 mthp_khugepaged:anon
>> ./khugepaged -c 8 mthp_khugepaged:anon
>>
>>> Why only testing mthp_khugepaged:anon? IIRC, file and shmem are not
>>> supported, so khugepaged should reject them, right?
>>
>> Currently, I have not added test cases for shmem mTHP collapse, so adding file or shmem would be no-ops and might mislead others. I will add the shmem/file mTHP collapse feature and test cases in a following patchset.
> 
> Right. I mean when one specifies ./khugepaged mthp_khugepaged:file/shmem, the
> program should show some error like “file/shmem not supported”.

Yes, that works too. I still prefer to add the corresponding test cases 
after I add shmem mTHP collapse support:)

But if you have a strong opinion on this, I can also add a "not 
supported" message first.
