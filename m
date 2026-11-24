Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528529;
	b=nCFSJxa8CWVd4x7IrE2tStTP0DQSa4Z2TaJ1A9PPY02OscYpksExhsh0LCohRTicy2ti
	 sMTX8RaqP9EW0YeLmOC+6VIlJKVsM5Gr9JjVUWED1a2IjmAS1D+z015iLvMP8qqRh7DOP
	 eE9ZdVUel+8GVLeIy0vz/z2U+DZkQZBt3addgAF0iWoXOPV7sJ3J7oSs0sRDZdIsJ1u6M
	 VO7q/ymVpLsDPcg6OfTPgDYiJwiRJ7+2Ke2OszHHdW47eFGSg9x6/DKuxWu692w2UUxSG
	 hGt05UY/t8TkashUO8/TvFrTzfjp9AjL3E14VWHZ/d6c+dx2A7H5iSUPkg+vu6zCgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=I1beTTuDkHcJrFtkrdIEDwGOge1ar4jfKSDiYm+SAes=;
	b=1qle7wbABlKJAlH6HdRrjkgEVscD+0alWUVwNp3lYCHxeI+Lp6C0rj3HaQeOFUei3EUZ
	 MPi0CHi2Ex41/LIXyub164Z3tL+8PG2Kwsu4IUaq2k/a5ugTUwaa1Q0TJoIVjEoSaEClR
	 VHgkKC+D1GdvmF9K/t85eqW2sVeHmVYVQwuXBkx/ZMaZpcrDH1Vnb7yfS/nhOP7oDDRx5
	 3lV1L1nc+pgvzjps58Tsane7p7jo94TpCY6zglT9R49lGTA+oMgF3+FueVV3n5H7w9eHE
	 AGEnlzygzVr/uEsLsDOak5lBY/5g2VJin0sRfJArrBKn0pDz5t6xE+WDhQuFSoSrgTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=Y2bsdeUG;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBEA606A322
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEBEA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=Y2bsdeUG
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505a0acbc1so56839866b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795528527; x=1796133327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1beTTuDkHcJrFtkrdIEDwGOge1ar4jfKSDiYm+SAes=;
        b=Y2bsdeUGRkhvEwUU7zA+Ccwi7nQaUwSHzxZBaZ4811Twitth90vemfuauNp3AqPTj5
         FzQ2ayO2yIqj2+f5itd7nxfGgGmg46Y42OdYNwLVeKI1BvNLReA7ROzQg5P5QM1jfE+x
         ERu6bMFz1PNLPKVM/wxS0Z1Ggk2SW9lhivGplwZnVpSMC5fdYcuB/Cn9qGdq4URirwED
         van4HZN7J1SKjJ9KU/JspZfLnbHYMonP2cokgyoMnPREAQDWLkuFpvMwLbwyKFxv/WZy
         DH7TB2xui6Lg3bS8WmzuzW2wxpA7MXXUCrNaKcxy+XTz28I3PPQMyWL6amYPir4Ud9ax
         32Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528527; x=1796133327;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1beTTuDkHcJrFtkrdIEDwGOge1ar4jfKSDiYm+SAes=;
        b=puSdS9ggb/dkT2ulUhSDl+zYKjs9xCawBeSanaOpbT4886CsroMlbsVhvnae7BmP5f
         PjsHs3CNxEnm8Cv8z2OHSQjEkAuz7hvXY8XqSkqED/jdzzgTESH/7Zje0aD8mlKp0wdx
         8bT6rRcqQlZrgfkiqRtbsrXdcasPdt7tCBqI9grzOKzjIy31iH1F+F6s3EvsaQzavatL
         fSIS37lPgGe+dWeYIBYrZwEqOK4MXxLOphYJhDujW/AGPtFvrkA192NuWSvAalhztJDJ
         +auA7o5tvavBVQdG8YUCSfT9Pz7eF/7JjBQS9WG9TljLRF+k1hNkfXOXtJaUIEgB3FeE
         0oCg==
X-Forwarded-Encrypted: i=1; AL+hErFfXnnXsR+dzLhXuZUUwaEmnG8ij+TNJWzxMgE4O8SedqH27MAVuOMyMI2ogQ3BxMxT2hijXnlz/1NLxBGHNPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d2nmY2H+2jtyu3vfjejm38wiAp7wq9l1y3jpp2BugYrKWJGc8
	pxWjHqnGhUMuMZDK9elk7JEH0o1YN5OSDXLxspwS+CCrv17HeHYaMqJbipvne/Z4xuo=
