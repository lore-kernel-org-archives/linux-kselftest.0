Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204018;
	b=t08cQmplmJeAkD1/VCAbxmb4aM85/d1rq4SPsXWqvYzyk/TCplqTHbO5+Ca/w6JFYx1t
	 jly0KurizoqFokKkjT/cZZaUcAmroWtOPnzUlU0VWka7bCR+Yl7ss/auqfYX2ZgwzvIYQ
	 3cJ01UDk3wGp15Vf/O4PKkKWePbob3lqHycVYLWpyA+hUalonowZd5v3Lb9fug5hZw/DO
	 h9SsKAKjFQT5N6w4Mm5WN2gPOXhSpQvw16dw+/gMrZ+7PdWYmzydKxmcx/IUW+7myldGS
	 M3YMvZYRimz2jvrhdyZpC7cfi07N8cDZg6cVp6H6qoL7jmqcLkb12z1KMXCWytOsNdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204018;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qubYjXY2vptnpAVqagUiJ2qxHAQ4vMZJBnWCWzokVjA=;
	b=xVqlkcWhFURKFa5Qyt02AYFQJH9L8R2bYqAm79ewDe+AKeAGSZDmRbLTQFff3oqvVA1W
	 Imap+kTGCWX/qok4D3jCy2MB0dYhtVlnhmpCNh4lv1qM/qUDj85crHFWzhZsKdcGMG51x
	 O+Dnc/mRbdScwWdH0WMORiam0LNgqJik+8QHAJxUdBgpZGqMQjL3tqR8aHQpzZF7PLEPD
	 mN0HnVvQsTjUCOFPLRFPdTn9QDrfS58Mhbp3gUJK245BohV9giPfUOpIR3X4HgAl0bB04
	 0Wspvd0NI5unj6P1RuD+fdmeLXV/75D9gyJXQEZ8ybl8bXewLivLHcdrRhzsS/MeDpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrLbrDBr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73489606A337;
	Mon,  9 Nov 2026 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RrLbrDBr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F8B1F008A1;
	Mon,  9 Nov 2026 06:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204018;
	bh=qubYjXY2vptnpAVqagUiJ2qxHAQ4vMZJBnWCWzokVjA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RrLbrDBrTTfZLLtOI+wHw4N3b09v1iPoUqWV82zGDXZClGr120nbboxL+Ku0Va9N2
	 FaxC1ajIhXJKNSaQb6/Q095DCXi8lnUHaVZJYF/y0e3GT1b5Lr1pXn7uPJsuOeMf7I
	 x7VPboHn7PdGzrRWDu2z0P6NxT91rF99OzA4hq6rPBRtLx8efVAiIlWluQju87LJdO
	 bHRTHCmdsUqL1/KlZ8IHvWsz5r8jF79EDZlA1FODTyKn2tirfRzcHL0fo2y3Bl0ihv
	 RRtTx2Wk5pXt14fAWwP2gkCtDvapd8yU3wwFyUG+fcFkAz8rMbsdXeJWnxa4KlYmLX
	 7GzeAR/TfOz+Q==
Subject: Re: [PATCH net-next v2 5/6] net: devmem: resolve physical map_dev for
 leased RX bindings
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel@iogearbox.net, razor@blackwall.org, dw@davidwei.uk,
 sdf.kernel@gmail.com, bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 09 Nov 2026 06:00:16 +0000
Message-ID: <179420401662.994134.8611720170424449790@kernel.org>
In-Reply-To: <20261108055809.2122934-6-almasrymina@google.com>
References: <20261108055809.2122934-6-almasrymina@google.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch fixes a use-after-free that predates the series,
  but the commit message understates it and has no Fixes: tag.
- [Medium] The series is not bisectable: the previous patch breaks leased
  RX bindings, and this patch fixes that without saying so.

--

net: devmem: resolve physical map_dev for leased RX bindings

For leased RX queues, netdev_nl_bind_rx_doit() now passes the physical
backing netdev (rxq->lease->dev) as map_dev, and locks it around
net_devmem_bind_dmabuf(). net_devmem_bind_dmabuf() now asserts that
both devices are locked. It also refuses to bind when map_dev is no
longer NETREG_REGISTERED.

> Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
> bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
> virtual netdev in binding->map_dev without tracking the physical backing
> netdev at all. Unregistering the physical backing netdev while a leased
> RX binding was active failed to detach and unmap the dmabuf.

