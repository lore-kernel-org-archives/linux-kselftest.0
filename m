Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314C4AF67F;
	Fri, 11 Sep 2026 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150622; cv=none; b=QzNb/UFCRXEheVDvxOU9DkMmKRZHJQeBE94jBsd9ALRxGNPu/mVZKgDfrZZwjR1FSgJ3E8rP/G5JnhVCj1RjrjlsHx/bC5hEp9s9kokYf9vO9vhlzapTYII3YU4WYGixCm0Fd8t6nORJwxv2Qb4iBevMTHn0gUgrV7l+LhtC8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150622; c=relaxed/simple;
	bh=kaUp194rucXMwbEBWohdBnDbGqFXS+NaelYZxoe1jcM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bRgETDRtcocDqirjNYE//hXoEfwtBuT4gyiocF7XIkyPkGxzVnQFBHWa33ZbQkZnTbihaW4Y+Pthtpgd1t7aq8RbzgYCxLo5NzLkqIKGU2J0G/T94CtaVmLHGE5kL8FL1P5D4BG7PyGupAXMjB5uSd+Siu+iGacxY8G7BBXanPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMwwD8Pn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMwwD8Pn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF181F00893;
	Fri, 11 Sep 2026 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150612;
	bh=9q6E405kevP4Q7t7b7joHYELBjjubVBWDhl+LQ0Baqw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YMwwD8Pn7YneEezooRyFK9bjvMsUbzRutiutWJ0Ri0H42C7t3sf2krlJ9ZFaZotAL
	 IdsRUNKnHJy8N8yMQU6rZU/Pi0+vOJoePS2RWddoETXwDxmD6C/mPn/8AuwRgQBaQS
	 yrDRPyKBxUQUhRUydI5COExaFAaQhXAZLGUac1m7nLkWUarYRv9Zzpb4IfE0W++NmC
	 10P9SEk6CopsOPehRaw8tak7E0lUZgfIMVgnSLcnzWm/SflY9Dwvi35cPoELBG0MEK
	 vub1EIYcQTaprhHt3Dnr136CBDTeE4yaMoZJT2OwCO7hEJkIstsvAmeVXihkHriClk
	 0TI1lD0dnu/lA==
Subject:
 Re: [PATCH net-next v2 4/5] fbnic: Support larger memory-provider RX pages
From: netdev-bot+sashiko@kernel.org
To: bjorn@kernel.org
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 daniel@iogearbox.net, mike.marciniszyn@gmail.com, mohsin.bashr@gmail.com,
 sdf@fomichev.me, bobbyeshleman@meta.com, daskald@meta.com,
 bestswngs@gmail.com, maxime.chevallier@bootlin.com, jacob.e.keller@intel.com,
 leitao@debian.org, cuitao@kylinos.cn, asml.silence@gmail.com, dw@davidwei.uk
Date: Fri, 11 Sep 2026 18:16:50 +0000
Message-ID: <178915061000.219967.7726187707862333281@kernel.org>
In-Reply-To: <20260910180908.1506533-5-bjorn@kernel.org>
References: <20260910180908.1506533-5-bjorn@kernel.org>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

