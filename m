Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923821;
	b=ivBI45kySEG+rmH1bJrbP4ZmR2SK4mnHF/45mkb6H+Rsb1woJBc79Iiw0StdMArZgFZ9
	 ajJe/pWeK1T4KIKjjw0TwwRmRf51QJppCNLWY0WYyHG9zS3OZr8Bt9zbotSwdrm7+bpAR
	 CRWNWnmWxXj6uNfKtMU6fe2oOBocd/AZqllnCBk20brzCx2nCBCzJlCuw8C704JZoaxoL
	 qwSPqtcBdU24CtJPs0VcQEwSmOLYtkjdt/FMsIIuyjfYke3NEv1XfXegUdiMhf/ITR2jw
	 EICvnpLJmXaCRe9rNzM/kNSbloA5rkPt+rSRa+bghn/bGU2r6M3vrR/uwzwrA14kYFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SDEIjTL/pMuP5OvwnL/SS4lozZwfHuBubfkoJhtRSRk=;
	b=yK/j58mBhm8zGiyRjoklCe6PVHUSz4ImInVpFNTeNMT8cf2FimjtKZwyJ8W04B+EWDFJ
	 qR/hfOV+UTXMHCQiUCBSdfNUC718s+PYRBaLt853yW1SOTuE2SzzcaJShj8zJglQigORi
	 HLpgPmKabK3Qzl6sJdPCzmz5Inhxul0k2CPe3cZmebZjyIfke6ur2eJ1IRqtE9s5iH4LV
	 j2AG19VR3aHEVVBsrmFDFPkpHw6hSw81TpRuAsRFLCtnv529HtFpyaAXQH+UZwFtb94qY
	 e09v3kDDgW/M595IINk6WzWiCHU/3bLFUNwaOQehj8lkUKdiXef57d4aFC9vRdCTaFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gzj285x0;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18132606A328
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 00:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18132606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gzj285x0
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so97240eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 16:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923819; x=1794528619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SDEIjTL/pMuP5OvwnL/SS4lozZwfHuBubfkoJhtRSRk=;
        b=Gzj285x0Dq3SfXCUBvJM9YvixG8v7TKNssxgoLlOcEEf/hXz9q9HWnf4Li4EB2Qf2g
         Do2vOeXKc3/+lWknu7wCvz8X+K7Sodbha5oeDiZVIRghxfZWo7ePdAqDprNYezN4zx1A
         L2ceWDGOaLWpdvtV2RAD0C0AYrkKEvo1xYnuzCcHjdfeUS3abPJ95e10z7Mwk+m4lOSV
         wBRiTlD8+Bg23QBf/0nCXa3jwB6JqyjDqfed7Swp5q+LeURrOapUMJAPeFYWjle2rQ+q
         jwJQhXzAI63hfb7vKzHMc5B3OfzWmbPFVZmSUKW5zJ3zAm/09rngB4WYdF1EIAZmHbk3
         n+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923819; x=1794528619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDEIjTL/pMuP5OvwnL/SS4lozZwfHuBubfkoJhtRSRk=;
        b=bXFguPnDDi8cFLB7TiU6rhro5Ks/fBPu1sl5zX4kCyQUIafyW+PUgIAa2OW3jEZCsH
         ZdT+0RlLoiWmr/6XUOkVqAalbh/tSnSmnwqdeHtZkR362wf2/+oxlrRoNwEMAZQVeSih
         sNvBs8clwN7oOS9uaZcHH8yf9Qdo8eqv3OrM4oT16XoZWiADxIaMQ5kmYX51sK/Kd+px
         Sm8fgcm042McucivTUc5wUkMhpawUrhUbIyCkqwmKmT70OHQUdfUuZfLPNpCK0tk5Rnn
         Zr7gbVvbjjjaynJclckEVX8Kve3IHyAIpiubJyL9Yes9Y1dReJHwxyd+7bgaLauTQigh
         Lc/g==
