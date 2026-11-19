Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082063;
	b=ZYbl2S5Gpn8Z0qWImSofHTPXQOJtnhJ4QpePgw4sb5cP1TUynqaLeSDsVHJvfMcouk6n
	 Q3gWUy8wp5cK5plTVXk3pV83i6ccJx4SoXFRZuAN1bMkJtMd1zva6SIiUM8ZdfGDPN6iA
	 3nRF2S6KjSOQys2WdiZcYnVlnkQhFKyOZ2gcf76whXLG93bF3sJ23h8za5uU5SJioxCkn
	 n1s+iZQB5/7M0Vyee4BHlDY0kOui4vEov2sfb8m8Ie+lmwBXwecJx75oTuuYRHHio5j7k
	 cSDgLTuydCPdx23+Sn5xR78cUCaWmfH3OFWaP4G4QQwaR/PdRdo1pa2N6LMy9lEi7AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082063;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h9SsKa89pdv6CdZOat+96TxZ6dXD8Iqx3PWwB13ANYM=;
	b=Xufmtej93dV1hOPGEcGofYD2lo/QefsdAwkwxig5YBLL2HZ6gWVP+H/zCEQgHHEhIiEd
	 ySuHZZfzmnDNvjApf/RsnWTB8VGdzT54gelh6x2sQzRkzE0Ft0+rGPF9Aqhg4C9fg3MpI
	 +WwhCEJj5314nReYLTHUqKcbL9vDQ0gleLzCkBsW5LWgJx5N9W0Xv7mTkVhwS/Nw8fOge
	 sTyqvozgiMPuF6zOFRbw/0RDbxb/g7S8LUFO2XTyL2IUO/ewGQDcfLHPlNFpxB2NtHGHT
	 l+aUG6g0RL9rz/NsUIKpVuUe7X6Xjqj1kO2+oMwfEPznrVj8Sd5wlcwmpYRoFuR1FRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSsOv2Ba;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2092606A320;
	Thu, 19 Nov 2026 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSsOv2Ba
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDB41F000C5;
	Thu, 19 Nov 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082063;
	bh=h9SsKa89pdv6CdZOat+96TxZ6dXD8Iqx3PWwB13ANYM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aSsOv2BaxlpvGGuDpyN71M7yc+4TZItkDwPgE/mVRRxpKY/5Is1ICLm1OgQDx1CQU
	 BA0gi+RgMuVvWHZeDOzxTCb2FZXMyL9Z9/FVms1/Van+NgiraVVl5+ChPi5CB+in0C
	 XH/kpzSmFGtfsk/A4mqAhJZgHTf4iaen7PonvaAAK3ZiUi/F2/a66EezcOG7ADXlae
	 p3GO/y46uHeMN7OeP4VWcAvW6EW3ubHu9BOEwkegZPuNYkm4wQHv1Lxdpv1zX4Bt21
	 f6EAHh607LaZEcwkMIHTnB2AJFaHdpmMldXw3eVwcCptWwhlNP8BT03LuCdW7ddVpI
	 wswesMqFXK85Q==
Subject: Re: [PATCH net v2 1/5] eth: fbnic: wait on the correct queues in
 fbnic_queue_stop()
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org, almasrymina@google.com,
 vadim.fedorenko@linux.dev, daskald@meta.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 19 Nov 2026 09:54:21 +0000
Message-ID: <179508206173.3136.15402623456535892800@kernel.org>
In-Reply-To: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] After this patch, fbnic_queue_stop() passes
  nv->qt[t].cmpl.q_idx to fbnic_wait_queue_idle().

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  fbnic_queue_stop() stops the vector's netdev Tx queues with a bare…

--

eth: fbnic: wait on the correct queues in fbnic_queue_stop()

This patch sets q_idx on Tx completion rings. fbnic_queue_stop() now
passes cmpl.q_idx to fbnic_wait_queue_idle(), so Rx queues no longer
wait on queue 0. It also skips stop and wake of Tx rings that are
marked FBNIC_RING_F_DISABLED.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 07d4b2e923627..5efed21e59329 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

[ ... ]

