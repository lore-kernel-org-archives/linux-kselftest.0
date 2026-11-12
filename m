Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500816;
	b=K0OvMuehdBhfhDMLRGkRqYRJMcEbSh0B+FlUQI2s1s4OGHk6tFdsqgEmXwL86aG7qEVu
	 ZN3wo8dvzs3q7iK1ecMsMAsw1Ed4f+IzgYy4a0hJ3qQL4rYl9txFV4DkJ3s7x5oRDBsPc
	 Sokb7RF8WS6eOt7sZLK/X2WrCYzpA1OoH8SgPlBCJ/6CH3C1hxljy/cpSHa2TaIRiHDbD
	 4NrnW2mvV8bd58VjpdFb2JdcaHCqHqayhPvd2a+7HlC6/o3+7D58/HnFpWRBa4WfdKsNe
	 e51feJ+mPTR0VeSoIt7IIRfDDYSNr+3trxPg6ArdNa88siEHHHkaHydB6CbF+XY6jXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
	b=UKBvFeA/yX4Baw/2fHja5qwE7thU4v6s8M6/H7vSEyZXgYddSmicYlm3ifogVLeOXxlu
	 oCrFRxBpSAPeRtxUy9VJkZM/RPOj4kqYqvvqGkpZ2fEyn1MI8DBoRXUZQlHUmeSP5Gc5V
	 GBaViRu/aZwU9wGYxnrw6W2YaO2xWYmGLH0n5/TAms3DmsrW8AlQ3Ah69MN8Nyq8vVaXp
	 uwI8395PGqNa5ntmK1V3LuT7iZeVQgPWz8Q/tGl73RfJSTWJ/ot2sDIwvOq9xpm4BInrB
	 HcA0tZMXHHTWsT+UUtwwDMD+5LAnriHNqzj45uhK5FGhh/qBDKwuDC/eXq6Klr2GigA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b="EtFg/kC9";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E52606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E52606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=EtFg/kC9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a610c7e61cso1519245e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794500814; x=1795105614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
        b=EtFg/kC9y1DirVvA9yLbTRagqhSjkLk6ziYDwHAP1xD7Xmb6LsmwWC8mOetg+tDeZh
         xWqqP6oEWPZigH9h1x3dDWabH29oHWXXy8GyR9+grcWK9NGsuRdMLxx+2jW5MXAnBZ+b
         H/lsp0vaUjFdhS/GF2SD93gAx8GKeho3HqXqonlGauq2eoZZ/MrWpHCfCZ3KE4KEYOUt
         fqiTFrUhHUh8TyyYD+ozgnb4Vl8qqidvow3BWLG4cR49WWZCTr/lQPU+eMqBNf3k50R3
         sT9Nx29c5j6NPlP/T/8cZnAXmYTOw+p/EfAeODvgcT6FR3gbNvbFp0tzEYIJwXmERdqj
         v7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500814; x=1795105614;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
        b=LYYm4PpDLVXyAj+NezsTdn7VTJP5upwpQrd8YFglJPp6qabYEnFFDjs5BBl97uLo6l
         allS9VSVjznvKX7dFOkA6qI8zaIZZgWG4ed0tCSOYrp4EOVYK3FE4HNpMdJ9q+jnKv31
         6vGDBGUAtikb0RTFmUmIUfkSwcMZ/HbuUvtTp4ZLlDBo85cNSdzlfH2wHCp2UkE9LcQD
         GACwYihmOzHwY3S+p2FLOOvp7ZTMBgXcmnDbRhXUmm/TeL9iKjdv+LPUWtdcHRn9FWel
         DJ1j2qdsF3H9dxT++mzy/DI7ET9HXw5Q8OL6pEWIv1HqRAXm6PCAV9OBqOtbNLIgg4hT
         FA/g==
X-Forwarded-Encrypted: i=1; AL+hErFVDp4HpuxubwcB/c4VxW0EQFDRqhJW6Y+C/D1jXRrhzFr/lukjDOByoLr7N1A0RY0/thva6oUHRi0OBDqc6gM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KNsdpHiXNB9RACCPK0yHA1+xz3dlVM4giLf0TSGAVj5GAGwah
	t8mwaH+AtR6DDvfMKvs2vvCu6VNBZl+7psbWmx9ROILrXOXdzgKylvHpIliWQW0o9kE=
X-Gm-Gg: AYBFou0WgmVSfdFqkuT8Yhd4MKtD+vDLnEQ3xLVbJZ8YiwkWzPvKIt30NikYcf5ZDSf
	d3/4GFUm9D2rJfDzxA16tqtdqv8odnBJuOFuGkCTb+CMesIZnY9uQtp2GSQk6ucb6nlrmzOkEwx
	s5kPHDEc02fhzLA6SW2D77H7vat6C8qhj1otWMUim6lWwsTLnRQqjxfIBQMfJSraqMaEaaHE7gd
	35fQurw59d3lw7yT+haFdPeNOzXaH3pGKtefnlgkLZxsXEsMUVM5q0RbcMNEiMbaNt+XiS6dh7l
	axgflAnx/eMxEg1EPYnaXJ3y4aTJgAi9iuBOZ7rc5fHfsYKDSN8kxFjUk3f7swmsGSjWIOdWJ30
	wepxLkZpQAmQZR7kJi2KvL+RZOpsywSJ6/SeJqTt/PsJlILPOSdWobP0AivSfgnrFAOwLvLyEw3
	51fuL3yR02uGwjCy75sTgfLmpGi4GCDJi8zTKDCjpUaZxQySjzxAbv2lWNGDNtzAhk2SBJQBZTk
	kWhYVBUhIkfIctVt0BlgZaAYHf4rezY3oNdzSN9QJHoCNJPn3mI97nIao83Gdstk1PFz2id0yb3
	Y0nYwMloyd2535J0iBAh4EWP3X/DOGVrZl5gtVM1yVJ2jjtPGKEArC3aaNycvm6jq5rPG2GC0C3
	Qb+11Fg==
X-Received: by 2002:a05:6000:1788:b0:490:540:f95f with SMTP id ffacd0b85a97d-499c92284d1mr12368002f8f.5.1794500814316;
        Thu, 12 Nov 2026 08:26:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm84484f8f.41.2026.11.12.08.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:26:53 -0800 (PST)
Message-ID: <bac47e7d-2982-47db-bf97-d8c1d832704f@6wind.com>
Date: Thu, 12 Nov 2026 17:26:53 +0100
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
Subject: Re: [PATCH net-next] ipv6: always apply all.force_forwarding to every
 interface
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 12/11/2026 à 14:41, Gabriel Goller a écrit :
> Currently, writing to all.force_forwarding updates the interfaces
> only if the value stored in all.force_forwarding changes. Setting an
> interface to a different value and then writing the same value to all
> leaves that interface unchanged:
> 
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl -wq net.ipv6.conf.dummy1.force_forwarding=0
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl net.ipv6.conf.dummy1.force_forwarding
>   net.ipv6.conf.dummy1.force_forwarding = 0
> 
> Apply every write to all.force_forwarding to all interfaces, even when
> its stored value is unchanged, matching all.forwarding. In the example,
> the final write to all now sets dummy1.force_forwarding back to 1.
> 
> Also match forwarding's locking: take RTNL for every write and compare
> the old and new values under the lock, rather than returning early based
> on an unlocked comparison. Send netconf notifications only for actual
> value changes, including for default and per-interface writes.
> 
> Note that IPv4's forwarding does not behave like this, but we won't
> change that one and align force_forward to the IPv6 forwarding.
> 
> Fixes: f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding")
> Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
