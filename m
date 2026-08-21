Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9786E4A3418
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320925; cv=none; b=AYfUARcDh8OtqUOqxfymQpBpqIaR2O5Urg06n51G3kdHFMs9l9NeIiVfidjyw/JjkQeKT1y8bmLQ9YoZ/P3PThCCIhRZstLfnqqAe7DMDvtbraIGj8RQ/CBGsR7e3GSl+OqzmXl+IOBSfWxXayhZTD95IJhiXFFtnrqeozVOpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320925; c=relaxed/simple;
	bh=w/VwBDo9UPwUkAEyzce0Vi/QMwtEtK0I0XlnqIp4S9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUyURI7z6/wdnMy9x3GNx79cYPRE7Y4kRTjd5W11Hm6yMFJZcSTZka3RXTtthg8EjK2ErXlO4CUIctujkmFW2tbChv1739jcATtL6uIWMhS7iUDlfaPUvqYu8Lpm22whH+NqwAyu9jkgiduhLKogmz8Sn4XE0zMYPM/t5OxBhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNG9uLgr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNG9uLgr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so5461825e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320921; x=1787925721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQd8YnirXzo/05vCBWaK5j7dOswPV7dn2KgbQ3nhodY=;
        b=mNG9uLgryHsnsf9twvifd8wbGuqV5Uy6Bsy3G6bFpmQb5TNVtD1Ld4th9iwN4VF4ye
         PIXjmEXNoRb44HxXWc3WsVxpICy0BKRHWbImGWfxC+WJVRUbZhdsPJPRarazJSBQXPfF
         fEMKu0S1O693HtUybQ4OW6PGVkLDjKXlXY00Khu7BALM3wdhE1KOm84SAM459QWrfBqB
         XCty1Dfm7TubjZU60e8Wx3DJ8/FaHXcr/MHZIOaWWl3liy/M6OhNcXIFvP2GVp3Wiyg6
         nxt7AEztZJoOqfglCutIVIV7B1NS4RmvzfjJXxryEZ85D7b6b+RtAbK/iefNYu4OmtZm
         /ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320921; x=1787925721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQd8YnirXzo/05vCBWaK5j7dOswPV7dn2KgbQ3nhodY=;
        b=nJJOLBU4qCw1BEgjHwqX5kFnBiyWgnxpe0T4KnN5uh9QS7DMFi5147aCMdDObo8EpX
         JSAUaZ60qtc1DD8OV8vhHJ/OUvDmqA6KgRyrvp/Jy/s8y4oIlQtDz7YhhdIhq6SXG4ox
         Kx7tUxZnJmctl6wle/GRfijp9vf2qgSFJRXb6+RA4YUWb8yQpk2278+OsI55x5j4vROv
         DRJUY55onxEfEqvZN6Ztlu5VtXF23coEJYz+GXIEqP+uXw5+rHPXi3Lw9+vQE4SI1KHl
         YFDs96Xtp3T38XomJc+0zlQuEYkiOpwmmLBckQRmZx+aeYNBzHeJ9Lned+3WZdgA4rrI
         On6A==
X-Forwarded-Encrypted: i=1; AHgh+RqC4ia4+VA9bUfut894MRHfl/vF6If+TbZEfs/38PZGAkRyc7giytOtDbhrYvmoCjrSqsQUcabuFQLKIZxtxtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0UEDGVXFkDAGh/mXjdrjuBv1Zi+HpbIGqsdJUbFXrTxgDxpU
	vY2Rt0y0OCcrx+aEKYZ3NkPeRsNKAHa1gygc96zAsh7j67LChrnnmVlr
X-Gm-Gg: AR+sD10sx097HxcKWeumEB3m5aAYzFzqraV6HQbx0yfevJypBnyJAjVOAPRpus0uzO8
	EzaWqL+HW59gdcg6EwhF24XaCc2v8HYdBjp50Cuxgw288olY0wbnVzQltBEy/22IF00mxzrMgUe
	kTexZHEw5m8TsFSFb5IdNVzAi1xv5B4CQDGkx8723bJjePudZFse56XIFgzA6+sEtmlWXYjHc5C
	gyJPlvPCcD2u/ihucbnt4Qc5eZ7g3Tn2TcrfgRNPxSV245gYLJ1gYAgBdI3P84kANouJiZr78/L
	eBqAmsBEhWxM5WQlHGVl/S9XSufOv4hMu6d74UaWbh9oQ8ZX+RhGlB+VaIEkFTjrbRWCJQCaYBm
	XhvHhEf576C8IJWgnfyp3u56lY6e3ZeyJAyo2FvNm7caGypK46Y0/MbXuCM80hqNLfzoSFh4ADK
	nVSHT5oPctD2tOkZOd6W+bqzRHQCRVH8qb5ffZ5GHUPrr73OCjJnpSUD+A+TLCN9glpE9kGDLxm
	ZJJ
X-Received: by 2002:a05:600c:1912:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499b9182141mr59968525e9.4.1787320921200;
        Fri, 21 Aug 2026 07:02:01 -0700 (PDT)
Received: from [10.45.28.226] ([15.248.3.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90f8b4fsm34103715e9.9.2026.08.21.07.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:02:00 -0700 (PDT)
Message-ID: <6270fea8-aa08-48ca-ab1e-ab0ada105ded@gmail.com>
Date: Fri, 21 Aug 2026 15:01:58 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] KVM: arm64: Add pre_fault_memory implementation
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com,
 joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, corbet@lwn.net, vladimir.murzin@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 isaku.yamahata@intel.com, Jack Thomson <jackabt@amazon.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
 <20260612162354.73378-3-jackabt.amazon@gmail.com>
 <amc8zlGxegNKHxIY@google.com>
Content-Language: en-US
From: "Thomson, Jack" <jackabt.amazon@gmail.com>
In-Reply-To: <amc8zlGxegNKHxIY@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vincent,

On 27/07/2026 12:11 pm, Vincent Donnefort wrote:
>> +	unsigned long		*page_size;
> 
> It looks a bit odd in that struct.
> 
> Also, transparent_hugepage_adjust() modifies pfn and gfn. So perhaps it'd be
> better to introduce a struct kvm_s2_fault_mapping that can be used to get what
> has actually been mapped in kvm_s2_fault_map()?
> 

Yeah that's much nicer I'll do that thanks for the suggestion!

>> +	if (vcpu_is_protected(vcpu))
>> +		return -EOPNOTSUPP;
> 
> It could just call pkvm_mem_abort() when the VM is protected?
> 

I see, I don't have a setup to test this properly myself, so at the
moment I left the protected vm's out and don't advertise the capability,
if there's a usecase happy to look at it as a follow-up.

>> +	/*
>> +	 * pKVM stage-2 mappings aren't directly walkable from the host; let
>> +	 * the fault path handle both new and existing mappings.
>> +	 */
> 
> pKVM has a host interval-tree where we keep track of what has been mapped and at
> what level. This tree is also protected with the mmu_lock.
> 

Thanks, that sounds better. I'll have a look at moving to that for v6 then.

-- 
Thanks,
Jack
