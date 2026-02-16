Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFC2DCBFD
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230538; cv=none; b=D6sU6okdks9L6ptsZ+elEMtRilUZb3uo9vm/hw+jVIXEy8tRW1VNj3lQaOx45dsL4VPjYw1HxDvnxE0QKdN5TKz/fN+0yOXZnLBZSqysHk3mTGZhHM3dDROIUI4IIUuX7ys6ddd6mZWXPRViR6rCpswYvy5Xkn9LS/7F4uQCdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230538; c=relaxed/simple;
	bh=uR23f/Xi4qAYu4h7O8AC2abSIGMZGM2ZkKUBwEHbfYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+frr70M7spNOhO1vkbI7UFxdbrziRAaI+QiIHs6SLtF+1aZmZds4VYdOpYLJEkW/TNYnPINe0h5aqa1+V4Q/kaRQP8PyPf/QUQvveClXuAcWHXd4QSb+tNPZp8wWqp3qJlCVyEEsMK8D6tqMlv+R8c2QkQLTXWQLRNW+Cqisp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipj3T9M8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipj3T9M8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-436263e31abso2788080f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Feb 2026 00:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771230536; x=1771835336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqMDWFA09AdxtFbAq9HafV9nKqlfN7BY8T0DhIPssgc=;
        b=ipj3T9M83IroxsQqnApSwOU6wogDZYue0gmQYpMI3YGGbWIRQf1Je2jA2XkZ1k6FcL
         gNIgxWgusOu8o1OBc66TGpjDs2vd+PII3yXM+ln3cIfVFqvrEA+vYKzorvHs8r8kkd+o
         eofxzx2DATZMgQxG7RX2fAEy8Hf4KY2oGqG5+bR+zUOr0Iz+iZ/BfJsoso4slwV8vaH9
         qWMbBwxAF3XbIKkv+IH4MlOzao2dMeEMuMbO59qQFI1VpncwExpJ9665vi8J9zHftySV
         vtJ3x2ss2h8bjEvNpca2Fmuj+dVQqgj+Di4wTFRibfYpAwC0VnJn1Bl9JtWeyAGj1QLf
         EJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230536; x=1771835336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqMDWFA09AdxtFbAq9HafV9nKqlfN7BY8T0DhIPssgc=;
        b=BBKxiXD3VgwE59lnkk4rHK037qPKhilZbK8atvTX/EpBNrptenwg9Uw8m/M4id+egJ
         K2daNoe9vinkE5bIUXUv/7MGq6KEv/nqEXXEKhH1SHp1wmcPsjSSQRinYB/9ls3elypr
         FBDGjvSBySk5BRWScDvGXkd23w2VYOC8iGPy5XpNhm59xjN/MFmp5OOEbcQhfA4kN+rG
         zIyHyTnFrOrob6xKZxVvPImVvMQnegm+Oso1w+hZLfPUXDk142jyMIWMUYipdf9s5by6
         /H/09xtFhdwrC0X+jgsLvcXenX7zKuJjiObO52mHzI0J0MgmUjPAd/pz1A1J840xM5y9
         kEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Z6NNsTOXOaZnSo0n2pVHWnjXBfQFudG0niaOFG6KW7mHCJXieUnDvaYi/qCTVK4Q1biaBn7Ip4o1OYXmAOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0QC+YPGnjDQeFKmvi6q+02RC2jkSp52Myhl3nMx1z8j5G4qpp
	ztjAcWdNY9zxbHaLf8aJd2ql56Ps+SBZwdk76hCk1wcMZXqtRB66GRuJ
X-Gm-Gg: AZuq6aK439/Fi1bD1FZmi6UQibNBwiktmOtGNOcb4uuapADiiOfF/9rB3g9f5bi/7f+
	FS6s4fkP3ubWotQckxrTP3bJBjXoTpGl16aO6OzGb9TAVpE0oUSd4Qe+z2O+k7YSpEixIs3fu2E
	A/n5+glQJkxPBge5krORjIWZ2HWfpmITVSzY2WfwykSm8LpoT7PjKgMAZ/sHy86+cfOSsiAK80T
	MkzFio/t64H0Qmxttiicu2kJVSYf0NUjrS63wfd6G1ZRv8cylInZhsujbkeT7elBPFmfbO3/Hsj
	bZ+JiR5peH+qDj9fc2KTmqSv9hnFkIo+yttiL56fCcby9WzUH7IKhfczeyXGFVO3IsWR8VwS51H
	WGO9SdmPJFisLYvsjcqpWZ6NJA4wPY+D3Olc4xaBEj+inPfhCN9DGbbLDTWGPXgOivebrQEWz4Y
	nvN6EF8B7zyvdUJEQJuFAarJUh4tWpYBQOIN1HS+WOj3A=
