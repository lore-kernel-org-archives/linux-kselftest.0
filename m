Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822C316905
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780734099; cv=none; b=kYP8BDLgiumCP16ubeH4UwbY7S8yuajrFq2LkF3MnjbQdC0Kqwy4vlm0r9IST1TCCjGihWttuyTDeeb2Y80Eo4hUsYEHdYsgRcOwPvmS3yPkrpMxiDsqr6z1C6A0GElzwn4w1u6H8EJTDWwzptE6VintBIxFX1uLtqFTSnpnZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780734099; c=relaxed/simple;
	bh=xNsig66RaSc9mwJJKda5AfVrR7MopkMm6DomHG+DJVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNm3QCuVFyeBazqkXL3KkGxe6lhWUmBaiIQpmne/are0ZXbT8QbCcQvkWtBU7FDnqqgIWD2bE2UNpog/RQA71zyN/1f1auRW3h2LiPf53EIxDKOXh1SiG2T5F3ZI7reBmczNNJF2rDmG1TLfUc55qeKZirn1zquV2mZRVDCgszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=UH05RJSL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="UH05RJSL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b7866869so31513265e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1780734096; x=1781338896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gMg6KaYvC+cJxi997viIEAJIuy1B+hppRNVQz2bByc=;
        b=UH05RJSLI0QctYLwr0qzLZKFjNETsRVKTwKFx0L2fmVue84qdzMF8amgvjFCWr9kYZ
         /YtZKrp2m4lw32rFAyxTxX3UEbZeM9XSO9EKvrTaAfuaRgimy+HY05Xz/wOXm7inNem0
         6dxSFjusNVmEtwOfQ4wAc4gKl2niSPWagQP18+7wFKEaaTURdQ/MZYbOoWY8euXKQwT5
         amH+ztZnH4WPThQHboUNfr66vOCjk0nceCr+VgpXhcU7wk3V5S6n/G4WzGxnbVmaKpC8
         +IIzaQbP+7FDFGNE9qOZLc5B/PtUzJ0kmhqdpMD6z6ECjaBJY9aUwNm+i+IPjHXwNy97
         j5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780734096; x=1781338896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gMg6KaYvC+cJxi997viIEAJIuy1B+hppRNVQz2bByc=;
        b=FzvjYnkNZl9OqrvXZrEIkCV+H2Dd39HegCWDocO2vySqTUwal24z34ExJaS2gkIbu7
         /Sv7PfHSYUGd/b6VaOM1/IjHuAxeQSSjaacia5FToR0OOtbNQI9WRs20hnkiUtf1p3Uf
         oW2+NcH5BzuSlg78EmJrvdERaQZFcUf1KwJtmC4rKFtW6UP3ubSl4DY4SaTp9rbu+gMx
         uPwjybqtRZ1+H+7aBSvGB0KyRQbuphmSg7Rdx6A898LuQY2f7jYAjBF1TXRZ1U0qz8DF
         TyWZE9LLNvnAAWqfSZEXhE2c7XJRhQEzTjvr8soaY5Xiyfd10GxptbTCGvChDqLZc0M1
         b5ug==
X-Forwarded-Encrypted: i=1; AFNElJ9xYqCwD0F0/krbNf2rN4PUrQBv/G0YiT4ttEigJjScUhMFm2Skq51nXQ4Q1/vZvBsqMW/P4AWTP+84x6YGR+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YztzvKNCzsIv3CUj5WX22ohII8DBbEprjngbVJAsnnpQ8nvWLzq
	4nlMauqd5blzH2HbyneeSdsqheIEz9ZGJO6PJXQkObM3GqmMkOGLsVbgjSMaH8o289o=
X-Gm-Gg: Acq92OFplVAaMQYN8nzt8Xi9zMQSy5D9ZDPImFkDk7rU3fCgR8NFADy1zozt5mj+qfC
	FljuLEmLYAklQ5f+4vWlmszH508PWPIgKoXZfbEIt7PE6B2uAMMxuQ9dWpV6mJsNucRCL4oU12A
	5Yo6Kon9t3+huz9AGpFdp4nyyIiXMXQhe/QP6xvPLLH+fbgwzFGWLfcVEggU4mRczjFbWK/bCxn
	7REaP/cA98K801jQjC1FFEAQsmVDRuPORIh8+/DnyZ/Bgr+sDXL3syskSe4mZ7ljf0gwgpw1knV
	84lTTxHk4dwsOGIdKz7//OwLC5gGZl5HC8DfM9nxt1D/CQFxdo6zGVcIG7an3ubJcOD2IjhzRCu
	zUYO7Ua7v1J9MTGPANxU/ovu4bZ9p07quxw4d+jrS7f4pFlRPu1RPumJfvHWtRNdrhb/xziRwBr
	TA8JrS75dIoU9pjmNqgmQ2QRiraIfZtmjm+XAo26rzVYE6raxnm5C9JKNXPYY6AQKH
