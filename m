Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861518;
	b=1/DRK7y5m98ywB3/YsPQalIE7t+JxTmmaBC1lq5PCtT6+c2swK2slLBE78mPqyWbrrDh
	 Hfu7okaAFiCFUGS+fOEuNkQMSjhSqfpZ8JMyF+nmi0pmEn3Pn8msGQ1CZToesRTLFs7PW
	 WEYWuhXIoqyQxvgCMqJR5UL6JXHtIWdEWWFRXNusNwukJZfKlMdfyXlCqdeU3vbabmfiZ
	 zTJwnDbPN6dwrVxkNCNFoeNhCFN8xKDKfgBDLdlDH1EKAFN1OdiaXkhZ5a7hUmPyRUJzA
	 Jvha2tNK2d9xSzCOsqgp/S3AhJ2PWi7f+fexAZbeWvpkqp3ykBWZbAAnYjN5ZCpeknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861518;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HG/kFYl5oDMkfPL6aHfHn98/45lFfto87m3QqcW7mkE=;
	b=UUyUcyjRKzVRbZ/XHxI4APwaAydFZa3YrCcQpMFsTH/MT0AWcmZpJ5dz5V5EXCwPU6JG
	 RhrC8PNhMcRrOejCa82Q0tLDLlxNGO4brJHBvpVivhbJFBCdhQKFJptV1mqzkc+euYPNd
	 E1NyGj2FRO1y/MFN3jg9iYxGZza4vPircQ+Now5+Q/zhagubCHMFlUqdRA/UEeUBuJ9+y
	 mehfEcA1jdOLqxpYVdZVC2Pd5xHpQ56Iq3cE2weG/rAE1DsTLt+vDwSFWXA4j9+k6uDTW
	 RAT4e6AFlVuGpQ2bsmyp4wI1ZE5p25u2GjQX7wq52eAvBsIm51izxJ6u9M4PSf2NMjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B8yx/Y+G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAEB606A31C;
	Sat, 28 Nov 2026 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8yx/Y+G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2F51F00897;
	Sat, 28 Nov 2026 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795861518;
	bh=HG/kFYl5oDMkfPL6aHfHn98/45lFfto87m3QqcW7mkE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B8yx/Y+Gi/rauFSFQuimTHfVzTrLgLz27hZvBYirftc95e+3u2rJLVexBJHc0h7VF
	 1gdKCJ7MbQVwUoEVvdDsX3kYJB00q+oEZFRxWqqIs6g0qRls+iYK0N74j/+2FAI5YG
	 qv9jq6GPbtOiA4fvy34WHoDqq4yzH83ePE0td8nd9WLrNKTnrGMZc/limShX2usjQ3
	 BrfTyVSxlsurj8x2OJF5MOmCO0iOwvMAZV2fvXL0d1AZY+JptAPFXi4mDLGX8uXpwk
	 /SWw78yw6wwpy95zv49gkkEoUfiYjfdteVUnE6VMkGKrTV9GWRzBAXt6KKTlzwyBoc
	 otVtf9cicOOBQ==
Subject: Re: [PATCH net v3 1/2] wireguard: peer: free packets left on the
 receive queue on removal
From: netdev-bot+sashiko@kernel.org
To: apasichnik9@gmail.com
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 10:25:16 +0000
Message-ID: <179586151692.3135.13303430947283381708@kernel.org>
In-Reply-To: <20261127102243.49405-2-apasichnik9@gmail.com>
References: <20261127102243.49405-2-apasichnik9@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch skips purging tx_queue.
- [Low] The new comment in peer_remove_after_dead() says a
  transmit_packet_work queued during the second flush of packet_crypt_wq…
- [Low] The commit message describes the bug only as a refcount/memory
  leak ('leaks a peer and its keypair').

--

wireguard: peer: free packets left on the receive queue on removal

This commit adds peer_purge_rx_queue() and calls it from
peer_remove_after_dead() after netif_napi_del(). It frees packets left on
rx_queue when a NAPI that is being disabled completes without draining
the queue, and drops each entry's keypair and peer references. tx_queue
is intentionally left alone.

> rx_queue keeps the rest there. Each entry holds a keypair and a peer
> reference, so the peer is never released; the WARN_ON in rcu_release()
> that checks for leftovers is never reached either.

[Severity: Low]

This isn't a bug in the code, but could the message also mention the
other effects of the leak? A stranded rx_queue entry pins the peer, so
kref_release() never runs.

