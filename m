Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720624;
	b=3yvnrJ3VupTYVbvd51tCYwhs2iGYctJZ5pDNwjrJKamqdmfYDU/zFdXOh82DXlbIyS6L
	 7jY+4BdF1QTbeEhooEod6RreA91fqoY+VZBfUfRFgOSG6CaKqo3iCeTy5PQ7wPz3xvGjB
	 oFSHogUC8dEU5NCQUkhVkt7Pr61GqQ24HBgBIjg1j0elMIceQsamGxGU8HrewdRFHoT1J
	 lrAhqQf0LC1ClOyNy/Mps8+G1VCbbd6d27gNDBRCct+f5wlMZw0/OAfgC+bMcQURPo6v/
	 76VzixOxX1S86r2vtPZ1rcpUdUWyBGlktTI+12mWKeg0JZvw9lQBKCerhAvmxql4D2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720624;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=N65HqPxX/ELug8Pbigt0amqo727I7WkvGhbQ0Xq8tKg=;
	b=4lHf5dDZKpJETGKM30BJjxaWW0XnByGSdFiQdsxaI+ZK2KAk6eP5DiuyI7ZDjDaFVjr8
	 iv8C0H7TQcCBKNNAIHPQi25kUYVYbvEVpDQG+4fsgMoMuI5IwEBhcf9sziT8Y37iQVDzt
	 u5NQSisZjLXPF4scl5MSqunsgDkgpM5eKFLk0K+Co/4ZGrVaxFWxrm3u/ec4kOBlzlLVB
	 LysAzJzBuDhC7Q51jXUJvbaY4rL/eI6417NYgmU9aX0WRVOk4Esb7/fBfykg6GUZ/5d/X
	 zHIkmzvnnzkpvQXEjZ0cJLYZ6VKy8s6C4GrvPVH5j5ez2UWKNmExx4K4D2Ge0G/MujA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GB70a263;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34643606A33C;
	Thu, 26 Nov 2026 19:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GB70a263
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224641F000EC;
	Thu, 26 Nov 2026 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720623;
	bh=N65HqPxX/ELug8Pbigt0amqo727I7WkvGhbQ0Xq8tKg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GB70a263uFekhs/KQMkwZkMvIac6Ti8UaJ7eOBbO5veapd1qw59m9TGwLrIUU0149
	 Qyat30ZexBv4uF4DGHeebXD5fsvWgNFurQY4Xl6gTRXa8bvfYdB42T5mDA5qFlbLp8
	 InPTjGohrdLr97LCg2AK9uvdadynnIVYFzi0Nddj1lcb55irkgiU1vEY4kdZwSo4Na
	 Cn2aowxlpopkmwsnlu/tT5ekCzKJB/01CSW7bfdWbnvnpQH5YDa+XI6dXQCa1OdVL0
	 rYXB0VQYhARMV75Zde0GTG+KvyrS9McRUCpjhkYgTmRmkynmiVnYBV7jrUy5NNvjGH
	 bdQjvoEtqJIfg==
Subject: Re: [PATCH net-next v2 08/12] amt: receive the AMT gateway control
 plane over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:17:02 +0000
Message-ID: <179572062268.3135.2896747109290971474@kernel.org>
In-Reply-To: <20261125191450.2497936-9-omar@blockcast.net>
References: <20261125191450.2497936-9-omar@blockcast.net>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch changes how an IPv4 gateway handles Relay
  Advertisements, and the commit message does not say so.

--

amt: receive the AMT gateway control plane over IPv6

This patch lets an IPv6 AMT gateway receive Advertisements, Membership
Queries and Multicast Data over an IPv6 outer header. The learned IPv6
relay address is published under a new seqlock. A zero UDP checksum is
now accepted only for Multicast Data on an IPv6 gateway.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 6158e13f5520f..7dd1d544ff14e 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -2662,27 +2719,48 @@ static bool amt_advertisement_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	struct amt_header_advertisement *amta;
>  	int hdr_size;
>  
> -	hdr_size = sizeof(*amta) + sizeof(struct udphdr);
> +	/* The IPv6 form (RFC 7450 s5.1.2) has the same header and nonce, with
> +	 * a 16-byte relay address in place of ip4.
> +	 */
> +	hdr_size = sizeof(struct udphdr) +
> +		   (amt_v6(amt) ? sizeof(struct amt_header_advertisement_v6) :
> +				  sizeof(*amta));
>  	if (!pskb_may_pull(skb, hdr_size))
>  		return true;
>  
> -	amta = (struct amt_header_advertisement *)(udp_hdr(skb) + 1);
> -	if (!amta->ip4)
> +	/* The two forms differ only in their length, and the device's family
> +	 * picks one, so a message of the other form is not accepted.
> +	 */
> +	if (ntohs(udp_hdr(skb)->len) != hdr_size)
>  		return true;

[Severity: Low]
Is this new length check meant to apply to IPv4 gateways as well?

When amt_v6() is false, hdr_size is 8 + 12 = 20. With this check an IPv4
gateway now drops every Advertisement whose UDP length is not exactly 20.
That includes the 24-byte form that carries an IPv6 relay address.

Before this patch amt_advertisement_handler() only did a minimum
pskb_may_pull() and had no length check. An IPv4 gateway would accept the
24-byte form and store the first 32 bits of the IPv6 address as
remote_ip. It would then send its Requests to an unrelated IPv4 host.

The commit message says:

    The IPv4 comparison it replaces is the one "amt: reject a gateway Query
    or Data from 0.0.0.0" fixed in net for IPv4, so this patch carries only
    the IPv6 half.

It does not mention that IPv4 Advertisement parsing changes too. The check
is still unchanged at the end of the series.

If the old IPv4 mis-parse counts as a bug, could it be split out and sent
to net with a Fixes: tag, as was done for the 0.0.0.0 fix? Otherwise,
could the changelog state that the IPv4 behaviour changes?

>  
> +	amta = (struct amt_header_advertisement *)(udp_hdr(skb) + 1);
>  	if (amta->reserved || amta->version)
>  		return true;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
