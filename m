Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859322;
	b=T6R5LGWulepMNiQzgwCMNzPLR86ZdwenmMv6ky+sKa7fgjsW+8hZ/mORZoyEURpK6R/N
	 70lFhX+5fCfnj60uVdILLcV1bCib70ldnw5GS6SQ3tVz2EUVcxw3R2DJOlpReu5mk8heq
	 zFADIPAgXVHbfSF0oltMuGpTwnWVU+JyJIHiuGdKhDoMzVU9Bzm63wtpRHivG3YWBxvbp
	 D8mcSZL/I/MNesYs6ib/rjMGeM1yDUAZ42F2/cDkbjnHDZZyTS0+BdMuSM4t37k4trANJ
	 xU2uhmb2z9mmmTJiww9ncPvKwVmQhcd6dSNwmUVYmmMcs22hHGNRZ38hEYVUxzXZkEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859322;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6ifWf4j1d3G8lIodYGxBjWABGXQx7X8VTWGws64IYAE=;
	b=yKUWhfpDwuavwzig5j+2tMf/IPsjboCBKZBiqy9/8QPpDrJ/Yzg+pSqjasU/dZWCOwCX
	 T5Ll2XRSXc8jhSSU/4w3vuwBNo8sPrO5MqseAEdZIv54bKEm1JHbweN8ANfwhynh68LIH
	 riiCl2A1Covmkod01uOsLmTtUHBZJTnJ8vHPHOaIrCPT1mcYjIkxM3dZ+RzuOiVTf01L5
	 x2CxGjZpmyKmvL3JUnMzhkk84+sjhgrYv7JHdGNULLZo7PWwjMP9jjWAKKVi/DJgDUeEp
	 IDOq0kF7JQBghCC3tVvG2d+bEzYBKrOH9YI4y2HOumJkHbBKJOhtLedNFNhieoqMbHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zxh8EQ5O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C280606A6AB;
	Sat, 28 Nov 2026 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zxh8EQ5O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6801F00939;
	Sat, 28 Nov 2026 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859321;
	bh=6ifWf4j1d3G8lIodYGxBjWABGXQx7X8VTWGws64IYAE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Zxh8EQ5OotkVkJR4KOzWl6P8qqSAz8YGdwAt1FbMjYE+ifp1NsF5ZJ+drPh8YgZl/
	 QRBJfU3l5MFhHxaU2xI1uederw78aivdTG6+rCZV959mTTwCWJnvzXpEvdKJLNOS3Q
	 X/vRruLquKBh7RpUoY+tmOfpuzqHyrYzRCLHTcMJHJB5jbX2Qjv5VuJL+nmU6l0jA1
	 V7p/fb4zcLwivAJu4VSGiRemrTNHW1icZeLbptxoqEQXBqmVumOL4tz+BN9oJPioQv
	 YnJP2J7JDdHyE8m8CTjJ3KLHqqdgrkAXsK44lcPLbaIki8a4EZ4Pd+3GHx0a9jpHuc
	 8FTIm5MDDDqVw==
Subject: Re: [PATCH net-next v3 08/12] amt: receive the AMT gateway control
 plane over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, willemb@google.com
Date: Sat, 28 Nov 2026 09:48:40 +0000
Message-ID: <179585932045.3135.13937242522656754802@kernel.org>
In-Reply-To: <20261127094703.3025517-9-omar@blockcast.net>
References: <20261127094703.3025517-9-omar@blockcast.net>
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

- [Low] The new comment in amt_rcv() (drivers/net/amt.c), "IPv4 input
  drops a 0.0.0.0 source as a martian, but IPv6 input delivers ::", is…
- [Low] On an IPv6 gateway, amt_dev_xmit() reads
  READ_ONCE(amt->ready4/ready6) without a lock and then calls…

--

amt: receive the AMT gateway control plane over IPv6