> @@ -3089,13 +3092,16 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
>  	napi_disable_locked(&nv->napi);
>  	fbnic_nv_irq_disable(nv);
>  
> -	for (i = 0; i < nv->txt_count; i++)
> +	for (i = 0; i < nv->txt_count; i++) {
> +		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
> +			continue;
>  		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
> +	}
>  	fbnic_nv_disable(fbn, nv);

[Severity: High]
This isn't a bug introduced by this patch, but does anything here wait
for an fbnic_xmit_frame() call that is already running on another CPU?

netif_stop_subqueue() only sets __QUEUE_STATE_DRV_XOFF. Nothing calls
__netif_tx_lock() or synchronize_net() before fbnic_nv_disable(),
fbnic_wait_queue_idle() and fbnic_nv_flush() run. Only the full-down
path in fbnic_pci.c uses netif_tx_disable().

A sender may pass the netif_xmit_frozen_or_stopped() check before the
bit is set. It can then still be inside fbnic_tx_map(), writing
tx_buf[], ring->tail and the BQL state, and ringing the doorbell.

Suppose it sets ring->tail after fbnic_nv_flush() has run:

fbnic_nv_flush()
    fbnic_clean_twq0(nv, 0, &qt->sub0, true, qt->sub0.tail);
    ...
    netdev_tx_reset_queue(tx_queue);

Is the skb and its DMA mapping then leaked once __fbnic_nv_restart()
re-enables the ring and fbnic_enable_twq0() resets head/tail to 0? BQL
would also keep in-flight bytes that never complete, and that can
stall the Tx queue.

Now suppose the sender is delayed until after fbnic_enable_twq0() has
done this:

	twq->tail = 0;
	twq->head = 0;

It would then write a stale ring->tail and ring the doorbell, and the
hardware would fetch old descriptors whose buffers are already
unmapped. Could those completions make fbnic_clean_twq0() read a NULL
ring->tx_buf[] entry and dereference FBNIC_XMIT_CB(skb)->desc_count on
it?

To hit this, a queue restart (netdev bind-rx devmem, io_uring zcrx) has
to run on an Rx queue whose NAPI vector also serves a combined Tx queue,
while another CPU is sending on that Tx queue.

>  
>  	for (t = 0; t < nv->txt_count + nv->rxt_count; t++) {
>  		err = fbnic_wait_queue_idle(fbn, t >= nv->txt_count,
> -					    nv->qt[t].sub0.q_idx);
> +					    nv->qt[t].cmpl.q_idx);

[Severity: Medium]
On an Rx-only vector the Tx triad has sub0 disabled and carries only the
XDP TWQ1 ring, so this call becomes fbnic_wait_queue_idle(fbn, false,
txq_idx). Does fbnic_wait_queue_idle() actually cover TWQ1 of that
queue?

It builds a single bit from the queue index and tests that bit in all
four Tx idle arrays:

fbnic_wait_queue_idle() {
    ...
	off = idx / 32;
	mask = BIT(idx % 32);
    ...
}

The TWQ, TQS and TDE idle arrays are twice as wide as the TCQ one:

#define FBNIC_QM_TWQ_IDLE_CNT			8
#define FBNIC_QM_TCQ_IDLE_CNT			4
#define FBNIC_QM_TQS_IDLE_CNT			8
#define FBNIC_QM_TDE_IDLE_CNT			8

There are 128 queues with two work queues each (TWQ0 and TWQ1), so this
looks like one bit per TWQ. fbnic_wait_all_queues_idle() reads all 8
registers, but fbnic_wait_queue_idle() only reads registers 0 to 3.

If bit idx maps to TWQ0, it is always idle here, because TWQ0 is
FBNIC_RING_F_DISABLED on this triad. The TWQ1 ring that carries XDP_TX
traffic would then never be polled.

Next, fbnic_queue_stop() calls fbnic_nv_flush(), which runs
fbnic_clean_twq1() and unmaps the XDP buffers. Could the hardware still
be fetching TWQ1 descriptors at that point?

The bit layout isn't documented in-tree, so the answer depends on the
hardware. The commit message gives "fbnic_wait_queue_idle(tx, 39)" as
the wait on the vector's XDP Tx queue. Is that wait enough to cover
TWQ1?

>  		if (err)
>  			goto err_restart;
>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117215416.1901246-1-dimitri.daskalakis1%40gmail.com
