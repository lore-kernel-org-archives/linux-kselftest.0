Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59683B7B7F;
	Fri, 18 Sep 2026 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723313; cv=none; b=Sm3Fh4nNm8V2D4tRnYy4INc/e5MK9DWvgYFTc/deOqNqTZuz5HyMZZOQKlUa6nbzWh77JvZBuVgjIZHXkgV0rSMlvG3bItDIt1yisftX7UHM+q4DnVt+3S53e8Lhwt9yZc3n3YvPwpp0ten2EPgFJpnpTe6xyobSSO2j6L29KcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723313; c=relaxed/simple;
	bh=OlRLXVIn2r5aG9Ji4gyVA8JaMSQ+3b6MaSdtt6+4vAY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g173teoa1jUMSrFoPJ8C+ZsdRWhTOzcNt0BhL0/YDVZR+LJGLLafBlcukzvRoURl+WNXWrAMCyxHRvpEZyJAcG/Vaz0FkK+RlPCGU+fK5+YltrDzA7k+KYITd56mnRY0c0WzXtuIYz6Nk0pT5r4dHUFq/cDbSVoF3Agb2/bd8FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EM10W6rE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EM10W6rE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA6F1F00893;
	Fri, 18 Sep 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723311;
	bh=2RGK9msVdh8rZ3KN+uyXUzb15p/yT1hKDC+8zsV21pk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EM10W6rEGqAHMMcQlNMKnSaIN1Glhot6FkS+TnSfaE5Xrsz61Lxjrcej6/aQ4csL+
	 axkh7902etjxnqpEgSVysPsyMzHFutNe8FJdgfJqK+oZRr5/iz0UCqdQeGxy8o+Ze0
	 HVi6MrRWSHxBvjnmWUUeMSJmGS3VIeegYzmHsyz18zV4Xl8BvRdxKbVco/n3iltt30
	 0xNzZ+P69SPEX99EkjZ9GOs/z2vR1diiczgTqmzj4RKqEEmrVPB/Q1vAIKT3gfEsGO
	 YVeHPO5wT+UX4iQhhI1xCFt38daaXTq2/dnweJPOdJwWvulXCD7UDD4T/Rw4ajvvoL
	 jRxwcRq+bQgLQ==
Subject:
 Re: [PATCH net-next v3 4/5] fbnic: Support larger memory-provider RX pages
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
Date: Fri, 18 Sep 2026 09:21:49 +0000
Message-ID: <178972330968.22033.5908779973524437697@kernel.org>
In-Reply-To: <20260915182105.4162425-5-bjorn@kernel.org>
References: <20260915182105.4162425-5-bjorn@kernel.org>
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

- [High] fbnic_alloc_qt_page_pools() and fbnic_alloc_rx_qt_resources()
  use two non-equivalent predicates for the same decision, which lets…

Pre-existing issues:
- [High] In fbnic_alloc_qt_page_pools() the error label err_destroy_sub0
  calls page_pool_destroy(pp) after `pp` has been overwritten with the…

--

fbnic: Support larger memory-provider RX pages

Renders the per-queue rx_page_size and uses it for the PPQ page-pool
allocation order and the PPQ BDQ page geometry, so one page-pool
allocation is described by consecutive 4 KiB device-page descriptors.
Also adds ndo_default_qcfg/ndo_validate_qcfg and advertises
QCFG_RX_PAGE_SIZE.

A couple of questions about the two predicates used for the page-pool
geometry, and about the existing error label in
fbnic_alloc_qt_page_pools().

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index fef51d4541026..615b74fc7bef4 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c

[ ... ]

