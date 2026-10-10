Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B949DB90;
	Sat, 10 Oct 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636089; cv=none; b=rKtgPi0QvQaxmWsfD59lg+M1/1jtO5mvGZtZTO12GVmzEhfdneNN/LGOqjESdwVS5IU1Q4lYQpRwLpd7MCKxMzHBRovPEB+RZIoSwpKiJNnTC+5y/PZJO/9WS6fGLjkslSOOxi27ub6IE1yTcrFS7+CBvYHlik0CCjg7jma8XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636089; c=relaxed/simple;
	bh=xXYpfe5z16VtFbCawIMGakd+kWOsBcYVn0BEYTtmdto=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jz/+jaXpuVblOMiV29D+HCMTv0nz0feYCBbSHvDX8bJDcvuYaqG4fan6b0/SMchlaIrJkagZApAASY1SXrBvkn1lwDkbgQXGCweXdpb3rfmYgW31iY58tvHhWLxya9REIbY2gfUbLw0yuSYM/DlNbFJMT3WwuIz9ahOyre3kZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEedFhxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEedFhxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FFB1F000FF;
	Sat, 10 Oct 2026 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636085;
	bh=UMaO4w/vEEoHlY2RncBAvUxKcgvEEQIglb4beZx56Ho=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YEedFhxKyV7KlyifqggDcCTmkBmMplfEg6XoWM9fMyxrQVWbF462M1URQUIZqMqso
	 wHcdAtjVzL+fqBHrCOqUCP9GMUMpq0x+4G9llOMATa3mbIVkCNIbq6Wm5yQuwqef+c
	 9YZLZ9KWT+GxFTEYJLa283XfrMAK8YxOCJ3pIqEfgJcDMSPYQKGK9jhgHNoZsVEEQa
	 BCnSgf90qaQzapZdB7ZtmqWg9P1XHIo4GjCOzhUP//nhBjxk/lFPaw6JKsyx/Njgo+
	 GiiKvVTd9WIGPGs+8uMfS+RuKej8+3JhjBXYyu2xnyAZ4ABIZQ1ljA2xGh0NHouBbz
	 Ik5LUSCM+TcZw==
Subject:
 Re: [PATCH net-next 02/13] amt: send the Relay Advertisement over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:24 +0000
Message-ID: <179163608450.434549.15930085032781839497@kernel.org>
In-Reply-To: <20261009122426.551178-3-omar@blockcast.net>
References: <20261009122426.551178-3-omar@blockcast.net>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] amt_send_ctrl_v6() in drivers/net/amt.c never counts a transmit
  failure after the route lookup.
- [Low] amt_route6() builds the flowi6 for ip6_dst_lookup_flow() with
  memset() and never sets fl6.flowlabel.
- [Low] The new IPv6 branch of amt_discovery_handler() rejects a
  Discovery whose outer destination is multicast, so that it does not…

--

amt: send the Relay Advertisement over IPv6

