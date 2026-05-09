Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D526B08F
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778310279; cv=none; b=VCVLHOuPtydXMaaRO87Ait/GLiDfRRxMjokxy2GaC7fyv42fNvTk/RQeCXX0zuZCycog0wJDzexigsRKCSczA4+UicGRRZ4jg2ygHmVp/ovS9m4CWQf5TGbT/GQHpIzLeuDFTdrhqzc4uzk5ocncJtbBnb/YgJqtFSEQC1pDSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778310279; c=relaxed/simple;
	bh=jSZV4MYNUEsxBlK4l/1QEbloQe4c1H66Esv2O7gHXIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz7MRdMoeVSriq/d9vWz5PN4RfNnYT9JC98Ag3mA4eQ0Wwg/w17nXUQTaphD1HvzRCYnNq2uS0c/oTP5PGmIVAAychTSulfooNIU95T+xWW2hYgywj8RSmFHtz1vTrRI7vjRgERsMwXNG0qRxnk2udEss/UNJmLXptSxhs5r2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiMU4EzK; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiMU4EzK"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-366be8040a9so524566a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 09 May 2026 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778310277; x=1778915077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVO03yvgR7MFJkwnTb5HkHDLGj6R827bwPS9kDzxY8o=;
        b=JiMU4EzKC28RzotjkUABp+7TNAyDycruU5QNhn3VbiWGgqiYlM6y4C9Ejbnm1QDaJ8
         J1vxxrawlozKujSShZT7nKxyNvBVUFw2dJ/xQFamUH9xTtRH8/M5yXaurOigxatmWKJK
         KuImOi+1/d9UzqjWF99RT9Pq5Jccqfo0G1nxPKHQdDaePfBK8IRIntH3GcmGnvaB5rlh
         /MurQWbOa801d2Z4xY02+a/kqasJl40tSHEBopCJzeja3neFkYUdTd4Drp+1+054ldOk
         B+rMSRw81IfdK6Ebw7WVAsxNH0sC1hyeXEmDMwY837NJVUrP+8QwiB7XdJkZ5sWY+ZHd
         g7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778310277; x=1778915077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVO03yvgR7MFJkwnTb5HkHDLGj6R827bwPS9kDzxY8o=;
        b=MISzowD3BlI5wLkKnZIPK5jDKA6KI3EzjaREX4fuqihsjESoIbhSbXCLYiAZ1uyyGK
         0rOX/fGPxx58YvaKYFEf0Si1cQV4gIIcyKkTlTMAq8O322SJg+xP+wMtaPc9Cxn5VEWR
         qbkIqhltZhfnv+Ic0gki6Ew1b2RrCkSI+YpaWoCwWPZsksPHCEfuBtm7/QkNc/dp7M75
         Sipom+2Ey1d2qqbXFSVYMXqTfENzWjeXChu/UoFXhgQsD/wgXqzmgosekBoS+cqfmDli
         FrMoc6O7tPisRYIGma1cjQNUPLHr9iroMI3S6kJUJs65N6HyiuAGNc8hOCaeOguYWJDe
         73xQ==
X-Forwarded-Encrypted: i=1; AFNElJ81ojawweAeT20FP7U3pBJP1zeuh7NZRTrUqKhbffzuFrFj3HFW88MD98DEMtvO/YZxMqgRKoyisy2tHVNY3t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGTja2TKNkZqmIjJ3Zrubo6cEwY0SDzGpNb5HEShAnn0a8u/R
	LjvCI+AvXcbuXXyAflE9T+EBY7y8u0dtdlwAr8V32IQrkTwHcckL/ms9
X-Gm-Gg: Acq92OH+aQ6AX0w20xDqhgH0TJGCeoTQI0Y3oJvySXj9ZcmkK8KCw3A5zorPLQQZ4UC
	YrPe23B8Sx0MtRmEBdRaDdzoXKtB6Tqky0E9vn7ZnNJf7lRg7orMGa//wMFhRFmdetKqLxPe1Rm
	q3SHGIkLA6UBzGzv206ibeFjTKXU300P7QTrqiAauOOEHf2Oze/flCSvBKOgMdDJjauS9OA7fTZ
	ybneHpaW6Q8lp1l2KtCPfl7ZJIFgUiaJQv6eUuXqbd9h/QWGs2S5JQpsFacF2vrlMDuT4BfDmcw
	c4Q3FnfdDH+7rLWKHM6Dw+157U6AaCjgvaxKxOh9dT/XEtFxfaGJQi7sfzgxOp97JBt9/0y6QX9
	GIkkDHsFRb+n19a6s262zr/MIcYJG+JUShSMDRZq2EeAuJfeAsfJ9z/xUv/COvnw7EqmkDsxjdx
	U/jwwszAXJaLhlmcUD62u/uaDN4XNWmxUCAtswtC/dMA==
X-Received: by 2002:a17:90b:2882:b0:364:a497:dc45 with SMTP id 98e67ed59e1d1-365aa83f807mr17884589a91.0.1778310276863;
        Sat, 09 May 2026 00:04:36 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm1156505a91.8.2026.05.09.00.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 00:04:36 -0700 (PDT)
Message-ID: <42f6064b-ea32-4b9c-b6b5-f1dd47a89ac3@gmail.com>
Date: Sat, 9 May 2026 15:04:29 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/khugepaged: fix spurious -EINVAL from sub-PMD
 MADV_COLLAPSE range
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 shuah@kernel.org, zokeefe@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
 <20260507070558.3064142-2-chenwandun@lixiang.com>
 <9eea2afb-8c35-47eb-b1de-6a08503c9679@kernel.org> <af30otSSGbPxHbxM@lucifer>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <af30otSSGbPxHbxM@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/8/26 23:02, Lorenzo Stoakes wrote:
