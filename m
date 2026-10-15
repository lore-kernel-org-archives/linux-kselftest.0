Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A7E4EC662
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100098; cv=none; b=FWmfL81FCQO3EIooBuY7GGpamwJZAgjvxu0W7K3fzBfCmxGdimeZaUSWeBDcS4wvdhYKqARhoL0g6ROvHW6ezsUxUvWzb2VKkvdOlhwufrSxOiL9A4Dz92wfV4kdEbhRlkBOIj73X7/OrV7uXQ/FLKtQQ8nJ38kIKaj2UG3cTW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100098; c=relaxed/simple;
	bh=3Lx9vE7yCD77ah7rBA67Wk4a1OpFreWj6zV9y194fo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzXzE5tmv54sZUgWPeoniOwLiN3vtCKopLx7j7bA75vvzvGk+bNkHD4VmO+B5BTFmK7c2KwMO8G1aZWIgROh9CocfYPHkQ+HYZ4VIBc4IxjGTuUJ43aY9zGBu0H6VI+kXpK8Gouwip1Ua9IhccHTvBCUQwun4ZnFwuQ7whqimWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5TJRbX1; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5TJRbX1"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1098354a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100096; x=1792704896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZG9EBmOo2wE4WN4qlbtoGqOgHUEOnJauUtDZZ8S+A4=;
        b=E5TJRbX1C5L03JI06tIK4Ho24uMpmb16RuLUJfV05lRrOyX1fuo1S2LuSdsdMcm7wz
         cyILr3N/VRyAmy4OmWm7iA5Wx8X/M/LRRbavJKf/Fk7mToTYU2dPgTiMon++oSa6vRap
         JRv8vINqmIMN85vkjGXgqEQad6cTQ4gu+Z60NCzNTgKuq3nvg939IW5F66ex5a+JmB+p
         JT9EUXrzSDIOdKRU1JniyZzrgofWQcCrSDAchj803lw9TyYgUb1IgJ+A9OHycYBMuwzN
         xpm7VWGhCMnu+Bl1A8rDzuFV9vbRKmWyJ1ewipHk9k8jFx6pHSoXFXm3FnOfq9NPnivj
         kreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100096; x=1792704896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZG9EBmOo2wE4WN4qlbtoGqOgHUEOnJauUtDZZ8S+A4=;
        b=sVydAU1VBaxg/PKHbNonyZi80iTD8Go0/Uw9VfDV179wWbdQotnP7H49f9GXpqU1QR
         wWNX6KPGvRSRpTEHiszlMS+ZWgQXQiHO6PVsD3fmC/3VnEqY8FsVbQehUt20Cr8Ckxhq
         lfwkaQYtwn7CIqMLBC8hRn5+s/+vLxRD8MVMsM3M/Ox1Cu3o+y5kaVXs0DEXDJNgZUH+
         Hvw8SMcN7yQql8qPxwKkQusBH6O9nvDQlUhudWJn2eMTT/DL7G94pVprA4blQxAIF9Tu
         iw1s6sYAKnmIasX47c2Rr3jJaJQh4f7Ncyjc8K2SFTIi9/sNthep+Kv7ZX9JysV9mU7Y
         jeOA==
X-Forwarded-Encrypted: i=1; AKwUvBxCYSzIk25a8kjxWqCQzFuNFZkFIg44MtKfj2BY0d6MGUK/K1EmryhcWAgGmkktAjqZmY8avuZybwumy+oRcJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlVock7IO+g7hxcq7cySCM7sPzRXYNgYsKsuuPLNvqdnmvPbvT
	NCU/wWFsTFrVRbj0i/oa3WcqvSMhk2nm1knT39keXNu6VPXD5hRfT93N
X-Gm-Gg: AYBFou1ulbGRfNJuAznMMl1tBDGjQCY01Cc0ohJP+fXlL3/7WiKLeyoVy/Rb5aiO55x
	YYbmTYk+8woDdU/NKEyGQL5Cm9mrG5QE5iHkEd1WKw3aCvGRg5r6K5vNFLhhGxhd0Qazt8A8aj3
	nzN/v7UMp3aG+O6r1TUsps3jlHwE/Dgt5ypt51K0N/fF4TH2HktmTyaXOeYWDoa+kCA+lm6Y+io
	pFLq+aoTJp8e0Hna49niYVWhzbulNaq3Ft4uHjcVQLsZCMk+oZcPbiI+5oADbhMSoaFrNB/X5Uo
	mtcwCtA4dqhuA/hHZUPfNI5Zuktp4OTANbn4IdDUbVrj8j+gM4/ecUIyJCXAxGsqFETheHVo50J
	pfU5lFrPRKVnrVj0Sp5rHJWoXeYTwr+g8UYhcBb3mLV30m39+Bc5as91XeH5fGarnaS6xNZqVum
	iPERLz9NOHZU+MoHD/iaMtpAP+Of4QSzUhCTg+khg6BW2aCEjC2bgiyOEg4Y0JDGhCWA==
