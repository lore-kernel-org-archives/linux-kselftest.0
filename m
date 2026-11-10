Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329263;
	b=spCv80FjYTDiE1KvyRtOV7TDZXrGX6ix9maRPUQlbpb3V43ESwOW3B7/ADJJPh+beqfO
	 OvG6zaxl1ZsGqAl//Is/rgTIGxWi8qjbfK4sBG0M3QBEsgm0Dul79kZ/TpRSKTEk/EOsJ
	 r5cC6MrGnvQolLgfB+QYzJ/kg1e1FbjRWO2RoyawLtFYtoYEf9Pwz2UhuNPcgMeCxO5sD
	 aPSxq93Gdn0htbcKRPYVc+R4m7sJ5S82LsCDjcSrpzjIbmNQflh5FpZYVff32+P62BpUK
	 RMu4fWkPMwGoMlcHPxfwCnwmzU1CnOdtT5adeyGJxJiWnEtO3Nl6kjoSPRUOTTv66iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329263;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nG9stXQkwLVFlp/SM6Lzv9KwcbHb+1wfgq3qgejLqIQ=;
	b=dQy84KQwJdLTA+Aakt2iJ/tSsUMbtrfaWCd84a3AObJ47wmKzDgvCxOF2tFuxEi+MQHq
	 9uPxclVaNY4D9sD+tIGvOhUGJso+XZg3ILPdFnQl3ClccdnVKAf4guXPaYKP4DsqOdFrV
	 QFtgsVwaqdJgxoqGSXvZrLaRsDLsNokHZ0tKh+MLiFbfNjclN7IX3GMTP/I4rDkTcwfDk
	 aVwwPWgsLuQw3vhwffanE5pXoBdCSfVyFpcNXtq4vDywPmn0yDCVoHLOa/aADJlETXAd6
	 2drnrORF3EGzQx7567gTxGWfwspH4npZIT89tKA8ynDaQZ0RyhvMUEw5uIWC+BABypQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b="IoRLkDg/";
	arc=none smtp.remote-ip=209.85.216.102
