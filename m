Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859320;
	b=AIoubVij8r6aPEXO2i2OiixgM5BmqkDVFrW4xY7p5loJ+2n+5sRM8ULRB+qYXitDBymU
	 kLWiv9qVVSPLEG2a8I031fIg4VgLIBI4QmFc+5HqZ41fH4VyO+Aziv6Nymm2pPmGlU9mH
	 gIo2tfn4OWdAHaMwKCj9KjfbhEsgSZpf3M0UchcKKm/FllZS7WZv4u8PNXvYs3CAM9zdU
	 Z1KdpT5SC+mJ3oVPRyjd9ZwWccCVUYvfB7H3QGPISzO8WMfQoh1ME/HNJn4mZcAwexvmg
	 xs4oEYvsLGS2MO4A+yXk0D2mJvLhAW4t4ViX0k1X0Vg1SKisWi6oHpw7iNqvgNbaycA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859320;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XnBWWXM/LsXj484dg96+mAdMdayPDPIPl5sYcE7lwnU=;
	b=Givtse31zVubliUrPgK0Vq63t0XxMbe4Z+fv9+V70s7rfU40WdHiLVL3dO9cIDTGM0DL
	 GqzIat65nV4HGkOEl49J4IdZqkBf8zPaZoZmhNyIkcZJiw3yUOzSr0H9R1e3E4rrYKvJ7
	 VkyyOHXJTR5fyh2OLguEeuTg8c0USlBhjdTAjiX43X+STsz7c/xdYGL5roFyIniIWqI3V
	 WIWPlNhxY8OZBScG1gwu1gUfu3Y74coJ1L0NaVuLIgdH67t8iGxx8NFHR2aBMdTCcNLDi
	 rl3h3BME8hXKSfRAAJNzUg/8HNfYWxF/PELYOJ552VP7ocf5MAOpQwRjwywR2wmA8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JBb2pEK2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5BB606A698;
	Sat, 28 Nov 2026 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JBb2pEK2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B941F00898;
	Sat, 28 Nov 2026 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859320;
	bh=XnBWWXM/LsXj484dg96+mAdMdayPDPIPl5sYcE7lwnU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JBb2pEK2+6QFwd/jmLclpy2yzi68ZXMJdo+IOwVwZdXmn5lCn1k0PCI06OGPtqsKg
	 KHkb+60Ai5+hHvztn4dd49jPRF6wVHs+7xT48sv2VNlWk0GIQKktx1iDx17vQ2NLJS
	 n4FQvwDTP6aYhMz9tFalm8kdTFmaMiOaus9wvZ/Y9cdvyClSM93v16R/fpPPDBBJ4d
	 o3+/TqTvfR9FBezVdtLRthap6m89WdqH1TDpPqBpWgsibxGcxhzrpbiFH0IaDZLeYP
	 RNQilNwBnlsFIiiwV4XYYkqE7AoE3f10QGf6UxLZsObEL0GEj/4Tf0rIoCVLpapCiQ
	 aOnwLMMyYtEOg==
Subject: Re: [PATCH net-next v3 05/12] amt: forward multicast data over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, willemb@google.com
Date: Sat, 28 Nov 2026 09:48:39 +0000
Message-ID: <179585931904.3135.10573142335250073634@kernel.org>
In-Reply-To: <20261127094703.3025517-6-omar@blockcast.net>
References: <20261127094703.3025517-6-omar@blockcast.net>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message understates what a forged ICMPv6 Packet Too
  Big does to a gateway, and the same applies to any real path whose…
- [Low] The commit message says 'A copy that cannot be sent is still
  freed, but it is now counted in tx_dropped and freed with a drop…
- [Low] Two header comments in drivers/net/amt.c do not match the code.

--

amt: forward multicast data over IPv6

This patch sends the relay's copy of a multicast packet through
amt_udp_xmit(), so it can go out with an IPv6 outer header as well as an
IPv4 one. Over IPv6 the route is looked up first. A payload larger than
the route MTU less the outer and AMT headers is dropped, and after
walking all tunnels amt_dev_xmit() sends one ICMPv6 Packet Too Big.

> The route MTU never drops
> below IPV6_MIN_MTU, as a smaller Packet Too Big is ignored, so a forged
> Packet Too Big can at most lower the tunnel MTU to 1280 bytes less the
> outer headers; an IPv6 payload between that and 1280 bytes is then
> undeliverable.

[Severity: Medium]
Is this an accurate description of the effect? With a route PMTU of 1280,
amt_tmtu() returns 1280 - (40 + 8 + 2) = 1230:

    u32 hlen = sizeof(struct ipv6hdr) + sizeof(struct udphdr) +
               sizeof(struct amt_header_mcast_data);
    ...
    return mtu > hlen ? mtu - hlen : 0;

amt_send_multicast_data() then drops every inner packet, or GSO segment,
larger than 1230 bytes toward that gateway. This applies to IPv4 and IPv6
inner payloads alike.