> On Fri, May 08, 2026 at 02:27:37PM +0200, David Hildenbrand (Arm) wrote:
>> On 5/7/26 09:05, Chen Wandun wrote:
>>> madvise_collapse() computes the THP-aligned window:
>>>
>>>    hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
>>>    hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
>>>
>>> Previously this was done after kmalloc_obj(), so problem arose when
>>> the range contained no complete PMD-aligned window (hstart >= hend).
>>>
>>> When hstart > hend, (hend - hstart) wraps unsigned to a huge value, the
>>> final comparison fails and -EINVAL is returned instead of 0.  Consider
> I think both should return -EINVAL.
>
>>> two single-page calls on a 2 MiB-aligned address:
>>>
>>>      /* hstart == hend == aligned  ->  0 == 0  ->  returns 0 */
>>>      madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);
> What's aligned? You're putting a random variable name in there? Presumably a PMD-aligned address?
Yes, PMD-aligned address.
>
>>>      /* hstart = aligned + 2MiB, hend = aligned
>>>       * (hend - hstart) wraps unsigned  ->  returns -EINVAL */
>>>      madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE);
>>>
>>> Both calls cover less than one THP and collapse nothing; both should
>>> return 0.
> Disagree.
>
>> Okay, so we talk about a "userspace is being stupid" scenario.
> Yes!
>
> I feel that -EINVAL is correct for hend > hstart, and I think it might even be a
> userland A[BP]I break to change it (maybe somebody, somewhere is being foolish
> enough to use this to also validate input ranges).
>
> The weirdness is when hstart == hend being 0 but that's sort of established
> behaviour I guess.
>
>>> In addition, kmalloc_obj(), mmgrab() and lru_add_drain_all() were all
>>> called before discovering there was nothing to do, only for the code
>>> to kfree() and return immediately after.
>> Just a comment as you motivate here why this is suboptimal: we do not care about
>> a "userspace is being stupid" scenario being fast.
> Yes, in general - so what? The user is doing stupid things, so the user wins
> stupid prizes?
>
>>> Fix both by computing hstart/hend after thp_vma_allowable_order() but
>>> before kmalloc_obj(), and returning 0 early when hstart >= hend.
>>>
>>> Fixes: 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
>> Fixes: is likely ok, but I don't think we want to treat this as a hotfix or CC
>> stable.
> I'm not sure I want a fixes here, this isn't really fixing anything. This isn't
> a bug afaik, it's just us not handling this brilliantly, but (possibly by
> mistake) getting the right output.
Yes, I also thinks this patch only fixes minor issue or cosidered a 
clean-up.
I would drop this Fixes tag in v2 to avoid any confusion.
>
>>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
> I put this patch through AI detection and it's telling me there's an 80% chance
> this whole thing is LLM-generated, which is making me grumpy.
>
> Can you confirm that this is, in fact, your own work? Plagiarism is not a nice
> thing to do, and THP doesn't need more traffic, we're overloaded as it is.
I can confirm this patch is my own work，I found the issue and wrote this 
patch myself.

The issue was found when I noticed THP pages were still being generated 
even after
adding "transparent_hugepage=never" to the cmdline, after debugging, and 
finally found
this was due to madvise + collapse path, while reviewing code I found 
this minor
issue and wrote this patch.

I did use an LLM, but only to check the commit message to find 
spelling/grammar
errors and improve readability.

I fully understand your concern about the traffic, I will be more 
careful about
what I send to the list.
>
>>> ---
>>>   mm/khugepaged.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index b8452dbdb043..92473d93e837 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -2836,6 +2836,12 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>>   	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
>>>   		return -EINVAL;
>>>
>>> +	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>>> +	hend = end & HPAGE_PMD_MASK;
> See below re: conflict.
>
>>> +
>>> +	if (hstart >= hend)
>>> +		return 0;
> 	if (hstart > hend)
> 		return -EINVAL;
> 	/* For compatibility, users may rely on this. */
> 	if (hstart == hend)
> 		return 0;
>
> Is probably better.
>
> But I'm not sure what the point is if we're already doing this behaviour?
>
>>> +
>>>   	cc = kmalloc_obj(*cc);
>>>   	if (!cc)
>>>   		return -ENOMEM;
>>> @@ -2845,9 +2851,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>>   	mmgrab(mm);
>>>   	lru_add_drain_all();
>>>
>>> -	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>>> -	hend = end & HPAGE_PMD_MASK;
>>> -
>>>   	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
>>>   		enum scan_result result = SCAN_FAIL;
>>>
>> In general, LGTM, but see for conflict:
>> https://lore.kernel.org/all/20260409014323.2385982-1-ye.liu@linux.dev/
> Please use mm-unstable as a basis for your mm work Chen, this is something you
> need to fix, the patch above has been around for a while and is in
> mm-unstable.
>
> You have patches in mm already so you should know better by now.
Apologies for not basing this on mm-unstable, I'll fix in v2.

Thanks for your review.

Best regards,
Wandun
>
> But I'm really not sure I'm in favour of this anyway. I'll defer to David but
> this feels useless to me.
>
>>
>> --
>> Cheers,
>>
>> David
> Thanks, Lorenzo

