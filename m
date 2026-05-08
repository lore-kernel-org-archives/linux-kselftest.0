Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EB32F2607;
	Fri,  8 May 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243262; cv=none; b=kxMQvXzco2rAUkPTNeELIYadca+H5wG93KtTFZ/Ud6KF727shkKSDAepXNPEkKLQhTG5yUWImizP4SBjdbRZVmN91VZiu8kVnvfztSJW+TxbRsefZt9RoRAX2L4lH6YLcx1Uq1Ss/xY2rckd8pLcZjk6wHgVJBK+sJJxU771Y24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243262; c=relaxed/simple;
	bh=ma++l05+jUjyVj+lcNXmwxDuxjpw7p6B1P8IKC8yMQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dyiH4+YIwhqm26BIqmPV+iUj8ibgzyLqnf62pEYyWgZMo3j0SRh5PoAjB3QBQVfOqwzrXiS61Uvlgd4nZ5qkvdykDR4MXsj2nWkNAY2IwyTQyFLjbfeIgFCZ14NpI9+NlFy81gYCzDuC6e5DWcIMf6tEE3ZAgDdTwLJE3eHqm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCEWqKKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCEWqKKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628E5C2BCB8;
	Fri,  8 May 2026 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778243261;
	bh=ma++l05+jUjyVj+lcNXmwxDuxjpw7p6B1P8IKC8yMQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCEWqKKRcUw+sjbMY4GB6hIhqhRig1T9LBpWmxd+nA8f2RNcGBllNRagKqI5FzPkN
	 26WsO52bPsw5CHqjgtS4Rb3u2xUKya8vRxfVeFNKd2KLSLATsgfDBq4hpeNNIGXjZ8
	 2PO/vCswnxE0EQxQfrGL6LXYvtSayT9AeTQQOonJB5Ru/dqN2pcozNQcOwxcSJKQf2
	 GNvCRoso9B+/d6WwdVo4BS3ASXlLDzKauJCdFBiNLDBYCqY52n0jXnZLa+JiGGt0TQ
	 GkErbG4t1NjoO/5a6oA4L8mPV3eO5mJDGDKtOE4Ufpkawu0K1TjSQmla59Tw4OqsG9
	 jEniXbBkz1QTA==
Message-ID: <9eea2afb-8c35-47eb-b1de-6a08503c9679@kernel.org>
Date: Fri, 8 May 2026 14:27:37 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/khugepaged: fix spurious -EINVAL from sub-PMD
 MADV_COLLAPSE range
To: Chen Wandun <chenwandun1@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org, shuah@kernel.org, zokeefe@google.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
 <20260507070558.3064142-2-chenwandun@lixiang.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260507070558.3064142-2-chenwandun@lixiang.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/26 09:05, Chen Wandun wrote:
> madvise_collapse() computes the THP-aligned window:
> 
>   hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
>   hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
> 
> Previously this was done after kmalloc_obj(), so problem arose when
> the range contained no complete PMD-aligned window (hstart >= hend).
> 
> When hstart > hend, (hend - hstart) wraps unsigned to a huge value, the
> final comparison fails and -EINVAL is returned instead of 0.  Consider
> two single-page calls on a 2 MiB-aligned address:
> 
>     /* hstart == hend == aligned  ->  0 == 0  ->  returns 0 */
>     madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);
> 
>     /* hstart = aligned + 2MiB, hend = aligned
>      * (hend - hstart) wraps unsigned  ->  returns -EINVAL */
>     madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE);
> 
> Both calls cover less than one THP and collapse nothing; both should
> return 0.

Okay, so we talk about a "userspace is being stupid" scenario.

> 
> In addition, kmalloc_obj(), mmgrab() and lru_add_drain_all() were all
> called before discovering there was nothing to do, only for the code
> to kfree() and return immediately after.

Just a comment as you motivate here why this is suboptimal: we do not care about
a "userspace is being stupid" scenario being fast.

> 
> Fix both by computing hstart/hend after thp_vma_allowable_order() but
> before kmalloc_obj(), and returning 0 early when hstart >= hend.
> 
> Fixes: 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")

Fixes: is likely ok, but I don't think we want to treat this as a hotfix or CC
stable.

> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
> ---
>  mm/khugepaged.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b8452dbdb043..92473d93e837 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2836,6 +2836,12 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>  	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
>  		return -EINVAL;
>  
> +	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
> +	hend = end & HPAGE_PMD_MASK;
> +
> +	if (hstart >= hend)
> +		return 0;
> +
>  	cc = kmalloc_obj(*cc);
>  	if (!cc)
>  		return -ENOMEM;
> @@ -2845,9 +2851,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>  	mmgrab(mm);
>  	lru_add_drain_all();
>  
> -	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
> -	hend = end & HPAGE_PMD_MASK;
> -
>  	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
>  		enum scan_result result = SCAN_FAIL;
>  

In general, LGTM, but see for conflict:
https://lore.kernel.org/all/20260409014323.2385982-1-ye.liu@linux.dev/


-- 
Cheers,

David
