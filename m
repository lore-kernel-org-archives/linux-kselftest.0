Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96772225A34
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889283; cv=none; b=HrTxb9Owya8NmOhCBfUm6Bafgb3YAWPinESlOlgCbx1N4zkAVL5dO6ZRY+LcGXz7eVMD5Z7zJwV2nn/8EOYNJw5aypgc/3vQ/Ki1TBxZOpD6vHOQHKebZakOoYaIkIMcE14GVZF+rBD++AWJandp8GDo9mmKGs7Zf1Yytovcc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889283; c=relaxed/simple;
	bh=yIY/11Dq1CPkCm/A2dAowYLqnGZWKwSB10TrnqAw+10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nufek9xMaoVi83I0+bO/2Z65qzce7mXqe3YHMSKHLQx5NtIlNmZ3XX51aGJ46f2o+O/VuEXCRUXdPqGz5D8R19qSVWLpI0Nq5RBtRSUt/UDe55vPgt1JR7KZv5PXnrGissqj69rOMd8NEI7rP0ILSEqV4sZ0OW6h8cSKEYOCiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgYLzNUU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgYLzNUU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359228b7c6so4138634f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770889281; x=1771494081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwjxeLZCnF17rcxqGqeGmiS56iGGEOFnXmQIiNjxVnc=;
        b=bgYLzNUUZD2HqtlSiww6qDfu0GL/itYcSfZ9JKl3P6gq8f3VcXGcQXQ8eXrRWRNnnG
         2KPWACV64CVhls0FL1j421mdxVf5VeDlkUfzxEmzvfH62RsweUL+6WSsrIxpVLAjXgE8
         LYYfyfsu/7f1iNPSU+yCRO8aohRvWbFQV30a93WpBJxWVS+vFquTLmHYI3JDiIpfM+OS
         W76Fyz5xs+Xz4Pruom3UfmA6BAlWZI1ANVvEYsueQIw9xv9N3y7ApRtCO+SF9fNcrVG1
         SJJsohE03108YMOSgNVuM8YqgeYlQjW8jQJ0yjp4ZizhCdAPAljpNb30ZIygNMa9kZTs
         emeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889281; x=1771494081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwjxeLZCnF17rcxqGqeGmiS56iGGEOFnXmQIiNjxVnc=;
        b=D78fWy1YpZEj5sJQ9iN7DPCgV19ZVHP/z1MwC6vIkekUAl0RL3iX0fIbeGV78jVflo
         jS/hxRSTf2EZ0BzGIvjKcTvKGNKexdC+su3p1Fr6WK9/z0f7RNswCpI1BRxWwuQqmfta
         gtnFEcl7V+BiP6bna95nw+rC/C4TK5cBN9ROhcAdXUmpJNV8p4tFTD1je2NvSckLDMWy
         ju9NrbJrxxqy74wS0s97q8NhfD8WA4x/n2kwSOav2UzqPT67nqptoIbqMBuBH/YmR4lJ
         F2VUG8bbTThPCioIo3m3WJ3MfcbU1SMq7+X8YrewVjFWDjxPxk6qCcZRnmU2xjQ1vvQB
         HazA==
X-Forwarded-Encrypted: i=1; AJvYcCV+S2Ti/dzI887hFnzkUcb4u6a9BlCpZXpnI3vMC0mKfROj16TCKWrJzvS46U1VJ3aRteRE1cPkr44QGqLgk8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/FkX87M+MKtL3dlf1mhFvuZDoxItHgIH6rsI07GXubjaLADT
	V2ITnh57sevnQVc2WB6eDPE/Mmiylke0NY+Ds9xkc57Hk1XaqxEzemR3
