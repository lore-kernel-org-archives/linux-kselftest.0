Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859317;
	b=f0Vq/f8cKa+tpxMDGzT5YXSU2GK0xvYV6iTL9Xp1iuxOQPW5F5CLUJHllWqV6qig6byx
	 lxbW0JiNO49D6LCb8bJkw6IE0e1Kq7z2K3wlbaNluZqDut7eaG7f6IVe3/4SVRPLGLm8c
	 076u+tV9iliUa/Qhgz3YTW2VO6k1FVzPknOjKHKnEx0SpArN2Rz5vli7gvhbykVHrFcZv
	 vwvkMyhFmWzYJ9xXMwZ9akt8uDEwqsi+DmSCSvjGdfReBwtqgK3VZurzhzhsh6QKXELEK
	 xtGTHS6dOID2FuEamkAPLhj3J/iaiVkz68lUWKV5BfvmOIN/tGMa+8o46LU7iLWZWEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859317;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RZs+hLB39RJoNYD8vJAf6edaYJxDfKubtPKj/+Sx+cY=;
	b=XvT3kekulUAQL1K2EycXBBpyah70U5uKvVAAL9cS5pelUrM+WfmiUt6xfybEX10LEkVN
	 oDZ7uu7m7dmWiAYVIAu+53ez/XCIaM/7fTTEhX6ySH+Od1kSe7qmqBqN39iDUMbRB9N5e
	 zOJxQIe9HyoWz+yvpK5WmsC7e3hfKGq+sf4mROVyOZXVVUWKpBaa5ieO/2cgD44BKRKXS
	 9d0ilAGmgisU5TcfG48h5P0O9+uyWGL+UIb1mSmSaUjrjspbKHZoWRmSG0ihc13bfabDo
	 YNNCTJ4oiIknCx8vmUWdGsf9ijcDwQ1KjqexWXlhT3NuGH39gUQDdWljcLYMYJ8txJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K011nthr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3888606A31C;
	Sat, 28 Nov 2026 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K011nthr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60711F000C1;
	Sat, 28 Nov 2026 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859317;
	bh=RZs+hLB39RJoNYD8vJAf6edaYJxDfKubtPKj/+Sx+cY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K011nthr42Ejz0hTEP8cH2ToftWhnQiYQV9ud+pgvfrrueOqb18dPkleGKHOQPv4Z
	 eobS/zgM3teU9+Sk5m9+GpXcpVgjJCyV1xloKtIku2bNa8C9LBqGU7EiMBnfhxCSKm
	 vQUUczv1VukkXP74dYKM9BpyAqW7N6eWpX6vIKHv36QCSXx8imHb4DdDkFH7JxuIss
	 TLYNnj1gCZyNTUoet+GHnDXEIZlCOqFfuXsvk9XIpaChAUiJfc7lBoES+ObJHWwyur
	 U2HV0fc6ylTPAO1EUFgWrKnixK868OPws2nbFvsy2ymWrVJk1QSucVxRbB7LBCxWVX
	 80jz41Istrv9w==
Subject: Re: [PATCH net-next v3 03/12] amt: key relay tunnels on a union
 amt_addr endpoint
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, willemb@google.com
Date: Sat, 28 Nov 2026 09:48:36 +0000
Message-ID: <179585931643.3135.2851219283955870732@kernel.org>
In-Reply-To: <20261127094703.3025517-4-omar@blockcast.net>
References: <20261127094703.3025517-4-omar@blockcast.net>
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

- [Low] The commit message misdescribes the pre-patch behaviour on an
  IPv6 outer transport.
- [Low] The commit message says both `amt_update_handler()` and
  `amt_request_handler()` pass the outer-source snapshot "to…
- [Low] The patch changes what the per-source tunnel cap counts.

--

amt: key relay tunnels on a union amt_addr endpoint

This commit stores the relay tunnel endpoint as a union amt_addr instead
of a __be32. It also adds the amt_outer_saddr(), amt_relay_mac() and
amt_same_source() helpers. The per-source tunnel cap now counts IPv6
sources per /64, and amt_v6() is still false for every device, so no
functional change is intended.

> A relay keeps one struct amt_tunnel_list per gateway endpoint and finds
> it by the gateway's IPv4 address, stored as __be32 ip4 and taken from
> ip_hdr(skb)->saddr, together with its UDP source port. On an IPv6 outer
> transport that reads the traffic class and flow label of the IPv6
> header as an address, and the field cannot hold the gateway's address
> anyway.

