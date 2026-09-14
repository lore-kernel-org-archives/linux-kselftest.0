Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450583C1D75;
	Mon, 14 Sep 2026 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384036; cv=none; b=DVeeA7V/tTBpFg8rDXVjlXee8oYa0X0uE+FAhXVD8XTPOqPVtunFoSGkfPosnDN3ErPNrEzZL74UZ5kgvP4mKrLcYQTOV94QuMo5OSTtEPGVPhAkYF+kHBXhVoFWXpa6fAI9GZKMi+6IxG0d6dlL7FjB/VZQDcLkWqsEjuceHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384036; c=relaxed/simple;
	bh=QyQQznyqdr9N2F5vfmqWsVg9Ud/6jPRp/sn41MuoRCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SCnIYepcE9vBri3qf1UMP8HySIcN3YXW4uTwKhL+auntPkX2ySf5XWioLynNx9zf3KWfqjcSqMFtmtubp4eGeaH/sSdfNT1GfAfkxDxKWdlIDgPLrI+ybwLYlDv1w1IPQqkdHgklnRszVSuhWWLW5ExnI6ipXbJpI4/C+9ZAmQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1q3dkk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1q3dkk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4436E1F000FF;
	Mon, 14 Sep 2026 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789384034;
	bh=4iapnKpInECdM67FSHL9LJQaxyD1KztvcDWIMOqapn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=W1q3dkk5NEeZ2WsfFIaHjDQQxfBSFkfh+114qmfDj4KuVB2JbUv58FthRHm7MaHip
	 jBGRdFvic4KbMgP2CW7yQDhOK4EFVF+TbWZKXZw5oDpARygRSc7riHnJZ4DL2RNbjI
	 OhZX1XB5FFDfZ3+THC0lfEVZdddYbsTrBGp/sLaUrOeoTWQv3aJPXQx+oevsyAQ252
	 goicy4jUf1xrYnZVH/wK4mwDQXafWi911WbE2rJ+iHRxdYi4FlIAMlHp8kxp3SnInm
	 7g4LkHiWndfT/MxPq2hd+qgc9u+k16M7Z3mbt/ik5iF9S5j4iGXFtJdlfMalzmToTD
	 Xvq171vOSVDDw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, daniel@iogearbox.net,
 mike.marciniszyn@gmail.com, mohsin.bashr@gmail.com, sdf@fomichev.me,
 bobbyeshleman@meta.com, daskald@meta.com, bestswngs@gmail.com,
 maxime.chevallier@bootlin.com, jacob.e.keller@intel.com,
 leitao@debian.org, cuitao@kylinos.cn, asml.silence@gmail.com,
 dw@davidwei.uk
Subject: Re: [PATCH net-next v2 4/5] fbnic: Support larger memory-provider
 RX pages
In-Reply-To: <178915061000.219967.7726187707862333281@kernel.org>
References: <20260910180908.1506533-5-bjorn@kernel.org>
 <178915061000.219967.7726187707862333281@kernel.org>
Date: Mon, 14 Sep 2026 13:07:11 +0200
Message-ID: <87ik48nlb4.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

netdev-bot+sashiko@kernel.org writes:

>> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_txrx.c
>> index 28b962307c080..5e22905a63739 100644
>> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>
> [ ... ]
>
>> @@ -1599,6 +1603,8 @@ fbnic_alloc_qt_page_pools(struct fbnic_net *fbn, s=
truct fbnic_q_triad *qt,
>>=20=20
>>  	qt->sub0.page_pool =3D pp;
>>  	if (netif_rxq_has_unreadable_mp(fbn->netdev, rxq_idx)) {
>> +		pp_params.order =3D get_order(rx_page_size);
>> +		pp_params.max_len =3D rx_page_size;
>>  		pp_params.flags |=3D PP_FLAG_ALLOW_UNREADABLE_NETMEM;
>>  		pp_params.dma_dir =3D DMA_FROM_DEVICE;
>>=20=20
>>  		pp =3D page_pool_create(&pp_params);
>>  		if (IS_ERR(pp))
>>  			goto err_destroy_sub0;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but the patch widens the set of
> inputs that can make this page_pool_create() fail, so it seems worth
> mentioning.
>
> At the err_destroy_sub0 label, pp has already been reassigned to the
> ERR_PTR returned by the second page_pool_create():
>
> 	err_destroy_sub0:
> 		page_pool_destroy(pp);
> 		return PTR_ERR(pp);
>
> page_pool_destroy() only short-circuits on NULL:
>
> 	net/core/page_pool.c:page_pool_destroy() {
> 		if (!pool)
> 			return;
>
> 		if (!page_pool_put(pool))
> 			return;
> 		...
> 	}
>
> and page_pool_put() then does refcount_dec_and_test(&pool->user_cnt) on
> the error pointer. Should the label destroy qt->sub0.page_pool instead,
> and save the error value before overwriting pp?

Yup. I'll send out a separate fix for this.

>> @@ -2028,15 +2034,18 @@ static int fbnic_alloc_tx_qt_resources(struct fb=
nic_net *fbn,
>>=20=20
>>  static int fbnic_alloc_rx_qt_resources(struct fbnic_net *fbn,
>>  				       struct fbnic_napi_vector *nv,
>> -				       struct fbnic_q_triad *qt)
>> +				       struct fbnic_q_triad *qt,
>> +				       u32 rx_page_size)
>>  {
>>  	struct device *dev =3D fbn->netdev->dev.parent;
>>  	int err;
>>=20=20
>> -	err =3D fbnic_alloc_qt_page_pools(fbn, qt, qt->cmpl.q_idx);
>> +	err =3D fbnic_alloc_qt_page_pools(fbn, qt, qt->cmpl.q_idx, rx_page_siz=
e);
>>  	if (err)
>>  		return err;
>>=20=20
>> +	fbnic_bdq_set_page_size(&qt->sub1, rx_page_size);
>> +
>
> [Severity: High]
> Can the BDQ geometry here end up describing a page pool that was never
> enlarged?
>
> fbnic_bdq_set_page_size(&qt->sub1, rx_page_size) runs unconditionally,
> but fbnic_alloc_qt_page_pools() only raises order/max_len when
> netif_rxq_has_unreadable_mp() is true; otherwise sub1 just takes another
> reference on sub0's order-0, PAGE_SIZE pool. The two predicates are not
> the same:
>
> 	net/core/netdev_rx_queue.c:netif_rxq_has_unreadable_mp() {
> 		if (rxq_idx < dev->real_num_rx_queues)
> 			return __netif_get_rx_queue(dev, rxq_idx)->mp_params.mp_ops;
> 		return false;
> 	}
>
> 	net/core/netdev_config.c:__netdev_queue_config() {
> 		mpp =3D &__netif_get_rx_queue(dev, rxq_idx)->mp_params;
> 		if (mpp->rx_page_size)
> 			qcfg->rx_page_size =3D mpp->rx_page_size;
> 	}
>
> The config renderer applies the memory provider's rx_page_size with no
> real_num_rx_queues bound check, while netif_rxq_has_unreadable_mp()
> silently reports false above real_num_rx_queues.
>
> When they disagree, does the device get descriptors past the end of the
> mapping? fbnic_bd_prep() posts fbnic_bd_page_count() descriptors from a
> single allocation:
>
> 	__le64 *bdq_desc =3D &bdq->desc[id * fbnic_bd_page_count(bdq)];
> 	dma_addr_t dma =3D page_pool_get_dma_addr_netmem(netmem);
> 	u64 bd, i =3D fbnic_bd_page_count(bdq);
>
> and on the completion side fbnic_rcd_bd_page_offset() decodes offsets up
> to rx_page_size - 1, which fbnic_add_rx_frag() then feeds to
> page_pool_dma_sync_netmem_for_cpu() and xdp_buff_add_frag() as payload
> inside what is really a PAGE_SIZE buffer.
>
> A path that seems to reach this: fbnic only sets real_num_rx_queues in
> fbnic_set_netif_queues() at open, so after probe it equals
> FBNIC_MAX_RXQS from alloc_etherdev_mq(). A devmem/io_uring bind with
> rx-page-size=3D8K against a high queue index is accepted then, "ip link s=
et
> up" shrinks real_num_rx_queues (netif_set_real_num_rx_queues() has no
> memory-provider check), and a later "ethtool -L combined 32" makes
> fbnic_alloc_nv_resources() allocate that queue while
> netif_rxq_has_unreadable_mp() returns false but qcfg.rx_page_size is
> still 8192.
>
> Before this patch bd_page_shift was always derived from PAGE_SIZE and so
> always matched the order-0 pool. Would it make sense to either derive the
> BDQ page size from the pool that was actually created, or reject
> rx_page_size !=3D PAGE_SIZE when no large-order pool was allocated?

Hmm, yes, it seems like this is a valid bug, when fbnic's real queue
counts and private counts disagree! I fixed the root cause by keeping
the real queue count synchronized. I'll send this one out separately.


Bj=C3=B6rn
