Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253CE58039D
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963775; cv=none; b=i0+EZG6CEQkKP4+7FsDQEdO2dk+Em/mINFiYfuN/0FYMbmur9gn9HcfhSrh2p8Jt+FEmBaZDdPKpQa/UzqxCyOKv1jBoAKZrtIxgzo7BNuRib3lnPFTSIqVYpTAOYPEaw1nKQvxJQacLfWCGMZsFkDL+Kwh+gOrTRb09qPmNKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963775; c=relaxed/simple;
	bh=8UyRz0pNRbKuhOPAv+GQ+lFd/A7kot7/Ib2oI3fHECM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OS43lqbgzCiBKzSyaDxtfTG5p8B5e5IE2s3fjsbdS/cxnkXvlSmO4PJgoWfkrPldPS30VO/DhOm+HZRU5kXqq++3rYmY+rrBLPwVTIHq0Or7e1i/aKArtC1SLptTNzsWG2Y6hpKYw1KLvnKIMzHAcWE8A0ygsdL9W1TYXOKZtU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=F1acJ/ZM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="F1acJ/ZM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740f2so2430135e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1788963771; x=1789568571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HaWevtsqS/j7ikipn8DTmG2iP8U3mJM88NAd/Ru8qKk=;
        b=F1acJ/ZMQyUM+hJ3oG1KZk5gUg0+FdwNbDuubDmn0XmasJ86L1oEA5Ckmck+XowzLk
         JY1AKf1mNCEUK8xavvJnbjxPaPPWHfgpEaQV3Aj8D9p9EBCveOvvtbY8Jbvvb3SYQID7
         Fs2V5m6BP0X0bV8WB+if1iM++9TldQKuiNir4Ahjek8NYt/yavN9H1gCdwD64kAVT4z2
         1iy+YtcP34istnpOpShhDn9XJugjvKSNd+CEbkUBxNzm01N9ey6KIZh1ovLR3Bhugw8P
         YgeIjVG0EXQhHHuv+PUi2JYmJLZCz4c4WnpOyI9tlOJQ4drAehizpaxpBda1o8fP7GMV
         xMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963771; x=1789568571;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HaWevtsqS/j7ikipn8DTmG2iP8U3mJM88NAd/Ru8qKk=;
        b=roLvhZFoEFGCpQIEj/2fSIimDonhlCmHVKcj3GpZ+honPvHsbaKgPI0O+Ug1gTaWDH
         0lNAX/Hh7ixiWhqZQWi6jkrHshqVYXR5giCBC0/Rjh9mOUJss9XCMSlpJCcBg2498Z64
         ycNP/sKAVINUGr+uGy0zxdlGKYAnCudAkjUt7r9y++QvMHGX9daWi1Es/Pw5LRmB/p3p
         V8S024/OkQQYxoHybH7huq788SdzOimaPNOdd1GdAebf0kDsLZ3Sso6I6V2YKrbiL3lG
         GuxeU6nYlvir+WvamOR+yOEAK4JX+x+VmiJLRmXm6DG3DvE0AfCkqTLDKnBtPEewFGP4
         OFTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzksofE8M+8O1y2T1QiM8TU/6WPQJqNltEdstyaHDDcyYOG7GX59VsShUNl+rW8265CNVyiKBDXfvqc3Q9Etlk=@vger.kernel.org
X-Gm-Message-State: AFuF++nAkzwqVSd3uwbbPAPS3h+DHbYtkDbvABEEC/G3xnZTN6aM2tsA
	zOFgSrlGFWNusHXZrXSrSwXHgkAA1rqgePwgdpJLTX1cAaxRVcI5RetwcPF7KHeUJi4=
X-Gm-Gg: AYBFou1P0t69Q//D5jDA1FEUU8HfhN0BPtDTGZ9e92T5vbGUfdKqsmePr8q8t52euYN
	Z2U7KavUHq6ks6NFNyHASsHQgG9Xlu1GGOVoO3pr3Of1JRRtTEZabtYOb+I1a/ABYu8srqiUx31
	LcfGGzEK3sXiQ17OhIPnEA6vOV8CKyAnps+PJhvNiZ5X8f/LsYyWfRIOMDoOw+3/0q5Nj/usYl8
	AL/sulnl4biLJn8Ctgi9TjAMRUTc0DfYEtm1IJuW1iyKRBzi7a/gKHtPky46duw525z/NRILNQH
	bHiYX1jC1Qj09z46VUg/GaXinDbxsbAVgupcmKxdlgPe1n5RdK1E4WICXg3M5SO8FfSzgirseBy
	Joz2ISUKWImjDJtEUd54cyZ7xVsJIdLBUJo2V5MWwB41zCh/ViIS7iJVYkTcevnEBTMozxB4juL
	vei1Th251ptCCLUJhEZOvWpvGiM97AnxrUMpVtn43if/ABEZwglIbhHUpqzCMYUSoapZ5m2iaeT
	wc0uQiLrvan4QVkvW4Qn2J4BVn7FyCKaE5UKlbAB+ZB4s+K2qtn
X-Received: by 2002:a05:600c:4f48:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49d079867f5mr258909655e9.0.1788963771271;
        Wed, 09 Sep 2026 07:22:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm42712069f8f.7.2026.09.09.07.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:22:50 -0700 (PDT)
Message-ID: <ab826712-6255-4e9b-b6fb-f6f8c380e779@6wind.com>
Date: Wed, 9 Sep 2026 16:22:50 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v3 0/4] rtnetlink: dump link-layer multicast
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
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260909133247.113923-1-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 09/09/2026 à 15:32, Yuyang Huang a écrit :
> "ip maddr show" prints three kinds of entries: link-layer, IPv4 and
> IPv6. The IPv4 and IPv6 ones can be read over netlink today: IPv6 has
> had RTM_GETMULTICAST for a long time and IPv4 got it in eb4e17a1d915
> ("netlink: support dumping IPv4 multicast addresses"), with IFA_MC_USERS
> added later so the user count no longer has to come from procfs.
> 
> The link-layer list is the missing piece. dev->mc, the addresses
> programmed into the device filter, is only exported via
> /proc/net/dev_mcast, so iproute2 still carries a procfs parser just for
> that. This series closes the gap so that "ip maddr show" can be served
> from rtnetlink alone.
> 
> Patch 1 fixes the type of target-netnsid in the rt-addr spec. Patch 2
> handles RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
> walks dev->mc under netif_addr_lock_bh(), no RTNL. The reply reuses
> the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST carries
> the raw link-layer address, IFA_MC_USERS the reference count, and a new
> IFA_F_GLOBAL flag in IFA_FLAGS marks entries added explicitly, which is
> the "static" column /proc/net/dev_mcast has and "ip maddr" prints. A
> non-zero ifa_index limits the dump to one device and IFA_TARGET_NETNSID
> selects another netns, like the IPv4 and IPv6 dumps.
> 
> Patch 3 updates the rt-addr spec and patch 4 adds a selftest that
> checks the filter, the user count, the global flag and target-netnsid.
> 
> Nothing changes for other families. AF_PACKET dumps returned
> -EOPNOTSUPP before, so iproute2 can keep the procfs fallback for older
> kernels. I have the iproute2 side ready and will post it once this is
> in; with it, "ip maddr show" does not open /proc/net at all.
> 
> Changes in v3:
Please, wait 24 hours before sending a new version:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-netdev.rst#n15