X-Received: by 2002:a05:600c:4e4c:b0:490:bb3e:30b0 with SMTP id 5b1f17b1804b1-490c25b2ab5mr131639785e9.4.1780734095644;
        Sat, 06 Jun 2026 01:21:35 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d4891csm82571075e9.1.2026.06.06.01.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 01:21:35 -0700 (PDT)
Message-ID: <a63eed7d-b674-4830-a690-1b55dfdc9a72@blackwall.org>
Date: Sat, 6 Jun 2026 11:21:33 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/6] net: bridge: add 802.1Qat stream
 reservation admission control
Content-Language: en-US, bg
To: Luke Howard <lukeh@padl.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Cedric Jehasse <cedric.jehasse@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org, Max Hunter <max@huntershome.org>,
 Kieran Tyrrell <kieran@sienda.com>
References: <20260602-mv88e6xxx-8021qat-mqprio-v2-0-72be14522e7c@padl.com>
 <20260602-mv88e6xxx-8021qat-mqprio-v2-3-72be14522e7c@padl.com>
 <537410c3-ff4e-43fd-834e-775cd1bbe89e@blackwall.org>
 <E1253C6D-F6F0-407A-AABF-FCAB57100A1C@padl.com>
 <n2pi7h5nvxg3xvshtcxqeizpukp6hphqa7kodbe7b3ioc3kcq5@n34fgocvaicm>
 <d0e650fb-4011-4d64-9780-a0ddd0ca1cf3@lunn.ch>
 <CCF20D32-6C9F-49DC-9838-592EFB5E88D2@padl.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <CCF20D32-6C9F-49DC-9838-592EFB5E88D2@padl.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/06/2026 11:02, Luke Howard wrote:
> 
>> So it sounds like you first need to work on the software
>> implementation and expand the simplified version with the features you
>> need. You can then add support to accelerate this by offloading it to
>> the hardware.
> 
> Agreed.
> 
> The definition of Dynamic Reservation Entries in 802.1Q (clause 8.8.7) might support the addition of a new MDB (or even FDB) entry state to the kernel:
> 
> - add MDB_DYNAMIC_RESERVATION (a state, not a flag);
> - the software bridge only _classifies_ packets against  MDB_DYNAMIC_RESERVATION entries, and only when MDB is authoritative. Classification sets dynamic_reservation_hit on tc_skb_ext;
> - dynamic_reservation_hit is visible to the flow dissector so can be used for policy enforcement.
> 

See, saying the bridge has to classify doesn't sound right. Why not do the
classification where such operations are usually done, e.g. tc?
You have to manually designate these entries anyway.

> Advantages:
> 
> - the new MDB state maps well to 802.1Q;
> - minimal changes to bridge;
> - actual policy (reclassify, drop, etc) is left to the user;
> - doesn’t require a new tc-flower entry for each stream DA;
> - entry state maps 1:1 to mv88e6xxx AVB_NRL ATU EntryState.
> 
> Disadvantages:
> 
> - no unicast support, although potentially can be extended (there are some subtleties);
> - mv88e6xxx support would either require rich enough tc-flower support in TCAM, intercepting TCA_FLOWER_DYNAMIC_RESERVATION_HIT and mapping to native AVB admission control, or a per-port devlink parameter (not so nice).
> 
> This is implemented and working with the software bridge, I still haven’t quite figured out the right mapping for mv88e6xxx.
> 
> Luke
> 
> PS. I previously incorrectly asserted that 802.1Q required dropping frames with AVB/SRP PCPs but without valid dynamic reservation entries. 802.1Q discussions priority mapping in clause 6.9.4 for traffic from SRP boundary ports (those not participating in SRP). In practice I think this should all be policy, e.g. you might want to reprioritise valid DSCP traffic from within a SRP domain, or drop instead of reprioritise, etc.

