Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DC03B14A3;
	Mon, 15 Jun 2026 06:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506015; cv=none; b=WXEZlS/h2WEY86ed0lwPoqR9/yT5yKTuaFz05vDT6Bjm3SzFMuIBJhLb6NEYhAcA+qIfYiGCIvdIS01DhhxOzUV5cRcx+FdETiT811Fs53i6Bvkp5h+Y5w+anx0JUq29qN5B0UN5REy9SOt0ufUZjkPPi8IDDTuc2C6cKdpE8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506015; c=relaxed/simple;
	bh=tYVbsJMtl4sLHc9F3ymy7DSjMez2Q+25+5pzmss6iPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l++6yYPzvBSqZR9tGzzbo3D4IgY2xOM0ReXV4DMpRGVX1AfBj1JCMaaDyszFMXiX657VPtWZpqcxDA9cVenW1Yz+76OneRn1kVdwB13XGJNwdUjmpaftnaHUUseqUugXtCpUo3yP8zpoCNgAddgKhK+1HNKG1iIAwIB89y65WnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hT6VmRkb; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hT6VmRkb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781505990; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=MkI+1TpE0aUAl41JF553jaqHkvoJvgRTmIJlr1KvO1s=;
	b=hT6VmRkbAGlCp2p6zUIhjwDYQXCXUwneB6AytFd+uCdxHFUuwHpLmib6ts3eib8ITdq2a+f97QXbeJlYbp1rJF/mYRA0oPSJiNuP3K1CAadKvR+T/j9m3WEi4TV2z5S/7nmSYZSlpRtXl6de0BLUcOwK2zbHM2K/Paqjy9lrJQw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4q36AT_1781505988;
Received: from 30.74.144.140(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4q36AT_1781505988 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Jun 2026 14:46:28 +0800
Message-ID: <2d201ef2-0279-454d-ace0-ef7882e1385f@linux.alibaba.com>
Date: Mon, 15 Jun 2026 14:46:27 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse
 support
To: Nico Pache <npache@redhat.com>, Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260610124416.46522-1-lance.yang@linux.dev>
 <443feb66-94ab-458e-8cd8-0ad440d0d067@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <443feb66-94ab-458e-8cd8-0ad440d0d067@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/12/26 6:22 PM, Nico Pache wrote:
> 
> 
> On 6/10/26 6:44 AM, Lance Yang wrote:
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
> 
> This is kinda my fault... I reused the enum PTE_MAPPED_HUGEPAGE (which was only
> really used in file collapse) when reporting that a collapse attempts is smaller
> or equal to the current order of the folio.
> 
> if (!is_pmd_order(order) && folio_order(folio) >= order) {
> 
> I will change that in my follow up to use its own (or a different enum).

Maybe use SCAN_PAGE_COMPOUND? Anyway, I’ve already fixed the issue Lance 
raised locally.
