Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60D42EEC4
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539858; cv=none; b=HSbJTmJmMBo14cvVUw+lJzuLMXgOLXjRFQfa5MyFKDLNsEf1UAfv4DRaxGgea0VqvsulTAsDRPAVPyjWEkl+RemUKq/OZN41TdUaENV/1Q7bAUK65BOA3TKtIflqD9SfZh4UksPb8HP3sZzfFx6qGA7/rCnb6ZkQFomOU5ciNCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539858; c=relaxed/simple;
	bh=CZUowsiS7R3v4ktfIQO8p3SnSSmC+DnEiusOSgtwtAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3xoiqV9nztjAa/+RUhu7D28fAuwHpY3WMBc6MpnrkEyEwJk2cT40ORD1Y21cBc4KuOToKKI/cE6eQt1RTrAiTMkNh+ntoHKs4nGXLHlFY5tGbMIc9VZ4o7I+Mcy4kes981AFqKMfHDY6b6v54kSSaZLHJeUO3ja2MWAcz78/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=O/ll95+S; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="O/ll95+S"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018485638so1763235e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1791539855; x=1792144655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jGNJK6cAv9yzUM3Gu9HFHfD/WcVYclzAOKq5nlTYmA8=;
        b=O/ll95+SfflFZAIxpt/1tMgMelVC8gKxMphm/OQMShzMCK/QlBOtkM9GypG6vl4/de
         aTlDNODTEaycVihPeb83cssSrY7kmUEOEBX8Lj/0HLi15lHQdI4xh2TEvkTDZrjDIwNM
         0QwkIWwTQ1HBHQ9Bq36dKeo0vjsVXdspFGgAViLguI46cJgtkll/KOtD4caWJqc1iaSJ
         8TEb66NC3V3lRwCUZolx3h9gS59mdTB3FEcoYLMt6z/TBJcM3cO2nQ9dYdNabCmRt0iF
         fRHjKouERBck5yp1MopHm3Y6RZRBuOwl/Eg+gARn3zZNjkNr7xfwWleC5eimTd3jkVM2
         Y/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539855; x=1792144655;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jGNJK6cAv9yzUM3Gu9HFHfD/WcVYclzAOKq5nlTYmA8=;
        b=i9t5mLTw9MLVCnD8x0GAJ2uWPtXv+dlpAo1trItCtahKNfMGG26Ir8pmsLae9VFmQO
         1vyKS+04iIVeXVjHjjfHfeIGEM6WLeodxOrCcQvX1oLV1A0zSM1ahQ7UirLjzpEks4yu
         VRxGOly8PeaIxRcuD/dUUZuk5PK7CzGUMFLFDPf7NLfcSbLBCEZh+IifbcLoocB5xcw4
         Yt6ZDEFNI6oC8SF2mF8JnGKXS8kn+4CsOzVQ+FCGhDiAhIGi/SMEVZ57LbDEac2bjTVv
         91UnDRloDRijR7voVNObR4uBssrVXOeCP2UaGEysdgReR9Pgqr6l60PH3i5rXoooG9of
         +n1A==
X-Forwarded-Encrypted: i=1; AKwUvBzzAEtPYPToXEDUg9ztcC6gqyh5V7h65hI31TMYLVwZm9Pf4eKFEfWoAvuu7gmIhosGDMYkpSinU2q6B2y91eU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHwGZ9H8twkZ9cZlzhyWsFS3P43PnPqczcN57RE8YpsbERczOD
	iGI+7kt8iC1zicLWHGp/71mCCOa44c3H+WeG+5HCtFBHzWwLcOZi6N6nXwebROadR7g=
X-Gm-Gg: AYBFou3SWvERIjYOIPDnjCelKp+puaeZ+JqIi5WNSVGP3JuFH5X5zfaRZO1aEuRgav/
	nJGAPth5tlnmW971nPrhe+UvDQ9g0bAPEUyq2e7iWZmY8CWQ50Yqof/moftpR08z6LXB2BvWx70
	DhlahYm+2HYo2/k4u1uo/nqcRUCrZjdY/5IyPLVcHiBgH6vDqY527RY6n9t9UWEbgAf1EXjiE4w
	XmwgXWvF9X7kBHQMPdKrF8nekNOutUwdfDmYNWpWfxLl8+sP/J/CZ+mkYpyI7Y4b8wT+XK9dP6U
	aI9mrQHVV9lS2JMA7AGpWWqpYuAuEmtn9B186IPR0A3Yu8/+a0AZTfGXEbVIRRCL8yfFghfJhMc
	PdOzI7S9Uh4b759Ytj919SnXjRP6hdSPO9JGU5FxvmH6lbJyHYWgT8xrVQKJp8+EvlIZ8C+kg7I
	ZDzmUahzgFspPYtbJ5yTjuth9n7V/dzItYCg9XEvXxmgFcDw/ccsybNrP9sjor8bLcIlm32YE9X
	MMCVyyCN05MSmhtPmwRmedhbqVP1P015GB7TzjDwi+cgDkLtlE=
X-Received: by 2002:a05:600c:4ecc:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4a18e476022mr25383075e9.1.1791539854893;
        Fri, 09 Oct 2026 02:57:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm59188805e9.4.2026.10.09.02.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:57:34 -0700 (PDT)
Message-ID: <9c5e6623-ccd3-4570-a5d0-313e09f9bb62@6wind.com>
Date: Fri, 9 Oct 2026 11:57:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v10 4/6] net: add AF_PACKET multicast dumps
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261007115821.11332-1-sigefriedhyy@gmail.com>
 <20261007115821.11332-5-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261007115821.11332-5-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 07/10/2026 à 13:58, Yuyang Huang a écrit :
> RTM_GETMULTICAST dumps IPv4 and IPv6 multicast group memberships, but
> the device multicast list (dev->mc) is only available through
> /proc/net/dev_mcast, so "ip maddr show" still has to parse procfs for
> its link-layer entries.
> 
> Handle RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET next to
> the dev->mc helpers in dev_addr_lists.c and report every entry of
> dev->mc in the existing ifaddrmsg format:
> 
>   - IFA_MULTICAST carries the raw link-layer address
>   - IFA_MC_USERS carries the entry reference count
>   - IFA_F_GLOBAL in IFA_FLAGS reports netdev_hw_addr::global_use, set
>     by dev_mc_add_global() (SIOCADDMULTI) and dev_mc_add_excl()
>     ("bridge fdb add ... self"), i.e. entries added explicitly rather
>     than by a protocol join. This is the static column of
>     /proc/net/dev_mcast
>   - ifa_scope is RT_SCOPE_LINK
> 
> This covers every column of /proc/net/dev_mcast. AF_PACKET is the
> family iproute2 already uses for link-layer addresses ("ip -0").
> 
> The default FDB dump also walks dev->mc, but only for Ethernet devices
> and only if the driver uses it, vxlan for example does not, and it has
> no users count or global_use bit. Extending it would change "bridge fdb
> show" output and add NDA_* attributes.
> 
> Requests are always validated, there are no legacy users: prefixlen,
> flags and scope must be zero, ifa_index selects one device and
> IFA_TARGET_NETNSID is the only attribute accepted. The dump runs under
> RCU and netif_addr_lock_bh() without RTNL. After each round cb->seq is
> set from the dev->mc generation counter and dev_base_seq and checked
> like rtnl_dump_ifinfo() does, so an entry added or removed since the
> previous round sets NLM_F_DUMP_INTR.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