X-Forwarded-Encrypted: i=1; AKwUvBwEU0cviW0GPF4biSkeEEf2UgsEbidrsNOS+I29wy6RUmX6et1XgA3z0vIZeJALchizXRNWBR6f+b0W7p5aA2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nBPzRj50Vz7fP6rV+JbwwBq9ERMtbKdlNnN40ZMQbKfXTGGZe
	3sAORN/NQQNB6PODbu4IMcCTscOF45W278oTrtDoC+A1uRa3Hk8VQ61d
X-Gm-Gg: AYBFou15HTlPCl3gFGqZB00bTQQwUmUMBq7J2rQm5832kU1p/qEipJVQ3o4AoL2hQHl
	W3OU09V63zVJvLtgfqKkVyAsu0EszVf+ctUky0WXEh+I+bWeN5TDnNg+mKyea9ltDVI2DOTaXhH
	So4qQ08PO0w8xa5zpfVBowJZDjLPv9iD7Ahb6unknlFqPSIEU3dt26YqI+Mimdw6nVYDa/NCeWZ
	C1ELAx7ELWRCB7RIRUIAiwvQMdeFeaWPFDrpEczHqLinmEOhoLILcR49Lh6bobRn8fCJojuLJJ5
	gLB0plxa9d3XyKYJQdKGSD5gtrurwkKIWBOxjPMxurMjg7z4AG/4WfBLmJ8T1T+fSjtsCGfERVB
	rXF1tUhyMN1mv3ZTXOC5bjKBmmzum58dH25Rx/B9B25AS87AotPledCq8gX05hGkzeFEIxRzQQp
	PM58RBahUNi98IlJezIsrTPYqjGmDkIa4OE+YykxUhJMRmlLwC0/Z76pdmltkKS4+niEExfG3yX
	xXoCrflnlk0H9Q5WL/sF0TQI9pKNtS3Q0UH2qCa8dLm+OkAU9yx5qhmjAJoQGEmRge23WZrBuH5
	MndkJsd+OjzlAp9hpXwcQA==
X-Received: by 2002:a05:693c:8843:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36f72cc18dcmr1071728eec.4.1793923818875;
        Thu, 05 Nov 2026 16:10:18 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:74::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm681858eec.23.2026.11.05.16.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:10:18 -0800 (PST)
Date: Thu, 5 Nov 2026 16:10:13 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v1 3/4] net: devmem: support leased queues on
 netdev unregister
Message-ID: <au0aYjNLRjagTLEA@devvm16445.scu0.facebook.com>
References: <20261103232659.1340283-1-almasrymina@google.com>
 <20261103232659.1340283-4-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103232659.1340283-4-almasrymina@google.com>

