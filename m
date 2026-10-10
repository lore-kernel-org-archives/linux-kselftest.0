Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B84737DE85;
	Sat, 10 Oct 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636094; cv=none; b=UmzXdo5B3lawvNpnz1ZNW1z61WvIIFGwKwW0nN1lTcsi6776U5FDhPzWaJQsmQc9mVE3bEw7WHcFQ2qT1RJbwZFdf3pmeOhIYnhahYUQzP85Mk49SfUueezJRu4LcDpdwZj/6hK/qy7+Uw0KmacbUuRSacvkHOuKYygo92ML6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636094; c=relaxed/simple;
	bh=JEl0YoL2TeSHI4E5MqSlkMUDZSX/pDftDGk07n2JP5k=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FPy3Bfyv25tbyXidl0MkALjMvIUlwoqKQec6jCs9r05NcBY2BFwaHak8+dX/Qinge7z8cj2wDg2TUMQNOQ/m4x8cWVElpyW5tRsnU9moPDzE7zgp6N5frKe6c10dJonuTuSLcuVC92YkTYHXb6i4NyLTa794L2ytUT8mx7QUjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh4gSph6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh4gSph6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05E81F00898;
	Sat, 10 Oct 2026 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636088;
	bh=Xf6uSj2i1EAG50KNIrB/xvfGSfWxMZZZpKa8hGMx5Ps=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Nh4gSph6FCV1cdZq6m2P0fsijFyljMsLZc0itwBx9SQKGEAy+dvR/Wq58EQxQXASA
	 sfwyztdVxVtLT21JIz8fTtIQQLx9mHRdb9hM1OS9TDWOP0awiW26iJT3ukO16XIgul
	 dylG75CCkUz3hXWNY107MgmR0AyTrTzsX7ESCi5EXLt/F+wVuvQNMFCIZWbwGlfMYm
	 baxmh42d5WO4IYdmRzUlHrxqD1ZtC65YXsoS2OrFGF9AxFgCb1E0s1LW+JmblradFi
	 sb14SP9cAOsa7wzbf815JtOi2/zi7ht9OfvviTnQ2PefvgaotgQO/aEyCL/u/WRUDP
	 YZuwW/j9GsRnw==
Subject: Re: [PATCH net-next 04/13] amt: send the Membership Query over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:27 +0000
Message-ID: <179163608739.434549.2136224322943831238@kernel.org>
In-Reply-To: <20261009122426.551178-5-omar@blockcast.net>
References: <20261009122426.551178-5-omar@blockcast.net>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The IPv6 branch of amt_udp_xmit() routes Membership Queries
  without a traffic class but sends them with AMT_TOS.

--

amt: send the Membership Query over IPv6

This patch moves the route and transmit step of
amt_send_membership_query() into a new helper, amt_udp_xmit(). The helper
sends over the device's outer family: ip_route_output_key() and
udp_tunnel_xmit_skb() for IPv4, and amt_route6() and
udp_tunnel6_xmit_skb() for IPv6. The relay's General Query now uses the
IPv6 path when the device has an IPv6 outer transport.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index eaa5637674694..5e8a74cc0700e 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -1098,6 +1103,65 @@ static void amt_req_work(struct work_struct *work)
>  				 msecs_to_jiffies(100));
>  }
>  
> +/* Route an AMT-encapsulated skb to @daddr and send it over the device's
> + * outer family. The caller has already pushed the AMT header.
> + */
> +static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
> +			struct sk_buff *skb, const union amt_addr *daddr,
> +			__be16 sport, __be16 dport)
> +{
> +	struct rtable *rt;
> +	struct flowi4 fl4;
> +
> +	if (amt_v6(amt)) {
> +		struct dst_entry *dst;
> +
> +		dst = amt_route6(amt, sk, &amt->local_ipv6, &daddr->ip6,
> +				 sport, dport);

[ ... ]

> +		skb_scrub_packet(skb, false);
> +		udp_tunnel6_xmit_skb(dst, sk, skb, amt->dev, &amt->local_ipv6,
> +				     &daddr->ip6, AMT_TOS,
> +				     ip6_dst_hoplimit(dst), 0, sport, dport,
> +				     false, 0);

[Severity: Medium]
Should the IPv6 route lookup also use AMT_TOS? The packet goes out with
AMT_TOS as its traffic class, but the route is looked up with a traffic
class of 0.

amt_route6() clears the flowi6 and never sets the flowlabel:

drivers/net/amt.c:amt_route6() {
	memset(&fl6, 0, sizeof(fl6));
	fl6.flowi6_oif		= amt->stream_dev->ifindex;
	fl6.flowi6_proto	= IPPROTO_UDP;
	fl6.daddr		= *daddr;
	fl6.saddr		= *saddr;
	fl6.fl6_dport		= dport;
	fl6.fl6_sport		= sport;

	return ip6_dst_lookup_flow(amt->net, sk, &fl6, NULL);
}

IPv6 policy routing takes the DSCP from fl6->flowlabel in
fib6_rule_match():

	if ((r->dscp ^ ip6_dscp(fl6->flowlabel)) & r->dscp_mask)
		return 0;

So a rule such as "ip -6 rule add dsfield 0xc0 table X" would never match
these Membership Queries. The lookup could then use a different table or
fail.

The IPv4 branch of the same helper does pass the DSCP into the lookup:

	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);

udp_tunnel6_dst_lookup() also puts the dsfield into the lookup:

	fl6.flowlabel = ip6_make_flowinfo(dsfield, key->label);

The commit message says:

    Both use AMT_TOS, as the IPv4 path and the IPv6 control
    messages do.

That is true for the transmitted header, but not for route selection.

amt_send_ctrl_v6() (Advertisement, Discovery, Request) has the same
mismatch, since it also routes through amt_route6(). The mismatch is
still there at the end of the series.

Could amt_route6() set something like
fl6.flowlabel = ip6_make_flowinfo(AMT_TOS, 0) so the lookup matches the
header that is sent?

> +		return 0;
> +	}
> +
> +	memset(&fl4, 0, sizeof(struct flowi4));
> +	fl4.flowi4_oif         = amt->stream_dev->ifindex;
> +	fl4.daddr              = daddr->ip4;
> +	fl4.saddr              = amt->local_ip;
> +	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
> +	fl4.flowi4_proto       = IPPROTO_UDP;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