[Severity: Low]
Is this description of the old read accurate?

In struct iphdr, saddr starts at byte 12. In struct ipv6hdr, version,
traffic class and flow label take bytes 0-3, payload_len bytes 4-5,
nexthdr byte 6 and hop_limit byte 7. The source address then runs from
byte 8 to byte 23.

So ip_hdr(skb)->saddr on an IPv6 header reads bytes 12-15, which are
s6_addr[4..7] of the IPv6 source address. It never reads the traffic
class or the flow label.

The conclusion is still correct, since a __be32 cannot hold an IPv6
gateway address. Could the reason given in the message be corrected?

> amt_outer_saddr() copies the outer source address of a received message
> by value into a zeroed union amt_addr. amt_update_handler() takes that
> snapshot before pskb_may_pull() and iptunnel_pull_header() can
> reallocate the header; amt_request_handler() takes it after its only
> pskb_may_pull() and pulls nothing more. Both pass it to
> amt_tunnel_lookup(), amt_tunnel_get_or_create() and amt_update_tunnel().

[Severity: Low]
Does amt_request_handler() actually call any of these helpers?

Only the Update path does:

amt_update_handler()->amt_update_tunnel()->amt_tunnel_get_or_create()
    ->amt_tunnel_lookup()

amt_request_handler() walks the tunnel list itself instead:

    list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
        if (!amt_same_source(amt, &tunnel->addr, &saddr) ||
            READ_ONCE(tunnel->dead))
            continue;
        per_src++;
        if (amt_addr_equal(&tunnel->addr, &saddr) &&
            tunnel->source_port == udph->source)
            have = true;
    }

It then uses saddr for amt_relay_mac() and saddr.ip4 for
amt_send_igmp_gq() and amt_send_mld_gq().

That loop is a separate copy of the matching in
amt_tunnel_get_or_create(), and the two have to be kept in sync by hand.
Could the message say that only amt_update_handler() passes the snapshot
to these three helpers?

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 52ccaca08b5ec..83e666a023c12 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -2728,20 +2777,22 @@ static bool amt_membership_query_handler(struct amt_dev *amt,

[ ... ]

> -/* Most tunnels one source address may hold: an eighth of the table, at
> - * least one and at most AMT_MAX_TUNNELS_PER_SRC.
> +/* Most tunnels one source (an IPv4 address or an IPv6 /64) may hold: an
> + * eighth of the table, at least one and at most AMT_MAX_TUNNELS_PER_SRC.
>   */
>  static u32 amt_max_tunnels_per_src(const struct amt_dev *amt)
>  {
> @@ -2759,7 +2810,7 @@ static u32 amt_max_tunnels_per_src(const struct amt_dev *amt)
>   * verified source address may hold.
>   */
>  static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
> -							__be32 saddr,
> +							union amt_addr *saddr,
>  							__be16 sport)
>  {
>  	struct amt_tunnel_list *tunnel;
> @@ -2779,9 +2830,11 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
>  	 * against its address.
>  	 */
>  	list_for_each_entry(tunnel, &amt->tunnel_list, list) {
> -		if (tunnel->ip4 != saddr || READ_ONCE(tunnel->dead))
> +		if (!amt_same_source(amt, &tunnel->addr, saddr) ||
> +		    READ_ONCE(tunnel->dead))
>  			continue;

[Severity: Low]
This isn't a bug, but the comment on amt_max_tunnels_per_src() now says
the cap counts an IPv4 address or an IPv6 /64. Three other comments
about the same cap still describe it as per-address.

The kernel-doc above amt_tunnel_get_or_create():

 * table, amt_max_tunnels_per_src(), additionally limits the tunnels one
 * verified source address may hold.

The comment above this loop:

	 * a tunnel being freed neither stands in for its endpoint nor counts
	 * against its address.

And in include/net/amt.h:

/* Upper bound of amt_max_tunnels_per_src(), the per-address tunnel cap */
#define AMT_MAX_TUNNELS_PER_SRC 16

amt_same_source() compares only the first AMT_SRC_PREFIX6_LEN bytes for
IPv6, so two gateways at different addresses in the same /64 share one
cap. None of these comments is updated later in the series either. At
the series tip, the AMT_MAX_TUNNELS_PER_SRC comment and the
amt_tunnel_get_or_create() kernel-doc still say per-address.

Could these be updated to match the new definition of a source?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127094703.3025517-1-omar%40blockcast.net