X-Gm-Gg: AZuq6aLUJrg3HW6M1VjFh3zx1/uQnuu/VwaZGhHDcubQdOdh+mVPU8ZUORaUOI3Tjim
	rp+1E4v64V8tZn8KEpbQMndX7khPYyAWGj6stk/2Vv3aUolyotZC49B4F82CSuICL2WqT3LQhOC
	xq8J+oTxuxCaFyhhUMoQPlfYSlZ3oZDy/xuilBJMCUAlfP5A8sgpMG1GUIobPkpbj5d3XIf4Ird
	7GuKTUgJV8tddmmNvHzA8yqwQ+xaq2h0DiwE/Q0kco2suEUpew8ePW2t9Fe1+U9IFl/sj3AeHfR
	pQKVBSYah3JqU5e25pAFwOkvjKOGNGFaSOZ5D0PfrOORYuUO1QUScCgOlPP7cwjh9u2UzELqOds
	8hT/Zd+GUSJ5C866wd5L9lwBzz5o47j7ibcMCHzw++tMB9Qt2w//RG9YYimON3vuVkPYxJosxgS
	FfuNB0qImd0n4hSvRf440hwj8ADYBO7lz1Ag3eESeGDkHabg==
X-Received: by 2002:adf:e50d:0:b0:437:8ff8:fea3 with SMTP id ffacd0b85a97d-4378ff90099mr1644282f8f.21.1770889280803;
        Thu, 12 Feb 2026 01:41:20 -0800 (PST)
Received: from [10.221.203.72] ([165.85.126.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e5c550sm11501359f8f.36.2026.02.12.01.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:41:20 -0800 (PST)
Message-ID: <dbbe9690-996f-4a63-90a0-baec52c27236@gmail.com>
Date: Thu, 12 Feb 2026 11:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min RSS
 table size
To: Jakub Kicinski <kuba@kernel.org>, Yael Chemla <ychemla@nvidia.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 Willem de Bruijn <willemb@google.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, noren@nvidia.com
References: <20260131225454.1225151-1-kuba@kernel.org>
 <9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
 <20260211134319.39710c1d@kernel.org>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20260211134319.39710c1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/02/2026 23:43, Jakub Kicinski wrote:
> On Wed, 11 Feb 2026 22:10:56 +0200 Yael Chemla wrote:
>> Thanks for the test addition. I wanted to raise a concern regarding the
>> spread factor requirement that may apply to mlx5 and potentially other
>> drivers as well.
>> The real issue arises when the hardware's maximum RQT (indirection
>> table) size isn't large enough to accommodate both the desired number of
>> channels and a spread factor of 4. RX queues/channels serve multiple
>> purposes beyond RSS - they're also used for XDP, AF_XDP, and direct
>> queue steering via ntuple filters or TC.
>> Artificially limiting the number of channels based solely on RSS spread
>> requirements would be overly restrictive for these non-RSS use cases.
>> In such scenarios, we'd rather have a slightly degraded spread factor
>> (< 4) than limit channel availability.
>> We'd appreciate any feedback on this approach.
> 
> That's fine. In fact IIRC ixgbe (infamously) had more queues than
> it could fit in its RSS table. So none of this is new. At the same
> time if user _does_ want to use a lot of queues in the main context
> fewer than 4x entries in the indir table is inadequate.
> 
> The test is based on production experience, and provides valuable
> guidance to device developers.
> 
> I'm not sure what you want me to say here.
> 

No doubt that larger factors help overcome imbalance issues, and it's 
fine to recommend using 4x (or even larger) factors.

The point is, when this comes with a selftest, it's less of a 
recommendation/guidance anymore, it becomes kind of a requirement, an 
expected behavior. Otherwise the test fails.

This ignores multiple other considerations:

1. Existing behavior: In general, mlx5e today implies 2x factor, so it 
would fail this new test.

2. Device resources: In large scale (high num of channels, or high num 
of netdevs on the same chip, or both), it is not obvious that increasing 
the indirection table size is still desirable, or even possible. To pass 
the selftest, you'll have to limit the max number of channels.

3. ch_max should win: Related to point #2. Driver should not enforce 
limitations on supported ch_max just to fulfill the recommendation and 
pass the test. I prefer flexibility, give the admin the control. That 
means, driver would use 4x factor (or larger) whenever possible, but 
would not block configurations in which the 4x factor cannot be satisfied.


