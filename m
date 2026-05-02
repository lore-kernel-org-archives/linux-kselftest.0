Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298522D5C83
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 06:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701990; cv=none; b=WAZdQMuZWxLgv9UvxJbEZz47NktlbqaYQMl/aAo+WSArxNdjuukAEDzwL8oD2gMG/ywFBKJ3jUD3Gcfo+QnORTWywSYfCkMn/3+5KXFzpOk6NZc9hHIcTeLdYsh2PkUNKPPOJT6tLhZ0PSM0B/hKScf4cwFLcNaZph4emXZEm8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701990; c=relaxed/simple;
	bh=KTOCjruETFFyA9eMpMwBg7rk2PGjXG1IZi/DfUc1peI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhokYuA6ttPvLOrsaz1krNT0gpCA+D1JxbxN4kqlnn+q9rv/b9XphLPI90HI5/5VM22tPDjPqNiTV2aB2Dpl4WTbeBSrsoNIy1uXQdAy2NTwHUjwnj78yNcXVYINcL0QWaKDgK6iDGLsd1qML1qyBqzvnPvYKRjNBzShffbhJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=F6xKpikF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="F6xKpikF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso27803865e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 23:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777701988; x=1778306788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2x13DrMgH4CKBCggYi3SP9iAtnspCOSFTNkvACPndhs=;
        b=F6xKpikFAk+3g6LdyAo7yumsTr/6onrE+Yc7H74bo4+BPJdNQfi2A0yrzAWop1MoGb
         8XKG95AL/F53xU6N66qLTL56LE9RLSZOPG9fTVDgpUL5DIfq3tzrXNOf4++K2384dluX
         c/7VCmSirqvtnCiK7oMLUf3pHgW/hz+ugn/oWWPb2zKSZ4SD6jGtgdIzBafWMeU9T5+L
         AIjJr1c2f9WnrKkm+7rTcl9DBua9HmWN+dB/r5RGC7tJSx+0t6ZF79fniJCxM7/yCqiE
         Qu6whg9HXhVCh5f1yYczbnFL4tFZBjhC0KJV+KBPNa59KXXaHZGPw8XvnoZl0/lyiLOh
         Uu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777701988; x=1778306788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x13DrMgH4CKBCggYi3SP9iAtnspCOSFTNkvACPndhs=;
        b=e9CIPyPzbP4EVPZqHlPvob31751+y4y6aseguS84qNCRHFBNwjHlcXqVKSfDYo8Lff
         GK6kNP+KiP7+Pyj/qUtbQFXZf98gAV/tZNzqEJi3U4CYZeGz+joyfWe/rq+rgJYXjsic
         2rNU1ERVCKUqxvfYbrPuiJqzcyZqpzaCNLaF4F/zgxLhub+j2SR4M1YuGeNeupas6xq0
         4XVuwQ7CoCWKdPGyCiteAPAvo6tIV0Pv2TjiSFX+mh7VUpBqgWFJl1Plcr9FdYQkPJ/8
         lQxFT0AEGIDUEX9HaATjD+5gIb9QqlBk0FiXSKjf6Cb5FyrxiDfzneBIU2fMdI5I81C6
         OPcg==
X-Forwarded-Encrypted: i=1; AFNElJ90wyhJNCqpTuNdajZyeMY6VupjBh+u3T1l8xXrM5117X1VS07QLADWwyHSRz/hWurutZjluOchlHRBqvJzpc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkEPcRZzPvppWZQ4bwYX+JOaay09vfLU5qabkHtw7OSz307HC
	xcp0sl2DptnQ26VRRHHePVycatL0rf94YYEH76fJmgLYFirr0GmQ9CRWGcNH1uywi+4=
X-Gm-Gg: AeBDieueNvOp2FB4/Xtfd+IEaKme8GPLeRA06NY7GJeiJr7NAuu60glvAf92wuNTsWH
	P7dnlR+R1n6h7fOJDvpj13A2Fz7xEEH2ORsZ3c870F9CnR1c4sGbuoJQk1raU0Z5igKgWtcdDcC
	jxoL9/3dzO5nieveFzmX/z+IJR9bc77EL82++hg9QktDtXBYvQ/+t4/S05D3XIPFBntgdZmGUb2
	fSPuw7L2kqz3rJM9GjQgphMD45O/kMrgqcB4zXhSfySXAFQUYQl2RUc2YLPOo1QlHClf0d9uLeb
	r0lqtle9pKss/uziWw6a2s8qoiZTOC2Bevvh2eHeaxeln4/0OEEdWdRALLjNKZ1kjW36hoCMVvO
	kgLtBFgBmq0Z0qjXUw7vtLulDI5xMisx/GMXGGX0lH3dnCu4Lxci4dbHZ2LCZiouJ1IWrFnGHPA
	43IvMoIS6nEoVs9eCsJ1e2u6AIF1jgQjxzSSLrMEC+g1IHlHqZfbH8xXVlyU3cWoQDDpZer0D3E
	mA=
X-Received: by 2002:a05:600c:608a:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-48a9865d2ddmr24979785e9.17.1777701987611;
        Fri, 01 May 2026 23:06:27 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm171888165e9.0.2026.05.01.23.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 23:06:27 -0700 (PDT)
Message-ID: <fc6c4143-d279-4e79-ad8b-c5c06949dcd6@blackwall.org>
Date: Sat, 2 May 2026 09:06:25 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 5/5] selftests: net: bridge: add MRC and QQIC
 field encoding tests
Content-Language: en-US, bg
To: Ujjal Roy <royujjal@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, David Ahern <dsahern@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>,
 Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260501173130.3486-1-royujjal@gmail.com>
 <20260501173130.3486-6-royujjal@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260501173130.3486-6-royujjal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2026 20:31, Ujjal Roy wrote:
> Enhance vlmc_query_intvl_test and vlmc_query_response_intvl_test in
> bridge_vlan_mcast.sh to validate IGMPv3/MLDv2 protocol compliance for
> MRC and QQIC field encoding across both linear and exponential ranges.
> 
> TEST: Vlan multicast snooping enable                                [ OK ]
> TEST: Vlan mcast_query_interval global option default value         [ OK ]
> TEST: Number of tagged IGMPv2 general query                         [ OK ]
> TEST: IGMPv3 QQIC linear value 60(s)                                [ OK ]
> TEST: MLDv2 QQIC linear value 60(s)                                 [ OK ]
> TEST: IGMPv3 QQIC non linear value 160(s)                           [ OK ]
> TEST: MLDv2 QQIC non linear value 160(s)                            [ OK ]
> TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
> TEST: IGMPv3 MRC linear value of 60(x0.1s)                          [ OK ]
> TEST: MLDv2 MRC linear value of 24000(ms)                           [ OK ]
> TEST: IGMPv3 MRC non linear value of 240(x0.1s)                     [ OK ]
> TEST: MLDv2 MRC non linear value of 48000(ms)                       [ OK ]
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Ujjal Roy <royujjal@gmail.com>
> ---
>   .../net/forwarding/bridge_vlan_mcast.sh       | 140 +++++++++++++++++-
>   1 file changed, 132 insertions(+), 8 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

