Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F548665F;
	Thu, 15 Oct 2026 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092068; cv=none; b=nJq0bovgZ5q/9WaAqWF01TxdPkXzjON9sadZ2aUF0vEPNF2iPfmCK1qmBloNTqLYiA8kZ0bjilvovIm7L6fFL0TGyxHWIgRAgfx3w26tmOm3Rpzm9IfVQ+LTHI2W/VTtkiYEgPqUI13b5re8yynsD1Wvr2hnzBlQToweGsgi6qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092068; c=relaxed/simple;
	bh=pVqBf8/Bel0Tuvq/cyntrJls7clQ7ruEVjJAVmV+rZk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QfJpGGevAiHV+4RtS+s5lbIP8XK0WgwJK3/U36CVrYvGBV2zKCDOgit31oDkDoZN8+Pu9Du2HSpnyaDgfhy3zpfDZjnxI0i7DDhXM/NInw0Q5Z6folA1ME+3s/PnED4AHhMj+6FHnBatu7GKr8UumgeBz5EbWHJbxceW04HyJpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFUmVInt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFUmVInt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C411F000C4;
	Thu, 15 Oct 2026 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792092066;
	bh=mp8ADs0Pjba4FNiv5X0qxkpn/NYTL/M+4WAtZihv59o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AFUmVIntzTogl/MeQVB4R0AOTMbgJmnAoU1Mnsp5g0HlrK2TH6YndBz7kWEvj0iJn
	 VU8MdgLL8LGZb/EPhsilq3y2sZ2cbbdZ63WCegYEQExnrUKkqEb/TpSnOoaaobi0b9
	 r3ALCZzh8rtLSHH0TqYlPdMWH0BQZkKwvUBz4HhFeWxD0X0HKRHYre20UIuptFsN+U
	 JMaUBdgWeUwAfHJOEmdj5RV+3YCmHiQ8A7n3wKA3PHzoIMTPOmsVSIzz2rtEhCPcol
	 rdaGdL/BqmALKQTssYODcaiMuaxj64nSLDnRdHpghafxtm7VFEiRMvCzB4MMp7Nx/H
	 iEexDWrXB+s5Q==
Subject: Re: [PATCH net v3 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: kuba@kernel.org, asml.silence@gmail.com, dw@davidwei.uk, sdf@fomichev.me,
 ap420073@gmail.com, pabeni@redhat.com, kaiyuanz@google.com,
 bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, shuah@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@iogearbox.net,
 razor@blackwall.org, tariqt@nvidia.com, kaifengw@google.com,
 dtatulea@nvidia.com
Date: Thu, 15 Oct 2026 19:21:04 +0000
Message-ID: <179209206477.434549.12960086553517991706@kernel.org>
In-Reply-To: <20261014161754.3782346-2-almasrymina@google.com>
References: <20261014161754.3782346-2-almasrymina@google.com>
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
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] RX bindings made through a leased queue (a netkit virtual device
  leasing a physical NIC's rxq) still hit the dma_unmap_sg_attrs() use-…

Pre-existing issues:
- [Low] This patch handles only DMA_FROM_DEVICE bindings when a device is
  unregistered.

--

net: devmem: unmap dma_buf synchronously on queue uninstall

This commit unmaps the devmem dma_buf attachment when the last bound RX
queue is uninstalled. Previously the unmap waited for the deferred binding
free, which could run after dma_dev had already been freed. It also keeps
bindings in net_devmem_dmabuf_bindings until they are freed, hides unbound
ones from TX lookups with an xarray mark, and unmaps unbound RX bindings
on NETDEV_UNREGISTER, except for leased queues.

> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index f4d60654ce7fd..93cc2815d935a 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c

[ ... ]

> @@ -153,6 +176,38 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)

[ ... ]

> +void net_devmem_dev_unregister(struct net_device *dev)
> +{
> +	struct net_devmem_dmabuf_binding *binding;
> +	unsigned long xa_idx;
> +
> +	if (dev->reg_state != NETREG_UNREGISTERING)
> +		return;
> +
> +	mutex_lock(&net_devmem_lock);
> +	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> +		if (binding->direction == DMA_FROM_DEVICE)
> +			net_devmem_dev_unregister_rx(binding, xa_idx, dev);

[Severity: Low]
This isn't a bug introduced by this patch, but TX bindings are skipped
here. They are never installed on an rxq either, so
mp_dmabuf_devmem_uninstall() never runs for them.

After the NIC is unregistered, a TX binding created through bind-tx still
has three things: its dma_buf mapping against the NIC's dma_dev, the
NET_DEVMEM_BINDING_LIVE mark, and stale binding->dev and binding->vdev
pointers.

Can a later netdev_nl_sock_priv_destroy() then call netdev_hold() and
netdev_lock() on the freed net_device? Could
__net_devmem_dmabuf_binding_free() also unmap against the freed dma_dev?
net_devmem_get_binding() would compare against the stale dev and vdev
pointers too.

The next patch in the series, "net: devmem: detach TX bindings on
NETDEV_UNREGISTER", appears to fix this. It adds
net_devmem_dev_unregister_tx(), which clears the LIVE mark and dev/vdev.
It also adds net_devmem_unmap_detached_tx(), which unmaps after
synchronize_net().

> +	}
> +	mutex_unlock(&net_devmem_lock);
> +}

