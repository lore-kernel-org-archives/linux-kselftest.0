Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753084;
	b=zQCwA7xKKsokyK+PmU5vd4JFP6FVSCwjCC5eKsGjtHmOrO4BQQ4DpGBTu+AHj3fmVr5V
	 HOQpDrEIlDhwL9gDu19lZ5r3prAJxxdWmuz+uwMubemdxUG+P46g4SJyE7ptuQoDqzTx1
	 t62ZdWkfhKq7jyzDDLpDPLsRx3n6+HPfPYDHDdxHi71UJXpOlK2Ioptoyy2yktCCTJZfk
	 E6GJZXvhRj6DHCwD7agJXa2hWQ9tuke8fdaY5Ql7S5LwoIk2UvKNU07DabRzNo3wKNnBD
	 6mNV8MEsKkGP4NzPxNcfRjoJDq9QlqCxSePaUquXNWuAaDNgsDOf9XzbEhc3LjGT/sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753084;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ped2xn6GpwSUqsZ+O4fRYGiZsrjuxF7xbLOr6gCO5yk=;
	b=Q4jOhn6UjBYr5vvFI/XHlIMgrRHPNmPB7ppji0NdXEVVY3TXF2y1QnFCqrFFTBoY7vzv
	 3KZlqH1Z9EyGjLIZk0uUeOeUI1U+c0xyAzWUaKD4ECa3ebzYfsOE5Kr8xl8Q9LVCcI0Ec
	 xtO+JgWX25MDZNrtau2BBzbihKCQ0ibSge78Bfp8P70suy5eXZvpHcoXyJCa3IsysvNiY
	 LPrZcNfIfamSSvIySYaPX0e6vT+O+c7/SmvSPtsLFeAn9eNmttQMRpniF7+A57o4R3o52
	 HyRVK5yEZoNrNg9DGf2VcCrL3OSU98VMJLq2FXaV9442Em/uL6AX6eEXXPFRYOXxAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m+I/V2PT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9951606A31B;
	Wed,  4 Nov 2026 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+I/V2PT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DC11F00919;
	Wed,  4 Nov 2026 00:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753083;
	bh=Ped2xn6GpwSUqsZ+O4fRYGiZsrjuxF7xbLOr6gCO5yk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m+I/V2PTBOm9X/Ekvvy9TISlLwWPoZMj6Lo1J60okmN58SIWLmCmQ7WhZL8e3UPhK
	 oz7G0QaZ6Dy+ycyAu8lFoPheIVMHH7dlVLhTSw8a44bbzCuSN+dzWHMW0wvXqVNeEc
	 DeRTL4r+y597I7qIkicsp8uOGkW6XFnn48oL+UhFbjgtFI77goUReBf4gWh+vqtDvN
	 kYjkZ8fBhvvtUbQ8AFQYCsx9+6/q5Jlo9E59QE1U+fackdE/cuBYqE1Ua7+K05mNbz
	 WMCUQ44JgtpfMCA5NvWsPwlI3QGh9H/BV8ndmpRC4/qiLWlRdHy48af4bk8xFHKYhs
	 3lQdCZVt4hKbQ==
Subject: Re: [PATCH net v4 1/7] net/mlx5e: psp: drop ipv6 packets with
 extension headers
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Date: Wed, 04 Nov 2026 00:44:42 +0000
Message-ID: <179375308260.488856.17581878664897272479@kernel.org>
In-Reply-To: <20261103001143.246081-2-toddfreed@meta.com>
References: <20261103001143.246081-2-toddfreed@meta.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch rejects only some packets, and it does so in mlx5.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but the patch
  adds a new, user-triggerable way to reach it.

--

net/mlx5e: psp: drop ipv6 packets with extension headers

This adds an mlx5 check, mlx5e_psp_l4_is_tcp(), that drops PSP-associated
TX packets when TCP does not directly follow the fixed L3 header. IPv6
packets with extension headers are now dropped instead of going out
malformed and unencrypted. It also adds a comment to
psp_dev_encapsulate() saying the helper assumes there are no IPv6
extension headers.

> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
> index 348fd7a962615..c9829a124c533 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c

[ ... ]