X-Received: by 2002:a05:6a00:ae08:b0:899:53a9:1dd9 with SMTP id d2e1a72fcca58-89953a92059mr11995299b3a.57.1792100096025;
        Thu, 15 Oct 2026 14:34:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5841391esm153438b3a.59.2026.10.15.14.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:34:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:34:12 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Stanislav Fomichev <sdf@fomichev.me>, 
	Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
Message-ID: <atFGd4U3qpq6ZZKY@devvm7509.cco0.facebook.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-2-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015163915.1166043-2-almasrymina@google.com>

On 10/15, Mina Almasry wrote:
> When a bound net_device is unregistered while userspace still holds a
> netlink or TCP socket reference on a devmem binding,
> mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> netdev_nl_sock_priv_destroy() will not touch the unregistered
> net_device, but leaves the dma_buf attachment mapped until
> __net_devmem_dmabuf_binding_free() runs later on socket close.
> 
> Because dma_buf_attach() does not take a reference on dma_dev, device
> removal frees dma_dev while the attachment is still mapped. Closing the
> netlink socket afterwards triggers a slab use-after-free in
> dma_unmap_sg_attrs():
> 
>   BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
>   Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
>   Workqueue: events __net_devmem_dmabuf_binding_free
>   Call Trace:
>    dma_unmap_sg_attrs+0x76/0x2b0
>    unmap_udmabuf+0x8e/0x100
>    dma_buf_unmap_attachment+0x145/0x330
>    dma_buf_unmap_attachment_unlocked+0x96/0x130
>    __net_devmem_dmabuf_binding_free+0x156/0x2e0
>   Freed by task 9:
>    kfree+0x1b8/0x550
>    nsim_bus_dev_release+0xe/0x60
>    device_release+0xcf/0x250
> 
> Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> and null out binding->sgt and binding->attachment after unmapping so
> unmapping is idempotent across queue uninstall and deferred binding
> destruction. Call it synchronously when the last bound RX queue is
> uninstalled in mp_dmabuf_devmem_uninstall(), except when a leased
> queue is unleased: the physical device is still registered and, if
> restarting its queue failed, may still be using the binding.
> 
> The same use-after-free happens when the netlink socket is closed
> before the device is removed but RX tokens keep the binding alive. Once
> its queues are closed, nothing DMAs into an RX binding anymore and the
> outstanding tokens only need the net_iovs, so unmap it in
> net_devmem_unbind_dmabuf(). Make netif_mp_close_rxq() return an error
> when a queue failed to restart and may still be using the binding. Such
> a binding stays mapped and keeps binding->dev. Record a queue in
> bound_rxqs before opening it, so that a failed bind never leaves a
> queue using the binding without unbind knowing about it.
> 
> Keep bindings in net_devmem_dmabuf_bindings until they are freed and
> hide unbound ones from TX lookups with an xarray mark, so that on
> NETDEV_UNREGISTER the remaining unbound RX bindings of the device can be
> found, detached and unmapped, unless the device is a virtual device
> leasing queues, for the same reason as above. The walk runs under the
> device's instance lock and is skipped when the device only moves to
> another netns. Like netdev_nl_sock_priv_destroy(),
> __net_devmem_dmabuf_binding_free() takes the instance lock of
> binding->dev before unmapping and erasing the binding, so a binding the
> walk finds under the xarray lock stays alive while it is detached.
> 
> Fixes: f8350a4358fc ("net: page_pool: add a mp hook to unregister_netdevice*")
> Fixes: 0afc44d8cdf6 ("net: devmem: fix kernel panic when netlink socket close after module unload")
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Taehee Yoo <ap420073@gmail.com>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Assisted-by: LLM
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> ---
> v4:
> - Unmap RX bindings in net_devmem_unbind_dmabuf() once their queues are
>   closed, and make netif_mp_close_rxq() report queue restart failures.
>   The NETDEV_UNREGISTER walk only handles bindings whose queue failed
>   to restart (Stanislav).
> - Drop net_devmem_lock. Walk the bindings under the xarray lock, and
>   take the instance lock of binding->dev in the final free (Stanislav).
> - Record a queue in bound_rxqs before opening it, so unbind knows about
>   every queue using the binding (Sashiko).
> 
> v3:
> - Run the NETDEV_UNREGISTER walk under the netdev instance lock so it
>   cannot race with net_devmem_unbind_dmabuf() (Sashiko).
> - Skip the walk when the device only moves to another netns (Sashiko).
> 
> v2:
> - Don't unmap when a leased queue is unleased (Sashiko).
> - Unmap unbound RX bindings on NETDEV_UNREGISTER; keep bindings in
>   net_devmem_dmabuf_bindings until freed, hidden from TX lookups by
>   NET_DEVMEM_BINDING_LIVE (Sashiko).
> - Update the binding->lock and binding->ref comments (Sashiko).
> ---
>  include/net/page_pool/memory_provider.h |   4 +-
>  net/core/devmem.c                       | 137 +++++++++++++++++++-----
>  net/core/devmem.h                       |  10 +-
>  net/core/netdev-genl.c                  |   1 +
>  net/core/netdev_rx_queue.c              |  26 +++--
>  5 files changed, 140 insertions(+), 38 deletions(-)
> 
> diff --git a/include/net/page_pool/memory_provider.h b/include/net/page_pool/memory_provider.h
> index 255ce4cfd9755..a999a9b28bc70 100644
> --- a/include/net/page_pool/memory_provider.h
> +++ b/include/net/page_pool/memory_provider.h
> @@ -26,8 +26,8 @@ void net_mp_niov_clear_page_pool(struct net_iov *niov);
>  int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  		      const struct pp_memory_provider_params *p,
>  		      struct netlink_ext_ack *extack);
> -void netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
> -			const struct pp_memory_provider_params *old_p);
> +int netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
> +		       const struct pp_memory_provider_params *old_p);
>  
>  /**
>    * net_mp_netmem_place_in_cache() - give a netmem to a page pool
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index f4d60654ce7fd..20d95b24d5951 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -12,6 +12,7 @@
>  #include <linux/mm.h>
>  #include <linux/netdevice.h>
>  #include <linux/types.h>
> +#include <net/netdev_lock.h>
>  #include <net/netdev_queues.h>
>  #include <net/netdev_rx_queue.h>
>  #include <net/page_pool/helpers.h>
> @@ -20,6 +21,7 @@
>  #include <net/tcp.h>
>  #include <trace/events/page_pool.h>
>  
> +#include "dev.h"
>  #include "devmem.h"
>  #include "mp_dmabuf_devmem.h"
>  #include "page_pool_priv.h"
> @@ -27,6 +29,7 @@
>  /* Device memory support */
>  
>  static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
> +#define NET_DEVMEM_BINDING_LIVE XA_MARK_1
>  
>  static const struct memory_provider_ops dmabuf_devmem_ops;
>  
> @@ -58,9 +61,26 @@ static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
>  	schedule_work(&binding->unbind_w);
>  }
>  
> +static void
> +net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
> +{
> +	lockdep_assert_held(&binding->lock);
> +
> +	if (!binding->sgt)
> +		return;
> +
> +	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
> +					  binding->direction);
> +	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	binding->sgt = NULL;
> +	binding->attachment = NULL;
> +}
> +
>  void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
>  {
>  	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
> +	netdevice_tracker dev_tracker;
> +	struct net_device *dev;
>  
>  	size_t size, avail;
>  
> @@ -74,9 +94,23 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
>  		  size, avail))
>  		gen_pool_destroy(binding->chunk_pool);
>  
> -	dma_buf_unmap_attachment_unlocked(binding->attachment, binding->sgt,
> -					  binding->direction);
> -	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	mutex_lock(&binding->lock);
> +	dev = binding->dev;
> +	if (dev)
> +		netdev_hold(dev, &dev_tracker, GFP_KERNEL);
> +	mutex_unlock(&binding->lock);
> +
> +	if (dev)
> +		netdev_lock(dev);
> +	mutex_lock(&binding->lock);
> +	net_devmem_dmabuf_binding_unmap(binding);
> +	mutex_unlock(&binding->lock);
> +	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> +	if (dev) {
> +		netdev_unlock(dev);
> +		netdev_put(dev, &dev_tracker);
> +	}
> +
>  	dma_buf_put(binding->dmabuf);
>  	xa_destroy(&binding->bound_rxqs);
>  	percpu_ref_exit(&binding->ref);
> @@ -128,11 +162,13 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	struct netdev_rx_queue *rxq;
>  	unsigned long xa_idx;
>  	unsigned int rxq_idx;
> +	bool busy = false;
>  
> -	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> +	xa_clear_mark(&net_devmem_dmabuf_bindings, binding->id,
> +		      NET_DEVMEM_BINDING_LIVE);
>  
>  	/* Ensure no tx net_devmem_lookup_dmabuf() are in flight after the
> -	 * erase.
> +	 * mark is cleared.
>  	 */
>  	synchronize_net();
>  
> @@ -147,12 +183,62 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  
>  		rxq_idx = get_netdev_rx_queue_index(rxq);
>  
> -		netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params);
> +		if (netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params))
> +			busy = true;
> +	}
> +
> +	if (binding->direction == DMA_FROM_DEVICE && binding->dev && !busy) {
> +		mutex_lock(&binding->lock);
> +		WRITE_ONCE(binding->dev, NULL);
> +		net_devmem_dmabuf_binding_unmap(binding);
> +		mutex_unlock(&binding->lock);
>  	}
>  
>  	percpu_ref_kill(&binding->ref);
>  }
>  

[..]

> +static bool
> +net_devmem_dev_unregister_rx(struct net_devmem_dmabuf_binding *binding,
> +			     unsigned long xa_idx, struct net_device *dev)
> +{
> +	return binding->direction == DMA_FROM_DEVICE &&
> +	       READ_ONCE(binding->dev) == dev &&
> +	       !xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +			    NET_DEVMEM_BINDING_LIVE);
> +}

super nit: if you happen to respin, I'd just open code this part in
net_devmem_dev_unregister, it reads funny to me idk, but maybe it's just me.
But even as is LGTM, thanks!

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
