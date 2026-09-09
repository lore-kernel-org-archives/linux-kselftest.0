Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2646C4CC;
	Wed,  9 Sep 2026 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944359; cv=none; b=Vlf0aaKf2SC4jdj3iGd1t3acaHwAT6IdQl+K6SP7ltmeGTo4I5OrmqXAYmmxQEjTfHlEr1DNvzSogkMWdHs4WO/GOjyFnE7lXWIrs5n6DMLrtdfWHbOvN7zr+imrJKbAk+23qcQANmIdQmlmDQQyO+zlqenxWkPB1czFWqc9SL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944359; c=relaxed/simple;
	bh=akBep2zaez5YRBgB14fr7beegtFT+3p+FoPXjeTPtxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grsqy+ySXc5hLfRvIxspLOY/fl/3KSX2kst/toRjmYvy51uex+dLT588DQs2U4HcFedy/N8HK9UFaJTm4AF/OStoYG0xqRipAoFei69OjNAa2gu/HovTHxvFXF4lVt/shZ2eBe+OHu4pH/Zl7Q41vAwEqh39vXCauUFkuB3Oq6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ajqAJgjW; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ajqAJgjW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788944345; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=VDpmQwFklX/G6t4avKDv0NRZijMTIcQHDsR0pbaZQl0=;
	b=ajqAJgjWuaNPrOYOQBL4UbOo8wLMVwt82LRIIY5UA9cn8hJDvUv49I5aDuAOMfnCSCiMA5wt0gLUtpPuNlFuIu2OamvKXOn4NheA6w5O+ZLI3jBiVwT8yHbBxBxSP1in1x1chK6DLfkV1V2UP1kFloQwXU42g6JAnfl7Nw8EXXM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAeSzYm_1788944341;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAeSzYm_1788944341 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 16:59:02 +0800
Message-ID: <d489ce9c-f2e5-4daf-9c42-08b56f158e87@linux.alibaba.com>
Date: Wed, 9 Sep 2026 16:59:00 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/19] selftests/mm: make the swap cases' swapout
 reliable
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-6-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-6-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_swapin_single_pte() and collapse_max_ptes_swap() swap a range out
> and then require smaps to report exactly the count they asked for.  Two
> things keep that count from arriving.
> 
> MADV_PAGEOUT is best effort, so the count often turns up a moment late.
> 
> And wait_for_scan() leaves the range eligible for collapsing, so
> khugepaged is still working on it.  Collapsing reads the swapped-out pages
> back in, so the daemon empties the swap as fast as the case fills it.  On
> arm64 with 64K pages max_ptes_swap is 1024 pages, which is 64M a step, and
> the case loses the race:
> 
>      # Swapout 1024 of 8192 pages... Fail
>      not ok 10 collapse_max_ptes_swap
> 
> Retry for up to two seconds, holding the range out of khugepaged's reach
> meanwhile.  The collapse each case runs next restores MADV_HUGEPAGE, so
> only the setup is affected.
> 
> If the pages still won't swap out, skip: no swap, swap too small or full,
> a memcg cap or busy writeback. None of that is a kernel bug.
> 
> Assisted-by: LLM
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Make sense to me. So
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