- [High] fbnic_alloc_rx_qt_resources() programs the PPQ device-page
  geometry unconditionally (`fbnic_bdq_set_page_size(&qt->sub1,…

Pre-existing issues:
- [High] In fbnic_alloc_qt_page_pools()
  (drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:1611-1623) the local…

--

fbnic: Support larger memory-provider RX pages

The patch lets memory providers pick a larger RX page size for a queue via
QCFG_RX_PAGE_SIZE, uses that rendered rx_page_size for the PPQ page-pool
allocations and completion decoding, and adds ndo_default_qcfg /
ndo_validate_qcfg callbacks to sanity check the requested size.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 28b962307c080..5e22905a63739 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

[ ... ]

> @@ -1599,6 +1603,8 @@ fbnic_alloc_qt_page_pools(struct fbnic_net *fbn, struct fbnic_q_triad *qt,
>  
>  	qt->sub0.page_pool = pp;
>  	if (netif_rxq_has_unreadable_mp(fbn->netdev, rxq_idx)) {
> +		pp_params.order = get_order(rx_page_size);
> +		pp_params.max_len = rx_page_size;
>  		pp_params.flags |= PP_FLAG_ALLOW_UNREADABLE_NETMEM;
>  		pp_params.dma_dir = DMA_FROM_DEVICE;
>  
>  		pp = page_pool_create(&pp_params);
>  		if (IS_ERR(pp))
>  			goto err_destroy_sub0;

[Severity: High]
This isn't a bug introduced by this patch, but the patch widens the set of
inputs that can make this page_pool_create() fail, so it seems worth
mentioning.

At the err_destroy_sub0 label, pp has already been reassigned to the
ERR_PTR returned by the second page_pool_create():

	err_destroy_sub0:
		page_pool_destroy(pp);
		return PTR_ERR(pp);

page_pool_destroy() only short-circuits on NULL:

	net/core/page_pool.c:page_pool_destroy() {
		if (!pool)
			return;

		if (!page_pool_put(pool))
			return;
		...
	}

and page_pool_put() then does refcount_dec_and_test(&pool->user_cnt) on
the error pointer. Should the label destroy qt->sub0.page_pool instead,
and save the error value before overwriting pp?

Along the same path, is qt->sub0.page_pool leaked together with its DMA
mappings? fbnic_alloc_rx_qt_resources() returns the error before reaching
its free_page_pools label, fbnic_alloc_nv_resources()'s "while (i--)"
unwind skips the failing qt, and on the queue-reconfig side
netdev_rx_queue_reconfig() goes to err_free_old_mem (kvfree of the qmem
container only, no ndo_queue_mem_free) when ndo_queue_mem_alloc fails.

The second create can fail for ordinary reasons: page_pool_init() returns
-ENOMEM for the ptr_ring allocation (up to 16384 entries here) and can
also propagate an error from pool->mp_ops->init(pool).

[ ... ]

> @@ -2028,15 +2034,18 @@ static int fbnic_alloc_tx_qt_resources(struct fbnic_net *fbn,
>  
>  static int fbnic_alloc_rx_qt_resources(struct fbnic_net *fbn,
>  				       struct fbnic_napi_vector *nv,
> -				       struct fbnic_q_triad *qt)
> +				       struct fbnic_q_triad *qt,
> +				       u32 rx_page_size)
>  {
>  	struct device *dev = fbn->netdev->dev.parent;
>  	int err;
>  
> -	err = fbnic_alloc_qt_page_pools(fbn, qt, qt->cmpl.q_idx);
> +	err = fbnic_alloc_qt_page_pools(fbn, qt, qt->cmpl.q_idx, rx_page_size);
>  	if (err)
>  		return err;
>  
> +	fbnic_bdq_set_page_size(&qt->sub1, rx_page_size);
> +

[Severity: High]
Can the BDQ geometry here end up describing a page pool that was never
enlarged?

fbnic_bdq_set_page_size(&qt->sub1, rx_page_size) runs unconditionally,
but fbnic_alloc_qt_page_pools() only raises order/max_len when
netif_rxq_has_unreadable_mp() is true; otherwise sub1 just takes another
reference on sub0's order-0, PAGE_SIZE pool. The two predicates are not
the same:

	net/core/netdev_rx_queue.c:netif_rxq_has_unreadable_mp() {
		if (rxq_idx < dev->real_num_rx_queues)
			return __netif_get_rx_queue(dev, rxq_idx)->mp_params.mp_ops;
		return false;
	}

	net/core/netdev_config.c:__netdev_queue_config() {
		mpp = &__netif_get_rx_queue(dev, rxq_idx)->mp_params;
		if (mpp->rx_page_size)
			qcfg->rx_page_size = mpp->rx_page_size;
	}

The config renderer applies the memory provider's rx_page_size with no
real_num_rx_queues bound check, while netif_rxq_has_unreadable_mp()
silently reports false above real_num_rx_queues.

When they disagree, does the device get descriptors past the end of the
mapping? fbnic_bd_prep() posts fbnic_bd_page_count() descriptors from a
single allocation:

	__le64 *bdq_desc = &bdq->desc[id * fbnic_bd_page_count(bdq)];
	dma_addr_t dma = page_pool_get_dma_addr_netmem(netmem);
	u64 bd, i = fbnic_bd_page_count(bdq);

and on the completion side fbnic_rcd_bd_page_offset() decodes offsets up
to rx_page_size - 1, which fbnic_add_rx_frag() then feeds to
page_pool_dma_sync_netmem_for_cpu() and xdp_buff_add_frag() as payload
inside what is really a PAGE_SIZE buffer.

A path that seems to reach this: fbnic only sets real_num_rx_queues in
fbnic_set_netif_queues() at open, so after probe it equals
FBNIC_MAX_RXQS from alloc_etherdev_mq(). A devmem/io_uring bind with
rx-page-size=8K against a high queue index is accepted then, "ip link set
up" shrinks real_num_rx_queues (netif_set_real_num_rx_queues() has no
memory-provider check), and a later "ethtool -L combined 32" makes
fbnic_alloc_nv_resources() allocate that queue while
netif_rxq_has_unreadable_mp() returns false but qcfg.rx_page_size is
still 8192.

Before this patch bd_page_shift was always derived from PAGE_SIZE and so
always matched the order-0 pool. Would it make sense to either derive the
BDQ page size from the pool that was actually created, or reject
rx_page_size != PAGE_SIZE when no large-order pool was allocated?

>  	err = xdp_rxq_info_reg(&qt->xdp_rxq, fbn->netdev, qt->sub0.q_idx,
>  			       nv->napi.napi_id);
>  	if (err)

[ ... ]

> @@ -2097,7 +2106,11 @@ static int fbnic_alloc_nv_resources(struct fbnic_net *fbn,
>  
>  	/* Allocate Rx Resources */
>  	for (j = 0; j < nv->rxt_count; j++, i++) {
> -		err = fbnic_alloc_rx_qt_resources(fbn, nv, &nv->qt[i]);
> +		struct netdev_queue_config qcfg;
> +
> +		netdev_queue_config(fbn->netdev, nv->qt[i].cmpl.q_idx, &qcfg);
> +		err = fbnic_alloc_rx_qt_resources(fbn, nv, &nv->qt[i],
> +						  qcfg.rx_page_size);
>  		if (err)
>  			goto free_qt_resources;
>  	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910180908.1506533-1-bjorn%40kernel.org
