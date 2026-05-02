Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727342DA76C
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701892; cv=none; b=KVJJxJjust9mKNYoJVwRQJfqaMkkzYBiwdUsOKF4HCoYobe4fLDnbKaWVkCZCwUz6f0fILDiJWI5tg1QuhrJWgPs641NhgNM39r1+PxiLbFnUZMhWr9fgAxtfpkQxPyJsjVBc4G2FyqMYptvO68Xa7itXrKiJZOsSqCCzqCYbVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701892; c=relaxed/simple;
	bh=5VSyqBvoid9uFXOUdR772I1+U0H44cOPYNrNocs56ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InUQpwSZZWk+c1BENKcBTenyPLw1AvN/9CyYRVUdKKS9aL6AkLWQVI3oFYYh+JehtwTFhn6Ypc7KlrF9DFpzY6H/vZ+XB1IcLPo3gCEO3kZstQSvk/R9T7VZxguP7PwPzpKW/1/q1Uhd8dfFScsPahwgnWVicoNJBCuk25Tfeuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=kG2wG6Jn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="kG2wG6Jn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso31550405e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 23:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777701890; x=1778306690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePyFY9tU1bqBeZ/CDvqIuK5nLfvL0Jsqz80NzKwHDyY=;
        b=kG2wG6Jnt3Cj/nb5Iw7wIlfK0BOqouM0pPso1iI1aFMM1JRGe4Rc5gGpHAUarvapK+
         BDO3iNo5ZSsbbTBw0CfT2JK6mLRa9fCWNcREMIHoRVXwquDWZyZ+8aBHJN06BiQ2qSA8
         iM+hzH9wyNK157wxeE8yduPVxgWhhFJwF8k0OFEp2Lb5x1ylHUiLo6P6qJQaUQw+mhgp
         SlZZ0Fi4ufkWTgt5hqgf/GaDt4bNT5uxerA9Lbw0OkvYUAU+Jsr/K7nuJxkVTTUcAyuO
         ZjYFqpAKaWWYexn/ySeK9mVByCTSCgCAOZSDR0kj4krgJwkwRvFOxJyS7bx4072CwQII
         1GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777701890; x=1778306690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePyFY9tU1bqBeZ/CDvqIuK5nLfvL0Jsqz80NzKwHDyY=;
        b=UYw0T8QEglbMy7C91k89+EHZE7BdPpkxuWfv9WLdEbrCZnxVDvX+BA6ztwPiy3ZzTk
         RjXW1/lG2jzjFLzdrTf+hLjifqAHRz3BqZScOYxFyFVB/EFqhaeisPKMvCpdDFg8qAwl
         GQZyA+ri6Ehs6ceGveTkIt0HS8J+qLgNTaj7KLneZ1reeUsHoNkrrYZYJ2DhHM3SWcbp
         iLg67/zMoO6rWCIICN592vT0oJnXAlFUz6na10zw1WYobUFla0VM1OHBBgtAvE8GeOvY
         w7a7w0RD6eRayJech6zKeWuoeGBgyIpWYqV47b1gMxaNXX1HDjj8O5FTob72cSxKdYf7
         a+vg==
X-Forwarded-Encrypted: i=1; AFNElJ/+Aev6/gSd4X18Yr/NjTDFjQEIZXDJKOhIwruFdjtQQPD2U0+Ad3QRGkdx6qJXKqwcUIkZiC9+LnM2S9oQZgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsz2Y8nvi5eBNt/oJakpgPmWFUuGiLZy+ciKAntr6NFoKxzvs9
	u942R2sIbaSghMRdr9YnlKeoYXLa/4fJjs5HCU5nycoQp3KU1B4Zg9sHf33B7wQNKcI=
X-Gm-Gg: AeBDieuv2avAuq3ElmAOB/GexOfAr9IvvQTmtuqgAImQuv+loscWp7mKV8sFffJNGzN
	3/jYTEOrhLX0Og0SGunlr6MTvWyvb4cjPAoqr6Xt202Ph1c5qGcUWJM6vXOoyI3fOIQxYyJvAp6
	Jh8BHcu1gY01GIrIpQwe64YNCNLXbQhpBeQli8JlB2c+6tYuVKEDj5tRRWwghsJxd+x7g5F7Y1p
	2XN994wl/faz5gpLVb4AiTPpJuopHsXsNyHqc0E7WlN9A2Jp4k7xBHQpH1xi7OA+cNbEMoRs0dT
	84wbiGqOhf0dtHbt4aMzQ7PEeI5bPEfnLjnqhqDZqTix/5I3vHrxYFWEFH1+cCS0zmesSLphhqe
	S10kKVWFnAR7+QO/DyrsbDeySMU8tKbfT4ZFhB6LvYVTTCDJyQNeDbO8mnnZXKFiVibZEJgzBJS
	ctxi+amj1xifjj5rGnlDZB44J6T/iF1Wdhr1a94tYW9AyLdnPxTxaw88s6n2uGkYMbHJJrmj9LR
	O0=
X-Received: by 2002:a05:600c:4450:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48a98639086mr24427625e9.9.1777701889840;
        Fri, 01 May 2026 23:04:49 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm185348695e9.1.2026.05.01.23.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 23:04:49 -0700 (PDT)
Message-ID: <b4d8277a-2a5b-49d4-a132-0f875e580fae@blackwall.org>
Date: Sat, 2 May 2026 09:04:48 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/5] ipv4: igmp: encode multicast exponential
 fields
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
 <20260501173130.3486-4-royujjal@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260501173130.3486-4-royujjal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2026 20:31, Ujjal Roy wrote:
> In IGMP, MRC and QQIC fields are not correctly encoded
> when generating query packets. Since the receiver of the
> query interprets these fields using the IGMPv3 floating-
> point decoding logic, any value that exceeds the linear
> threshold is incorrectly parsed as an exponential value,
> leading to an incorrect interval calculation.
> 
> Encode and assign the corresponding protocol fields during
> query generation. Introduce the logic to dynamically
> calculate the exponent and mantissa using bit-scan (fls).
> This ensures MRC and QQIC fields (8-bit) are properly
> encoded when transmitting query packets with intervals
> that exceed their respective linear threshold value of
> 128 (for MRT/QQI).
> 
> RFC3376: for both MRC and QQIC, values >= 128 represent
> the same floating-point encoding as follows:
>       0 1 2 3 4 5 6 7
>      +-+-+-+-+-+-+-+-+
>      |1| exp | mant  |
>      +-+-+-+-+-+-+-+-+
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Ujjal Roy <royujjal@gmail.com>
> ---
>   include/linux/igmp.h      | 87 +++++++++++++++++++++++++++++++++++++++
>   net/bridge/br_multicast.c | 14 +++----
>   2 files changed, 93 insertions(+), 8 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

