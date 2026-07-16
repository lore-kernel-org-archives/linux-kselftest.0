Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003732C21D8
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195180; cv=none; b=UPS1FcdHpEggeGE/kEyg5DkC5ONL3wLWu5D2yDC1o8Fvg96LOnq8sF6AAr3S9IiNrDjAJDjvhPy3f312DWDbSkLDOT6nj1V3b74GYB6iFOEcJTsAlfcnHG7+Q834RTmQdO3Tav9L5k5brUYK+d6xieENzCSMJMG6KrC7crpwDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195180; c=relaxed/simple;
	bh=xVT23QRkqhJ4KVE6Xjupxflg0Om9cDeSJhRc8LkXLOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiVP+lvkbddqvz/9Yag/OWS90tL02OE1seqMqzmv8iTu/MDa9uBNYCnZyXv9GkzOVepygNfbc/VYmaTFra8YV6heaK5+onR8UiO0KszRmVhbZQW/BaBUJvwvx9DZrfXpEJpE4OgqhZczS6lyqhSIfwABPLZLRFavbFql2TGifTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=L6cViECS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="L6cViECS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c16879184e7so12183466b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1784195177; x=1784799977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KTxkaZPHUXOJmJBzLSBM+27rd0POVSJE0Fpas4J7vAQ=;
        b=L6cViECSmyGEaWsbZQNXFOQ3cErfZtQGeow/R/n5cKPpg6Ggp6dz9gkPKzLq9dZiU1
         Lpw5YilP4ASXTUnZglymBmI6OLQkfYK6lRWxoug2TO4sLJFHyj8gyDJCGqdulFbK5EQa
         M/T16pl7M2jyS5hr4doIMPuPam4Xmv2CiF3QHbOtIU5ZZuLs0/eMCXNHfLWdaVgP6+Qe
         xFzHj7fubuy5wr6/+x4kWnAUBQnQYpW6eiNktifwTkMnIXyIxcUF7GHa1oiE76CtfOlg
         9pVEFduOFocY81D3UidfVH8MlGuK7b+tmkbX+CAW5106k38ZXhGq8eY8aXUcVJnj9vtE
         jgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195177; x=1784799977;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KTxkaZPHUXOJmJBzLSBM+27rd0POVSJE0Fpas4J7vAQ=;
        b=jj7Pes2I8SeOnEbFoNX72/WNRXOnr4jZKMzxyZq47fVxx5iptmx3dGDZVaHgPGfgFu
         2S2JEU0I6LqR4r8xReycbhISTo/AgeUz8NZd+BUcXxFeHTla7JPQXdVY8NC5ksmrWmk+
         pciBmL58TYZc1FicHKcpp7/SpcIweb0CNvJg8ph/XveiN2tIc+hUab47YggjAd9XpgrO
         zDuw150bubEvWIGUAp5RG9IVuAne8ibWkt+rNSqAmtru0jcn/OZXXLijq+hq7iMrG0zF
         0l/IOQXhlo6NkmXwuLJrFibtzS07qV2VRbZHChd4skyu/apS+ZW8LAVIWeeC5b3GqKxD
         025w==
X-Forwarded-Encrypted: i=1; AHgh+RqYRj5vH4c+kYTgBj1gNiJgwKEFBCLKCQF/2PSFPWuiLWUiKKGS6DcKntGgHbtqv1siInEh3Gw0I0FGsJ1fqew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCg76YiwouVdzpVplGfB1hPEdzjZTQJDV3dbhwS4RIr0Gc4FRH
	AjoGSp8AFpPh8ucB/9rUlyGtkiWGA7z3Q7itnxH4FXzPz47bKbMh8rpyUKauxiK6fdw=
X-Gm-Gg: AfdE7ckRcvxX/XRZ/sMI8UO4H/XlmMVGdP4YHRIz+QMqKCGreaaBiZuAC3CFhmv1bu1
	McJRQxoJhK6SpiSzYv71NOl959cED9JH/fE2rN3O2/FmJRAV/KCEdLcgp00YibzPdLrLcls1Hev
	gEJmQu/HpKPlG7xJwbXf8Bb3qSvpoEuGSkkcTBLcqH/ykULNdD4K6A7mrk8JavOqBJ/MMyw1vNu
	2kuHS0Zqj4/E43xxBRA9ZtRYbYzd8Tul/sYS5ndvPNYoS+A08v8JR/j4H0/XtnfQ8rIKn0mlOCa
	sxZMd1qbfYTKBqTdF6udWmNasLybyaVzWNRFasgRRteApftBl4keg9fMhHNjPv17JagGinDkQl/
	t+mG+EnoNWHZ8miFm4d9B/uwagmUW64fVItPy8UjRbbI1jMeSctKfJ2TOuVwl0vd+UmjejxxyFL
	bO3jkCY22KfVL5q9k/y7nhzD4IPrlqRiCvq1EHB69yJu6/wV6icUhHcr0=
X-Received: by 2002:a17:907:3e21:b0:c16:1290:11a7 with SMTP id a640c23a62f3a-c161e923432mr637290166b.1.1784195177041;
        Thu, 16 Jul 2026 02:46:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262casm175544166b.6.2026.07.16.02.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:46:16 -0700 (PDT)
Message-ID: <b517ef0e-d499-47e2-aac6-1950c5946e55@6wind.com>
Date: Thu, 16 Jul 2026 11:46:15 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 2/2] selftests: seg6: add test for post-encap SID
 route lookup
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Justin Iurman <justin.iurman@6wind.com>,
 Anthony Doeraene <anthony.doeraene@uclouvain.be>,
 Stefano Salsano <stefano.salsano@uniroma2.it>,
 Ahmed Abdelsalam <ahabdels@cisco.com>,
 Paolo Lungaroni <paolo.lungaroni@uniroma2.it>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711162907.6521-1-andrea.mayer@uniroma2.it>
 <20260711162907.6521-3-andrea.mayer@uniroma2.it>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260711162907.6521-3-andrea.mayer@uniroma2.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Le 11/07/2026 à 18:29, Andrea Mayer a écrit :
> Add a selftest for the SEG6_IPTUNNEL_TABLE attribute, which selects the FIB
> table for the post-encap SID route lookup. This looks up the route for the
> first SID, the outer destination of the encapsulated packet.
> 
> Two routers provide L3 VPN services over an IPv6 underlay. Each router uses
> a separate VRF per tenant, with default blackhole routes (IPv4 and IPv6)
> that drop unmatched traffic. Tenant traffic is encapsulated, then
> decapsulated with an End.DT46.
> The encap routes are installed in the tenant VRF, but the routes that match
> the first SIDs live in a separate underlay table (500). The "lookup 500"
> attribute points the lookup there rather than to the VRF.
> 
> The test covers both the input path, where forwarded host traffic triggers
> encapsulation, and the output path, where a router originates traffic from
> its own loopback inside a VRF.
> With the "lookup" attribute, traffic reaches its destination on both paths.
> Without it, on the input path the lookup stays in the VRF and hits the
> blackhole, and on the output path it falls through to the main table, which
> has no matching route.
> 
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
