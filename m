Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A381DF73A
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 06:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701945; cv=none; b=lKEPnbh06xy9zkyKdZ3a3x1iDupQzcjR5TP2iblWFQKolpLjTsPQAJcpulfPs7RBy7LMDzs4efW82e3bu4BwfYoDU+h2/E7bwByfzRQ29Px+8422aXF2MKr+CdaYLNrn0dEw/dHEnrpwcrfhxiCsQjS3N4+y8L1a9NxFVoyxUk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701945; c=relaxed/simple;
	bh=X/hZCb0jhWMLtO0yzfJTyu1aVwl+6kQirfxui/Burbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUZykWGdUHGAlUGJecmlR6kqud14HHfG1diWw0ORtJ2VaG77Y/xmEaOHuXfDQCB7KKE9AHtBLj+irB2K3gWct77mIHW8Ur8YLKA4oNcIJszJbBZFZMXRyM4lTeI4AhODTiph6kJID5viEmFMBjP/TG0iSmg1c6/WEeFAp7gmhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=gYykFdUD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="gYykFdUD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so15587075e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 23:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777701942; x=1778306742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hb311y/HjKGqfYjiqwo0iWKOc8y7rqDPGTnOkcrspE8=;
        b=gYykFdUDDi2ROI6LbXOHU3TdkfVmdZjcslOVXt4bIBdCYVFtWJYrdomHd/mX4aUjMZ
         Q9X+z3BvUJ00AfUCNWiSm616pj8jk63wDt0Su3i4xwcN3AqhLQXTCj60lx0bwOzk3iYd
         TNADnzqemOfQqzQ4dk9M/nsouo37c/M2qqMoczwEzm0gYasP+Sz5phgxUZPGKN11gi72
         aJdVcUtDgFa+aQbSApjtC27j8lrmjKaVY/93e7HwbM+tis6xRJJagWtEHoSlEw9aML3I
         rGrgQZFzzUZu9nhPC9KSS02X+VYaWv8FIKs7eP+wGy0lJWKiFFCQqtPQ8LDG61MPGVkO
         Ju+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777701942; x=1778306742;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hb311y/HjKGqfYjiqwo0iWKOc8y7rqDPGTnOkcrspE8=;
        b=mSzp513FZZI4x5edfkMvfb5S/o3cCizkwjo6Qw+eoKJhI+GD4i7Uupv+cxYEukXUrD
         SssY7TxhkgpD+yC43STONPYPi2LjoqhSNngosqCZfO/fUyyd3W9dYJJXs6JWW0a89Efg
         ircNksKjn6K9o4mQ1HPoN91KgeacbkL/qIHEwhorT4Z0NGNC7eyk6OicOcSTupmb2Ifz
         gKEOAzWAV3BaX2z3aPlXisEsVONSL0A5y+BGk5/5gMGYAnJfMqZZIZct9M9Xqf+0dFYA
         vjkKZ/tI1Uu1WK2P/OpAB1C24+N44zTxOaHaR7yYvfYN/SWuMur9VZA3uGMnlsb34KAp
         oOlw==
X-Forwarded-Encrypted: i=1; AFNElJ+KXR9VfI0tWpQR6NJbfUcwaOWMzdZiy200OfUjWRdlOrBFQfwR/Y9YGSwk4JEkHSYtIelYqgxWLgVYTDySsRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysQpIljBqIHqwLAT779CbCAOdlRBuzk6huZf6ZAlcI1Y/lhrlt
	gd1dIi2RTw9mI7y2nFRDWhxSDKrRhVaJ2RiMhGdQEhLQsGFRoGnQbTJX28CisSFRQ7I=
X-Gm-Gg: AeBDieuWj2Ah3Xr6Yyyjq2GbpQET7xAidgp5dXyqO3sLVG4jKL95xHAEPqsmRI7VpSx
	XMo6HY6PYliiYhcDLTCWSnyEgzkKvy5DMG+NXEpDR67EBECLwtAB6jJvD7xrZuhb8BOn++1ArOY
	Xe40qnfKUH3dqt61kbRmqJbUbnXqWq9q2+yhKpxXVSJpvhXAhTjCiogAZ469DPXfsYfkfLHDfW4
	gJpadLGUJJjcNtezl7ltYrURex6NndjuNCTEo3bUmy423JQEgtt5fI/1IuY6UnrqCx9mIO7oyrM
	LVfUqV02uepsUUa/+h9n9z0YKtiX2Sq4/nFmb/8aK+QZa6CdreMgVbUMlv+U+fbNcgVPm9TSVWM
	ozUEyztvbjy2JO2w3t8LsDHoYpjhSb+v3ySK0X4/eGtbcsPDcZIrfJfLJRmDO/VSI231SHGVeR/
	RSshBlrtpTOeMsoK/gHcvQ6m8k2juprDaSMsK8gmE02H+mjV92KQxtCrWeOMfQAkck
X-Received: by 2002:a05:600c:4f13:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48a970fda7bmr29905755e9.12.1777701942442;
        Fri, 01 May 2026 23:05:42 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822c3422sm157004635e9.8.2026.05.01.23.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 23:05:41 -0700 (PDT)
Message-ID: <60fd2cc4-1c04-4db6-97cd-bc3bb9710a04@blackwall.org>
Date: Sat, 2 May 2026 09:05:40 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/5] ipv6: mld: encode multicast exponential
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
 <20260501173130.3486-5-royujjal@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260501173130.3486-5-royujjal@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2026 20:31, Ujjal Roy wrote:
> In MLD, MRC and QQIC fields are not correctly encoded when
> generating query packets. Since the receiver of the query
> interprets these fields using the MLDv2 floating-point
> decoding logic, any value that exceeds the linear threshold
> is incorrectly parsed as an exponential value, leading to
> an incorrect interval calculation.
> 
> Encode and assign the corresponding protocol fields during
> query generation. Introduce the logic to dynamically
> calculate the exponent and mantissa using bit-scan (fls).
> This ensures MRC (16-bit) and QQIC (8-bit) fields are
> properly encoded when transmitting query packets with
> intervals that exceed their respective linear thresholds
> (32768 for MRD; 128 for QQI).
> 
> RFC3810: If Maximum Response Code >= 32768, the Maximum
> Response Code field represents a floating-point value as
> follows:
>       0 1 2 3 4 5 6 7 8 9 A B C D E F
>      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
>      |1| exp |          mant         |
>      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> 
> RFC3810: If QQIC >= 128, the QQIC field represents a
> floating-point value as follows:
>       0 1 2 3 4 5 6 7
>      +-+-+-+-+-+-+-+-+
>      |1| exp | mant  |
>      +-+-+-+-+-+-+-+-+
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Ujjal Roy <royujjal@gmail.com>
> ---
>   include/net/mld.h         | 119 ++++++++++++++++++++++++++++++++++++++
>   net/bridge/br_multicast.c |   4 +-
>   2 files changed, 121 insertions(+), 2 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