On 11/03, Mina Almasry wrote:
> Previously, bind_dev was only populated when bind-tx was called on a
> virtual netdev (where map_dev != netdev), and leased RX bindings stored
> the virtual netdev in map_dev without tracking the physical backing
> netdev at all. Unregistering either the virtual device or the physical
> backing device while a leased RX or TX devmem binding was active failed
> to detach the dma-buf cleanly.
> 
> Always populate both device pointers on struct
> net_devmem_dmabuf_binding:
> - map_dev: the physical net_device whose dma_dev holds the DMA mapping
>   (resolved from leased RX queues in netdev_nl_get_dma_dev(), with its
>   netdev_lock held across net_devmem_bind_dmabuf()).
> - bind_dev: the net_device the user called bind-rx or bind-tx on (equal
>   to map_dev for direct bindings, or the virtual device for leased
>   bindings).
> 
> With both pointers tracked on all bindings, handle socket teardown,
> queue uninstall, and netdev unregistration in either order (bind_dev
> first or map_dev first):
> - Lock &binding->bind_dev during socket teardown in
>   netdev_nl_sock_priv_destroy(), close and erase bound_rxqs via
>   binding->bind_dev in net_devmem_unbind_dmabuf(), and require
>   binding->map_dev to remain non-NULL in net_devmem_get_binding().
> - Clear binding->bind_dev in mp_dmabuf_devmem_uninstall() once
>   bound_rxqs is empty, leaving unleased bindings mapped until the
>   binding is freed or map_dev is unregistered.
> - In net_devmem_dev_unregister(dev), if binding->bind_dev == dev, clear
>   NET_DEVMEM_BINDING_LIVE and clear binding->bind_dev if bound_rxqs is
>   empty or dev is not a queue leasee; if binding->map_dev == dev, clear
>   NET_DEVMEM_BINDING_LIVE, unmap the dmabuf, and clear binding->map_dev.
> - Reject new bindings and RX queue opens in net_devmem_bind_dmabuf() and
>   __netif_mp_open_rxq() if bind_dev or map_dev is no longer
>   NETREG_REGISTERED.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/devmem.c          | 85 +++++++++++++++++++++-----------------
>  net/core/devmem.h          |  8 ++--
>  net/core/netdev-genl.c     | 33 ++++++++++-----
>  net/core/netdev_rx_queue.c |  5 +++
>  4 files changed, 79 insertions(+), 52 deletions(-)
> 
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 6446355e787d4..1d6b89f196e02 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -86,7 +86,7 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
>  
>  /**
>   * net_devmem_lock_dev() - lock a binding's net_device pointer if still alive
> - * @dev_ptr:		pointer to the net_device field on a devmem binding
> + * @dev_ptr:		pointer to &binding->map_dev or &binding->bind_dev
>   * @dev_tracker:	reftracker for the held net_device reference
>   *
>   * Safely dereference @dev_ptr, acquire netdev_lock() on the device, and
> @@ -95,17 +95,18 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
>   * Invariant: *@dev_ptr is set once at bind time and is only ever cleared to
>   * NULL while holding netdev_lock() on that device (in
>   * mp_dmabuf_devmem_uninstall(), net_devmem_unbind_dmabuf(), or
> - * net_devmem_dev_unregister() during NETDEV_UNREGISTER before
> - * synchronize_net() and netdev_run_todo() free the net_device).
> + * net_devmem_dev_unregister(), all before synchronize_net() and
> + * netdev_run_todo() free the net_device).
>   *
>   * Taking rcu_read_lock() guarantees that a non-NULL device read from
>   * *@dev_ptr has not yet completed unregister_netdevice_many_notify()
>   * (which waits for an RCU grace period via synchronize_net() after
> - * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
> - * safely acquire a reference before sleeping on netdev_lock(). Once
> - * netdev_lock() is held, re-checking that READ_ONCE(*dev_ptr) == dev
> - * guarantees that the device has not yet been detached from the binding and
> - * cannot finish unregistering until net_devmem_unlock_dev().
> + * NETDEV_UNREGISTER and ndo_uninit before freeing the net_device), so
> + * netdev_hold() can safely acquire a reference before sleeping on
> + * netdev_lock(). Once netdev_lock() is held, re-checking that
> + * READ_ONCE(*dev_ptr) == dev guarantees that the device has not yet been
> + * detached from the binding and cannot finish unregistering until
> + * net_devmem_unlock_dev().
>   *
>   * Return: The locked and held net_device if *@dev_ptr is still non-NULL,
>   * or NULL if already cleared.
> @@ -219,22 +220,24 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	if (binding->list.next)
>  		list_del(&binding->list);
>  
> -	xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
> -		const struct pp_memory_provider_params mp_params = {
> -			.mp_priv	= binding,
> -			.mp_ops		= &dmabuf_devmem_ops,
> -		};
> +	if (binding->bind_dev) {
> +		xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
> +			const struct pp_memory_provider_params mp_params = {
> +				.mp_priv	= binding,
> +				.mp_ops		= &dmabuf_devmem_ops,
> +			};
>  
> -		rxq_idx = get_netdev_rx_queue_index(rxq);
> +			xa_erase(&binding->bound_rxqs, xa_idx);

What's the reason we start xa_erase'ing here?

> +			rxq_idx = get_netdev_rx_queue_index(rxq);
>  
> -		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
> -			busy = true;
> -	}
> +			if (netif_mp_close_rxq(binding->bind_dev, rxq_idx,
> +					       &mp_params))
> +				busy = true;
> +		}
>  
> -	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
> -	    !busy) {
> -		net_devmem_dmabuf_binding_unmap(binding);
> -		WRITE_ONCE(binding->map_dev, NULL);
> +		if (binding->direction == DMA_FROM_DEVICE && !busy)
> +			net_devmem_dmabuf_binding_unmap(binding);
> +		WRITE_ONCE(binding->bind_dev, NULL);
>  	}
>  
>  	percpu_ref_kill(&binding->ref);
> @@ -252,24 +255,20 @@ void net_devmem_dev_unregister(struct net_device *dev)
>  
>  	xa_lock(&net_devmem_dmabuf_bindings);
>  	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> -		if (binding->direction == DMA_FROM_DEVICE) {
> -			if (READ_ONCE(binding->map_dev) != dev ||
> -			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> -					NET_DEVMEM_BINDING_LIVE))
> -				continue;
> -		} else {
> -			if (READ_ONCE(binding->bind_dev) == dev)
> -				WRITE_ONCE(binding->bind_dev, NULL);
> -			if (READ_ONCE(binding->map_dev) != dev)
> -				continue;
> -			WRITE_ONCE(binding->bind_dev, NULL);
> +		if (READ_ONCE(binding->bind_dev) == dev) {
>  			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>  					NET_DEVMEM_BINDING_LIVE);
> +			if (xa_empty(&binding->bound_rxqs) ||
> +			    !netif_is_queue_leasee(dev))
> +				WRITE_ONCE(binding->bind_dev, NULL);
>  		}
> +		if (READ_ONCE(binding->map_dev) != dev)
> +			continue;
>  
> +		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +				NET_DEVMEM_BINDING_LIVE);
>  		xa_unlock(&net_devmem_dmabuf_bindings);
> -		if (!netif_is_queue_leasee(dev))
> -			net_devmem_dmabuf_binding_unmap(binding);
> +		net_devmem_dmabuf_binding_unmap(binding);
>  		xa_lock(&net_devmem_dmabuf_bindings);
>  		WRITE_ONCE(binding->map_dev, NULL);
>  	}
> @@ -324,6 +323,15 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
>  	size_t i;
>  	long err;
>  
> +	netdev_assert_locked(bind_dev);
> +	netdev_assert_locked(map_dev);
> +

[..]

> +	if (bind_dev->reg_state != NETREG_REGISTERED ||
> +	    map_dev->reg_state != NETREG_REGISTERED) {
> +		NL_SET_ERR_MSG(extack, "Device is being unregistered");
> +		return ERR_PTR(-ENODEV);
> +	}

I saw Dragos asking about these, I'm confused as well on why we need them.

> +
>  	if (!dma_dev) {
>  		NL_SET_ERR_MSG(extack, "Device doesn't support DMA");
>  		return ERR_PTR(-EOPNOTSUPP);
> @@ -560,9 +568,9 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
>  	 * net_device.
>  	 */
>  	dst_dev = dst_dev_rcu(dst);
> -	if (unlikely(!dst_dev) ||
> -	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
> -		     dst_dev != READ_ONCE(binding->bind_dev))) {
> +	if (unlikely(!dst_dev || !READ_ONCE(binding->map_dev) ||
> +		     (dst_dev != READ_ONCE(binding->map_dev) &&
> +		      dst_dev != READ_ONCE(binding->bind_dev)))) {

Now we READ_ONCE(map_dev) twice? Time to add a map_dev var and do it once?