This patch lets an IPv6 AMT gateway accept Advertisement, Membership Query
and Multicast Data over an IPv6 outer header. It takes a snapshot of the
outer source with amt_outer_saddr() and matches it through amt_from_relay().
The learned IPv6 relay address is published under a new seqlock, and the
IPv6 gateway socket now accepts a zero UDP checksum, but only for Multicast
Data.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 42de266f3ae3e..e9d5fb4c3634e 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -1271,7 +1328,7 @@ static void amt_event_send_request(struct amt_dev *amt)
>  		amt->qi = AMT_INIT_REQ_TIMEOUT;
>  		WRITE_ONCE(amt->ready4, false);
>  		WRITE_ONCE(amt->ready6, false);
> -		WRITE_ONCE(amt->remote_ip, 0);
> +		amt_clear_remote(amt);
>  		amt_update_gw_status(amt, AMT_STATUS_INIT, false);
>  		amt->req_cnt = 0;
>  		amt->nonce = 0;
> @@ -1424,7 +1481,7 @@ static bool amt_send_membership_update(struct amt_dev *amt,
>  	else
>  		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
>  	if (amt_v6(amt))
> -		remote.ip6 = amt->remote_ipv6;
> +		amt_get_remote_ipv6(amt, &remote.ip6);
>  	else
>  		remote.ip4 = remote_ip;
>  	if (amt_udp_xmit(amt, sk, skb, &remote, amt->gw_port,

[Severity: Low]
Can this send a Membership Update to the unspecified address?

amt_dev_xmit() checks readiness without a lock, then calls
amt_send_membership_update():

    if ((!v6 && !READ_ONCE(amt->ready4)) ||
        (v6 && !READ_ONCE(amt->ready6))) {
        ...
        goto free;
    }
    if (amt_send_membership_update(amt, skb,  v6))

amt_wq is WQ_UNBOUND, not ordered, so the event worker can run at the same
time. If amt_event_send_request() takes the req_cnt > AMT_MAX_REQ_COUNT
branch, it clears ready6 and then publishes in6addr_any through
amt_clear_remote():

CPU1 (TX)                          CPU2 (amt_wq)
amt_dev_xmit()
  READ_ONCE(amt->ready6) == true
                                   amt_event_send_request()
                                     WRITE_ONCE(amt->ready6, false);
                                     amt_clear_remote(amt);
amt_send_membership_update()
  amt_get_remote_ipv6() -> ::
  amt_udp_xmit() -> amt_route6()

The seqlock prevents a torn read, but it does not order the ready6 flag
against the address. The snapshot then goes to amt_udp_xmit() with no
ipv6_addr_any() check. The Update, which carries the nonce and response
MAC, is either dropped on a failed route lookup or sent to the next hop
with destination ::.

The window is narrow. ready6 is normally already false by the time req_cnt
exceeds AMT_MAX_REQ_COUNT. Hitting this needs a Query handled just as the
request timer expires, or a TX path stalled between the ready check and
the snapshot.

The IPv4 path already has the same race with remote_ip == 0. The IPv6
version only becomes reachable with this patch.

Would it make sense for amt_send_membership_update() to return true when
the snapshot is ipv6_addr_any() (or remote_ip is 0)? That would match the
receive side, where amt_from_relay() treats :: as matching nothing.

[ ... ]

> @@ -3456,10 +3536,17 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
>  		kfree_skb(skb);
>  		goto out;
>  	}
> -	remote_ip = READ_ONCE(amt->remote_ip);
>  
>  	skb->dev = amt->dev;
> -	saddr = ip_hdr(skb)->saddr;
> +	/* Snapshot the outer source before amt_parse_type() pulls. */
> +	amt_outer_saddr(amt, skb, &saddr);
> +	/* IPv4 input drops a 0.0.0.0 source as a martian, but IPv6 input
> +	 * delivers ::, which no relay or gateway can be.
> +	 */
> +	if (amt_v6(amt) && ipv6_addr_any(&saddr.ip6)) {
> +		err = true;
> +		goto drop;
> +	}

[Severity: Low]
Is this comment accurate for all IPv4 input? In net/ipv4/route.c,
ip_route_input_slow() sends a zero source addressed to limited broadcast
to brd_input before it reaches the zeronet martian check:

    if (ipv4_is_lbcast(daddr) || (saddr == 0 && daddr == 0))
        goto brd_input;

    /* Accept zero addresses only to limited broadcast;
     * I even do not know to fix it or not. Waiting for complains :-)
     */
    if (ipv4_is_zeronet(saddr)) {
        reason = SKB_DROP_REASON_IP_INVALID_SOURCE;
        goto martian_source;
    }

So a UDP datagram from 0.0.0.0 to 255.255.255.255 on the AMT port can
reach the INADDR_ANY-bound IPv4 AMT socket.

On an IPv4 gateway, the relay4 check in amt_from_relay() covers this. The
IPv4 relay paths, amt_discovery_handler() and amt_request_handler(), have
no source check of their own. This patch doesn't change their behaviour,
but the comment suggests they need no check. The comment is still the
same at the end of the series.

The commit message makes the same claim:

  "IPv6 input does not drop a packet from the unspecified address, as
  IPv4 input drops a 0.0.0.0 source as a martian."

Could the comment and the commit message be reworded so they don't imply
that IPv4 input never delivers a 0.0.0.0 source?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127094703.3025517-1-omar%40blockcast.net
