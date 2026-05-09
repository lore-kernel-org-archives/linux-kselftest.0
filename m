Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225329BDAA
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778313248; cv=none; b=IRYIxOCDXrZoKW+Kd9KbrF7OAdjh7b0UVk/14cRoKy4dmVPHGygMlDEmruGsvlGTSCByHxHbmqLO0g2+FJirqk+iHPwHEc5sqnibCrcRWsboOOauahqTjDprDvDHVrqkNLewdgz2JEui7FlHywdpG8y96RZw3KabmG5+OtOrs+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778313248; c=relaxed/simple;
	bh=9nHC3mN6xy21eFCWw9mcWZ/Fqn0qHkFw08YI0SuoZKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rE5a8f7NtKWi6wrVEinFZX9gL/EyXD/lKXMdroDmd19rsl0pL4Qn4p4SF1b4dn9JzZej3rtgh5tt1jzubK8TumRkLvJqnpkklbI2BWJnV1uvktxRYL/ILCZLHUVvtt8XKcy126/HJpsilniOb05gfRlpZg6hXxNw2bOKUNiSIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk+3FthZ; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk+3FthZ"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c82471904fcso1191596a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 09 May 2026 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778313245; x=1778918045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FI8KA4+9qmXkVJzkHEuRpOiJGy/NTHRYsaW2TKVpccs=;
        b=Bk+3FthZyJZqZz57lSi9+eX/qZReEpNJVv2/V/kifZxooAZLSPdVIQkHnFoGzjsGfB
         jam5q9IZx+fn6vSnKb7olNyd1SBwxqvHEgJ64cTsQSWTzTzyGSAGKZXk9DI4vXHPuM19
         L61Extq1+iGrIIu0a4WnB2dPoopxzC+twHfKDRic2HscXLzMU0+GaowHnuljBtAH3fzw
         TD90FrWXQCtEePCMRitMUsZmh7Y80gy9Y93vpVPnfGAV0JId6f9hsx4/4tUjqacKl6kG
         WV2jiff0dRYAEjbaUB1hMfZsRAMdxWAeMAHQ7u4y6AbFgjIqRAl+v3AqMH5X0UngNQp/
         F2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778313245; x=1778918045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FI8KA4+9qmXkVJzkHEuRpOiJGy/NTHRYsaW2TKVpccs=;
        b=s86ir8smgNwtNjlm56L2kNVWx+XYkENz9pDJGue57HyqGSQICczPh5ttDAhPBNDxqP
         ZqFuuH086KHTAnOUmEIIq4hDa+wIR57e7M+9ELGfqc8W9/g2h/wBOqDKG0lstrCMZ+27
         ch1v5UtCst2h9Netmd+aQzUEjiXbow4Pxm98FeL2PLy/YukMiiO6vfRss1/6tmgKL7mI
         H3ZCChZ1DdPsTxqYdh5IhPdfOWaHgAfUs0CMRMQIhEJ1Y/Ib4HmXdNez726I9qoBYpMe
         BWb0pW9yUgx3YM2b4Pn0jR3PLLs0qp52R8n7zp89939T5jGtccg2m1sQuV8sjMXzXIQy
         ZGig==
X-Forwarded-Encrypted: i=1; AFNElJ/yKj+Oe86JBXFyp0fRZH1pHURnIdiBvK0otdLh8CCrRLNNOwtSd+tp63UpBRYSy17l5kim3fmP9mCQBUy6LVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9v5LQ58P2HnKOZq+O1PrkWIE+asm066nLZ9PtNFiKEzc6eyjh
	f5I6S2UpHtSDSI0/aws68ckesX8VTIX6FDIp0fdJjFUOngTGl2zcNw3s
X-Gm-Gg: Acq92OFUG25OpSsn3ndTRQ00fYM5703OnRCp6KkASntKXnPqtkKDD7leVAYAzsd5Q8e
	e7Y85tmHq3qM64OMS6u212KNgIbM1hBdeyxVCGTypfe5Ir8/tUKSTYGZCK7vUsDqz/jdTWuSL9+
	FATon+vbcYqZdr50a0viEtHkkKgnkc8VygXRQPgTwskrQpkRioeHcKHAxNiYGeicDfoSrRLOsBm
	RFmkGCAEylziIUd1h2935tUTY18rk0kOQ2sodwfaR/laeKyT3CXsfKWp+VI1iYh8CSyIcT1sa7g
	OprYwB4T6lx088Xi8UsUkv52nq0nj9VeY4MqAg2LiPcNDcrkeuQl63FbrBdqecaHdR3SVnICJHM
	upMTXUB8daRZYydHmBdcL7EYzqFo8FoiaQnbO1VM6QR585va4WD/yjofgFXtiARiyS8JLFFahrj
	yRjEhIbO/aR0P7/19ty00gd6CWWDe79rM=
X-Received: by 2002:a05:6a20:a114:b0:398:71f2:59b7 with SMTP id adf61e73a8af0-3aa5aab2973mr17549441637.33.1778313245307;
        Sat, 09 May 2026 00:54:05 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d409eesm42643005ad.32.2026.05.09.00.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 00:54:04 -0700 (PDT)
Message-ID: <81cc8e5d-0351-48a9-9814-aeb6a8c2d32d@gmail.com>
Date: Sat, 9 May 2026 15:53:59 +0800
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
 <af37aPMyMV8JSIPH@lucifer>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <af37aPMyMV8JSIPH@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/26 23:04, Lorenzo Stoakes wrote:
> On Fri, May 08, 2026 at 04:02:37PM +0100, Lorenzo Stoakes wrote:
>> On Fri, May 08, 2026 at 02:27:37PM +0200, David Hildenbrand (Arm) wrote:
>>> On 5/7/26 09:05, Chen Wandun wrote:
>>>> madvise_collapse() computes the THP-aligned window:
>>>>
>>>>    hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
>>>>    hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
>>>>
>>>> Previously this was done after kmalloc_obj(), so problem arose when
>>>> the range contained no complete PMD-aligned window (hstart >= hend).
>>>>
>>>> When hstart > hend, (hend - hstart) wraps unsigned to a huge value, the
>>>> final comparison fails and -EINVAL is returned instead of 0.  Consider
>> I think both should return -EINVAL.
> Correction: I changed my mind (see below), and think == should return 0 simply
> for compatibility reasons. Though honestly both really should have been -EINVAL
> from the start...
I also hesitated before return -EINVAL or 0, for the two cases mentioned 
above, it
didn't collapse into any THP, so I wanted to return -EINVAL.

Later, I saw the function comment for do_madvise and madvise manual, so 
I thought
the cases mentioned above didn't meet the conditions for returning 
-EINVAL, so
I followed madvise manual and do_madvise comment.

Best regards,
Wandun

>
>>>> two single-page calls on a 2 MiB-aligned address:
>>>>
>>>>      /* hstart == hend == aligned  ->  0 == 0  ->  returns 0 */
>>>>      madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);
>> What's aligned? You're putting a random variable name in there? Presumably a PMD-aligned address?
>>
>>>>      /* hstart = aligned + 2MiB, hend = aligned
>>>>       * (hend - hstart) wraps unsigned  ->  returns -EINVAL */
>>>>      madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE);
>>>>
>>>> Both calls cover less than one THP and collapse nothing; both should
>>>> return 0.
>> Disagree.
>>
>>> Okay, so we talk about a "userspace is being stupid" scenario.
>> Yes!
>>
>> I feel that -EINVAL is correct for hend > hstart, and I think it might even be a
>> userland A[BP]I break to change it (maybe somebody, somewhere is being foolish
>> enough to use this to also validate input ranges).
>>
>> The weirdness is when hstart == hend being 0 but that's sort of established
>> behaviour I guess.
>>
>>>> In addition, kmalloc_obj(), mmgrab() and lru_add_drain_all() were all
>>>> called before discovering there was nothing to do, only for the code
>>>> to kfree() and return immediately after.
>>> Just a comment as you motivate here why this is suboptimal: we do not care about
>>> a "userspace is being stupid" scenario being fast.
>> Yes, in general - so what? The user is doing stupid things, so the user wins
>> stupid prizes?
>>
>>>> Fix both by computing hstart/hend after thp_vma_allowable_order() but
>>>> before kmalloc_obj(), and returning 0 early when hstart >= hend.
>>>>
>>>> Fixes: 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
>>> Fixes: is likely ok, but I don't think we want to treat this as a hotfix or CC
>>> stable.
>> I'm not sure I want a fixes here, this isn't really fixing anything. This isn't
>> a bug afaik, it's just us not handling this brilliantly, but (possibly by
>> mistake) getting the right output.
>>
>>>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> I put this patch through AI detection and it's telling me there's an 80% chance
>> this whole thing is LLM-generated, which is making me grumpy.
>>
>> Can you confirm that this is, in fact, your own work? Plagiarism is not a nice
>> thing to do, and THP doesn't need more traffic, we're overloaded as it is.
>>
>>>> ---
>>>>   mm/khugepaged.c | 9 ++++++---
>>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index b8452dbdb043..92473d93e837 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -2836,6 +2836,12 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>>>   	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
>>>>   		return -EINVAL;
>>>>
>>>> +	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>>>> +	hend = end & HPAGE_PMD_MASK;
>> See below re: conflict.
>>
>>>> +
>>>> +	if (hstart >= hend)
>>>> +		return 0;
>> 	if (hstart > hend)
>> 		return -EINVAL;
>> 	/* For compatibility, users may rely on this. */
>> 	if (hstart == hend)
>> 		return 0;
>>
>> Is probably better.
>>
>> But I'm not sure what the point is if we're already doing this behaviour?
>>
>>>> +
>>>>   	cc = kmalloc_obj(*cc);
>>>>   	if (!cc)
>>>>   		return -ENOMEM;
>>>> @@ -2845,9 +2851,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>>>   	mmgrab(mm);
>>>>   	lru_add_drain_all();
>>>>
>>>> -	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>>>> -	hend = end & HPAGE_PMD_MASK;
>>>> -
>>>>   	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
>>>>   		enum scan_result result = SCAN_FAIL;
>>>>
>>> In general, LGTM, but see for conflict:
>>> https://lore.kernel.org/all/20260409014323.2385982-1-ye.liu@linux.dev/
>> Please use mm-unstable as a basis for your mm work Chen, this is something you
>> need to fix, the patch above has been around for a while and is in
>> mm-unstable.
>>
>> You have patches in mm already so you should know better by now.
>>
>> But I'm really not sure I'm in favour of this anyway. I'll defer to David but
>> this feels useless to me.
>>
>>>
>>> --
>>> Cheers,
>>>
>>> David
>> Thanks, Lorenzo

