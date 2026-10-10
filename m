Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAA4A0142;
	Sat, 10 Oct 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636089; cv=none; b=Tow1corLM+ICrt80Pu826sO8XRm7N9YAQYCuDUUx15dbMOxTI21rUR1qYRI8RDJT5WwJMEAI7OCk1QyR7t8t2+iMBqeagqaxpXf8aYHEZvZvGxLdtzBgbSjxhuWTivusUhJpepjjEEyxnGY+1dBMamClRS3VqUQVUE8yRQSvgcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636089; c=relaxed/simple;
	bh=s5Lql2uqVar7Mo1oZ0KadqLV4WVljh3/vmghbJ6o6mI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TkO2vCfAlN9+8o4mtYO27x4HmXKSsnu0X8GA9CzQvTyZ9IJsqf46WqN3I8tp8ZROBRPnJOLrtzo3MNe44nljrA9RTWiN6L8mFf4IxV5pX0cUQ0kgts7feLDCUh/iJi0FGoX3wXOUgUdGlLb50NV3QrwKGXsIdTyjs+uCgp1Yywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByEj8JcQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByEj8JcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809061F00893;
	Sat, 10 Oct 2026 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636087;
	bh=b8dxuFLgJtZF417hED3puwABzhUfTvsA0w+Vj2BdDYY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ByEj8JcQU+yA7N0viDOuK1R3Kfnt6rW4uZDEFJoJSg44Ut7ZX5QjnmVU6STWU3P7C
	 Sn8LiHFfe+kOMOIdq74igeE60xRd+642rf0Ox9EBliQPTpahxFa0xynr+CBl89Rxdn
	 37e0m6FPxcGbqBfxH0qsEI1rEsiCWjbez2BHv33EkXPvnU5gBpGG94AfTc9pwSZ57u
	 NeLtCsGE/tatC8KGOSBzQ6KdXG4C/r5Jls89qVU/gYsfWuVUPYdYCI8w0P7wckJluq
	 cHj3LSltblBFY8qKiym+uPeOmbCd656WpShonO7CF4NbzZ5Zvnv6O1rrG2adX5XF/z
	 MpuMUpopFmA/w==
Subject: Re: [PATCH net-next 03/13] amt: key relay tunnels on a union amt_addr
 endpoint
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:26 +0000
Message-ID: <179163608605.434549.15713885412785793967@kernel.org>
In-Reply-To: <20261009122426.551178-4-omar@blockcast.net>
References: <20261009122426.551178-4-omar@blockcast.net>
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

- [Low] In this commit, amt_update_handler() (drivers/net/amt.c) still
  finds the tunnel with `saddr = ip_hdr(skb)->saddr` (line 2588) and…
- [Low] In this commit, amt_send_multicast_data() (line 1195) and
  amt_send_membership_query() (line 1250) in drivers/net/amt.c always…

Pre-existing issues:
- [Medium] amt_request_handler() in drivers/net/amt.c searches
  amt->tunnel_list under RCU only (lines 2863-2865).
