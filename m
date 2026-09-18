Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE27455610
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 23:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789775202; cv=none; b=ST0yK9e6r63gLLUo/ulmBEKTRWUNV+lpMtVsFIcLbCx/cLPpFS4m6T40vD2rbf/4stDDpYTfDL2xqVf7HpPNo59d2ZfBb7RfofpZ25mUJz0wCwEIRWDxkWtzD9d1NS8aKl2Bx5HzDKx872PUerOQsd+/KPQZOtli1OxVpJXJC/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789775202; c=relaxed/simple;
	bh=WITBwmjQ6YgkJFK36iLqV9GnsUYX+fX/wU9MGqkhguA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8r2IVlhQNU3jmNu4SdcKFDES2ldKd2xo3fLW8Bpb9eLCFEZSaI0ZHj7a4UQGGIm8iGNZ+Ws4aU5FmpsYW5lwwTtmDMQlr81rALUwtqQ+cJb8YZAkW63FJFJqvSBtBQ9JklTpU3jBqUdxMAyXZZbb8Pk5x6J87FtvygWbdcME9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZjP7GYQ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZjP7GYQ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48436686a40so155116f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 16:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789775197; x=1790379997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhFK29n+MC5nuBbvPBOhbnlgDf/9/2f5NLz1t43GcV4=;
        b=bZjP7GYQ9TRybeVTShJpqereBP0iHRakc7kvmuS1vXRyw6uovMvdpDUqjoLZh7HMUA
         TZL/hyFCFpipRJZAMVzzy+ICXEv6QmpYYETgGDpl9ud1V8Uir5OVYBBrPq9WWjOQ2oPD
         H62E05W8TysdgjxwWApKJ1XeO1OaPxw/s3CEYzq09/e8wXf8VbZaLZgvGr/iaeQl8tLA
         4u4b57ZSmmdNFvAnDVCWdMTyMdWMkQFDoGkMOshVUhoIYQ2ftEC+Uqqy67QYv73wcP/l
         q0ImsaF4MT1P0qWDsDDCQrLcyr3JAfS17b758d8LDpBFDJ4/7ZjbVcsNIGgcMNND/krZ
         Rk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789775197; x=1790379997;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhFK29n+MC5nuBbvPBOhbnlgDf/9/2f5NLz1t43GcV4=;
        b=Cdi9zqPvRbi9ZYz4Lge4WCKivaopn+daqDCMLkuofP8UzFuHYBgOuYUVKQ/DvE/gA0
         cWr2Zdb5wBT2Cdu04V3qEtn+42nTRS31X8xw4mjUvqTyh1zknmojaPvLwV3CjtVKgl2A
         f9HwOSyhicb8M8KdscIqbRax59zfAv4G/cMbjEqowIeuw71DAvhH1npbsMzN8dzHz7ho
         YipRUBzQKgkwvwA2LezCmZ+/zOPUqBYhfd/h7sOhE+GKJM9BA/GiI/XIr4xzJ4ZR6/BJ
         qtYZ+DxoUKx1ghMD2rMt2DP6lfQHGMybrF78xpADwZC2K+hWSTaGZakotxBG5KKUb31v
         BE2w==
X-Forwarded-Encrypted: i=1; AKwUvBymvEsbzS5Oj3X6oNYxnrHBD+tSb5PzTroD7bcFSA/3Zh22iv/nTTQGzzVEvg/6Reuiihxcp2v9kagwU6wSdSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k4ElwGEF1FXHpHdtoRc59UvZVwpHWaZ3b4U7Oj1v86NQj5d/eS
	F8LBZCcuzN2IalDqerhwYDvCEH/fse8tCuv0hESktTTrHWk5+b7T9ZGu
