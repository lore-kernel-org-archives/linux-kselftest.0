Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720621;
	b=U46RpbSguDJiHOgooONq5dlqQa2CFRjXRSioT6kSnQKlVGHlpf17wQVVNmbE9wpKXmY+
	 X7yWpRQT2cR09uPG7LEeWPSVYS7GtDxW6u2Nfgi+gA3Q0xlFgyVFh/09QAQiY0gUdbN7D
	 +5pdMgN6/lIhP4jrMVhBXPSo/ulMW+qCwc9tbfZKa/TzsY4pz6SQBza7HmlV92oj6/1Ox
	 3Op5JLg6KBNAIL6nTiN2QXL514NKQ7fWbk527HngS4nAQ4U46RpMAYYIziYeKyo1EcEPw
	 YxsfIlFUJFo0TVWKwbZ0gCPNh+ax5XiENz9xGZ9nz2+Mso1jojMbNP68+dazfKXdnYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720621;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QC9DfUnNWJVMnUf2ONDNYFI/o23hdAko+A6GsVR1Eek=;
	b=AevqYkU/Pot+ADPxnrBVdwtyRQ8GyDWMYfx2cv+FFGS55O55wXgikKMugg0Y3gIkl3V3
	 tv79gkCi+m6vjH0W+BbpljMyIWIdF0avjvuf/5FZ9vPl1pT896b9Ck173sL73GMUU7NtX
	 dVnlU1eQ9aDJYRuZh0j4kfHsyOU3oIxnLUQNi3DtFlcjXWjBNqWf57B3My9akvvuN5f3B
	 Q3GLGhOISLIDYcC4ykvV99xoEj/ge7MCSVsTUAwD/08PAQjvj7dlFUNFyJi+BsO+bR9ht
	 RxDF/qTYI13IMM7y9jojcEyh0CUY6rH3NYtskIxCiZcy8ynEG3lQRlsw7pBmrogI5VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rzv+FSSh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27865606A32A;
	Thu, 26 Nov 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rzv+FSSh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FAA1F0093C;
	Thu, 26 Nov 2026 19:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720620;
	bh=QC9DfUnNWJVMnUf2ONDNYFI/o23hdAko+A6GsVR1Eek=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rzv+FSShHeqQWihtE2UmvqeWgncDIRGoEaFlpg6SmxxE9O21lI7f6PXJ4Ig7KE6a3
	 eNbh7EyN0IRSHcXUm0Ly9M6AqPCkSwUnlTWSselPzB+zfCgC5xoZzMXV6+AgXlIyMj
	 XjT535nrKK8IaVkcL6x3QIZN0obby2Lt/erxl6IZq9wz4N/vg60i9Rlo4qZj2obsrQ
	 IWQeICyp19zLtKM1Ts3EHqrr9uXrMqkZsmmRyWryMWjUuRU4aMorkwA0Sk+1hnvUzP
	 ek6Gjlo08cn0bg1r++4vK64kpJXqZ1ZMNEacyHVNkWroMzJ90AO3YsU4heUTJMt68z
	 cdDct9esxmuEA==
Subject: Re: [PATCH net-next v2 05/12] amt: forward multicast data over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:16:59 +0000
Message-ID: <179572061952.3135.14503580379845323397@kernel.org>
In-Reply-To: <20261125191450.2497936-6-omar@blockcast.net>
References: <20261125191450.2497936-6-omar@blockcast.net>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When the outer transport is IPv6, amt_tmtu_exceeded()
  (drivers/net/amt.c:1255) checks a GSO inner IPv6 packet with…
- [Low] amt_tmtu() (drivers/net/amt.c:1246) computes dst_mtu(dst) -
  sizeof(struct ipv6hdr) - sizeof(struct udphdr) - sizeof(struct…

--

amt: forward multicast data over IPv6

This patch lets an IPv6 relay send Multicast Data by routing the copy
through amt_udp_xmit() for either outer family. Over IPv6 it routes
first and drops a payload that exceeds the route MTU less the outer
headers. It then sends one Packet Too Big to the source after it has
walked all tunnels.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 7e8219a0cdf9e..823367e8232bb 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -1237,26 +1237,51 @@ static void amt_req_work(struct work_struct *work)
>  				 msecs_to_jiffies(100));
>  }
>
> +/* RFC 7450 s5.3.3.6: a Multicast Data message sent over IPv6 must not
> + * carry a Fragment header, so a payload larger than the tunnel MTU is
> + * dropped, and an IPv6 source is sent a Packet Too Big. An IPv4 source is
> + * not told, as icmp_send() never answers a multicast datagram. The tunnel
> + * MTU follows the route's path MTU, as on every IPv6 UDP tunnel.
> + */
> +static u32 amt_tmtu(const struct dst_entry *dst)
> +{
> +	return dst_mtu(dst) - sizeof(struct ipv6hdr) - sizeof(struct udphdr) -
> +	       sizeof(struct amt_header_mcast_data);
> +}

