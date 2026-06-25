Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A5D3F0AB3
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782408914; cv=none; b=miOK1fN6fYwoBmDos44pH2INSd2VRrjOqgtEU1PST7W3RptUzZUlgZgJK16WO4Fqnksg1ayvXjrJsLFZHfwCIobbthAFB3Bgq/4Lze9Xv1Bt++zKwvvtHP0Tw7NTP5r7p/ANvhMQ9jE0aUBnWm7OOehwAwRZKh+z3fibQaLQW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782408914; c=relaxed/simple;
	bh=CWcHyXL1nuFr2zBbxcD+I49gXR+BUjlAzdxCBWdkI8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYj/ZTrZsmChV6V/uQdv0TiLVn1PXLANKKQaowN65xOqDr8vhWUN6+gox0QBTeu/CHjYbGtIILlnUcjSju/JHM1fNpsYy1gEDnHRAwISqk98JWgoL1EN3paQhgaK+2QMRBtT+weeWVDQNeEVr7aEAZlQkxotbSMFJ8quYBii8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Stdkh4aZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Stdkh4aZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b8adf7efso225745e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 10:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782408911; x=1783013711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfJs9w2lKJotpLjpMf0F1SfbJUWEBXoJkkJG2VjG/Js=;
        b=Stdkh4aZqRfpjEo20uwKLo9PSk7NjBdJNHDhqI7RfXNgpMJMHszH6ey6s+vMvevgEU
         FxecJgaftf9/fhtPN6St4eVRhStIQnKM0AGJZ21fO02zHgoeWBvyxIc0Cq7Pzyc8kMZN
         32rLAGP7+05pkOiuC+gAbR+tAHY4mDNzd+iDDqYy52rTJM6q9rSZzMPZeaWGUyT1Wfmg
         k3g7eZO7QypA0oXHk8ppmsOIhqnu055Mh0ykQnuApZs7nk2sZE8hC0p72rX+IEwpoFyB
         8wZcgufD7/uJ52OwLuyS0XD82OJlRT6IYAt2w1SyODb9TmepFeM0F8lCdAgYZjvKPSwZ
         4bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782408911; x=1783013711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfJs9w2lKJotpLjpMf0F1SfbJUWEBXoJkkJG2VjG/Js=;
        b=NNn1fPedyy+1ZUPajTKBjc6GjKUDxFjalrY/mL59vbGqMO+8n/PjdIA6M6BBUa5wWQ
         jj4sy2hI5E8gSutjqcWWu7x3F3C1ej2LzlF/5NHgCAraulYSDSpvCYTs8VJ3e0vchQej
         wEFiMJlKd3kWYK2N+tM3OHMAVGecviMG26wpGSRGR8UkGDi9LSb3z01XGWD2cVzM7Jok
         KkX0CacwUyiEveiUIPQ/wgqGZfUsPb5hrw/ROKMGP0l78mV0kg4UgtlcLNf0LQH9vCpA
         a7bTB/KaD8hCrwlx/5GZ2KwwOOc2e0xzX1CifD7SNsZ9y3lpmvzMvkGOOdzIQPtpD9fT
         GcQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLmsAjaNrF1Zucrv0fFY9lEQ807Ey0kOCJkm8jqRhEzKntfcHG6sdFNAXN56Ax0f5kYyzORRrtHZCUmGSNqy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYnvAxIoU91EMwMjLuWv71AEUtxrIJUcXkHI/kWvJhGAdq+b3
	V49/apq50LEV1Pu72OV5Zh+gcgXXkxSArfn49EMTXwrs1S12FzLLB6Eg
X-Gm-Gg: AfdE7cmCQIlKoyPSlIEV6nVaMBtGP/Y9bTbw2pnXcYSUwxDzc4YgnWfB8B2whX6sn8l
	XFaOfEJA2hC9OvO36jb84rG9/xvq8AzkZvTdU0qrkGgnTI0vqPB/8M2/LJcktungREZmNcnGtKf
	am7sTmUixl+mT6rmts5pgLH74+/TfaPDirc2xbhz2QttoYhxw5FbkE9N1MegiLsmZfQQyDf2sx2
	Y5os+/GxCup1ThqMco3Vl7rkpahAqimyPp/1FNlCPHMHsHx7WDsijVfQBw5LlLdg4MkE4dueZkv
	jU5Ie0E+BugB/JRvzdPnXvd2EUu3GgGbBbeIH5Im5KjdMZv8aOumD+zcfaVH9+9ZdRODu0KBQSb
	7EbAvTaRmnF4G0QSjqMZfbgUK+YvCaOEkxnXVRPR8nBJpcFvjdcitJEsbGxGauu5Wy2ENSwriA1
	iZLeMvM4FhRg3YQnVS58VWTiOLfsXqvQ==
X-Received: by 2002:a05:6000:2c08:b0:46a:8000:617a with SMTP id ffacd0b85a97d-46dc2733530mr2636381f8f.8.1782408911409;
        Thu, 25 Jun 2026 10:35:11 -0700 (PDT)
Received: from [192.168.1.135] ([165.50.1.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm18233741f8f.9.2026.06.25.10.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 10:35:10 -0700 (PDT)
Message-ID: <cb5c9a44-2b05-46a2-958b-cafe368c5576@gmail.com>
Date: Thu, 25 Jun 2026 19:35:02 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bpf: preserve rx_queue_index across XDP redirects
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Siddharth C <siddharthcibi@icloud.com>
Cc: ast@kernel.org, hawk@kernel.org, andrii@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260620121321.45227-1-siddharthcibi@icloud.com>
 <20260620121321.45227-2-siddharthcibi@icloud.com>
 <20260624185432.32d90aa8@kernel.org> <DJIA58WBML8S.A897NKI06DV9@gmail.com>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <DJIA58WBML8S.A897NKI06DV9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/26 5:44 PM, Alexei Starovoitov wrote:
> On Wed Jun 24, 2026 at 6:54 PM PDT, Jakub Kicinski wrote:
>> On Sat, 20 Jun 2026 12:13:13 +0000 Siddharth C wrote:
>>> diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
>>> index 5e59ab896f05..8f2d7013620f 100644
>>> --- a/kernel/bpf/cpumap.c
>>> +++ b/kernel/bpf/cpumap.c
>>> @@ -197,7 +197,7 @@ static int cpu_map_bpf_prog_run_xdp(struct bpf_cpu_map_entry *rcpu,
>>>   
>>>   		rxq.dev = xdpf->dev_rx;
>>>   		rxq.mem.type = xdpf->mem_type;
>>> -		/* TODO: report queue_index to xdp_rxq_info */
>>> +		rxq.queue_index = xdpf->rx_queue_index;
>>
>> Do you actually need this or you're just trying to address the TODO?
> 
> It's a 3rd if not 4th attempt from various "people" to address this TODO.
> We should just remove this line instead.
> 

I was one of the people that tried this. And also I have already sent
a patch to address the misleading comment to prevent future wasted 
effort. My patch is still on hold (LINK: 
https://lore.kernel.org/all/20251021114714.1757372-1-mehdi.benhadjkhelifa@gmail.com/).

Best Regards,
Mehdi Ben Hadj Khelifa

