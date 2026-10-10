Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060C4A4402;
	Sat, 10 Oct 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636093; cv=none; b=maVcb2O3SEofz59V3LmkL9VLZSNu61BoYUv8HoZF5TqEQtoDGUj+gBI4nb7RmYc/TSNvGknT0B9/sA1wnBV2iSVp4RtZ+zjrYPqWWoVTKw4SYCG5BJM7LM1dCIuO5KKxq/2fUOTl1BgulkcNkBpbzm+Gvfm+W9/Pwk6yFZNsRus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636093; c=relaxed/simple;
	bh=FXQwsq5Zr21pHBD8oKLIYRceF45ehRmxWoIWQbow1Es=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q4aay1AGpTkRkWFc0wyn7qs+JA/+hqIwzDxf9uOeUSu3fsjTZfmdDHh7xphzglIRmvSHvzavjPjb33zYE/7NKfLZ+MXu6UCX5lzCWwEhZJ525ygaA2iJhlm6WqOX39xQO/t2ZH3s79clq21DGXCjHlLIxNULqVLA29S0dfwuLNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQD8PoXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQD8PoXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EDE1F000FF;
	Sat, 10 Oct 2026 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636091;
	bh=9RHTjMv2ibV3tNarPxyI8/efibzsV8qLzlXqtz201PM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XQD8PoXSS/l8ilUjx3Ho6LpFo1/7yKzY6z4A6a4pkTz/f58MttaVPZQeLI3q/d+WF
	 jOsEDfdJQUvjWgHKX2zNcyJs2qSfX+GFlaX+NOeHOU5jiZIVb7bGZ12iLgr/ezBJNp
	 8AsngEO3/N7ff4gCNpZhOTuPKuZXHSfxLZqQGzgDY0oG6Jqfr2qfVhDJ1SZ3y9Rpov
	 dIKyseioZg76p9nel95rAtTMHKsQOeNbmS5HjhNzUe8NGNhJwKxbTctldLmidhyzHr
	 WoZomX0sLoLh6PddYfEukJtQXzcGHkMHlrkrCUs6sl5bUobM3ulOEGVcDqAaLLUo01
	 ZBf12EUvCOL0g==
Subject: Re: [PATCH net-next 06/13] amt: forward multicast data over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:30 +0000
Message-ID: <179163609023.434549.11786436819795174602@kernel.org>
In-Reply-To: <20261009122426.551178-7-omar@blockcast.net>
References: <20261009122426.551178-7-omar@blockcast.net>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] amt_tmtu_exceeded() (drivers/net/amt.c) sends one ICMPv6 Packet
  Too Big for every tunnel that a single IPv6 multicast packet is too…
- [Low] amt_tmtu_exceeded() decides whether the inner packet is IPv6, and
  so whether to send an ICMPv6 Packet Too Big, from skb->protocol (line…

--

amt: forward multicast data over IPv6

This patch makes the relay send its copy of a multicast packet through
amt_udp_xmit(), so traffic can be delivered over an IPv6 outer transport.
On IPv6 tunnels, a new helper, amt_tmtu_exceeded(), drops any payload
above the tunnel MTU and sends an ICMPv6 Packet Too Big to the source.
A copy that cannot be sent is now counted in tx_dropped and freed with a
specific drop reason.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index b977b00a6fd55..412d23cc62599 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -1103,15 +1103,43 @@ static void amt_req_work(struct work_struct *work)

[ ... ]

> +static bool amt_tmtu_exceeded(struct sk_buff *skb,
> +			      const struct dst_entry *dst)
> +{
> +	int off = skb_network_offset(skb);
> +	u32 mtu;
> +
> +	mtu = dst_mtu(dst) - sizeof(struct ipv6hdr) - sizeof(struct udphdr) -
> +	      off;
> +	if (skb_is_gso(skb) ? skb_gso_validate_network_len(skb, mtu) :
> +			      skb->len - off <= mtu)
> +		return false;
> +
> +	if (skb->protocol == htons(ETH_P_IPV6))
> +		icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0,
> +				max_t(u32, mtu, IPV6_MIN_MTU));

[Severity: High]
Can one multicast packet cause up to max_tunnels Packet Too Big messages
to be sent to its source here?

amt_dev_xmit() walks the tunnel list and sends one copy to each tunnel
that joined the group. Each copy can then send its own Packet Too Big:

amt_dev_xmit()
  list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
    amt_send_multicast_data()
      amt_udp_xmit(..., true)
        amt_tmtu_exceeded()
          icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, ...)

By default, nothing limits the rate of these messages.
inet6_net_init() clears ICMPV6_PKT_TOOBIG from icmpv6_ratemask, so
icmp6_send() skips both icmpv6_global_allow() and icmpv6_xrlim_allow().

amt_request_handler() creates a tunnel for any new outer source address,
with no authentication, up to max_tunnels. The commit message also notes
that a gateway can lower its own route MTU to IPV6_MIN_MTU with a Packet
Too Big that udpv6_err() accepts.

So a remote party with max_tunnels IPv6 addresses (one /64 is enough)
could join a group and lower the route MTU of each tunnel. After that,
every datagram on that group above about 1230 bytes would cause up to
max_tunnels Packet Too Big messages of about 1280 bytes each, all sent to
the multicast source.

Does this ever stop? The check uses dst_mtu() minus the outer headers,
which is about 1230 here. The reported MTU is clamped to IPV6_MIN_MTU,
which is 1280. A compliant source cannot shrink its packets below 1280,
so its packets or first fragments keep exceeding the tunnel MTU for as
long as the attacker keeps its tunnels and route MTU entries alive.

The commit message says "so a packet draws one for each gateway with a
smaller path MTU", but it does not say that untrusted gateways control
how many there are. Relays can only be created as IPv6 once a later
netlink patch in this series lands. The final state of the series still
sends one Packet Too Big per tunnel.

Would it work to send at most one Packet Too Big per original skb,
carrying the smallest failing tunnel MTU (for example tracked in
amt_dev_xmit())?

[Severity: Low]
Should this check use the inner family the caller already parsed, rather
than skb->protocol?

amt_dev_xmit() sets v6 and data from iph->version and never checks
skb->protocol:

	iph = ip_hdr(skb);
	if (iph->version == 4) {
		...
		if (!ip_mc_check_igmp(skb)) {
			...
		} else {
			data = true;
		}

If skb->protocol does not match the contents, ip_mc_check_igmp() and
ipv6_mc_check_mld() return -EINVAL. The else branch then still marks the
packet as data and forwards it, and skb_copy_expand() keeps the wrong
protocol.

Take an over-MTU skb labelled ETH_P_IPV6 that holds an IPv4 packet.
icmpv6_ndo_send() would read the IPv4/UDP header bytes as a struct
ipv6hdr, and the Packet Too Big would go to an address built from those
bytes. In the opposite case, a real IPv6 source would get no Packet Too
Big at all.

Reaching this needs something like AF_PACKET with an arbitrary
sll_protocol, or a tc/BPF redirect. Could the v6 flag from
amt_send_multicast_data() be passed down to amt_tmtu_exceeded() instead?

> +	return true;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
