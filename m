Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720616;
	b=l7yctpNMBBTZj6wkjT49pJNzj+iAKcdEHN9hnalnaSut5ni+UhGFH7nrg73g76QLm2Tn
	 v47u49phJC7MFLrTbz+mvEB4/mpSHgxUc2sypdjA6rOntZQSx1JfDIV16WyqQ4ySnVlEV
	 xb78rD+uHPTbq6kdOMRoE8yaNMhKY5JXRPQFIRKvpCQ47/NF01i4FihLLZ275zPJ3LiXj
	 0Rfjk5OBXds+kMCwhEO0j0e0Aocy9r0SDGVFZh0metVmUL8eTMTKg+qokCpl10RddF16y
	 J1AS7e3U75f7C6Mp5hMF1XYc7dQOwp4I8ztLiqwqEYy9P1V3Ko5w3nFsgklZx+5P7RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720616;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9u7fRQ27JKwPMHMRI8HVbLu3Ly/w1IeOYPfKtu1UK/o=;
	b=ux7Iaa0I+vXk66oaM4O2IEs1B6/sGmWiBjFxnQcJbDLrdwKOUIoTkve0OD/Dn5JJgdt6
	 lGH55niRgiviAdUoFWyF7KZh3O6ucdEHw/M3M0K+6g5QRQWiMvGncmw68pZVnr7qOgwsz
	 QnEbiIRAk6Vh/LhWcvOdqKKwk/xJ0FrSnUmg25zpEYsY4LPEUmT32+Mv8iiX350fUn1Ql
	 0woaHYOf0A374BB70N1JLjJTwv9Yo8+eirACtPxVcr7SwtS/3XJVE/TqE1Q7iI2F6vxHN
	 8fZeKWSnrzczfmjupsrakCfDZKpyGfETLWdr6jtrvPB6VLCUpJYHfVEbljw5xONk4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olxQeprM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D07606A329;
	Thu, 26 Nov 2026 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olxQeprM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066481F000C0;
	Thu, 26 Nov 2026 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720615;
	bh=9u7fRQ27JKwPMHMRI8HVbLu3Ly/w1IeOYPfKtu1UK/o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=olxQeprMulgqGjf255Cn9iNfWmrYFIJkPpm2Qi6+uFTL0Gkz/ExN8w1mhcIE7cXaS
	 J8OD+0K4CzDwIquWpZThRF3IgqxlBv8TzY/ifp9nHPUwM0rxiJpe37CpIQ0YGCYBSF
	 Fk8QzQfBB3JKTjgve0aIe3ZDX3rlstXy+O50HK2B9283L40kenewalAAbnDHkRJ/UN
	 5aVAWnjcUFpBCLuViqP1OpRtX4N/hhgumtBihAld09buGbwJWfTSkGFch6hf1FAQtL
	 b2aoX3m+6awUjqMmhUq2WlSrc8P2ykbuipMYGTEe7wLXaJUnHYUMvGEmvep4oyYulV
	 66E2832Rb/0mw==
Subject:
 Re: [PATCH net-next v2 02/12] amt: send the Relay Advertisement over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:16:54 +0000
Message-ID: <179572061450.3135.6022071464185625512@kernel.org>
In-Reply-To: <20261125191450.2497936-3-omar@blockcast.net>
References: <20261125191450.2497936-3-omar@blockcast.net>
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

- [Low] The IPv6 control-message helper does not count send failures that
  happen after the packet is handed to the IPv6 stack.

--

amt: send the Relay Advertisement over IPv6

This patch adds the IPv6 form of the AMT Relay Advertisement
(struct amt_header_advertisement_v6) and a new amt_send_ctrl_v6() helper.
The helper routes with ip6_dst_lookup_flow() and sends with
udp_tunnel6_xmit_skb(). amt_discovery_handler() now answers a Discovery on
an IPv6 device with this form, sourced from the Discovery's destination
address.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 3f3205d2df3e8..52ccaca08b5ec 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> +/* Send an AMT control message over the IPv6 outer transport from @saddr.
> + * udp_tunnel6_xmit_skb() adds the UDP and IPv6 headers, including the UDP
> + * checksum that IPv6 requires. Returns 0 once the message is handed to the
> + * IPv6 stack.
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
If the packet is dropped after it is handed to the IPv6 stack, should that
drop show up in amt->dev tx_errors the way it does for the IPv4 control
messages?

udp_tunnel6_xmit_skb() returns void, and ip6tunnel_xmit() only looks at the
ip6_local_out() result when a netdev is passed:

include/net/ip6_tunnel.h:ip6tunnel_xmit() {
    ...
	err = ip6_local_out(skb_dst_dev_net(skb), sk, skb);

	if (dev) {
		if (unlikely(net_xmit_eval(err)))
			pkt_len = -1;
		iptunnel_xmit_stats(dev, pkt_len);
	}
    ...
}

Since dev is NULL here, a drop by netfilter, neighbour resolution or the
qdisc is never counted. The IPv4 senders, including
amt_send_advertisement(), do count it:

	err = ip_local_out(amt->net, sk, skb);
	if (unlikely(net_xmit_eval(err)))
		DEV_STATS_INC(amt->dev, tx_errors);

Route lookup and allocation failures in amt_send_ctrl_v6() still increment
tx_errors. So the IPv4 and IPv6 paths differ only for drops after the
handoff.

The commit message says:

    Like the IPv4 control messages, it marks the
    skb TC_PRIO_CONTROL, uses AMT_TOS as the traffic class and passes no
    netdev, so control traffic stays out of the amt device's tunnel stats.

Passing NULL also hides these post-handoff errors, and the message doesn't
mention that.

At the end of the series the same udp_tunnel6_xmit_skb(..., NULL, ...);
err = 0; sequence is still present. That means every later IPv6 control
sender that uses this helper has the same gap.

> +out:
> +	rcu_read_unlock();
> +	return err;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