X-Gm-Gg: AZFdTZd7MF1B6+ND2/QMiiq6DH4HQYjg/N3Ga67IUioQod2HW0ZXsWL0sdOwjtsXjo3
	nW9gtJBiuLivXqMcWcR9JGJNVZlSOJ7g4m1+7nKJQ8eTRGxeV2909fc3we5DpIG+bwT4vxkYcfY
	fcLyL/vXATe+qI3tA8ngnHImGxpns8Juf6CxIas+2EY6Jr7993M/lmT+FtTna5gxMDe/oMb6rII
	HIgSAe27FYC3U3hDGLhDMVayEJ5WFxAcoWHjN56LD7BS4IHYfUWch7S1oQ3TZOUIiPYSYh8RVLc
	owrAPRD5/v1HXpj1KpsysMs8YbynsgaeZSWrRCwfNAQn7+ruU3bx/BWKcXQ9IchEKzt57/yZ2K3
	vV6D2l9+0kPtQ6T8c5LQSgFOTUo08zQO9Xf5Oc+LIKjjOY7lPdvN1Cv4h5zZAdp1WKwzTd3Lon2
	Xduwxwvt2fY47ptABv+LbTEk/YJg3iRWZ5bYZU5+mYJXnlCLdYRthJI87a5Aqb32rEpDpTJSaBk
	f0LGCIP6L9MTGKZjrdcf2RuHN7GH66//IQqKn23semAAoJ7Fh6AqfdveGX6qcgx9Rb/XqEqYRNi
	QVvcYGBYfULpuveYl8hSVgbH69/avXNFjGb4wO0QcSchLggsLNRh2OQzoq2wKbzbvbFL2kuUw85
	c5BjRaWXGM6v0CZ/FQKBifD+4qjM=
X-Received: by 2002:a17:906:2b5b:b0:c29:4634:5c8f with SMTP id a640c23a62f3a-c513a284994mr1056327766b.0.1795528527042;
        Tue, 24 Nov 2026 05:55:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01afbsm518330366b.5.2026.11.24.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:55:26 -0800 (PST)
Message-ID: <8f0c4cb5-8754-4636-abdd-ccec7ad5d932@6wind.com>
Date: Tue, 24 Nov 2026 14:55:25 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 1/2] ipv6: check the scope of the best source address
 candidate in a VRF
To: vjardin@free.fr, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 stable@vger.kernel.org
References: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-0-f667ab150ade@free.fr>
 <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-1-f667ab150ade@free.fr>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-1-f667ab150ade@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 23/11/2026 à 15:30, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> When a packet is sent through a device of a VRF, ipv6_dev_get_saddr()
> first checks the addresses of that device and of the VRF device.
> It stops there when the best of them has a scope that fits the
> destination.
> 
> Since the commit abb9a68d2c64 ("ipv6: take care of scope when
> choosing the src addr"), that is what the scopedist of the best
> candidate is tested for.
> 
> scopedist is only written when the rule scope compares 2 candidates.
> With a single candidate, the rules stop at the first one, which only
> tells that there was no candidate yet, then scopedist is read without
> having been written.
> 
> It is 0 with CONFIG_INIT_STACK_ALL_ZERO, which passes the test:
> a device that only has an IPv6 link-local address sends to
> global destinations with that link-local address,
> although another device of the VRF has a global address.
> 
>   # ip link add site2 type vrf table 30
>   # ip link set site2 up
>   # ip link add dummy0 type dummy
>   # ip link set dummy0 master site2 up
>   # ip addr add fd00:91::1/64 dev dummy0 nodad
>   # ip link add dummy1 type dummy
>   # ip link set dummy1 master site2 up
>   # ip -6 route add fd00:93::/64 vrf site2 dev dummy1
>   # ip -6 route get fd00:93::1 vrf site2
>   fd00:93::1 dev dummy1 table 30 src fe80::5cb7:13ff:fe96:87ac metric 1024 pref medium
> 
> When the scope rule does run, scopedist is negative, whether the scope
> fits or not: the test fails, and the other devices of the VRF are
> checked too. One of their addresses can then win on a later rule,
> the longest matching prefix for instance, over the address of the VRF
> device, which the first lookup is meant to prefer.
> 
> So let's compare the scope of the best candidate with the scope of the
> destination instead.
> 
> This issue was found for a development of a UDP tunnel device with
> IPv6 addresses in a VRF selecting an IPv6 link-local source
> address for a global destination: then it was confirmed with the
> fib_tests.sh case of the next commit, whose first two checks fail without
> this fix on a CONFIG_INIT_STACK_ALL_ZERO=y kernel.
> 
> Fixes: abb9a68d2c64 ("ipv6: take care of scope when choosing the src addr")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
