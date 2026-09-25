Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AAE47607C
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324975; cv=none; b=uOaFKDdc0RpLkUSusNQiNng0/t8mYsywNZ2/Y6DTTGz3p+Xdf5vaj+lL2eKILI0wPiwRlsehsnjtXqUO6zWbdOrNL7rg4XG4hYS0BahDKSh7mWeeULj2TsYoZ6yxh/YCaXBxnrq0F3ORdzCt4noKLl4zv3kE1YjgcnUdnmZlMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324975; c=relaxed/simple;
	bh=tH6+DscQyJEo85ChEQ+CavNAVpqBZ5urOGtxDKS+6Zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puB1cC1BLdcqudVKBFdAfOpnhdZ1mKkQ26+jeV1/0qVDhKuk5AIjAU9EFzglI6u4foHarTArD3E98fPN6dmjzE6tze/R678v975IkV/BrppVNwinCzvT+3/Hsl1ampbLKjBbk4kX32opyiqR9NuXGSEIjdhJoTS5ZFSTNEcdVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=XYvC/dOq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="XYvC/dOq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so296905e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790324972; x=1790929772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fv81lzR08QLIZUq47Mu+ZzBMprB5zSplxLNHUFOxUOM=;
        b=XYvC/dOq/SN/yjifjNzV71lscxlZ9AUcei6xlt/2HxkG44AZ7Tc/oRftLFfOA3secx
         KKjpY66muCOZ65znaL4D5tXd3+X2cSorO6kryRIq0/ntx46iI7tezF9qUfsx9zFqB+gx
         B1ysGbEdarT0gHE7Y/JXM0eXNP3iAQg+ucssZUfBYqrrCvEzrWDvmB14npEPl3wmtJic
         nzKIBrxR4nzqy+kw4lbSnZ9OW4xV49iuOjHNuPxJMVKp2U9ZdY74JgpyzO6hOh07E/aY
         9yJJGgxUvS10Gw+disxScic/v/CMhTAPIjnxbPyhV9jgj1F0lvsjszDXswO5Zk/VxvfC
         obVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324972; x=1790929772;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fv81lzR08QLIZUq47Mu+ZzBMprB5zSplxLNHUFOxUOM=;
        b=c/RcAXJEJs8REUYDFGUybURRCNB+HraqWEDPVoqoE2O/mgIGweHArlu3VabS/nEMh2
         RXynzrAlDHJTSwj5rBG5ZPN8YljpuGxI84JsHJ4wHOGJi0qmwW3RqbmjCpIeQpwzS6NN
         SeiNc7zX4vQsudGD8qjiwJcDtdqseG+inZ+nhte8yP/qclb3M1ZfwA6/3sRKJT+HOJuI
         viV8fGcVNFm16ecM7011ajGknA9hbvuMbI7S/FUBhy14EYqRduUzW0ABWqJESScFBe7t
         4TRlmUrlWx8KRKGHNFNVDkLTNNosEdWcKdkXYJLyVZ6XCRZPjwpEjX1CD4x4n7g1lRxW
         OBFw==
X-Forwarded-Encrypted: i=1; AKwUvBwHSah0HZ7adX94Ha1vN+3VVIRl42Yqw+Ru2xREgKk9Yn/MshqiIbVzX7xMLmw3bDOgTJLFjDcZnpLHWdBxDHM=@vger.kernel.org
X-Gm-Message-State: AFuF++kfdbKyr47VQgPJ7wThVhjEkoTLXJ9MpGWJ56PZJUTWU/mIcUJA
	5Fh5SjJN2lxe9xD/RyyMFYDKHY2TvPG1H3Gp1GB5894lG4jO4IX1FI8khNAsQ4zjcq0=
X-Gm-Gg: AYBFou0GKm04KxO1xCIRUSmYHVPesGxVDpMYhidFD2kMybjiICbZcl95hXHrUMggYjw
	+WIkSpDvRtEfGU+NLCm8VL4rDSJlA/8z6PDC2uZddW0zPwx20QL9MGskjgMT7aCpcI9r9BbgefP
	vlF2rcXGPKxNIevLvYbmzGgRbQwd286Sk8PoeJtMY0qQ3VFCPtVTx56yvRReCWykva7Jp7mSgr4
	3pEZ19+o96Lmx+/Tll0J7HPGyul3MvgKdS73O81/Ifum9Afyh8RvvGxNOAx14QEFxW/0O/u2Ib6
	BMLiVlmIlgn2p3bz8ngPfV/xLOFZ2CtO2nL8Iw7G0SzrEK0wGsotZItFkpklr5LAcD+kIwuOvE3
	mjD/b+Uf/5L3Uh/CsB+sBvR3h5qRx6q8DRDTgJG33L23mJ6Tlj70mAIjgQpfURM7QwJuOx8T/s6
	FQsyw7J6giVZRRqNcDbYDnDetaFit02Sk9EuuYl7tILdkrWkl67TePO/6oO1d9r73xk9spobpBv
	CXvPhrS0T8FUzCkK9ZLfEfYYXebblSZclBHbPfv3XYLIUv3Lbc=
X-Received: by 2002:a05:600c:8b4c:b0:49f:c432:885 with SMTP id 5b1f17b1804b1-49fe6702398mr79367885e9.2.1790324971671;
        Fri, 25 Sep 2026 01:29:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069d071sm50084845e9.5.2026.09.25.01.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:29:31 -0700 (PDT)
Message-ID: <361c4480-0a3b-476f-9f93-a07cf4d5eef7@6wind.com>
Date: Fri, 25 Sep 2026 10:29:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v7 3/5] net: add AF_PACKET multicast dumps
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
 <20260924011554.3494-4-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260924011554.3494-4-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 24/09/2026 à 03:15, Yuyang Huang a écrit :
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
> without an ndo_fdb_dump of their own, so bridge, vxlan or macvlan
> devices never show their multicast filter there, and it has no users
> count or global_use bit. Extending it would change "bridge fdb show"
> output and add NDA_* attributes.
> 
> Requests are always validated, there are no legacy users: prefixlen,
> flags and scope must be zero, ifa_index selects one device and
> IFA_TARGET_NETNSID is the only attribute accepted. The dump runs under
> RCU and netif_addr_lock_bh() without RTNL. cb->seq is sampled from the
> dev->mc generation counter and dev_base_seq under the address lock of
> each device and again when a round ends, so a change since the previous
> device or dump round sets NLM_F_DUMP_INTR, also when the last round
> dumps nothing because the device it stopped at is gone.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
