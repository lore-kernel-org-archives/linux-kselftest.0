Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AE1496D38
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141496; cv=none; b=FzclXKsNrQZ/6JvSTj9go+cn5lnZVY1KzHuFFfq3VMMuDtWncpMaPMmN8zy3Zbdyc6sWBfx5IBt1ejg873CPG8WBVJrGkRHmxUGgPyDtyADPQfsMr+Aon0UkQeeGiuUuhLpIVfBovwwCmsCDPgotChKY1dD7jkpBbHk9eYEpVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141496; c=relaxed/simple;
	bh=mmTb3omMSKk79oaBdbfhFPddSgi2tQARhX5tD0VeCPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n791Y+vk77NWK4o3N27MLOTVBh+vj/1zFLzl5wNtMqWp01I6bfsOs46+cAWCEI9ECgit74Z+6GeoQXpHs6pl7jCB4r66IK3yhaHjKKcJf4htnmiAsgt5ZHwhtk1EsoALVnhoszSDzbdVFxUHhlDe6fhKDYntLri9Xlv0Nn+uyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=LYFe8zN0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="LYFe8zN0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b4ba7fe26so35315e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1789141491; x=1789746291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fmKbcth3Cgu8DzPZBrBYeoO4fcpCEJAvt3C9XzTqgyI=;
        b=LYFe8zN0p6h98dBa4AVduWw+a6hqGLgplXHwgG0TJxNx3fFhs3CJT6K13uUAOYfIUg
         L4R3JrwyJQuCd7ePKoTlCgIhWZFltYkkLfd4e1NNzuSecUBf+0iShqdhDGR+4P3o1BWa
         drusHiYk2g6NO96RIeJzXowjj8u0PecbToS+m9e0kJmHekgT0pEbb6DGyNOjvWqytSpn
         NyhBxWzY5TUpLefrAMHXQgIMs971zgfDBQMZpRTai2WRi7sPn2l03HFBnTEtVOXj/rnw
         XZjVR17gmwCsA7OzxB4x0sYq9pFKOdzf4r9Vv/sCASucAkA6pfI8XpqEl82jGgOsDLyr
         5UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141491; x=1789746291;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fmKbcth3Cgu8DzPZBrBYeoO4fcpCEJAvt3C9XzTqgyI=;
        b=f6AEnSEWxSOEJh/a48CE5o4BZ2QabkGdm8sB92B5mlV3+esYokgW2+qpv78tZeQ1VP
         QJ84AGDnrhscQ/3g6JplLl7/SBCkMczrSG3k6HwjvjtGfkY5IDb2WilF8ZBrGW2CkzxX
         UFwCFCDhWTwqjzkSCpSflSHenTZmzO2m+5t9NS76WMfIYox4V+iVEAjPGmE3udauB/g2
         dErQX9mcolactlMR9Jk4YCwjUFF44EZAHTHqWeKYay/yYTX+yHqJM69MhEsIz44b+ga0
         rhrehtVyydFyefbVaIkqOnKkFqRcHnmuDrABH6jiFmSwvCu+3xfl/74S6pU3lx4V7hch
         47iw==
X-Forwarded-Encrypted: i=1; AKwUvBzGqF8tiekejg+WIKi8S0xdP91YMM/G3Ky3NP1upc6WRTlYv4+OfbP/nlMHMO5SQqwlEB9+Zt/BDSxQ6OxDOOM=@vger.kernel.org
X-Gm-Message-State: AFuF++k0YLCa2ISXHTG1MYklGLzZYaPyKn3DW9+oxgQeEgq0b2fbhRPj
	VSUGoXeEe+xkEvVnuAfJgFmQOuLKxIpZn7ICwfd2zMlNEL/qnCFoQ+Nt7th9MmYQgR0=
X-Gm-Gg: AYBFou17yDhmGcxslEZJ6x5abB21EvPMtp1gZ6McVZ3NRDqBC75zMnSOUuK7fG4/ET1
	ykOL200izzllqHB1OJVgajtUHQtugLp92uyBJFqMXXDdRDZ0hIOo+/te7LcwWDt6XwLsy01Dr6a
	40CU51TuWmXAV9NGxpUuH3qnLICKao3ei3IiKZvy6Nq6jKUn8dB5CTDjUDp8pldC7dzesBj+A60
	YDDEs2/tbN99g6pjgtLC8QdEBcLP+um9HIKsZ7eaC3WMetehbky32rAw2GS1OARW/Pvkz2EW0Zp
	hmrKLxo4uTjDd3IqWUphZaq2VQVKDm8a0T+DZBEvSHJUiEGnLXqa2SBQ4FlscHUW7mpF3cT4okX
	HIwAiePUIKQ/ZCBEiJ4MiiyXWyAOQMV0+V4E+Ay6h81egi99RHSNZ2Z8uVoHdEk0d79PUtukifW
	SS7Jvlx1RTalqoQ5/ITe90K5Q5auNFLAwT05QS/D2YKYeEbNNp071ooP6TqsWOzaMAq2K2vMXbg
	5sSYOpP4avsjvZTDKTGvKr6VURbSxMCUdze8e8mmgPeqic57ogy
X-Received: by 2002:a05:600c:46d1:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49e61640f73mr50975385e9.0.1789141491401;
        Fri, 11 Sep 2026 08:44:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm161865175e9.0.2026.09.11.08.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:44:50 -0700 (PDT)
Message-ID: <23770b2b-d5d7-476f-9c25-285e6bd50fea@6wind.com>
Date: Fri, 11 Sep 2026 17:44:50 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v4 2/4] rtnetlink: add AF_PACKET multicast dumps
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
 <20260911105103.7771-3-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260911105103.7771-3-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Le 11/09/2026 à 12:51, Yuyang Huang a écrit :
> RTM_GETMULTICAST dumps IPv4 and IPv6 multicast group memberships, but
> the device multicast list (dev->mc) is only available through
> /proc/net/dev_mcast, so "ip maddr show" still has to parse procfs for
> its link-layer entries.
> 
> Handle RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
> report every entry of dev->mc in the existing ifaddrmsg format:
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
> without an ndo_fdb_dump of their own, so bridge, vxlan or macvlan
> devices never show their multicast filter there, and it has no users
> count or global_use bit. Extending it would change "bridge fdb show"
> output and add NDA_* attributes.
> 
> There are no legacy users of AF_PACKET requests, so they are always
> validated: prefixlen, flags and scope must be zero and a non-zero
> ifa_index restricts the dump to that device. IFA_TARGET_NETNSID selects
> another netns like the IPv4 and IPv6 dumps and is the only attribute
> accepted. The dump runs under RCU and netif_addr_lock_bh() and does not
> need RTNL.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
