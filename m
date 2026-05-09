Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BFE311C2F
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 05:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778306191; cv=none; b=SosLCT3UyRpjY5gZh5KaXRaragATL9RndNEX7WcVdxQu5CjWS/poJRAWRjHY/jyYz9GEHsETLhzVyyJmh7aU18fMV7V7Z93jUFQlQ3qL6zNMbNoUPZD/9sBFCNFPH8kce+rcPB3eCjtjDRvWqHEmh2P2a0+sdvr4Vk8L/NRfwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778306191; c=relaxed/simple;
	bh=K84PeIaf8u2Q3Z7pnulmUb9BcD2A3RhjSwCeSxsIWtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8l8PjlmXZDZQR7zRmSNR+g6DZeCuiY+UqqvJ5fL/nJbJOBvI5pA3N9vAM2AegN/A4y8jr5cZ9V+YSt/cZqOHPM5KIn93UYw7y23XHZXtg8RKz3OOrCJqwmzXBSk+CIhK38Rb73TnsRLEQIV+uPz6rqdmWsn7dpXDYc8kzrvhBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rutv54EN; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rutv54EN"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-365d4d2f9c1so1779727a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 22:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778306189; x=1778910989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMVyy/IaM9CfR7aJopsUJkLNBd+P1jAwfTc6GxmGXeU=;
        b=Rutv54ENfC7rPGNlFoPIk21POeyLDYeLFgT3CJjOZ37ozq0Kgpt1bI5KyJIG8x+x1U
         leX3M1LLB18ZCJlmOkXErZq9jcUPgGtZKJ08kdcJbMpMdPiyS5YBLTrSDNnZjl/jUAnB
         9VJGpF/6wd9R5bKoMfB0BoimcmyU++ujzF1KeI0WLvUgwFEtxDoGeYE5a7WgYbJLYETD
         BXeTF0q9Cs0qW3Y4a50Gag6aADRe2ADgP8084v5QwhnYSnH37VTEG38fYBERKXCurdSX
         gywRNQCR/1D+3bbWq+FDATggyhXHDe+3DFQfikH/tfDzcALCeCg36epauwp2FxRJmzPw
         9+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778306189; x=1778910989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMVyy/IaM9CfR7aJopsUJkLNBd+P1jAwfTc6GxmGXeU=;
        b=Tr8xxjXJyZhgKKnD6/ofK4aKdEoibnjT8dFsO1/6mWJE82PG7vKN/64Gl6ZYTgEIi5
         W04vS/00NT/OxFbk5osSOkN3cdLrTU6TNampxt3rwGeXgSQofleBPA+6GP4GYrzZn0cz
         6vnvrZMqCUn9T3nuABlk2dxZ2gg3mDyBLFVF5qvqFvgYpKFew/+6PPDNjel2QnzitZ6D
         MfD2//7UJGpxJ4CI3VRpJvEDLwdl4Bq/wbve6KRdtIsNZg3YiApa+gA3f3qB0Q+yIt7g
         0cwnR3E4mUa9uDgUJQeWwtNmzMJIXsQEkSssG1kkw6qEm1J38gMGCw85dpbh5o8oiIpG
         pfJw==
X-Forwarded-Encrypted: i=1; AFNElJ/cZ8alD+gC8Db9Rg/yz0GvvL9r5nGkeMsFfKLY4r88XWJ9jutqkgVCxLrbNHGrO8iEF+yVz/PWtIkv+ZDhst0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/lAwIYMu90852RJZbxzaXK8wnUnxMSfHDTmnj2hl89xcH279
	RKVANBbc6TcZGCmdTl1Nswxl9gzL4IKLWV2xCevZks5Pa+8poPJBoEbm
