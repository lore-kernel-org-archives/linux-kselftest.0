Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729A4A263C;
	Sat, 10 Oct 2026 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636097; cv=none; b=fSis3pEdipEEUldw7mSaN//2oGiZMXau4NvgvsN08i/ZZ+moajC0ys8FfoOcpeHoEgh4Aqkyy1UgCT6OwOvPhJpcKgfmWRKd6Im4GEU2FoR/dQkdBTOQOka0mPIfX6AACJFMWCmwojtUdt78PH/Q52ad+w1EAFZJzptJQ+ftooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636097; c=relaxed/simple;
	bh=pZi4QH39eewWfHjw3MKSmvHCXhQ0/ijEGUN3GP1ixVk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TYcNP8llrZhd88xAIQkuEdR0ZfjKcxavKy3kZPeE7BKCt39DRjiV9FPWwlnhQIQbn/02I7g6TF2NgKBXiTxBbyyTOLiCL2djga/cr4uQRB1+foFS8hlDsfWLxY+V5NpUgIuJ1mj40l7czIVQrWQeB+/z0b8z66XuidprmU//g8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzIO9KuH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzIO9KuH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7116D1F00899;
	Sat, 10 Oct 2026 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636094;
	bh=fIwnivIhP5t6TBwewcS1RqvNzB6GS+W20m4WPWXfxiE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PzIO9KuHnpKvq/FW6mea4q45p/eWB58nIVu9dyvBxiLMiuaCsOsTXg52XW3vOwbpJ
	 yzs1yfla2/qbAn0gg6zToTbkbkI2F5Tez4g6MJLSWcvlJLdyI1o/WlhcISqP40FfdB
	 VRtiDglkdJuLtvFTwBeggK5KfemzcnL5MCswAvT0Cifrs1SiBa0tU0Oyz6wRDhyzPo
	 0RnSMpwtgEBGDDs3PeCVgkeM2vpFO6SjxrEK/f67P5rdmVIif+Nj8oTgipUWWs+zom
	 Mmrd8UqaPFqBTVVK/gaNODAflUdPf2zhXfb6sF1+NgkUG5grn8ecLCaVPtuyR6XLWW
	 atmBnWZeGci3A==
Subject: Re: [PATCH net-next 09/13] amt: receive the AMT gateway control plane
 over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:32 +0000
Message-ID: <179163609297.434549.11973060980255509069@kernel.org>
In-Reply-To: <20261009122426.551178-10-omar@blockcast.net>
References: <20261009122426.551178-10-omar@blockcast.net>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch also fixes an existing IPv4 gateway bug, but
  carries no Fixes: tag.
- [Low] At this commit nothing writes amt->local_ipv6 or
  amt->discovery_ipv6, so amt_v6() is always false and the new IPv6…
- [Low] The comment on struct amt_header_advertisement_v6
  (include/net/amt.h:136-140, added in commit "amt: send the Relay…

--

amt: receive the AMT gateway control plane over IPv6

This commit lets an IPv6 AMT gateway receive Advertisements, Membership
Queries and Multicast Data that arrive with an IPv6 outer header. It adds
amt_from_relay() to check the outer source in the device's family, parses
the IPv6 form of the Advertisement, and clears the learned relay in both
families. On an IPv6 gateway, it also accepts a zero UDP checksum only on
Multicast Data.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 148d1fb369154..86f168cb222c5 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -731,6 +741,21 @@ static struct in6_addr amt_get_remote_ipv6(const struct amt_dev *amt)
>  	return addr;
>  }
>  
> +static void amt_set_remote_ipv6(struct amt_dev *amt,
> +				const struct in6_addr *addr)
> +{
> +	write_seqlock_bh(&amt->remote_ipv6_lock);
> +	amt->remote_ipv6 = *addr;
> +	write_sequnlock_bh(&amt->remote_ipv6_lock);
> +}

[Severity: Low]
At this commit, does anything write amt->local_ipv6 or
amt->discovery_ipv6? If not, amt_v6() always returns false here:

    return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);

and the new IPv6 receive paths cannot run yet.

The remote_ipv6 address learned through amt_set_remote_ipv6() is also not
reported through netlink. amt_fill_info() and amt_get_size() only handle
the IPv4 attributes.

A later patch in the series, "amt: add netlink attributes for an IPv6
outer transport", appears to close both gaps. It adds IFLA_AMT_LOCAL_IP6,
IFLA_AMT_DISCOVERY_IP6 and IFLA_AMT_REMOTE_IP6, sets local_ipv6 and
discovery_ipv6 in amt_newlink(), and reports remote_ipv6 via
amt_fill_addr6(). Is this intermediate state intended?

[ ... ]

