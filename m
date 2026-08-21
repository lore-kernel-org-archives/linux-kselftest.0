Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B632B9BB;
	Fri, 21 Aug 2026 01:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787275191; cv=none; b=DI4tB5oZQiaGYmMAv6au0BD0mJkPKwixPyoG3RLcRFfkfoc7ghjnDVjnWApFSsI/iqikA07r394wM8myCaO3OMbpjGGZieptczas50KTpPbVc3mC7hD9UmEtZnuC2ipi5xyb5oe3xV0MHUnBtH1Ki1zARr9fC6WjLLVlg27xn6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787275191; c=relaxed/simple;
	bh=UBRrJrWZYgOntu3c71w64zJE2pPdBe6+iLAMey9Vy3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5K+QyJLMqz5YrIXpeEhkcpq4ORdAPEcEePJzW4kRGQF1HDwSiMByCgaGVLAtEa0hKeiGAXgJjqG+a7vfChG2U2o+nO/BSkSbhv9YeCMQMmu3R32Aej5oLAQK2TMTVdbmdNoV0C/sPxseXpGkXpcWKv/s9T9UtBfV5YHxRotr+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZvX+LbPZ; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZvX+LbPZ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787275177; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WGdDOkU52715zf2/WD7HSWNIZJ/R5i+/51DA79YiOoE=;
	b=ZvX+LbPZIVu9O7jZ+Mz1uX1AVq8GkuX6jz5SSvV3dPWbSeYk8rnXP3lgdkMch+K4D64YBTcbxk/WkHlwBiZxBhxjAt0nNgocnnj9PvETF/QLvFnZzC6K732AKlCv100ONsbFe/YMTXaljfw0a0G7/ZFB6jXIckePelLG0fhnZ3Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X9Kfngf_1787275174;
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9Kfngf_1787275174 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 09:19:35 +0800
Message-ID: <1bb6c1fc-ea6f-4b3f-a7dc-93012d1da598@linux.alibaba.com>
Date: Fri, 21 Aug 2026 09:19:34 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kselftest: mm: replace usage of /proc/self/smaps for
 check_huge_xxx() helper
To: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-2-ab430c58c7cf@arm.com>
 <DKU1AFIKNMNE.2A0JUVSTKHHLC@nvidia.com> <aodxH5Qc6_zVay-M@e129823.arm.com>
 <DKU6OCPNSECE.O9BZZWTSU1H4@nvidia.com> <aoebR7VhQH8kU-xJ@e129823.arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aoebR7VhQH8kU-xJ@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/21/26 8:26 AM, Yeoreum Yun wrote:
> On Thu, Aug 20, 2026 at 08:09:12PM -0400, Zi Yan wrote:
>> On Thu Aug 20, 2026 at 5:26 PM EDT, Yeoreum Yun wrote:
>>>> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
>>>>> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
>>>>> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
>>>>> made by memalign().
>>
>> I just googled the commit and find that Dev did that. ;)
>>
>>>>>
>>>>> The underlying VMA may start at a different address from the aligned
>>>>> address returned by memalign(). Furthermore, a subsequent
>>>>> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
>>>>> already set.
>>>>>
>>>>> This causes split_huge_page_test to fail because the check_huge_xxx()
>>>>> helpers incorrectly require the address returned by memalign() to
>>>>> match the VMA start address reported in /proc/self/smaps.
>>>>>
>>>>> Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
>>>>> /proc/self/smaps to detect huge pages and change the meaning of
>>>>> check_huge_xxx()'s nr_hpages argument:
>>>>
>>>> Have you checked Baolin's patches[1] in mm-new? They resue
>>>> gather_after_split_folio_orders() to reimplement check_huge_xxx(), also
>>>> based on pagemap and kpageflags. Does it fix the issue?
>>>>
>>>> [1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com/
>>>>
>>>
>>> Unfortunately, No. since __check_pmd_huge() in check_huge_xxx() still use
>>> /proc/self/smaps [1] for pmd THP, it still has problem though ths patch
>>> series applied.
>>>
>>> [1] https://lore.kernel.org/all/56b16691f605426b33b5cf47319233de6127a6b3.1785985999.git.baolin.wang@linux.alibaba.com/
>>
>> In that case, is it possible to use and extend check_large_folios() for
>> all check_huge_xxx()? You still need pagemap_scan_get_categories() to
>> check PAGE_IS_HUGE to identify huge mappings. Or at least
>> check_huge_xxx() in your patch can share most of the code.
> 
> Agree. but TBH, I think check_large_folios() can replace checking
> PAGE_IS_HUGE and keep the later part to check wehther PAGE_IS_FILE
> and SWAPBACKED according to check_huge_xxx().
> 
> BTW, Should I do this after [1] is merged into mm-unstable?

This series is already in mm-unstable, please rebase your patchset on 
mm-unstable branch. Moreover, we've extended check_huge_xxx() to support 
mTHP, so I don't think you need to change the meaning of 'nr_hpages' 
argument.
