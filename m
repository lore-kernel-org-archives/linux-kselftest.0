Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27B4A484F
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785506; cv=none; b=S7bYHUxusCuLZIMkgKS72zvWGzanw5dp+80TpSdP2L6AziV2d2ict/XR7rSWYqh1yc9mHMRBkXMuP9IJjmq0rZ2ut2gcJQz5rf0nscTsvM8e674CEgI2g036HWRxtVLt8M9EExiVlxcN1HjSoob25dZfLX52l4wUuFewNJMb+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785506; c=relaxed/simple;
	bh=QcG4Y12EznNeNbKOAixbdSxNwnRwj3wcEZZ8DofN3RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn/rPE8N1JQCWklOJHw5HTc4zRQIBOL+3CgHQtuZQ5ypShgVfUH8f4uEpLm++QuyGxp19vbfftaZPVu4QFvvKbWJWq6qxVFHIQJm/XFOMe+XJxWjY6bEb/VTJU5bvqJLScLU+wQJcgBJGdjDrpkOAL9VbOmYK8sHuPUAs1p2cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=U9OYRh4Z; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="U9OYRh4Z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso257961f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1788785503; x=1789390303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LNGC4xhmgAqrems8CxPUwu2p9jt91LkbKNWkt+9er04=;
        b=U9OYRh4Zm6Gs7oaMZSqZxd206ZjVVYgNMCi1qEwrzkW585k+ikrhW1kI4iNhrkB6VU
         GDskHH74Z0Oqwsjm9nBrKeP1yu5jxkfmYANQO6N1eoI+Rry19sxLI3/BlyvNIHdL0Mc8
         gr8HFX+sHNqdae20bWGqBqqEqjWCsPJeqnRwYuEP1EB+RhsYK+ENPYA1fH9TkvFrwqsQ
         iyQ7Cc3jvRj0B8E6VGXPsmf2qVXWDvP2ReAYMQeaQ5EcRTTCJj4/TvqwfQmnuOwc54ld
         tTfiuHK2n09vPqx2Yyr3O4TlyFTGgJtobc5DcYzqLmVwwQEf+aNAw1N2jfpTnPSZBUP0
         ncKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785503; x=1789390303;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LNGC4xhmgAqrems8CxPUwu2p9jt91LkbKNWkt+9er04=;
        b=Hs4M1uvjS0wfmqC0gm8JeXHFBXskkJPcRCPxf/r5itjlnwgVa/m6/XNLh29lkQzML5
         /ejSShYYNdxtZXVZuh9afSlwBN/bOklaVtlBSXtX+ebPI1gr/S7lu19GO+ZMCe0yts9K
         jjNoRXDHRVizWVKgi6LP4PCwzk+YX9nwalROpb//fCo2mGg5g1LRgmnhvXnaIDpTC7e/
         fcbRnDpYvSWatiUGiIyPCmV01usK7I/x0aGHPuhhhHOMgoAcz0czsDA+9+VK9ZXrgxc6
         MkoQmkZBALJZrff0/sLZeslupHL9w1Mz0iH1dmhtJ7s6C1aXA/9VHmYMsQ3VQRIIE2EH
         wU/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMIeSDlxzK8+RSWcywpSumoesoDmHhUsBPSwYzSZ7fedpm2ZyUUnWazjb2mGQjTvW9Vbd4sT/kH6ck7Ky2qW0=@vger.kernel.org
X-Gm-Message-State: AFuF++kBqLDz1TDJOEVxF90ICyxyyZuEb437cNnuxNoTTMl1LOCpPXFp
	grx7pC1fPbyxaQgmdy30AoK1ECJiRp0xKPFdtF/Of6Fj9Zp4y2IdqY13cohifbxEV5I=
X-Gm-Gg: AYBFou1Kwh5z8lzhev6JndOIUxIdYaqVTEewt9qjHJdJW33p/VrQD6xRTEUiz6ArvM0
	1NZiRbUJpQM9heI7mWvkHbc5OrePbCczsr4qKnUxPbhSbEMg0k1+EwyGdO//YUrznBZhInF7zLw
	M9/iMZ7h4KH6UCM1etH/5GHejP2D3yuRKd1s31MfcxOwqCbSNjHIbSu+u5JjWKapokTE1z+NmYo
	pMoHmZFWZmzSWBOtxhYZ+lP6edDerW8iq8N3KY5GQ/V6w7rZCEuK22KVCDB28IrtG0NZgMWUqwS
	0L9Hhh9SqhjpRelw91grn3YSI2rDnT3Hmhj9HPe7R95+/yg++GIaEEPtG1jCbZzYVCJ7GxVV0Bj
	cnUjnufCdyjmzOV5VrEPvpHP+wvX+wDHyVMhxbvOLvBesGAbNEYE4iXiDCkyS4v6hNMIAROZm7U
	L279bhj+LvbhIusXqXdEx+TXdWMXCDgoorQYRfqd0dTEtFjqLO5wA2L+oRM81ksbZ/0peJBezaC
	BAPkvqZ3x1PnFkPVbG/X2qnT34WUBTBiFQgQEjvxg==
X-Received: by 2002:a05:6000:2089:b0:484:3313:4a04 with SMTP id ffacd0b85a97d-48590807e07mr13071460f8f.6.1788785503154;
        Mon, 07 Sep 2026 05:51:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm20729287f8f.20.2026.09.07.05.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:51:42 -0700 (PDT)
Message-ID: <f1e70062-943d-4521-976a-ae7c9fbc756b@6wind.com>
Date: Mon, 7 Sep 2026 14:51:42 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 0/3] rtnetlink: dump link-layer multicast
 addresses
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern
 <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260905093932.43726-1-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 05/09/2026 à 11:39, Yuyang Huang a écrit :
> "ip maddr show" prints three kinds of entries: link-layer, IPv4 and
> IPv6. The IPv4 and IPv6 ones can be read over netlink today: IPv6 has
> had RTM_GETMULTICAST for a long time and IPv4 got it in eb4e17a1d915
> ("netlink: support dumping IPv4 multicast addresses"), with IFA_MC_USERS
> added later so the user count no longer has to come from procfs.
> > The link-layer list is the missing piece. dev->mc, the addresses
> programmed into the device filter, is only exported via
> /proc/net/dev_mcast, so iproute2 still carries a procfs parser just for
These addresses could be listed with 'bridge fdb' (RTM_GETNEIGH on AF_BRIDGE).
Instead of having a new message to get the missing info (users), maybe it would
be better to update the current API.

> that. This series closes the gap so that "ip maddr show" can be served
> from rtnetlink alone.
> 
> Patch 1 handles RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET
FWIW, AF_PACKET seems strange to me. Isn't AF_UNSPEC (like for interface, cf
rtnl_fill_ifinfo) more appropriate?

Regards,
Nicolas