X-Received: by 2002:a05:600c:6808:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-48373a3e755mr166426555e9.18.1771230535438;
        Mon, 16 Feb 2026 00:28:55 -0800 (PST)
Received: from [10.158.36.109] ([72.25.96.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a4b63dsm81455705e9.32.2026.02.16.00.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:28:54 -0800 (PST)
Message-ID: <ba1885cc-57e7-488b-946b-d08c1644dcaa@gmail.com>
Date: Mon, 16 Feb 2026 10:28:52 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min RSS
 table size
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yael Chemla <ychemla@nvidia.com>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org,
 Willem de Bruijn <willemb@google.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, noren@nvidia.com
References: <20260131225454.1225151-1-kuba@kernel.org>
 <9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
 <20260211134319.39710c1d@kernel.org>
 <dbbe9690-996f-4a63-90a0-baec52c27236@gmail.com>
 <20260212172215.0a3295a0@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20260212172215.0a3295a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/02/2026 3:22, Jakub Kicinski wrote:
> On Thu, 12 Feb 2026 11:41:19 +0200 Tariq Toukan wrote:
>> On 11/02/2026 23:43, Jakub Kicinski wrote:
>>> On Wed, 11 Feb 2026 22:10:56 +0200 Yael Chemla wrote:
>>>> Thanks for the test addition. I wanted to raise a concern regarding the
>>>> spread factor requirement that may apply to mlx5 and potentially other
>>>> drivers as well.
>>>> The real issue arises when the hardware's maximum RQT (indirection
>>>> table) size isn't large enough to accommodate both the desired number of
>>>> channels and a spread factor of 4. RX queues/channels serve multiple
>>>> purposes beyond RSS - they're also used for XDP, AF_XDP, and direct
>>>> queue steering via ntuple filters or TC.
>>>> Artificially limiting the number of channels based solely on RSS spread
>>>> requirements would be overly restrictive for these non-RSS use cases.
>>>> In such scenarios, we'd rather have a slightly degraded spread factor
>>>> (< 4) than limit channel availability.
>>>> We'd appreciate any feedback on this approach.
>>>
>>> That's fine. In fact IIRC ixgbe (infamously) had more queues than
>>> it could fit in its RSS table. So none of this is new. At the same
>>> time if user _does_ want to use a lot of queues in the main context
>>> fewer than 4x entries in the indir table is inadequate.
>>>
>>> The test is based on production experience, and provides valuable
>>> guidance to device developers.
>>>
>>> I'm not sure what you want me to say here.
>>
>> No doubt that larger factors help overcome imbalance issues, and it's
>> fine to recommend using 4x (or even larger) factors.
>>
>> The point is, when this comes with a selftest, it's less of a
>> recommendation/guidance anymore, it becomes kind of a requirement, an
>> expected behavior. Otherwise the test fails.
>>
>> This ignores multiple other considerations:
>>
>> 1. Existing behavior: In general, mlx5e today implies 2x factor, so it
>> would fail this new test.
>>
>> 2. Device resources: In large scale (high num of channels, or high num
>> of netdevs on the same chip, or both), it is not obvious that increasing
>> the indirection table size is still desirable, or even possible. To pass
>> the selftest, you'll have to limit the max number of channels.
>>
>> 3. ch_max should win: Related to point #2. Driver should not enforce
>> limitations on supported ch_max just to fulfill the recommendation and
>> pass the test. I prefer flexibility, give the admin the control. That
>> means, driver would use 4x factor (or larger) whenever possible, but
>> would not block configurations in which the 4x factor cannot be satisfied.
> 
> Oh I see.. I wasn't aware the CX7 has a limitation of the indirection
> table size.

There is a limitation, we read it from FW.
It's usually not small, much larger than 256.

But currently it can vary according to FW decisions in scale (resource 
management).

> I wrote the test because of a similar limitation in a
> different NIC, but that one has been fixed.. I have limited access to
> CX7 NICs, the one I tested on maxed out at 63 queues so the test has
> passed.
> 
> Is it not possible to create an indirection table larger than 256
> entries?

It is possible, depending on the exposed FW capability.
As of today, there are high-scale configurations (many VFs for example) 
where the FW exposed cap is lowered.

> 256 is not a lot, AMD Venice (to pick one) will have up
> to 256 CPU cores (not threads) in a single CPU package.