As a result, rcu_release() never calls memzero_explicit(peer,
sizeof(*peer)). That call clears the remaining handshake key material,
such as the preshared key and the precomputed static-static DH value.

The pinned keypairs also never reach kfree_sensitive() in
keypair_free_rcu(), so the session keys stay in slab memory as well.

peer->handshake.entry is only removed from index_hashtable in
kref_release(), and peer_remove_after_dead() doesn't call
wg_noise_handshake_clear(). The removed peer therefore stays reachable
through wg_index_hashtable_lookup(). That contradicts this comment in
peer_remove_after_dead():

    and in wg_cookie_message_consume, the lookup eventually gets a peer
    with a refcount of zero, so no new reference is taken.

As written, the message describes only a memory leak. The Fixes: tag
should be enough for stable selection.

> diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
> index 1cb502a932e07..6bafe572469ca 100644
> --- a/drivers/net/wireguard/peer.c
> +++ b/drivers/net/wireguard/peer.c

[ ... ]

> @@ -122,6 +136,13 @@ static void peer_remove_after_dead(struct wg_peer *peer)
>  	 * here from process context.
>  	 */
>  	netif_napi_del(&peer->napi);
> +	/* A NAPI that is being disabled completes after the poll in progress,
> +	 * even if that poll used its whole budget, so rx_queue may still hold
> +	 * packets, and nothing reads it any more. tx_queue is left alone: a
> +	 * transmit_packet_work queued during the second flush may still be
> +	 * draining it, and its entries keep the peer alive until it has.
> +	 */

[Severity: High]

Do tx_queue entries really keep the peer alive until draining is done?
The commit message makes the same claim:

  tx_queue needs no such step: transmit_packet_work drains it without a
  budget, and its entries keep the peer alive until then.

If transmit_packet_work is still running after peer_remove_after_dead()
drops the base reference, the put for the last entry in
wg_packet_tx_worker() can be the final one:

drivers/net/wireguard/send.c:wg_packet_tx_worker() {
	while ((first = wg_prev_queue_peek(&peer->tx_queue)) != NULL &&
	       ...
		wg_noise_keypair_put(keypair, false);
		wg_peer_put(peer);
		if (need_resched())
			cond_resched();
	}
}

That final put goes through kref_release()->call_rcu(&peer->rcu,
rcu_release). The worker runs in process context outside any RCU
read-side section, so a grace period can complete during cond_resched(),
or while the worker is preempted under PREEMPT_RCU.

rcu_release() then runs memzero_explicit() and kmem_cache_free() on the
peer. After that, the worker evaluates wg_prev_queue_peek(&peer->tx_queue)
again on freed memory.

Couldn't this lead to a NULL dereference on the zeroed object, or to
writes into a reused slab object via wg_prev_queue_dequeue()?

The new comment itself says the work can outlive the flushes. The
packet_crypt_wq encrypt workers share one ring across peers. An encrypt
worker queued after the first flush_workqueue() began, for example by
another peer's traffic, can take this peer's packet. It can then reach
this point after the second flush has advanced the flush colour:

drivers/net/wireguard/queueing.h:wg_queue_enqueue_per_peer_tx() {
	...
	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
}

The second flush does not wait for that work.

rcu_release() also peeks tx_queue in its WARN_ON() while the worker may
still be in its loop. That makes it a second consumer of a
single-consumer queue.

wg_packet_tx_worker() predates this patch, but the new comment relies on
this lifetime guarantee to skip tx_queue. Does something need to wait for
transmit_packet_work before the final wg_peer_put() in
peer_remove_after_dead()?

> +	peer_purge_rx_queue(peer);
>  
>  	/* Ensure any workstructs we own (like transmit_handshake_work or
>  	 * clear_peer_work) no longer are in use.

[Severity: Low]

This isn't a bug, but the new comment contradicts two comments that this
patch leaves unchanged in peer_remove_after_dead(). The marker before the
second flush says it covers the send side:

	/* b.1) For send (but not receive, since that's napi). */
	flush_workqueue(peer->device->packet_crypt_wq);

The block before the final wg_peer_put() lists which contexts may still
use the peer after the flushes:

	/* After the above flushes, a peer might still be active in a few
	 * different contexts: 1) from xmit(), before hitting is_dead and
	 * returning, 2) from wg_packet_consume_data(), before hitting is_dead
	 * and returning, 3) from wg_receive_handshake_packet() after a point
	 ...

That list does not include a wg_packet_tx_worker() that is still
running, even though the new comment says one can be. Should these two
comments be updated to match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127102243.49405-1-apasichnik9%40gmail.com
