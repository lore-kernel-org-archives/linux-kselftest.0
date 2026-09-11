Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F949EC7C
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141719; cv=none; b=pxaElsts0g5WammD/T0fvjZL3+qkNLleEpd4AABGoSZIqU2GHYluHfIdUQyULCv0MPOdocVzGhOdk4gnX+yc4TZmHh2PtmBXqBuBW1ETLMLMEi8EnLJ18t+Mcjrija96MrZSFU7l82QOJeu0aalGhftgcl9E1tsMkr2JzL/T3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141719; c=relaxed/simple;
	bh=coqt+w5I95EUW0QDTkx+JS5InZ9evmeQaO462+T+Peo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHBTTGKdHWCjL1W26z2cAJjj84gAzsV2xx6Csgs3KIUoFA4E+OmQeI1CLBFYpJnGPmqC+PAQqljT+Bip9GC6n3B/fYPRGG+DlMSX/1nlYLMJU8Kf45HhrFcS/PpcIF7D89vYusuCk3umm+qIwr0qSXWvYQYjZoZUZNtVYGWjdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=TNs+v4+F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="TNs+v4+F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db17b40eso36895e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1789141716; x=1789746516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=peYwW1i7KqZv9dHnFVZzcAAAiTdfB8U1dCo82QTWVsw=;
        b=TNs+v4+FjTdJPRl5CxDWGEM74SsZpTJ6QB4C3w+hTqCvDjoniuZOt+76f9MK8yz7uz
         rxB2BSLBH2nLFs/k5iU4WkIfXDHhl1SAIVM66tZFqBuS+sQGqregc0ePtyyr5igaMPfs
         Oq6EymrlFMsL5CgXLtNe1wFrRuC9HsBbDK2Qp5o7dUMKXBQRi55CIR+unxzwB79nyLWB
         LYPHS2iXI9c16JP5ULteH/k2UuwMRz1R1FVg7qdj9VnBemcIx8O6PTq/mY3md+4Bs4Lg
         5XM+HsBc/V4TA7IU/p4QVd2VgkkVpCazpEikkSWRm1BXa4Xq0MAucgy4TjBaD8V3OFfn
         a1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141716; x=1789746516;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=peYwW1i7KqZv9dHnFVZzcAAAiTdfB8U1dCo82QTWVsw=;
        b=MBINu4Z+uB1cdJdMm7rrH5aVfYNtM1eHApklmZM6jsA+WwwPAUWXIJOfg+hAKiBnFe
         GHlRqLru3Di1YxLCRG0F13MdRcDHDIcJ5fsaW1AKK1nwShDDSLNQyN/SCYjpCVIRIiuk
         pEtC3ujZkYjt5oP3nJrye8JylOGMWYOhykbPn+uNbipu+jMy5gZp1cOk0n4knQ15mvFO
         LXHbhBn9cuH+QA4mTrDTQsVo1wqS6ktsdgOw624mhulorrJXs7LDkEa29aa7TCarbOIJ
         QN+Hyp0b8zuz+LwavOY+lNel3iqcETvzIfrjJlTiocCtipWrTh223oGG+qqQylvZHTwP
         MM+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPf1U6CowrAJfK4jWll7kml3eLL1yo4gS0xQqjkHqw+3HCveazKgNx4Y60AuuoXkHWrM34hyRpmBkrEauSPQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++kznM3ZKGGM9LBVvok/gU8C/EPT4OWzW7AXy62I/iPVGJKo77h5
	9ZL22rHsk9hmUuW2upAxxiQ31AqAA7Pq1wIA01fVtZQ24/QmiOrf6v4y2XawjX+1Dgk=
X-Gm-Gg: AYBFou1cv9fuH95YOpYJsW4FhDkjHAqH0rIxBxVGqgWO1h3r1ktCIr9YxKI5tdnpCwV
	lszpBNXz62SmYsOkU8L6U6OjWvaZoOZEB1bFArHO8HqXlTiyPu/A8j4JggNuU2T3Rh4o3e1j6SP
	S3JuQ9iZ4qXhOL/Q79DZo1hX3aSUosaMEExObMFnFoaZcJbqdFpDQxNhsXL1zwjwjnavS2IkDHi
	gesuvwrmPZw+sJ7+K7nIJw546ZK9m+o0+pXcxQdJD3Xx+NzxHjzjY3a3vQlv7o2Z62dvBCFAVwA
	XStvbfJlbg/JRk1+jxtGI/GBRDbtHJnXvgoivFRHBmfmkSgaO2Y5FZeXvP71Dmh5RsZk2V3bJdN
	RmB82S93qTjmv5jemkB2GjWdnY2ij3Ac2H3dq6EjkcdBpeWfU01dCUt6w1/jz+rMLxIVBgWO6gQ
	5Ex6WQdX/umwyEPQERS6+H1w7vTxeNjcmdA7sKNkQCodnqP3FxuLZkJEzxK9u3NA+7gG5ozwkJt
	EF1h1aS3l/CVUP+98ONw2d5gkozQRaOmc/Vvt00BbsEFK0u3NJpQaa4J6h0sZTf
X-Received: by 2002:a05:600c:1c29:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49e61d2e5b7mr48659495e9.0.1789141716242;
        Fri, 11 Sep 2026 08:48:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6af095d7sm3509035e9.0.2026.09.11.08.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:48:35 -0700 (PDT)
Message-ID: <15c10d97-6b05-4ff7-81a2-02e9846a1d64@6wind.com>
Date: Fri, 11 Sep 2026 17:48:34 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v4 3/4] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
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
 <20260911105103.7771-4-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260911105103.7771-4-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 11/09/2026 à 12:51, Yuyang Huang a écrit :
> Add the global flag, list the attributes the AF_PACKET dump uses and
> describe how ifa-family selects IPv4, IPv6 or link-layer output for
> RTM_GETMULTICAST.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