[Severity: Low]
Can this u32 subtraction wrap when dst_mtu(dst) is below 50?

ip6_dst_mtu_maybe_forward() returns the raw RTAX_MTU metric when one is
set, and ip_metrics_convert() only clamps RTAX_MTU from above. So an
admin route with something like "mtu 40" is accepted. A large lwtunnel
headroom (for example seg6 with a big SRH) can also push dst_mtu() below
the 50 byte overhead.

In that case tmtu becomes roughly 4G, and amt_tmtu_exceeded() never
fires in amt_send_multicast_data():

	tmtu = amt_tmtu(dst);
	if (amt_tmtu_exceeded(oskb, tmtu)) {

The copy is still dropped later in the IPv6 output path. Because the
patch already leaves out tunnel MTUs below IPV6_MIN_MTU, no Packet Too
Big to the source is lost. However, an skb copy is still made and
pushed through IPv6 output per tunnel per packet. An ICMPv6 Packet Too
Big is generated toward the relay's own address, and tx_dropped is not
counted on the amt device.

Should amt_tmtu() clamp at zero, or should amt_send_multicast_data()
treat a dst_mtu() smaller than the overhead as exceeded?

> +
> +/* True if @skb, the inner packet before encapsulation, or any segment of
> + * it, is larger than @tmtu.
> + */
> +static bool amt_tmtu_exceeded(const struct sk_buff *skb, u32 tmtu)
> +{
> +	if (skb_is_gso(skb))
> +		return !skb_gso_validate_network_len(skb, tmtu);
> +	return skb->len > tmtu;
> +}

[Severity: Medium]
Is the transport header reliable at this point for an inner IPv6 GSO
skb that carries extension headers?

skb_gso_validate_network_len() computes the per-segment length as
(skb_transport_header - skb_network_header) plus
skb_gso_transport_seglen(). Earlier, amt_dev_xmit() calls
ipv6_mc_check_mld(), and ipv6_mc_check_ip6hdr() always resets the
transport header to just past the fixed IPv6 header:

net/ipv6/mcast_snoop.c:ipv6_mc_check_ip6hdr() {
    ...
	skb_set_transport_header(skb, offset);
    ...
}

ipv6_mc_check_exthdrs() then returns -ENOMSG for a non-MLD packet before
it corrects the offset:

	if (ip6h->nexthdr != IPPROTO_HOPOPTS)
		return -ENOMSG;
    ...
	if (nexthdr != IPPROTO_ICMPV6)
		return -ENOMSG;

	if (!skb_set_transport_header_careful(skb, offset))

So for every IPv6 data packet the transport header stays at nh+40, even
when Hop-by-Hop or Destination Options headers come before UDP.

For an SKB_GSO_UDP_L4 skb with such headers, the computed segment length
is short by the length of those extension headers. A segment that is
larger than tmtu by up to that amount passes this check. In that case
*ptb is not lowered, no Packet Too Big reaches the source, and the copy
is encapsulated.

skb_reset_inner_headers() in amt_send_multicast_data() then copies the
same offset into inner_transport_header. The outer
ip6_finish_output_gso() validation would also under-count, so the
oversized segments go out on a path whose route MTU cannot carry them.

This seems to contradict this part of the commit message:

    The device offers software GSO, so a GSO skb is checked
    per segment with skb_gso_validate_network_len(), before the tunnel
    offloads are set up. A payload that does not fit is dropped.

Would it make sense to locate the real upper-layer offset (for example
with ipv6_skip_exthdr()) before validating, or to fix up the transport
header in amt_dev_xmit() for data packets?

[ ... ]

> @@ -1575,8 +1617,10 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
>  			}
>  			continue;
>  found:
> -			amt_send_multicast_data(amt, skb, tunnel, v6);
> +			amt_send_multicast_data(amt, skb, tunnel, v6, &ptb);
>  		}
> +		if (ptb && v6)
> +			icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0, ptb);
>  	}
>
>  	dev_kfree_skb(skb);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