This adds the 24-byte IPv6 form of the Relay Advertisement. It also adds a
new amt_send_ctrl_v6() helper, which routes with ip6_dst_lookup_flow() via
amt_route6() and sends with udp_tunnel6_xmit_skb(). On an IPv6 device,
amt_discovery_handler() answers a Discovery from the Discovery's destination
address, and drops a Discovery whose destination is multicast.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 423ed7745fc7d..a550f84e86344 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -609,6 +609,78 @@ static void amt_update_relay_status(struct amt_tunnel_list *tunnel,
>  	spin_unlock_bh(&tunnel->lock);
>  }
>  
> +static struct dst_entry *amt_route6(struct amt_dev *amt, struct sock *sk,
> +				    const struct in6_addr *saddr,
> +				    const struct in6_addr *daddr,
> +				    __be16 sport, __be16 dport)
> +{
> +	struct flowi6 fl6;
> +
> +	memset(&fl6, 0, sizeof(fl6));
> +	fl6.flowi6_oif		= amt->stream_dev->ifindex;
> +	fl6.flowi6_proto	= IPPROTO_UDP;
> +	fl6.daddr		= *daddr;
> +	fl6.saddr		= *saddr;
> +	fl6.fl6_dport		= dport;
> +	fl6.fl6_sport		= sport;

[Severity: Low]
fl6.flowlabel stays at zero here, so the route lookup uses DSCP 0.
amt_send_ctrl_v6() then sends the packet with AMT_TOS (0xc0, DSCP 48) as
the traffic class. Would a DSCP-based IPv6 policy rule match this traffic?

fib6_rule_match() in net/ipv6/fib6_rules.c checks the flow key:

	if ((r->dscp ^ ip6_dscp(fl6->flowlabel)) & r->dscp_mask)
		return 0;

A rule like "ip -6 rule add dscp 48 table X" would therefore not match. The
Advertisement could then be routed by another table, or fail to route,
even though the packet on the wire carries DSCP 48. The later IPv6 senders
in the series share amt_route6() and would behave the same way.

udp_tunnel6_dst_lookup() in net/ipv6/ip6_udp_tunnel.c builds the key from
the traffic class it sends:

	fl6.flowlabel = ip6_make_flowinfo(dsfield, key->label);

Should amt_route6() do the same with AMT_TOS? The existing IPv4 amt
control senders have the same mismatch: they pass tos 0 to
ip_route_output_ports() and then write iph->tos = AMT_TOS.

> +
> +	return ip6_dst_lookup_flow(amt->net, sk, &fl6, NULL);
> +}
> +
> +/* Send an AMT control message from @saddr over the IPv6 outer transport.
> + * Returns 0 once the message is handed to the IPv6 stack.
> + */
> +static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
> +			    const struct in6_addr *daddr,
> +			    __be16 sport, __be16 dport,
> +			    const void *msg, unsigned int len)
> +{

[ ... ]

> +	skb_reserve(skb, hlen);
> +	skb_put_data(skb, msg, len);
> +	skb->priority = TC_PRIO_CONTROL;
> +	udp_tunnel6_xmit_skb(dst, sk, skb, NULL, saddr, daddr, AMT_TOS,
> +			     ip6_dst_hoplimit(dst), 0, sport, dport, false, 0);
> +	err = 0;

[Severity: Low]
Do output-path drops go uncounted in tx_errors here? dev is passed as NULL,
and ip6tunnel_xmit() in include/net/ip6_tunnel.h only looks at the
ip6_local_out() result when dev is set:

	err = ip6_local_out(skb_dst_dev_net(skb), sk, skb);

	if (dev) {
		if (unlikely(net_xmit_eval(err)))
			pkt_len = -1;
		iptunnel_xmit_stats(dev, pkt_len);
	}

err is then set to 0 here whatever happened.

The IPv4 sender of the same message, amt_send_advertisement(), counts
these drops:

	err = ip_local_out(amt->net, sk, skb);
	if (unlikely(net_xmit_eval(err)))
		amt->dev->stats.tx_errors++;

So these drops raise tx_errors on an IPv4 relay but not on an IPv6 one: a
netfilter OUTPUT drop, a neighbour or qdisc drop, or the ip6tunnel_xmit()
recursion-limit drop. On IPv6 only route lookup and skb allocation failures
are counted.

amt_send_discovery_v6() and amt_send_request_v6(), added later in the
series, reuse this helper. They would also get err == 0 for every packet
that reaches udp_tunnel6_xmit_skb().

The commit message says the NULL netdev is deliberate, to keep control
traffic out of the tunnel stats. Could the ip6_local_out() result still be
checked here so tx_errors behaves the same as on IPv4?

> +out:
> +	rcu_read_unlock_bh();
> +	return err;
> +}

[ ... ]

> @@ -2701,6 +2791,26 @@ static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	if (amtd->reserved || amtd->version)
>  		return true;
>  

[ ... ]

> +	if (amt_v6(amt)) {
> +		const struct ipv6hdr *ip6h = ipv6_hdr(skb);
> +
> +		/* The socket bound to :: also receives a Discovery sent to
> +		 * a group, and a multicast address can never be a source
> +		 * (RFC 4291 s2.7), so such a Discovery is not answered.
> +		 */
> +		if (ipv6_addr_is_multicast(&ip6h->daddr))
> +			return true;
> +
> +		amt_send_advertisement_v6(amt, amtd->nonce, &ip6h->daddr,
> +					  &ip6h->saddr, udph->source);

[Severity: Low]
What happens when the Discovery's outer source is ::? Only the destination
is checked, so ip6h->saddr becomes the Advertisement's destination without
any check.

ip6_rcv_core() drops a multicast or loopback source, but not an
unspecified one. UDPv6 delivery to the relay socket bound to :: does not
check it either. The path would be:

amt_discovery_handler()
  amt_send_advertisement_v6(..., daddr = ::, ...)
    amt_send_ctrl_v6()
      amt_route6()               fl6.daddr = ::
        ip6_dst_lookup_flow()
      udp_tunnel6_xmit_skb()     outer daddr = ::

ip6_dst_lookup_tail() treats a zero daddr as the default router. So the
lookup succeeds whenever stream_dev has a default route, and the relay
sends a packet with destination ::, which RFC 4291 s2.5.2 forbids.

Should a Discovery with ipv6_addr_any(&ip6h->saddr) be dropped too, like
the multicast destination case?

> +		return false;
> +	}
> +
>  	amt_send_advertisement(amt, amtd->nonce, iph->saddr, udph->source);
>  
>  	return false;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