- [Medium] In amt_request_handler() (drivers/net/amt.c), the new tunnel
  is published with list_add_tail_rcu() at line 2905 before `tunnel->key…

--

amt: key relay tunnels on a union amt_addr endpoint

This commit replaces the IPv4-only __be32 ip4 endpoint in struct
amt_tunnel_list with a union amt_addr, and makes the union's ip6 member
unconditional. amt_request_handler() now records and matches tunnels
through a new amt_outer_saddr() helper and amt_addr_equal(), sends ICMPv6
when the tunnel limit is hit on an IPv6 device, and computes the response
MAC with siphash() over a packed {address, port, nonce} tuple. The commit
message states there is no functional change because amt_v6() is still
false for every device.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index a550f84e86344..eaa5637674694 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -1173,12 +1192,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
>  
>  	memset(&fl4, 0, sizeof(struct flowi4));
>  	fl4.flowi4_oif         = amt->stream_dev->ifindex;
> -	fl4.daddr              = tunnel->ip4;
> +	fl4.daddr              = tunnel->addr.ip4;
>  	fl4.saddr              = amt->local_ip;
>  	fl4.flowi4_proto       = IPPROTO_UDP;
>  	rt = ip_route_output_key(amt->net, &fl4);

[ ... ]

> @@ -1228,13 +1247,13 @@ static bool amt_send_membership_query(struct amt_dev *amt,
>  	skb_reset_inner_headers(skb);
>  	memset(&fl4, 0, sizeof(struct flowi4));
>  	fl4.flowi4_oif         = amt->stream_dev->ifindex;
> -	fl4.daddr              = tunnel->ip4;
> +	fl4.daddr              = tunnel->addr.ip4;
>  	fl4.saddr              = amt->local_ip;

[Severity: Low]
include/net/amt.h now documents tunnel->addr like this:

	/* Gateway endpoint, in the device's outer family */

However, amt_send_multicast_data() and amt_send_membership_query() still
always route over IPv4 with fl4.daddr = tunnel->addr.ip4.

On a device where amt_v6() is true, would these send to an IPv4 address
built from the first 4 bytes of the gateway's IPv6 address?

This can't happen at this commit, because nothing assigns
amt->local_ipv6 yet, so amt_v6() is false for every device.

Later in the series, "amt: send the Membership Query over IPv6" and
"amt: forward multicast data over IPv6" switch both senders to
amt_udp_xmit(), which branches on amt_v6(). Both patches land before the
netlink attribute that can set local_ipv6.

[ ... ]

> @@ -2585,7 +2604,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	skb_reset_network_header(skb);
>  
>  	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
> -		if (tunnel->ip4 == saddr) {
> +		if (tunnel->addr.ip4 == saddr) {

[Severity: Low]
amt_request_handler() now records the endpoint with amt_outer_saddr() and
matches it with amt_addr_equal(). amt_update_handler() still reads the
outer source as IPv4:

	saddr = ip_hdr(skb)->saddr;
	...
	if (tunnel->addr.ip4 == saddr) {

On an IPv6 relay, wouldn't this compare bytes 0-3 of the stored IPv6
address with bytes 4-7 of the received IPv6 source? That would drop
every Membership Update.

As with the senders, this can't happen at this commit, because amt_v6()
is always false.

The later patch "amt: match the Membership Update tunnel by outer family"
converts amt_update_handler() to amt_outer_saddr() and amt_addr_equal().
That happens before local_ipv6 becomes settable.

[ ... ]

> @@ -2837,12 +2861,24 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
>  		return true;
>  
>  	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
> -		if (tunnel->ip4 == iph->saddr)
> +		if (amt_addr_equal(&tunnel->addr, &saddr))
>  			goto send;
>  
>  	spin_lock_bh(&amt->lock);

[Severity: Medium]
This isn't a bug introduced by this patch, but this lookup runs under RCU
only. On a miss, the new tunnel is added under amt->lock without
searching the list again:

	spin_lock_bh(&amt->lock);
	...
	list_add_tail_rcu(&tunnel->list, &amt->tunnel_list);

amt_rcv() runs as a UDP encap_rcv in softirq. Two Requests from the same
gateway address can therefore be handled at the same time on different
CPUs, for example when different source ports are steered to different
RX queues.

Can both miss the RCU lookup, so that each adds an amt_tunnel_list entry
for the same endpoint?

Later lookups stop at the first match, so the second entry would never
be found. It would still hold a max_tunnels slot and a pending gc_wq
until amt_tunnel_expire() removes it.

The Update that answers the Query sent from the duplicate could also be
checked against the first entry's nonce and MAC and rejected.

This patch only changes the comparison to amt_addr_equal().

[ ... ]

> @@ -2876,10 +2912,13 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
>  
>  send:
>  	tunnel->nonce = amtrh->nonce;
> -	mac = siphash_3u32((__force u32)tunnel->ip4,
> -			   (__force u32)tunnel->source_port,
> -			   (__force u32)tunnel->nonce,
> -			   &tunnel->key);
> +	/* The MAC is opaque to the gateway, which only echoes it, so one
> +	 * siphash over the zero-padded endpoint serves both families.
> +	 */
> +	mac_in.addr = tunnel->addr;
> +	mac_in.port = tunnel->source_port;
> +	mac_in.nonce = tunnel->nonce;
> +	mac = siphash(&mac_in, sizeof(mac_in), &tunnel->key);

[Severity: Medium]
This isn't a bug introduced by this patch, but amt_request_handler()
publishes the new tunnel before it sets the key:

	list_add_tail_rcu(&tunnel->list, &amt->tunnel_list);
	tunnel->key = amt->key;

Another CPU running amt_request_handler() can match this address under
RCU, jump to send:, and read tunnel->key here without holding amt->lock.

Could it compute tunnel->mac with the all-zero key left by kzalloc(), or
with a partly written key?

If that CPU's nonce and MAC stores end up as the final values, the
response MAC would come from a predictable key.

This patch reads the same key as before. It only replaces siphash_3u32()
with siphash() over the packed tuple.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