1230 is below IPV6_MIN_MTU, so this check leaves *ptb at zero:

    if (tmtu >= IPV6_MIN_MTU && (!*ptb || tmtu < *ptb))
        *ptb = tmtu;

As a result, amt_dev_xmit() never calls icmpv6_ndo_send(). An IPv6 source
sending multicast larger than 1280 bytes gets no Packet Too Big and loses
every packet. Even with a signal it could not recover, since it never
sends below 1280. IPv4 payloads above 1230 bytes are dropped silently too.

The forged PTB reaches the route through udpv6_err() ->
udpv6_err_update_exception() -> ip6_update_pmtu() before the socket
lookup, and an mtu of 1280 is accepted. A real path whose PMTU is between
1280 and 1329 bytes has the same effect.

Doesn't this mean an off-path sender can silently black-hole all
multicast above 1230 bytes toward a chosen gateway, including common
1316-byte MPEG-TS payloads? That is wider than IPv6 payloads between 1230
and 1280 bytes. Could the commit message describe the real scope, or
could the design be reconsidered?

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 70be70ed5ce03..3972b3eccc913 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -1374,26 +1402,58 @@ static bool amt_send_membership_update(struct amt_dev *amt,
>  	return false;
>  }
>  
> +/* Send the relay's copy of a multicast packet to one gateway. Over IPv6 a
> + * payload that does not fit the tunnel MTU is dropped, and *@ptb is lowered
> + * to that MTU so that amt_dev_xmit() can send a single Packet Too Big to
> + * the source once it has walked every tunnel.
> + */
>  static void amt_send_multicast_data(struct amt_dev *amt,
>  				    const struct sk_buff *oskb,
>  				    struct amt_tunnel_list *tunnel,
> -				    bool v6)
> +				    bool v6, u32 *ptb)
>  {

[ ... ]

> -	skb = skb_copy_expand(oskb, sizeof(*amtmd) + sizeof(*iph) +
> +	if (amt_v6(amt)) {
> +		u32 tmtu;
> +

[ ... ]

> +		tmtu = amt_tmtu(dst);
> +		if (amt_tmtu_exceeded(oskb, tmtu)) {
> +			dst_release(dst);
> +			/* A source ignores a Packet Too Big below
> +			 * IPV6_MIN_MTU, so a tunnel that small is only
> +			 * dropped for.
> +			 */
> +			if (tmtu >= IPV6_MIN_MTU && (!*ptb || tmtu < *ptb))
> +				*ptb = tmtu;
> +			DEV_STATS_INC(amt->dev, tx_dropped);
> +			return;
> +		}
> +	}

[Severity: Low]
Do the header comments match this check? The comment on
amt_send_multicast_data() says *@ptb is lowered to the failing tunnel
MTU. The comment above amt_tmtu() says:

    ... a payload larger than the tunnel MTU is
    dropped, and an IPv6 source is sent a Packet Too Big.

Some failing tunnels never update *ptb, so no Packet Too Big is sent for
them. These are tunnels with tmtu below IPV6_MIN_MTU, including tmtu == 0
when dst_mtu() is 50 or less.

*ptb is also lowered for inner IPv4 payloads. Only the "ptb && v6" check
in amt_dev_xmit() keeps those from producing a Packet Too Big.

The inline comment here covers the IPV6_MIN_MTU case. Could the two
header comments mention these conditions too?

> +
> +	skb = skb_copy_expand(oskb, sizeof(*amtmd) + amt_ip_hlen(amt) +
>  			      sizeof(struct udphdr), 0, GFP_ATOMIC);
> -	if (!skb)
> +	if (!skb) {
> +		dst_release(dst);
>  		return;
> +	}
>  
>  	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
>  	 * header. The tunnelled payload has no link-layer header, so the
> @@ -1402,18 +1462,7 @@ static void amt_send_multicast_data(struct amt_dev *amt,
>  	skb_reset_mac_header(skb);
>  	skb_reset_inner_headers(skb);
>  	if (udp_tunnel_handle_offloads(skb, true)) {
> -		kfree_skb(skb);
> -		return;
> -	}
> -

[ ... ]

> +		dst_release(dst);
>  		kfree_skb(skb);
>  		return;
>  	}

[Severity: Low]
The commit message says:

    A copy that cannot be sent is still freed, but it is now counted in
    tx_dropped and freed with a drop reason

Should these two failure paths count the drop as well?

If skb_copy_expand() returns NULL, for example on a GFP_ATOMIC failure
under memory pressure, the function returns without touching tx_dropped.

If udp_tunnel_handle_offloads() fails, the copy is freed with a plain
kfree_skb(), with no drop reason and no tx_dropped increment. That branch
is close to unreachable for a freshly copied skb, though.

Only three paths are counted: the IPv6 route lookup failure, the tunnel
MTU check, and the amt_udp_xmit() error branch with
kfree_skb_reason(skb, SKB_DROP_REASON_IP_OUTNOROUTES). Since
amt_dev_xmit() always returns NETDEV_TX_OK, copies lost on the other two
paths show up in no counter.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127094703.3025517-1-omar%40blockcast.net