X-Gm-Gg: AYBFou0gXoZiBDm4U7FXW8u5GKn+aouVnw0flELgiK26L/geTLbf4ozwhDSGBEuJAgA
	DFNKN1EjoSPQoqQaopV9mHjbttZzguv95exfsub40P9gRKq/sId3ftb7sN6XmRKO2qwZVOXsV82
	ZqkipikjHSsoPHIaXvXsa63HDC3mbwkGz9lTAlCMrToFn6c7F0c/HMB/702Nuu4J3lH+9dL8FCq
	BsfQh9y39OYeNNjFWBnIxN9+FZ1EJHMpQcimfsARB71+zvEIKt5dx6sAJN40hcwm5CMvkhArZ3y
	fz9q5Xgvs9moRNO6URjnAKNuIxINH9QGdWAgpUNMxMCCT77/ByLnOFmywXshckwSQj1gMU6wnXb
	HE7ptXe2wHIuUVPHH+IjBHNdMX5x8v+QhyUqBQh9I9DTuJAFcx43qumD9q5ypzhgbYdM5X0EqGI
	AvnEANtL6jw68+9kBzUEHUsRAF2n/BtXfFbVWX5cvxZ7uqYrNnhi6iXFK7/DUtzL+zPdbf/fv9V
	mskQxAlxV3EXLY/IVCRTa7+S2hUFawTMf8HIDuAZ5Z/2fBRHA08qk+5rgpKuxTnuCvtFlzFE38a
	sRGtXc0BYJIWE8MAlp/mrbWDA5uMgmnD9oqGGLa0z9sflgDIjkomL7tKk511GuaWKtj6s428YIn
	2SZcegzl90F+v+49OWw==
X-Received: by 2002:a05:600c:1d1b:b0:49e:7cc6:ec88 with SMTP id 5b1f17b1804b1-49fc7e00555mr43611665e9.1.1789775197074;
        Fri, 18 Sep 2026 16:46:37 -0700 (PDT)
Received: from ?IPV6:2a02:3100:59ae:19fc:400:b6b0:efdd:810c? (dynamic-2a02-3100-59ae-19fc-0400-b6b0-efdd-810c.310.pool.telefonica.de. [2a02:3100:59ae:19fc:400:b6b0:efdd:810c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm32070215e9.6.2026.09.18.16.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:46:35 -0700 (PDT)
Message-ID: <7c09a44a-19d9-43f5-a852-12f5b6579641@gmail.com>
Date: Sat, 19 Sep 2026 01:46:34 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] net: hsr: fix packet drops caused by GRO superpackets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com, skhawaja@google.com,
 liuhangbin@gmail.com, stable@vger.kernel.org, sdf.kernel@gmail.com
References: <20260809121455.1745-1-xiexinet@gmail.com>
 <20260809121455.1745-2-xiexinet@gmail.com>
 <20260813182111.088aee3d@kernel.org>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260813182111.088aee3d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2026 03:21, Jakub Kicinski wrote:
> 1) could you explain in more detail why GRO is breaking things?
> GRO shouldn't merge packets with different L2/L2.5 and packets
> with trailers?
The reproducer is plain SAN traffic entering a PRP RedBox's
interlink: matching Ethernet headers, no RCT yet, so GRO can merge it.
PRP then appends one RCT to the aggregate, using its length for
LSDU_size and assigning one sequence number. If the aggregate LSDU
exceeds 4095, the 12-bit field truncates it. Later TCP segmentation
cannot generate per-segment RCTs. An aggregate left unsegmented may
instead be dropped for exceeding the lower device's frame-size limit.
Our wire captures showed segments without RCTs and duplicate delivery
through the two LANs.Disabling interlink GRO raised single-stream TCP 
throughput from 27-37 Mbit/s to about 94 Mbit/s on the 100 Mbit/s rig.

> 2) the code seems inspired by LRO but LRO also has
> NETIF_F_UPPER_DISABLES. This change looks rather incomplete.
> Calling it "best effort" seems like an excuse.
NETIF_F_UPPER_DISABLES prevents a lower's ethtool request from
overriding an upper's LRO-off policy. GRO is outside that mask and
remains changeable; extending the global mask would affect other
stacked devices too. Patch 1 sets the GRO-off default, while patch 3
segments plain, trailer-free aggregates before tagging, including
when GRO is re-enabled or GSO arrives directly. GRO_HW can also be
fixed on, so feature disabling alone cannot exclude all aggregates;
device-specific hardware-coalesced formats remain outside v6's
segmentation guarantee. I should have explained this distinction
from LRO explicitly.
 
> 3) Clashiko has a number of other comments:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260809121455.1745-1-xiexinet@gmail.com
I have retrieved both v6 AI reviews and will address each comment
with a fix or technical explanation before posting another revision.

-- 
Xin
