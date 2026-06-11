Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D73320CB1;
	Thu, 11 Jun 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177377; cv=none; b=hR3tx5qsQIRBBxf/8dSveChH4cdG8rXjdu6PsxCViq0G18QENUxl2BjwacFiAlG0mEUCtbKKGf4zy/IOrtTYi65sOL/og7ncbcuLVhiIQNVk9NjSy2T1yaH2WWyuU/X2a8ETvqztz7hg5L42peKEevjKNAu0r6vF5Ob8+6RF9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177377; c=relaxed/simple;
	bh=Zt63zeD7kRJmVCQ8yg0v+ky2xSQuXw9KdMtbrsTrZzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i7xM/1oqxy6iJadVLoRrrik+fUL1/VW4E3iw+iI4He9qfb4gqhtjvRbePdQrqToVKwkxTOOn6cglbkxOpwQ06FpZnKqx0y37uzrUD9nHptjQIOT6vSFtNhGQ9L/wB8w/WNfyiWqn1CIwTjML7gLcHKVQ3OgnikMdsWCgj6N6aXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yn14eYUC; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yn14eYUC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781177364; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KD5qlvuzor2NppjwzPy6wAZfmryDMLk9wvmW4Ku/6Og=;
	b=yn14eYUCf0GhMmFfKiqvcNwX6JsFngRbURy1T8sbUauc0E8RtpcgR9x86DI+mv/T6YFCrjXyWGzRyi3TT4uHqclRxm/6ww7nPb3uHXGYwa18EK5m7+NL28TrMs3lMxB3b/u5zbHn3LKArXgX8o4cLL4rqT8F31RPyX8YqCKRNtI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R381e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4dWSlL_1781177362;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4dWSlL_1781177362 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 19:29:23 +0800
Message-ID: <0f4d30db-d9f9-4598-8bc8-328b48ca017a@linux.alibaba.com>
Date: Thu, 11 Jun 2026 19:29:22 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 07/11] mm: khugepaged: skip large folios that don't
 need to be collapsed
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9e05e5ca589e1156f75078951efe874118f88587.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260611045925.36457-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260611045925.36457-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/26 12:59 PM, Lance Yang wrote:
> 
> On Wed, Jun 10, 2026 at 06:29:15PM +0800, Baolin Wang wrote:
> [...]
>> @@ -2843,6 +2853,11 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
>> 		goto out;
>> 	}
>>
>> +	if (bitmap_empty(cc->mthp_present_ptes, MAX_PTRS_PER_PTE)) {
>> +		result = SCAN_FAIL;
>> +		goto out;
>> +	}
> 
> This check seems to jump the gun a bit for MADV_COLLAPSE ...
> 
> shmem swap entries only bump "swap" during the scan in
> collapse_scan_file():
> 
> 		if (xa_is_value(folio)) {
> 			swap += 1 << xas_get_order(&xas);
> 			if (swap > max_ptes_swap) {
> 				result = SCAN_EXCEED_SWAP_PTE;
> 				count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
> 				break;
> 			}
> 			continue;
> 		}
> 
> Holes don't set the bitmap either. They just show up later through the
> "present" check:
> 
> 	if (present < HPAGE_PMD_NR - max_ptes_none) {
> 		result = SCAN_EXCEED_NONE_PTE;
> 		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> 		count_mthp_stat(HPAGE_PMD_ORDER,
> 				MTHP_STAT_COLLAPSE_EXCEED_NONE);
> 		goto out;
> 	}
> 
> For MADV_COLLAPSE, both max_ptes_none and max_ptes_swap are HPAGE_PMD_NR,
> so those checks still let this through.
> 
> So now we bail with SCAN_FAIL before collapse_file() ever sees the case,
> even though that code still handles both: swap via shmem_get_folio(),
> holes via nr_none.
> 
> Am I reading that right? If so, looks like a regression ...

Thanks for pointing this out. I think I should add a 'cc->is_khugepaged' 
check.

if (cc->is_khugepaged && bitmap_empty(cc->mthp_present_ptes, 
MAX_PTRS_PER_PTE)) {
	......
}
