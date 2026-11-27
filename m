Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772889;
	b=iTv7umj8g/PlMo4220DF16NRF5lOWwZgpSzOdLfIACVhOhM67vUHSt9bHffkOComvScd
	 WTJ3FMP4ZfAnfjGkfadcKrLPhtxKxPt+sy18mQBhZnTlNn8tnzAMA5Tob/8OcubYOAMkD
	 8CuHy20YRzlI8+WnqPk+wRfWUYiw0TfgtPiKNIZIwFRTHfL7DPsQhRJhAuyMgP7ix+Fzj
	 YfDByeLrG8GmgCz27QpLFIFEC2VzvyV9zpyG+xozq8jb+FASiuONC+iIsg1TKrIGxugzm
	 dRaGylzSZ3T+TUhr2PxTehFBd5b4MuQcFojvD5BnsKadWcx+NNGke7/WupmfyemzSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772889;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CtR9zbja128/tqNXZ1sd4nsIOtsn8t0YXyFSEJVxCY0=;
	b=S31PwhRDimQMjfMuWru/uKkUIt87/0QkMnyGWlnAnPMLu16W8tCRA3003m6L8qiCBVtZ
	 GKG7OyIU1tChQdbS2rvOu2cggMLcxy3sZNurjDkObI9v13hsLNuXBQoxowbdpmKATfTBF
	 d9Hc0UWSj1y7MAEAIzOvyeK7zE8RWWqCe/MDeREvZESbzr3TliJcVlQSThpbgs/yKDJ8X
	 3l24uE63SlXl8RslRZCpfwo9zUAUMxR8w/aoe5eY/2KhxADa1dPG3ygX8uxn+Q+QXs5Ui
	 WJiz8x6msDpRE+VreAKH46fq15ffLl3smBD1On2cha8ePbQFGdcwUSgr3wWDIUn0Mfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXJfFa1p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59948606A334;
	Fri, 27 Nov 2026 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXJfFa1p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0641F00929;
	Fri, 27 Nov 2026 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772888;
	bh=CtR9zbja128/tqNXZ1sd4nsIOtsn8t0YXyFSEJVxCY0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZXJfFa1prBGQN8yTSZak06j+vAF1uYCaoDm8x/hMec/a9ItrLOeiJ/aIlnJU51KKr
	 qMxnfn2CZI3UupRkeSE1Ierf5OpCsxLBb7kLHg1y77/2ilOLCBUiXKtYgIMwrZmUqH
	 J1trcNU6L6OVkOiQtjL3snnF9f0c5pgHtCbUp9tZNiiMVYlaRkekIM0GTPhT7ix8P3
	 mzZ4o0YCURYpJ5NeAMy9E2BlhSxJMJsg3nX2Cx3vN6XN5snL5kU+iU8fQnQYf9AlNP
	 bWXKpPjOHFjGW3ldyyVoRSAGEo3zo7CTT8XefDuCXbq1l84FY83sANSOnjzY1VufXh
	 TLTU/EQhFYUXQ==
Subject: Re: [PATCH net v2 1/2] wireguard: peer: free packets left on the
 per-peer queues on removal
From: netdev-bot+sashiko@kernel.org
To: apasichnik9@gmail.com
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 09:48:07 +0000
Message-ID: <179577288773.3135.10772290029017294104@kernel.org>
In-Reply-To: <20261126094722.73025-2-apasichnik9@gmail.com>
References: <20261126094722.73025-2-apasichnik9@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new tx_queue purge in peer_remove_after_dead()
  (drivers/net/wireguard/peer.c:148) can run while…
- [Low] In peer_remove_after_dead() (drivers/net/wireguard/peer.c), the
  patch adds a purge of the per-peer queues and a comment saying entries…

--

wireguard: peer: free packets left on the per-peer queues on removal

This patch adds peer_purge_queue(). peer_remove_after_dead() calls it
after netif_napi_del() to free anything still left on peer->rx_queue and
peer->tx_queue. The aim is to fix a peer/keypair leak: once a disable is
pending, NAPI completes even when more than one budget of decrypted
packets is still sitting on rx_queue.

> diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
> index 1cb502a932e07..3e08898cec5ec 100644
> --- a/drivers/net/wireguard/peer.c
> +++ b/drivers/net/wireguard/peer.c
> @@ -91,6 +91,25 @@ static void peer_make_dead(struct wg_peer *peer)
>  	/* The caller must now synchronize_net() for this to take effect. */
>  }
>  
> +/* Each queue entry holds a keypair and a peer reference. Transmit entries
> + * are lists of packets, receive entries single packets.
> + */
> +static void peer_purge_queue(struct wg_peer *peer, struct prev_queue *queue,
> +			     bool lists)
> +{
> +	struct sk_buff *first;
> +
> +	while ((first = wg_prev_queue_peek(queue)) != NULL) {
> +		wg_prev_queue_drop_peeked(queue);
> +		wg_noise_keypair_put(PACKET_CB(first)->keypair, false);
> +		wg_peer_put(peer);
> +		if (lists)
> +			kfree_skb_list(first);
> +		else
> +			dev_kfree_skb(first);
> +	}
> +}
> +

[ ... ]

> @@ -122,6 +141,11 @@ static void peer_remove_after_dead(struct wg_peer *peer)
>  	 * here from process context.
>  	 */
>  	netif_napi_del(&peer->napi);
> +	/* A NAPI being disabled completes after at most one more poll, which
> +	 * may leave packets on rx_queue that still hold references.
> +	 */
> +	peer_purge_queue(peer, &peer->rx_queue, false);
> +	peer_purge_queue(peer, &peer->tx_queue, true);

[Severity: High]
Can this purge of peer->tx_queue run while peer->transmit_packet_work is
still pending or running on packet_crypt_wq?

All peers on a device share wg->encrypt_queue, and the per-CPU
wg_packet_encrypt_worker() drains it. Each flush_workqueue() call only
waits for work that was queued before that flush started. Here is one
possible interleaving:

flush_workqueue() #1 (step a) is running
  another peer's xmit queues encrypt worker W on packet_crypt_wq
    (flush #1 does not wait for W)
  W pops one of this peer's entries from the shared ring
flush #1 returns

flush_workqueue() #2 (step b.1) waits for W
  W: wg_packet_encrypt_worker()->wg_queue_enqueue_per_peer_tx()
       queue_work_on(..., peer->device->packet_crypt_wq,
                     &peer->transmit_packet_work);
    (queued after flush #2 started, so nothing waits for it)
flush #2 returns

napi_disable();
netif_napi_del();    /* only a synchronize_net() */
peer_purge_queue(peer, &peer->tx_queue, true);

If wg_packet_tx_worker() runs at the same time, it and peer_purge_queue()
both consume tx_queue. prev_queue is single-consumer, so
wg_prev_queue_peek() and wg_prev_queue_dequeue() update queue->peeked and
queue->tail without a lock.

Could both sides get the same skb list? That would mean a double
kfree_skb_list() plus a double wg_noise_keypair_put() and wg_peer_put().

If transmit_packet_work is still pending instead, the purge drops the
peer references held by the tx_queue entries. The final wg_peer_put() in
peer_remove_after_dead() can then go through
kref_release()->call_rcu(rcu_release) and free the peer while
transmit_packet_work is still linked on the workqueue.

Would wg_packet_tx_worker() then run container_of() on freed memory?

Before this patch, a late tx worker was the only consumer, and the queued
entries kept the peer alive.

This also seems to contradict the commit message:

  Free whatever is left on both per-peer queues once nothing can feed
  them any more

The follow-up patch in the series only touches the selftests and does
not change this code.

Would a flush_work() or cancel_work_sync() on &peer->transmit_packet_work
before purging tx_queue close this window?

[Severity: Low]
This isn't a bug, but the earlier comment in peer_remove_after_dead() is
left as it was, and it now contradicts the new one:

	/* The transition between packet encryption/decryption queues isn't
	 * guarded by is_dead, but each reference's life is strictly bounded by
	 * two generations: once for parallel crypto and once for serial
	 * ingestion, so we can simply flush twice, and be sure that we no
	 * longer have references inside these queues.
	 */

The a), b.1) and b.2.1) step comments also still describe the two
flushes plus napi_disable() as a complete drain.

__napi_poll() in net/core/dev.c does this:

	if (unlikely(napi_disable_pending(n))) {
		napi_complete(n);
		return work;
	}

That makes the new comment the accurate one. Should the old comment be
updated to match?

Also, the new comment only covers rx_queue, but the next line purges
tx_queue too. Could the comment say why the tx_queue purge is needed, or
that it is only defensive?

The follow-up selftest patch in the series doesn't update this comment
either.

>  
>  	/* Ensure any workstructs we own (like transmit_handshake_work or
>  	 * clear_peer_work) no longer are in use.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126094722.73025-1-apasichnik9%40gmail.com