[ ... ]

> @@ -529,16 +588,19 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
>  	unsigned long xa_idx;
>  
>  	xa_for_each(&binding->bound_rxqs, xa_idx, bound_rxq) {
> -		if (bound_rxq == rxq) {
> -			xa_erase(&binding->bound_rxqs, xa_idx);
> -			if (xa_empty(&binding->bound_rxqs)) {
> -				mutex_lock(&binding->lock);
> -				ASSERT_EXCLUSIVE_WRITER(binding->dev);
> -				WRITE_ONCE(binding->dev, NULL);
> -				mutex_unlock(&binding->lock);
> -			}
> -			break;
> +		if (bound_rxq != rxq)
> +			continue;
> +
> +		xa_erase(&binding->bound_rxqs, xa_idx);
> +		if (xa_empty(&binding->bound_rxqs)) {
> +			mutex_lock(&binding->lock);
> +			ASSERT_EXCLUSIVE_WRITER(binding->dev);
> +			WRITE_ONCE(binding->dev, NULL);
> +			if (!rxq->lease)
> +				net_devmem_dmabuf_binding_unmap(binding);

[Severity: High]
Can RX bindings on a leased queue still hit the dma_unmap_sg_attrs()
use-after-free described in the commit message?

Take a bind-rx on a netkit rxq leased from a physical NIC.
netdev_nl_bind_rx_doit() gets dma_dev from netdev_queue_get_dma_dev(),
which returns the physical NIC's DMA device. But binding->dev is the
netkit device, and bound_rxqs holds the netkit rxq.

On unlease, the lease pointers are cleared only after cleanup has run:

netdev_rx_queue_unlease()
    netif_rxq_cleanup_unlease(rxq_src, rxq_dst)
        __netif_mp_uninstall_rxq(virt_rxq, &p)
            mp_dmabuf_devmem_uninstall()
                WRITE_ONCE(binding->dev, NULL);
                if (!rxq->lease)   <-- lease still set, unmap skipped
    WRITE_ONCE(rxq_src->lease, NULL);
    WRITE_ONCE(rxq_dst->lease, NULL);
    netdev_put(rxq_src->dev, &rxq_src->lease_tracker);

net_devmem_dev_unregister_rx() does the same for unbound bindings,
because netif_is_queue_leasee() is true for netkit:

	WRITE_ONCE(binding->dev, NULL);
	if (!netif_is_queue_leasee(dev))
		net_devmem_dmabuf_binding_unmap(binding);

Once binding->dev is NULL, it seems nothing can unmap the binding before
the final free. When the physical NIC unregisters later,
dev_memory_provider_uninstall() passes the physical rxq, which is not in
bound_rxqs. net_devmem_dev_unregister() matches only on binding->dev,
which is never the physical device.

For example: with the netlink socket open, delete the netkit device,
remove the physical NIC, and then close the socket:

net_devmem_unbind_dmabuf()
  percpu_ref_kill()
    __net_devmem_dmabuf_binding_free()
      net_devmem_dmabuf_binding_unmap()     <-- sgt still non-NULL
        dma_buf_unmap_attachment_unlocked() <-- freed physical dma_dev

The commit message gives this reason for skipping the unmap:

  "the physical device is still registered"

Is that still accurate when the physical NIC is unregistered first? In
that case netkit_check_lease_unregister() unregisters the netkit device
from inside the physical NIC's own NETDEV_UNREGISTER. The unlease skip
then happens while the physical device is already NETREG_UNREGISTERING.

Closing the socket first while RX tokens keep the binding alive seems to
end the same way. The netkit unregister clears binding->dev through
net_devmem_dev_unregister_rx() without unmapping. Once the physical NIC
is removed, the last token release unmaps against the freed dma_dev.

For leased queues, would the binding need to track the physical device,
or be unmapped against it?

> +			mutex_unlock(&binding->lock);
>  		}
> +		break;
>  	}
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014161754.3782346-1-almasrymina%40google.com