Received: from mail-pj1-f102.google.com (mail-pj1-f102.google.com [209.85.216.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16282606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16282606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=IoRLkDg/
Received: by mail-pj1-f102.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1344533a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329262; x=1794934062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nG9stXQkwLVFlp/SM6Lzv9KwcbHb+1wfgq3qgejLqIQ=;
        b=lNHMH3RJJvhV4bm3D6Mo/6Ecl2rtnMoC0JxO4EsyAK7u2OyWn4YqLxFAUz8xw5wk4b
         PVtz81jybYrS/HMAIDTA2E1D/hRwWzPIooixZCnAGvg5YfTQiaABIbVWkid6vzqhGxDK
         CKELzVB5NdSvl/rVBI6+JpvwcsIECbpZR8inAwlcsjwlGbk70zBQThGDoShYb7e38rQL
         M/adwCYshfgbGVtgOsRIQXEkaAWdEJHS/0582m2B818digXoavACnlnGwJaFhpnblbvy
         fhJFCUxo9SJlqc8quyDVWIEyd8dIKkQmvK7JeUhKCwORj5OcBmQ+j5vkM6XMoCOf8kQZ
         3hFw==
X-Forwarded-Encrypted: i=1; AL+hErHxHxodyBNDEtc21RgnDW1rHyKRJlNef8DN5AMFyIZsOglPZMNTk/SGi2sxf2h9k3/UozMhEfotyaEWihIWTp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++1HULd72MowxVNRaNLDFeR7CJEFAza7yRGTBeS9c6BFzCNWWR
	O5NAgtSAtxNpgQA/qa3TH+6MF9I7ro7dersxNKvEj5ljlRk6CYj8jxyrUaS3DoiSOPYowJ7VSnq
	fkwMUUvRgjVL6IPEIaXJfYVxuDBzACwwoFlBeOxg=
X-Gm-Gg: AYBFou3dLF0DfV3hupAPQg2+cblA5E48hbeB014if7XKJGMkNoma2uZ/cmsLK0S8T1F
	NqLzOnw+oosoqbRjJoHBYmVQ3VSv1KD1kNrDjL/lA8/QBAYl566TfhJuNOhfD1oMFKlzn5SjIzE
	RgKXOEERGXipuWF3ZDbYXEtM9+vq3IhCeMedrDKAiVhWB3MV3NVl9aLv4qB6CdKWPUid/RHXyUl
	H4dmK4f6qYCKOrPkwbZ3h0oNULNsVWiZkwnLUht530IgAxftt/zUif2+gj9Zo0HWNuJubFVPFGH
	cmq6H4rXuQ66hywOhTtpminPsH6d3fpggLFLiDqOE20TVLo2QyKFfzL+e+S/U3Gsk+7ZitinqXc
	kkg==
X-Received: by 2002:a17:90b:2707:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b166cf6979mr3264778a91.35.1794329262291;
        Tue, 10 Nov 2026 08:47:42 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1690d291dsm990689a91.4.2026.11.10.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:47:42 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1794329258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nG9stXQkwLVFlp/SM6Lzv9KwcbHb+1wfgq3qgejLqIQ=;
	b=IoRLkDg/XdQGCsYApczobF0xNyOZOVRsSpJaAeYcx8Z4QeSgHjqeionaAzNoKZGOOgM+oL
	LUN63e/LMgVxBdYJN+e5T0DV8vpyjFnXnv5/I8AeILJ1A8QyF5AC0xmKpQ2laIA3oeKy2D
	2Wj2oRk0lyawSr8TLpuq0OlohsoH0do=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 6530d039 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Nov 2026 16:47:37 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:47:35 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Roman Khromenok <roma55592@yandex.ru>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: device: allow userspace to enable
 IPv6 link-local addresses
Message-ID: <avNKp7OVA7d1X3fL@zx2c4.com>
References: <20261022110039.270335-1-roma55592@yandex.ru>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022110039.270335-1-roma55592@yandex.ru>

On Thu, Oct 22, 2026 at 01:00:39PM +0200, Roman Khromenok wrote:
> WireGuard interfaces do not get an IPv6 link-local address by default,
> which wg_open() achieves by setting addr_gen_mode to
> IN6_ADDR_GEN_MODE_NONE on every ndo_open. A side effect is that any mode
> chosen by userspace, via sysctl or IFLA_INET6_ADDR_GEN_MODE, is silently
> reset on the next down/up cycle. Users running routing protocols over
> WireGuard, such as Babel or OSPFv3, need fe80::/64 addresses and today
> have to set the mode again after every ifup, which network managers do
> not expect to have to do. For example, systemd-networkd cannot honor
> LinkLocalAddressing=ipv6 on WireGuard interfaces because of this.
> 
> Instead, set the default once, when the inet6_dev is created. That
> happens on NETDEV_REGISTER, both when the device is created and every
> time it is moved to another network namespace, since addrconf tears down
> the inet6_dev on NETDEV_UNREGISTER. So register a netdevice notifier
> with a priority just below addrconf's, so that it runs after the
> inet6_dev exists. The default behavior is unchanged, but userspace can
> now opt in and the setting persists across down/up.
> 
> An alternative approach using IFF_NO_ADDRCONF was proposed in [1], but
> it removes the ability to have link-local addresses altogether, and it
> was reverted because it broke the selftests.
> 
> Add a selftest checking that link-local addresses are off by default,
> that they can be enabled and survive down/up, and that the default is
> restored after moving the device to another namespace.

This is an old decision, but one I think I'm inclined to stick with. You
can't use WireGuard with LL generated addresses, because AllowedIPs
requires explicitly binding to public keys. So you wind up having to do
coordination between the chosen IP address and the distribution of keys.
The solution for Babel and the like is to add explicitly WireGuard
support and use the neat mesh qualities of Babel for key distribution
too. There has been some talk about implementing this for a long time.
That's the direction I'd like this to go in, not breaking the whole
allowedips model, which is what this moves toward. I hope that's
understandable.

Jason
