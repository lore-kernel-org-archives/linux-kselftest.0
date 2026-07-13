Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBE338A73B
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943057; cv=none; b=gOu9EqQ2+bVquHethQTCNn9wFdsv8at5Z2HHC1C3OK249sKwFVlE+gVxq0AwSClU3pa7RueOhAH7MfcMKR0Sl3w6NA/iuqCF2/MgBCwfYMUazKgvYGhscOPIGqPdOIjiTepxMGtLJdocoYVkCVgbOVdeW/Xw5kBUt3isDZBzlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943057; c=relaxed/simple;
	bh=fkmsy/qj3nDjH6r51nZM+y+pjrVIbB4xwZRlFVlVYik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tj0X3fRcZHpMdMeDOd9rOf+ZuS9QwSr4Sx1p1sn6dFoWm0eER0u0RP7li5ImT+HIV6MFv3fCMz3ngkGkTmcUInh5bftOXNEwnLCLcjuJ1y9D6tHUDPDZgpBGLsWsSD2Ujpm1HVZlGsTJx9TE5rru8vF4Lco4a85Mu8r7UvdDWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=M+TfEqy4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="M+TfEqy4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2612403f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1783943055; x=1784547855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCmyiRNgN+jRhAkyFwvAt0xGNMCOhabSbhuO5oOGF5U=;
        b=M+TfEqy4B1o33TzJTzzCbXqdgtGFZhTniN40XnBRJyktulROSxdPsQU58aIn2Qd+e4
         DEUhiiOJEJCy8tFL81K8MIvXBNAFbsN1EBGIqebdbPvFHiNsVLkvDcWD3WNQrL2vaMbH
         aTSXAhTslibYJRFyVkGU4VPLFwex/m7k5D/UmQGalmkUmB/BeKfsgb4nsUyFFkaR4p0t
         fpAPNqyPvq7bV6DlUUGcfFQ5xnLZ860xBcrEtZbwrDxkepqvhZI7K+LKn3BlIzDCcfID
         kxIYu9bD44HRTBB54nZvoba/xMbEhOgEBtJKvH/zUdkKNz/9eVrUA+u1Dt/hya4KAGFu
         pkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783943055; x=1784547855;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCmyiRNgN+jRhAkyFwvAt0xGNMCOhabSbhuO5oOGF5U=;
        b=pnoOo0yC/H1jFXlOxUK+w/pS1XTlz6Z6KM1A2hxTAx8lGTKGyTqatGIqXdgSKeJ46J
         ofMgcqmYa4EwM+17GvrdUgZIi1MHVikj8gkSqWi9Px2qam4fl4hCSIHoqZJm2cL/Pn8c
         iVG/qGhN/YDxl1ak/8y03N56bBP0NLQl7NKIP3wRtbMT6C8eGjyNkCtGEXYtwBrUB/Fy
         +9bQBnW1he+qWJ+To3UgC3MQeDQgyCyKQL5Za5k+kXLO9DU9kHjXgQOuaghyDdGPBIwd
         kPtRX45YkEY0HHadDny98haxufxDO+NCJBdR0TlRdkZyxB+V/SLg7MZg370cw+8jLjAJ
         inuw==
X-Forwarded-Encrypted: i=1; AHgh+RpH4amhJlcHzFTBskQj/U7fBU2un6GjxyNFIQEyR6Mo8tesHmFxXFRiomp5lNmn84JfyGSLvcd4OcOuFht3QZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/9y1qcyh7NO4Bsdf5kzsfogCKyP+ReCPtq5O/jy692bvCHHB
	7neiDnoAvyp4Z0wmdAgVQ2sEjBYEwHnSyQBZSVWKvTZqDQ24QrDlHamGLVEXcLd1q/R+es7nBUO
	tZtw9AZ+CYSZ26FVF9pDXSK88SsR6WI0IWbQMy6wdd5zOZJF61bYvYCzMvLhHdAo=
X-Gm-Gg: AfdE7cnWxk9tV3k0XJNZXlwfBr66O+MJrzGygsmv9R5mXzDpPGAqfYZCC7mmR3alPd/
	WWdi+jSg6avEKzaEnwmOFzZ4VY7t2hPQmbRVaIiVOE+XrsCgZgM5th0ECZmn/ynzB8avrq66wTQ
	WHuK4koLmCUITK9m2YOgFMzZu9R9Z1carjhAXCfy+V4DTBCvugQThp+Wbd181yd/QNbayMPEETD
	P5mCRATWmLeCaACNDX0bGixwlsvkoMvsVpcf69hn6Pk0vfyWqCaEJz6YK5IvWjpdge0Is04gGZa
	XHgsBrUKrWOWHGuyAEJIhe4v40+tsLpOLkICoeM6ijm8K3olrPPvrqf3sQqkUiw7LszhfftaJqR
	yCIiVLouvwAILK762TaHIp6NLSMl9dvAf5UA4VZzOXSf3VqFUdEPMZjJY09UOtkHXBH9p5IqRtG
	nyWwziTkuftxfRfJKMwqeS5V/9HZQu5GcaX1uWGBdl5P8Uh754pgk=
X-Received: by 2002:a05:6000:2612:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47f2dd1f23fmr11029156f8f.29.1783943054642;
        Mon, 13 Jul 2026 04:44:14 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:cb9f:b978:adcf:f7ae? ([2001:67c:2fbc:1:cb9f:b978:adcf:f7ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm82155316f8f.29.2026.07.13.04.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 04:44:14 -0700 (PDT)
Message-ID: <6eb596f6-5be1-46f2-8f69-b73cd5e8b038@openvpn.net>
Date: Mon, 13 Jul 2026 13:44:13 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 4/7] selftests: ovpn: increase timeout
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sabrina Dubroca <sd@queasysnail.net>
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
 <20260710-net-sft-fix-containers-v1-4-a2915c294ef5@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Organization: OpenVPN Inc.
In-Reply-To: <20260710-net-sft-fix-containers-v1-4-a2915c294ef5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 10/07/2026 20:04, Matthieu Baerts (NGI0) wrote:
> The default timeout is 45 seconds, that's too low for a few ovpn tests.
> 
> Indeed, these tests can take up to 50 seconds with some debug kernel
> config on NIPA. Set a timeout to 90 seconds, just to be on the safe
> side.
> 
> Note that the Fixes tag here points to the introduction of the ovpn
> tests because I don't know when they started to take more than 45
> seconds. That's OK because a timeout of 1.5 minutes is not exaggerated.
> 
> Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

we didn't really bother tweaking this value because AFAIK NIPA uses a 
much higher timeout value.

This said, I agree that when running locally 45 seconds may not be 
always enough.


Acked-by: Antonio Quartulli <antonio@openvpn.net>

Jakub can pull this one directly without going through my tree.


-- 
Antonio Quartulli
OpenVPN Inc.

