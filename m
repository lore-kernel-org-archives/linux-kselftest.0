Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720622;
	b=tRwFOo2loC0ksXU3fOg097GFmsUWVp44wOikSHQY4WKE910rtuEZTTmxTt9COBVWKUr+
	 Egbj6IL7fGzdG4J3o7sSW/TC0rjPpmHCZtPn+ySRwvDaTpl1Vjkb7rFpoUYu5moFKi7AR
	 O/NFvt0c6Xqbyj8eSt47z9eYohunu2bAojZCRhEv1HICAs0L9559odkpWlKzFhydiG0tP
	 t7yj0vOmWrCP4fMr027VIz8EpNf5LEJ2c949yK1bsKx7bmXFJRzP2HFl8y8vWqVdz9/DD
	 T80+WLOfNPwvmgooO5mdjeznOCgoXOkkvuuwo8GVf0l9GikvbdrNFyYZOglIqqmH2uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720622;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9OqSVe81H/kFXVcsDosZylHfevYu8i9Vnq49ubXZbkE=;
	b=PHwB5NZ1UNjvuVIPDB2vD84irK+yyrlWqo9BpEwB+46d+qtbqErah+yGtAibVhINJoQx
	 ZlYkQlJRsKyQ6i6u1HqjN1Hx6r4CyKdp/z8W5fJts1DLSpxWORM6Ss0zf/3tcjIx/GsT4
	 1oF9zQjFwBZ1k/HZxnxi4XuzNkZkQq7yGhOyYDUBVmxAHJgX5Pp3FIDb/xSlcHIZUTPXj
	 w0dccO7q9FzVUVkodRJmpZj3Fj4hCFX0+CBxfPX3m/E4Y8jkvibMaBUj3OhE39zuXXYRr
	 RIqpSQAJGEVfZBGZMwf+RNUut2oeEUA1NWQoRJuXkguyhuDKXOAST8ZoCNVVxGD3rzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5d3XGnU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB7606A6A2;
	Thu, 26 Nov 2026 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5d3XGnU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB1D1F000D4;
	Thu, 26 Nov 2026 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720622;
	bh=9OqSVe81H/kFXVcsDosZylHfevYu8i9Vnq49ubXZbkE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n5d3XGnUAE1dtcrhVMepc7/5xGdGLWaWhjfeXJaaIBSvz20lnOAimPH/UcUXM03Ha
	 rQ99HuqmekVytvtPUFfg5765tqorSGn0xtzt5+Ea+4fUgbBxJK+nJ6NlPAHzGOlZvY
	 QSD9iQxuXxJZYlJzfmcBY/gWcuM/h0uZikSE0lCjF5eIlKlBKmyKzYVbmIk7dSgLjH
	 6rPuxlPLPW8+ANeMaPpOiWLySXaZS0JrgehjivWOPiSlNJ7hmSIxQPghe4Seri0g06
	 EtjPTwBHtF+PY80WeZL8pRfBIC4ikbbw5iYpsQcfwPobXmazvFDjAWcmHf1eLq7Ouq
	 vwE3aH0B/eVzQ==
Subject: Re: [PATCH net-next v2 06/12] amt: size the encapsulation headroom by
 the outer IP version
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:17:00 +0000
Message-ID: <179572062093.3135.571620247087203844@kernel.org>
In-Reply-To: <20261125191450.2497936-7-omar@blockcast.net>
References: <20261125191450.2497936-7-omar@blockcast.net>
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

- [Low] The commit message names the wrong drop site for the packets it
  is meant to protect.

--

amt: size the encapsulation headroom by the outer IP version

This adds AMT_RELAY_HLEN6 and AMT_GW_HLEN6 and a new helper, amt_hlen(),
that picks the IPv4 or IPv6 headroom size for the device's outer family.
amt_hlen() is then used to size needed_headroom, mtu, max_mtu and
min_mtu in amt_newlink(), and the new MTU on NETDEV_CHANGEMTU in
amt_device_event().

> The amt device reserves AMT_RELAY_HLEN or AMT_GW_HLEN of headroom and
> subtracts the same amount from the stream device's MTU. Both assume a
> 20-byte IPv4 outer header. An IPv6 outer header is 40 bytes, so on an
> IPv6 device an inner packet in the last 20 bytes below the MTU would
> not fit the stream device once encapsulated, and ip6_fragment() drops
> it: nothing sets ignore_df on the tunnel skb.

[Severity: Low]

Is this description accurate for this tree? The previous patch in the
series, "amt: forward multicast data over IPv6", added a tunnel MTU check
to the relay's bulk transmit path. The check runs before encapsulation:

drivers/net/amt.c:amt_send_multicast_data() {
    ...
		tmtu = amt_tmtu(dst);
		if (amt_tmtu_exceeded(oskb, tmtu)) {
			dst_release(dst);
			...
			DEV_STATS_INC(amt->dev, tx_dropped);
			return;
		}
    ...
}

amt_tmtu() returns:

	return dst_mtu(dst) - sizeof(struct ipv6hdr) - sizeof(struct udphdr) -
	       sizeof(struct amt_header_mcast_data);

That is dst_mtu - 50.

An inner packet that does not fit is dropped here, before
skb_copy_expand() and amt_udp_xmit() are called, so it never reaches
ip6_fragment(). The drop is counted in tx_dropped, and *ptb is lowered
so amt_dev_xmit() sends a Packet Too Big if the payload is IPv6. An IPv4
multicast payload is dropped without notice, because icmp_send() does
not answer multicast.

The size of the window also seems different from what the message
says. sizeof(struct amt_relay_headers) is 12, so the old relay MTU is
stream_mtu - 40 and the tunnel MTU is stream_mtu - 50. The affected
packets fall in a 10-byte window, not the last 20 bytes.

The other relay sends (Advertisement, Membership Query) are small
control messages. The gateway's Membership Update only carries IGMP/MLD
reports.

The code change itself looks right. Only the stated reason seems off.
Could the commit message say that the relay's own tunnel MTU check in
amt_send_multicast_data() drops these packets, and that IPv4 multicast
payloads are dropped without notice?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