> @@ -170,8 +183,9 @@ bool mlx5e_psp_handle_tx_skb(struct net_device *netdev,
>  	if (!mlx5e_psp_set_state(priv, skb, psp_st))
>  		return true;
>  
> -	/* psp_encap of the packet */
> -	if (!psp_dev_encapsulate(net, skb, psp_st->spi, psp_st->ver, 0)) {
> +	/* psp_encap of the packet. only tcp right after the ip header */
> +	if (unlikely(!mlx5e_psp_l4_is_tcp(skb)) ||
> +	    !psp_dev_encapsulate(net, skb, psp_st->spi, psp_st->ver, 0)) {
>  		kfree_skb_reason(skb, SKB_DROP_REASON_PSP_OUTPUT);
>  		atomic_inc(&priv->psp->tx_drop);
>  		return false;

[Severity: Medium]
This is a pre-existing issue, but this patch gives userspace a new
and predictable way to hit it.

When this returns false, mlx5e_accel_tx_begin() fails, and mlx5e_xmit()
returns without flushing the SQ:

drivers/net/ethernet/mellanox/mlx5/core/en_tx.c:mlx5e_xmit() {
    ...
	/* May send SKBs and WQEs. */
	if (unlikely(!mlx5e_accel_tx_begin(dev, sq, skb, &accel)))
		return NETDEV_TX_OK;
    ...
}

Suppose the previous packet on the same SQ was posted with
xmit_more=true. Its doorbell was then deferred in
mlx5e_txwqe_complete():

	send_doorbell = __netdev_tx_sent_queue(sq->txq, attr->num_bytes, xmit_more);
	if (send_doorbell)
		mlx5e_notify_hw(wq, sq->pc, sq->uar_map, cseg);

In the MPWQE path, the session can also be left open by
mlx5e_sq_xmit_mpwqe().

The DMA error paths in mlx5e_sq_xmit_wqe() and mlx5e_sq_xmit_mpwqe() call
mlx5e_tx_flush() for this reason. The accel drop path does not call it.

Before this patch, the PSP part of this path was only reached when
psp_dev_encapsulate() failed, for example when skb_cow_head() ran out of
memory. With mlx5e_psp_l4_is_tcp(), every PSP-associated IPv6 packet with
an extension header takes this path. Such headers can come from
IPV6_RTHDR, IPV6_DSTOPTS or IPV6_HOPOPTS on the socket, or from a route.

If such a packet is the last one in a qdisc bulk dequeue batch, the
earlier descriptors are not announced to the NIC. They stay that way
until the next successful transmit on that SQ. Since the queue is not
stopped, the TX watchdog will not fire either.

Should the accel drop path in mlx5e_xmit() call mlx5e_tx_flush() like the
other drop paths do?

[ ... ]

> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index c9c1a8826b7f9..5049ed400be07 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c
> @@ -272,6 +272,7 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
>  		ip_hdr(skb)->check =
>  			ip_fast_csum((u8 *)ip_hdr(skb), ip_hdr(skb)->ihl);
>  	} else {
> +		/* assumes there are no ipv6 extension headers */
>  		ipv6_hdr(skb)->nexthdr = IPPROTO_UDP;
>  		be16_add_cpu(&ipv6_hdr(skb)->payload_len, PSP_ENCAP_HLEN);
>  	}

[Severity: High]
Should this assumption be enforced in psp_dev_encapsulate() rather than
only documented?

The malformed packet is built here, in the shared helper. bufflen
includes skb_network_header_len(), so udp+psp is inserted after any
extension headers. Then only the fixed header's nexthdr is rewritten to
UDP, and psp_write_headers() sets the PSP nexthdr to TCP.

The new check, mlx5e_psp_l4_is_tcp(), only covers mlx5. The other caller,
nsim_do_psp() in drivers/net/netdevsim/psp.c, has no such check:

drivers/net/netdevsim/psp.c:nsim_do_psp() {
    ...
	net = sock_net(skb->sk);
	if (!psp_dev_encapsulate(net, skb, pas->tx.spi, pas->version, 0)) {
		rc = SKB_DROP_REASON_PSP_OUTPUT;
		goto out_unlock;
	}
    ...
}

So with netdevsim, a PSP-associated IPv6 TCP socket that has IPV6_RTHDR,
IPV6_DSTOPTS or IPV6_HOPOPTS set, or uses a route that adds extension
headers, still sends the malformed packet to the peer.

The selftest patch in this series ("selftests: drv-net: psp: test ipv6
tcp socket with extension headers") says that netdevsim encapsulates
these packets "in a malformed way". It skips netdevsim instead of fixing
it:

    # netdevsim doesn't drop them: it sends them malformed
    cfg.require_nsim(nsim_test=False)

psp_dev_encapsulate() already validates its input and returns false for
a non-IP skb->protocol:

	if (skb->protocol != htons(ETH_P_IP) &&
	    skb->protocol != htons(ETH_P_IPV6))
		return false;

Both callers treat false as a drop with SKB_DROP_REASON_PSP_OUTPUT.

Could the "TCP directly follows the fixed L3 header" check go next to
that existing check instead? That would fix both callers, protect any
future users of the helper, and make mlx5e_psp_l4_is_tcp() unnecessary.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103001143.246081-1-toddfreed%40meta.com