X-Gm-Gg: Acq92OF8DTRVhkmdtt1kqTi4JcFU/9JKUE2z6dWvR6L3FxEbhTiFVkAAerj6ifEoVq5
	bUkl0ilGaV2Y6TnCDGDr6NTxzu5V3+BE7oE6e8aQUq8HmbC6ep7SNMb0LGjUe8f09pplvQAi6zs
	FLmKdYXUXQrzxzy6QXMklXIlivDV9cetLkb/CGgueEjZUyvibdUTff8W90k/bBTdLd2mIkdxmm5
	WwH7gcZGGbGwTigpAWqnRl7xh+lTX69zyTkJ1Tc7v9qTgnrM3ZRsfWVWxj5SPfifr7GlJ1PmKJw
	8KTw8QkD8c07XuIt2RMoH0KC9ZZQfuRswEqmbbqqyI2zSoR0dOY6jblssC+C753zaPl7LY9LJmd
	HHv1nWk6ZWPd5gJgVZ/+7ks14bAEOZz7jtbM6QS1EK7yUcVizIYJ/t9dRGMgGzSX0QlvWhLZlRr
	5yRu1WEF2taM0XK+Gq7MEOGTl0RxFr//A=
X-Received: by 2002:a17:90b:3c8f:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-365ac47e3ecmr16022750a91.22.1778306189319;
        Fri, 08 May 2026 22:56:29 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367bd392d2fsm1009154a91.0.2026.05.08.22.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 22:56:28 -0700 (PDT)
Message-ID: <9e20b388-7952-4d3b-93e1-27b3885ba5d3@gmail.com>
Date: Sat, 9 May 2026 13:56:22 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/khugepaged: fix spurious -EINVAL from sub-PMD
 MADV_COLLAPSE range
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 ljs@kernel.org, shuah@kernel.org, zokeefe@google.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
 <20260507070558.3064142-2-chenwandun@lixiang.com>
 <9eea2afb-8c35-47eb-b1de-6a08503c9679@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <9eea2afb-8c35-47eb-b1de-6a08503c9679@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/8/26 20:27, David Hildenbrand (Arm) wrote:
> On 5/7/26 09:05, Chen Wandun wrote:
>> madvise_collapse() computes the THP-aligned window:
>>
>>    hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
>>    hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
>>
>> Previously this was done after kmalloc_obj(), so problem arose when
>> the range contained no complete PMD-aligned window (hstart >= hend).
>>
>> When hstart > hend, (hend - hstart) wraps unsigned to a huge value, the
>> final comparison fails and -EINVAL is returned instead of 0.  Consider
>> two single-page calls on a 2 MiB-aligned address:
>>
>>      /* hstart == hend == aligned  ->  0 == 0  ->  returns 0 */
>>      madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);
>>
>>      /* hstart = aligned + 2MiB, hend = aligned
>>       * (hend - hstart) wraps unsigned  ->  returns -EINVAL */
>>      madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE);
>>
>> Both calls cover less than one THP and collapse nothing; both should
>> return 0.
> Okay, so we talk about a "userspace is being stupid" scenario.
>
>> In addition, kmalloc_obj(), mmgrab() and lru_add_drain_all() were all
>> called before discovering there was nothing to do, only for the code
>> to kfree() and return immediately after.
> Just a comment as you motivate here why this is suboptimal: we do not care about
> a "userspace is being stupid" scenario being fast.
>
>> Fix both by computing hstart/hend after thp_vma_allowable_order() but
>> before kmalloc_obj(), and returning 0 early when hstart >= hend.
>>
>> Fixes: 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
> Fixes: is likely ok, but I don't think we want to treat this as a hotfix or CC
> stable.
Yes, agree, I would drop this Fixes tag in v2 to avoid any confusion.
>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> ---
>>   mm/khugepaged.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index b8452dbdb043..92473d93e837 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2836,6 +2836,12 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>   	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
>>   		return -EINVAL;
>>   
>> +	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>> +	hend = end & HPAGE_PMD_MASK;
>> +
>> +	if (hstart >= hend)
>> +		return 0;
>> +
>>   	cc = kmalloc_obj(*cc);
>>   	if (!cc)
>>   		return -ENOMEM;
>> @@ -2845,9 +2851,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>   	mmgrab(mm);
>>   	lru_add_drain_all();
>>   
>> -	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
>> -	hend = end & HPAGE_PMD_MASK;
>> -
>>   	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
>>   		enum scan_result result = SCAN_FAIL;
>>   
> In general, LGTM, but see for conflict:
> https://lore.kernel.org/all/20260409014323.2385982-1-ye.liu@linux.dev/
Thanks for your review, I will fix the conflict and send v2 version.

Best regards,
Wandun
>
>