> @@ -1600,6 +1604,8 @@ fbnic_alloc_qt_page_pools(struct fbnic_net *fbn, struct fbnic_q_triad *qt,
>  
>  	qt->sub0.page_pool = pp;
>  	if (netif_rxq_has_unreadable_mp(fbn->netdev, rxq_idx)) {
> +		pp_params.order = get_order(rx_page_size);
> +		pp_params.max_len = rx_page_size;
>  		pp_params.flags |= PP_FLAG_ALLOW_UNREADABLE_NETMEM;
>  		pp_params.dma_dir = DMA_FROM_DEVICE;
>  

[Severity: High]
This isn't a bug introduced by this patch, but the error label reached by
the second page_pool_create() in this function looks broken, and the new
order/max_len parameters add failure modes to that call:

drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:fbnic_alloc_qt_page_pools() {
	...
		pp = page_pool_create(&pp_params);
		if (IS_ERR(pp))
			goto err_destroy_sub0;
	...
err_destroy_sub0:
	page_pool_destroy(pp);
	return PTR_ERR(pp);
}

At the label, pp is the ERR_PTR from the failed create, not
qt->sub0.page_pool. page_pool_destroy() only guards against NULL:

net/core/page_pool.c:page_pool_destroy() {
	if (!pool)
		return;

	if (!page_pool_put(pool))
		return;
	...
}

so page_pool_put() does refcount_dec_and_test(&pool->user_cnt) on an error
pointer. Can this oops, and does it also leak the sub0 page_pool together
with its DMA mappings, given the caller propagates the error and
netdev_rx_queue_reconfig() goes to err_free_old_mem without calling
ndo_queue_mem_free?

Should the label be something like:

err_destroy_sub0:
	page_pool_destroy(qt->sub0.page_pool);
	return PTR_ERR(pp);

The reason this comes up here is that pp_params.order is now derived from
a user-supplied value, and the memory provider validates it:

net/core/devmem.c:mp_dmabuf_devmem_init() {
	...
	if (pool->p.order != binding->niov_shift - PAGE_SHIFT)
		return -E2BIG;
	...
}

fbnic_validate_qcfg() accepts any power-of-two rx_page_size >= 4 KiB, so on
a host with PAGE_SIZE larger than 4 KiB get_order(rx_page_size) can differ
from the provider's chunk order and this create fails deterministically,
not just on -ENOMEM. The label exists verbatim at b8e9e7d82e7e and is
still present at dadc755bdd0c.

> @@ -2029,15 +2035,18 @@ static int fbnic_alloc_tx_qt_resources(struct fbnic_net *fbn,
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
Can the sub1 BDQ geometry end up describing more memory than the pool
actually allocates here?

The pool order is only raised inside the memory-provider branch of
fbnic_alloc_qt_page_pools():

	if (netif_rxq_has_unreadable_mp(fbn->netdev, rxq_idx)) {
		pp_params.order = get_order(rx_page_size);
		pp_params.max_len = rx_page_size;

but fbnic_bdq_set_page_size(&qt->sub1, rx_page_size) above runs
unconditionally. The two are not the same test:

net/core/netdev_rx_queue.c:netif_rxq_has_unreadable_mp() {
	if (rxq_idx < dev->real_num_rx_queues)
		return __netif_get_rx_queue(dev, rxq_idx)->mp_params.mp_ops;
	return false;
}

net/core/netdev_config.c:__netdev_queue_config() {
	...
	mpp = &__netif_get_rx_queue(dev, rxq_idx)->mp_params;
	if (mpp->rx_page_size)
		qcfg->rx_page_size = mpp->rx_page_size;
	...
}

So for rxq_idx >= dev->real_num_rx_queues the rendered rx_page_size still
reflects the installed mp_params while netif_rxq_has_unreadable_mp() is
false. sub1 then shares sub0's order-0, PAGE_SIZE, DMA_BIDIRECTIONAL pool
while bd_page_shift claims rx_page_size / 4096 device pages, and
fbnic_bd_prep() posts that many consecutive addresses off one netmem:

drivers/net/ethernet/meta/fbnic/fbnic_txrx.c:fbnic_bd_prep() {
	do {
		*bdq_desc = cpu_to_le64(bd);
		bd += FIELD_PREP(FBNIC_BD_DESC_ADDR_MASK, 1) |
		      FIELD_PREP(FBNIC_BD_DESC_ID_MASK, 1);
		bdq_desc++;
	} while (--i);
}

Does that hand the NIC up to rx_page_size - PAGE_SIZE bytes of addresses
past the end of the allocation?

The sequence I think reaches this, all with CAP_NET_ADMIN:

  - with the interface down, dev->real_num_rx_queues is FBNIC_MAX_RXQS,
    since alloc_etherdev_mq() sets it and only fbnic_set_netif_queues()
    (called from __fbnic_open()) narrows it
  - bind a dmabuf with rx-page-size 32768 to a high queue index, say 64;
    netif_mp_open_rxq() only checks rxq_idx < real_num_rx_queues, and
    the !netif_running() path of fbnic_queue_mem_alloc() just creates and
    frees page pools, leaving mp_params installed
  - bring the link up; fbnic_set_netif_queues() calls
    netif_set_real_num_rx_queues(8), and rx_queue_release() does not clear
    mp_params at index 64
  - ethtool -L combined 128 while up; growing the queue count is not
    guarded, and fbnic_alloc_nv_resources() then does

	netdev_queue_config(fbn->netdev, nv->qt[i].cmpl.q_idx, &qcfg);

    which returns rx_page_size 32768 for index 64 while
    netif_rxq_has_unreadable_mp(dev, 64) is false

Would keying both the page-pool parameters and fbnic_bdq_set_page_size()
off the same condition (or clamping rx_page_size to PAGE_SIZE when the
queue has no memory provider) close this?

> @@ -2098,7 +2107,11 @@ static int fbnic_alloc_nv_resources(struct fbnic_net *fbn,
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

> @@ -2997,4 +3072,7 @@ const struct netdev_queue_mgmt_ops fbnic_queue_mgmt_ops = {
>  	.ndo_queue_mem_free	= fbnic_queue_mem_free,
>  	.ndo_queue_start	= fbnic_queue_start,
>  	.ndo_queue_stop		= fbnic_queue_stop,
> +	.ndo_default_qcfg	= fbnic_default_qcfg,
> +	.ndo_validate_qcfg	= fbnic_validate_qcfg,
> +	.supported_params	= QCFG_RX_PAGE_SIZE,
>  };

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915182105.4162425-1-bjorn%40kernel.org