> @@ -2476,27 +2501,39 @@ static bool amt_advertisement_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	struct amt_header_advertisement *amta;
>  	int hdr_size;
>  
> -	hdr_size = sizeof(*amta) + sizeof(struct udphdr);
> +	/* Both forms start with the same header and nonce. */
> +	hdr_size = sizeof(struct udphdr) +
> +		   (amt_v6(amt) ? sizeof(struct amt_header_advertisement_v6) :
> +				  sizeof(*amta));
>  	if (!pskb_may_pull(skb, hdr_size))
>  		return true;

[ ... ]

> +	} else {
> +		if (!amta->ip4 || ipv4_is_loopback(amta->ip4) ||
> +		    ipv4_is_multicast(amta->ip4) || ipv4_is_zeronet(amta->ip4))
> +			return true;
> +
> +		WRITE_ONCE(amt->remote_ip, amta->ip4);

[Severity: Low]
The comment on struct amt_header_advertisement_v6 in include/net/amt.h
says:

    A gateway tells the two forms apart by the UDP datagram length
    (s5.1.2.5), not by a field in the message, so it is a type of its own.

Does amt_advertisement_handler() follow that? It does not seem to look at
the UDP length. It picks the form from the device family and only enforces
a minimum length with pskb_may_pull().

Suppose an IPv4 gateway gets a 24-byte IPv6-form Advertisement from the
discovery address with the right nonce. The first 4 bytes of the IPv6
relay address would be read as amta->ip4. For 2001:db8::1 that gives
32.1.13.184, which passes the zeronet, loopback and multicast checks. The
gateway would then send Requests to that address.

An IPv6 gateway, for its part, drops a 12-byte IPv4 form without any
message. It treats any datagram of 24 bytes or more as the IPv6 form.

The relay side comment in amt_discovery_handler() ("The Advertisement
takes the form of the outer IP version") matches what this code relies
on. Should the struct comment be corrected? Or should the handler compare
ntohs(udp_hdr(skb)->len) against the expected form and reject a mismatch?

[ ... ]

> @@ -3075,11 +3112,32 @@ static void amt_gw_rcv(struct amt_dev *amt, struct sk_buff *skb)
>  	}
>  }
>  
> +/* Whether a message a gateway received came from its relay: the discovery
> + * address for an Advertisement, the learned relay address otherwise. A
> + * relay address that is not known matches nothing, not even a 0.0.0.0
> + * source, which IPv4 input delivers in a packet sent to 255.255.255.255.
> + */
> +static bool amt_from_relay(const struct amt_dev *amt,
> +			   const union amt_addr *saddr, bool discovery)
> +{
> +	__be32 relay4;
> +
> +	if (amt_v6(amt)) {
> +		struct in6_addr relay;
> +
> +		relay = discovery ? amt->discovery_ipv6 :
> +				    amt_get_remote_ipv6(amt);
> +		return !ipv6_addr_any(&relay) &&
> +		       ipv6_addr_equal(&saddr->ip6, &relay);
> +	}
> +	relay4 = discovery ? amt->discovery_ip : READ_ONCE(amt->remote_ip);
> +	return relay4 && saddr->ip4 == relay4;
> +}

[Severity: Medium]
The relay4 check here also seems to fix an existing IPv4 gateway bug.
Should that part be its own patch for net, with a Fixes: tag?

Before this patch, amt_rcv() accepted a Membership Query or Multicast Data
whenever saddr != remote_ip was false. That includes saddr == 0 while
remote_ip == 0. remote_ip is 0 after amt_event_send_request() gives up,
and also after amt_dev_open():

    if (amt->req_cnt > AMT_MAX_REQ_COUNT) {
        ...
        WRITE_ONCE(amt->remote_ip, 0);
        ...
        amt->nonce = 0;

The INADDR_ANY gateway socket receives a 0.0.0.0 -> 255.255.255.255
packet. ip_route_input_slow() sends it to brd_input before the zeronet
martian check:

    if (ipv4_is_lbcast(daddr) || (saddr == 0 && daddr == 0))
        goto brd_input;

amt_membership_query_handler() then only checks the nonce, which has just
been reset to 0:

    if (amtmq->nonce != amt->nonce)
        return true;

So until the next discovery event, which can take up to
AMT_DISCOVERY_TIMEOUT, one on-link broadcast could inject a Membership
Query. That sets ready4, mac and qi, passes the inner IGMP query up, and
moves status from INIT to RECEIVED_QUERY. After that,
amt_event_send_discovery() skips rediscovery.

The commit message mentions this only in passing:

    "in either family: IPv4 input delivers a 0.0.0.0 source too, when the
    packet is sent to 255.255.255.255."

The change sits in a net-next IPv6 feature series and has no Fixes:
trailer, so stable kernels would not pick it up. An earlier patch in this
series, "amt: send the Relay Advertisement over IPv6", describes changing
IPv4 behaviour as "a fix of its own for net".

Could the IPv4 0.0.0.0 part be split out and sent to net, with a Fixes:
tag for the original AMT gateway receive path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