[Severity: Medium]
Does "failed to detach and unmap the dmabuf" understate the problem?

Before this series, a leased RX binding only referenced the netkit
device. Unregistering the physical device then goes like this:

net_devmem_dev_unregister(phys)
    binding->dev never matches phys
dev_memory_provider_uninstall(phys)
    mp_dmabuf_devmem_uninstall(phys_rxq)
        bound_rxqs only holds the virtual rxq, so nothing happens

Later, netkit_uninit()->netkit_queue_unlease()->netif_rxq_cleanup_unlease()
calls mp_dmabuf_devmem_uninstall(virt_rxq) while rxq->lease is still set:

    if (!rxq->lease)
        net_devmem_dmabuf_binding_unmap(binding);

The unmap is skipped and binding->dev is set to NULL. On socket close,
net_devmem_unbind_dmabuf() skips the unmap too, because binding->dev is
NULL.

The attachment stays mapped against the physical device's dma_dev
until __net_devmem_dmabuf_binding_free() calls
net_devmem_dmabuf_binding_unmap().

c4466d2c3e77 ("net: devmem: unmap dma_buf synchronously on queue
uninstall") notes that dma_buf_dynamic_attach() takes no reference on
dma_dev. Once the physical device is gone, isn't that final unmap a
use-after-free in dma_unmap_sg_attrs()?

If so, could the commit message name the use-after-free and carry
Fixes: tags? Candidates are 222b5566a02d ("net: Proxy
netdev_queue_get_dma_dev for leased queues"), which enabled devmem
binding through leased queues, and c4466d2c3e77, which kept the leasee
exception in mp_dmabuf_devmem_uninstall(). Without a Fixes: tag, stable
selection would likely miss this.

> diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> index 9e56c26fc65f9..442362f23fe88 100644
> --- a/net/core/netdev-genl.c
> +++ b/net/core/netdev-genl.c

[ ... ]

> @@ -1104,16 +1112,21 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
>  	if (err)
>  		goto err_rxq_bitmap;
>  
> -	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, info->extack);
> +	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, &map_dev,
> +					info->extack);
>  	if (IS_ERR(dma_dev)) {
>  		err = PTR_ERR(dma_dev);
>  		goto err_rxq_bitmap;
>  	}
>  
> -	binding = net_devmem_bind_dmabuf(netdev, netdev, dma_dev,
> +	if (map_dev != netdev)
> +		netdev_lock(map_dev);
> +	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,

[Severity: Medium]
Is the series bisectable at the previous patch, "net: devmem: always
populate bind_dev and detach both devices on unregister"?

That patch dropped the netif_is_queue_leasee(dev) guard from
net_devmem_dev_unregister(). It now unmaps whenever map_dev matches:

    if (READ_ONCE(binding->map_dev) != dev)
        continue;
    ...
    net_devmem_dmabuf_binding_unmap(binding);

At that commit, this call still passed (netdev, netdev). For a leased
RX binding, map_dev == bind_dev == the netkit device.

Now delete the netkit device while the physical NIC stays up:

unregister_netdevice_many_notify()
    NETDEV_UNREGISTER
        netdev_genl_netdevice_event()
            net_devmem_dev_unregister(netkit)
                net_devmem_dmabuf_binding_unmap()  <- unmap, unpin, detach
    ndo_uninit
        netkit_uninit()
            netkit_queue_unlease()
                netif_rxq_cleanup_unlease()
                    __netif_mp_close_rxq(phys)

In that window, can the physical NIC's page pool still hand out
net_iovs whose DMA addresses come from the unmapped, unpinned sgt?

If __netif_mp_close_rxq() fails to restart the queue (the case
c4466d2c3e77 guarded against), the window never closes.

This patch fixes that by moving map_dev to rxq->lease->dev. The commit
message only describes the physical-unregister case, though.

Could the two patches be squashed or reordered, so the leasee guard is
dropped only once map_dev is the physical device? Failing that, could
the commit message mention this fix?

>  					 DMA_FROM_DEVICE, dmabuf_fd,
>  					 niov_shift, priv, NETLINK_CB(skb).sk,
>  					 info->extack);
> +	if (map_dev != netdev)
> +		netdev_unlock(map_dev);
>  	if (IS_ERR(binding)) {
>  		err = PTR_ERR(binding);
>  		goto err_rxq_bitmap;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108055809.2122934-1-almasrymina%40google.com
