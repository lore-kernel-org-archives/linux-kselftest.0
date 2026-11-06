Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004869;
	b=Zlr/lsNFmbagJ1lo5LN33gFZnaEy+wp7I5Hb0q/nrMCr5GTlV0aA07YlhQPVq5SmWVNX
	 JUyBiHygz2X/ALdpTSC1ZnwHyq0HaCo4EAEY5ls7nMrJYLXebdcLcAUQAA7WOvTAom6tj
	 AziX97Ta87CiduUdNyVatwv5/DDo/j5JH4FLmlT97wOMH0HgQO/e7S+wVroP032lJOdFU
	 NP1vRTdr3wpew4BVHG0swLNJKuSFlg0ip4DRqyF23WO8d/fq9/CeQYiegsG2Kfru2tBTN
	 3IdeBimtalpiSvpFaJbdDMFkIh5OaA4vFOlXfQPKFTV3FVITKseUkF9Gg6EEq9pzCSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004869;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+ty9wgDBmsLBWQWQcUOkua0bFjBDJLzoe/U2VROVMOM=;
	b=GIuaJBXRXGzr+cbuGEv6zoX3jC4qre7lLVEO4cUBYBG4UoivQxoWQpYh/+yllsjhkW5B
	 09rfSd3aJ0OyiC1dm0IeMAdtRsHcg7eDxUQsuFrDDzhA8M1Jtc1xwWYGWTd1U2ERyjuYI
	 kI6zOa556NKicoNAHl8Fln+6O5TyV9WCFgegHF0Su0Cdp7BzVnqtMdxD3QuL5fUp7TJ+r
	 YlzerayMhvqOscjZkBWLPlcYHz5G70r+lcPuzNJvsDA5C6STcG3qo+/cQYpepow+VpP8J
	 tMsciqQhKYG3VZNZqnzmuZkkMHA971fId568/zXBxIuTDJADMyTvyWkFOWatwJLdsSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=cVrbK1v+;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF60D606A32D;
	Fri,  6 Nov 2026 22:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF60D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=cVrbK1v+
Received: by mail.grapheneos.org (Postfix) id EB1843C08EE8A;
	Fri, 06 Nov 2026 22:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794004862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ty9wgDBmsLBWQWQcUOkua0bFjBDJLzoe/U2VROVMOM=;
	b=cVrbK1v+t2M9gGIkrPEfWgq9MaHG5UFflP9CwgYIEJ2IGwiONaf0fkzZCG1xesIH8yNJIG
	pi6aDn+5mJjRoAXWv9/CYIz8OHRrWy1b4cWLQPL9BN1zpJShdSo5WklBlPPzjCFCT6Qqpy
	k5JGK9+5Es75Y9Ro74LW1lNngh3zOnYQfcpQxfPYhDTiSKnhY/tF404h6dcwtI16Dkj6NN
	RGt2kO60nkIfIRIp67OsQrkKHDFfzez6VV8EnjU1kvVIWWCbJMQ0H6H7y6TD1odVA9PNye
	+AqoZWTCtTOyZQKTlVamyzUX+qA3B7DqQVIfwqeH6TYWdPmOa1nkWpfk4RP6yQ==
Message-ID: <c37801aa-94c0-455c-9b55-8746dec731e2@grapheneos.org>
Date: Fri, 6 Nov 2026 22:40:53 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [RFC net-next 1/2] ipv4: Honor prohibit when oif specified
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827 <liamsmith827@proton.me>
References: <20261019032406.88874-1-liamsmith827@grapheneos.org>
 <20261019032406.88874-2-liamsmith827@grapheneos.org>
 <20261025171348.GA233026@shredder>
Content-Language: en-US
From: liamsmith827 <liamsmith827@grapheneos.org>
In-Reply-To: <20261025171348.GA233026@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 17:13, Ido Schimmel wrote:
> Given the above, I think that the patch is too specific to your use
> case. It doesn't make sense to only honor prohibit rules / routes. How
> about checking for 'err == -ENETUNREACH' [1]?
> 
> It doesn't allow us to distinguish between "no route" and "unreachable
> rule", but we can probably ignore it given that it has always been the
> case and nobody complained. It needs to be explained in the commit
> message.

I was trying to sneak in just enough functionality for us to do what we 
needed, but I'll gladly expand the scope.

I think if we were checking for -ENETUNREACH we would want to also check 
for -EHOSTUNREACH to keep the semantics of unreachable consistent 
between both the rule and route variants. However, I think we should 
differentiate between a routing miss and an unreachable rule/route, 
allowing the fallback only in the former case. Not only is this, as 
you've said, the intention of the fallback, but it also has a concrete 
benefit for Android's current networking implementation. Android 
includes a final unreachable rule, so a routing miss is not possible. If 
treated the same, this unreachable rule would not prevent apps from 
being able to use the fallback to send traffic over interfaces which the 
routing rules do not allow. This is a real cross-user leak which we were 
going to fix by changing the final rule to prohibit (alongside the 
original patch), but that would likely not have reached upstream.

This is easy to implement. In v2, I've added a FIB_LOOKUP_REPORT_MISS 
flag that returns -ESRCH instead of -ENETUNREACH on an IPv4 lookup miss.

> Note that multicast needs to be exempted because of VRF. The lookup
> fails on the unreachable default route in the VRF table (-EHOSTUNREACH)
> and we construct the route anyway. It is also consistent with IPv6 where
> these routes / rules do not affect multicast traffic since the
> per-interface ff00::/8 routes in the local table are matched first.

I do agree that multicast needs to be exempted, and that's not 
exclusively because of VRF. That same -EHOSTUNREACH can be encountered 
with multicast outside VRF. In addition to the IPv6 reasoning you've 
provided, there are 2 instances within ip_route_output_key_hash_rcu() 
where multicast traffic goes directly to make_route without a 
fib_lookup(). Whether fib_lookup() should be consulted for all multicast 
is another discussion altogether.

> Why modify this hunk? Looks like an unrelated change.

This comment does need to be updated because it has multiple 
inaccuracies, both with and without the new changes. I'll split it out.
