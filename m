Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BB416CFD
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676439; cv=none; b=nDyI7v/KHHHBRTXEtcWHVOs62ttf00qgy8GG5hVuk9iI3lrOXTn86+j7ZmEfgD1T9TuRcbQ9Luq7nFTtezAoADH0/ICCMqmBsGFnIz5IePF2RID2FD6pFrZs7hsB58XvW5DgZYw9+aEpfz2t9B+Z5C7bDhktLcteiOuT0b0/nTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676439; c=relaxed/simple;
	bh=SsQfeurk4ed9hQnsOPWLl1nA8N6jtyUDvGh7S2vpuFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKLqqOmcNJ5HZvw7Lw/5CVBvA03oL55TP+NhcUH0f9ZU19dRxQNf/RSW3pqJWwlsg1NFjTTiMNYDCEpVRzUWmEOnNIcjhdQvBvPH7zZAHOuE5baGkPC0Z6vKAvVtafCOiONUPImLngl3pW4nGmhvyl61HqvrBAdhfd4+uJGam+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF8O5wdl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF8O5wdl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf1f074a12so21866655ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780676437; x=1781281237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mql6HNKVt0P+1uPegRUW8zlGYKpmXHvNpDN0uRKtg58=;
        b=EF8O5wdlEzY6OBlkhry+7oUoAvDlT+f+Fhe+3NJ7Ug+OQ8c85+fP1wWZA9b1TCeS+8
         e6+c/EgcUQ0q0LkR5x2Yu5rgddrrdz5RmLV83V/2nSi9LxdcWQ7fubrMeMzig+L3gY+6
         jx34sSAzyxiXqY8GcU4b4s//gJ96dH0Xp4YbVujrZMP0dlDByvSEm2uBXbX+Gbjn7dKt
         F6y5gzO1MiEaSt0efIo4wqlOfHiHY2ZN1fPitd88NMGooE9VMTzuGtuCOjseGVVUhkM/
         Tcg3f+b1a2l/eqqR9+ezRSxzyLXTOAxLNDoBVMe11Ai0NDbeoKqpQUETvcrkwSLTdwIa
         R5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676437; x=1781281237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mql6HNKVt0P+1uPegRUW8zlGYKpmXHvNpDN0uRKtg58=;
        b=RLfl/BjAO+0T8MTY9U9ztNPQ+jTKTkTpWiKlDdyot9oZggtUrpwY5Tx1bua/832xzO
         gnbV0nwP9VpBNiqSRH3TSn7QGnM1a8SJFLNoufFjRDZNFfFnQPGolVMGsOER1Lzqsh5I
         6TxTt5I3qUvaHg5WYSSuiYt+Leh4bYiZbiUal8voj8xPFehyg1LqpyFmgCCn0XyYDzfK
         XUiMV+AEpOOG7szKhahVdm82WQ0U+wYZo8EmTpD+KhAWsj/1qHcBaRRfPXNdgXuOjU2t
         x3xs1VPaxyidhcz+B1mehZgsJsESN1OFyJgy0dppP6hJL8igiZhApnABsfjWM3gc5304
         y2/Q==
X-Forwarded-Encrypted: i=1; AFNElJ++zAi7mFPyXwbk4YXtgIG9OsUPXXElgmVkgq3/eOH3Qyte2Wqx6MiohbCeBBmWmmka6BVZZyRXh2IPa3rL7EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPcUAF3vzL6pDe/mKykIhDWmgrgzMawgdaUY1JnluS12xcOdM9
	Sn6AYk1sW15m4JhtzlqjqSXXuFI6OjfQj8SO4dLgNyG3vuE+7OwG6kJ2
X-Gm-Gg: Acq92OFBR6VPALMNS4d7h/59TKKsingdxZnWJ5eGcAGMwi782mjgOEls/8WAO+MHFf1
	0Y45vhbEaeZEwSuGBZ942AR70U8GGs2hCcS1gwfoyT1/KuzDxvEC4l4iD/3F1v8KmAwx6bO9R9g
	8HDmrkvFhrj0MT7z93z7Y/x1hWNf4X8y9sdhMCulrDxSNfKB17jECEaz6OAq3mPDUJb/PVg5c5b
	1fn5Hy/URB5kRLn75gKE0vdUaEqvB3v7B3pm/z3IAeWRlIUxs+cABpCLleTg/JVaMYdAgxzGAqE
	80oDK1DmxwUGNJCvvSVWYlPpIq9pPg99j5veDFhSndKv3elsXYXvU3kqVBc3lPO8rFohEGrQuuA
	7K17ftJ6WKBkvS7885fWCaF0amO+qWZ4o0ZqaWhskwR0HNW9CnTBT8gR9oDCwrPhlHlE3e4k6EB
	l1a7uPS5U6wR4mtDZsJhbYz51mrOtqq9qi0GQYvU2HR/BgfJrQQnhh8X8=
X-Received: by 2002:a17:903:2c0e:b0:2bf:356f:4e17 with SMTP id d9443c01a7336-2c1e821d398mr55753675ad.13.1780676437322;
        Fri, 05 Jun 2026 09:20:37 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa404fsm97497065ad.37.2026.06.05.09.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:20:36 -0700 (PDT)
Date: Fri, 5 Jun 2026 09:20:32 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 1/4] net: devmem: allow rx-buf-size > PAGE_SIZE
 per dmabuf binding
Message-ID: <aiL3UM9aULBypEk7@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-1-f37a4ac6726c@meta.com>
 <aiLrsLM8N0VzrNMe@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLrsLM8N0VzrNMe@devvm7509.cco0.facebook.com>

On Fri, Jun 05, 2026 at 08:33:04AM -0700, Stanislav Fomichev wrote:
> On 06/03, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> > This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> > churn for large flows.
> > 
> > Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> > lets userspace request a larger niov size. The value must be a power of
> > two >= PAGE_SIZE.
> > 
> > Measurements
> > ------------
> > Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
> > dctcp, num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov
> > size, mlx5.
> > 
> > CPU Util:
> > 
> >    niov        net sirq %        net idle %         app sys %        app idle %
> >   -----  ----------------  ----------------  ----------------  ----------------
> >      4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/- 10.53
> >     16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-  9.24
> >     32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-  3.65
> >     64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-  3.27
> > 
> > RX app sys % drops ~19% from 4K to 64K.
> > 
> > Throughput:
> > 
> >    niov       RX dev Gbps   RX flow avg Gbps
> >   -----  ----------------  -----------------
> >      4K  300.63 +/- 53.21    75.16 +/- 13.30
> >     16K  321.35 +/- 28.20    80.34 +/-  7.05
> >     32K  347.63 +/-  2.20    86.91 +/-  0.55
> >     64K  332.11 +/- 14.26    83.03 +/-  3.56
> > 
> > Throughput seems to increase, but the stdev is pretty wide so could just
> > be noise.
> > 
> > kperf support (not yet merged):
> > https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  Documentation/netlink/specs/netdev.yaml |  8 +++++
> >  include/uapi/linux/netdev.h             |  1 +
> >  net/core/devmem.c                       | 52 +++++++++++++++++++--------------
> >  net/core/devmem.h                       | 13 ++++++---
> >  net/core/netdev-genl-gen.c              |  5 ++--
> >  net/core/netdev-genl.c                  | 18 ++++++++++--
> >  tools/include/uapi/linux/netdev.h       |  1 +
> >  7 files changed, 68 insertions(+), 30 deletions(-)
> > 
> > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> > index a1f4c5a561e9..063119907983 100644
> > --- a/Documentation/netlink/specs/netdev.yaml
> > +++ b/Documentation/netlink/specs/netdev.yaml
> > @@ -591,6 +591,13 @@ attribute-sets:
> >          type: u32
> >          checks:
> >            min: 1
> > +      -
> > +        name: rx-buf-size
> > +        doc: |
> > +          Size in bytes of each RX buffer the NIC writes into from the bound
> > +          dmabuf. Must be a power of two and >= PAGE_SIZE; defaults to
> > +          PAGE_SIZE.
> > +        type: u32
> >  
> >  operations:
> >    list:
> > @@ -805,6 +812,7 @@ operations:
> >              - ifindex
> >              - fd
> >              - queues
> > +            - rx-buf-size
> >          reply:
> >            attributes:
> >              - id
> > diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
> > index 7df1056a35fd..180a4ffffd60 100644
> > --- a/include/uapi/linux/netdev.h
> > +++ b/include/uapi/linux/netdev.h
> > @@ -217,6 +217,7 @@ enum {
> >  	NETDEV_A_DMABUF_QUEUES,
> >  	NETDEV_A_DMABUF_FD,
> >  	NETDEV_A_DMABUF_ID,
> > +	NETDEV_A_DMABUF_RX_BUF_SIZE,
> >  
> >  	__NETDEV_A_DMABUF_MAX,
> >  	NETDEV_A_DMABUF_MAX = (__NETDEV_A_DMABUF_MAX - 1)
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 957d6b96216b..5a1c0d7984a8 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -46,7 +46,7 @@ static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
> >  
> >  	owner = net_devmem_iov_to_chunk_owner(niov);
> >  	return owner->base_dma_addr +
> > -	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
> > +	       ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shift);
> >  }
> >  
> >  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
> > @@ -93,13 +93,14 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> >  	ssize_t offset;
> >  	ssize_t index;
> >  
> > -	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
> > +	dma_addr = gen_pool_alloc_owner(binding->chunk_pool,
> > +					1UL << binding->niov_shift,
> >  					(void **)&owner);
> >  	if (!dma_addr)
> >  		return NULL;
> >  
> >  	offset = dma_addr - owner->base_dma_addr;
> > -	index = offset / PAGE_SIZE;
> > +	index = offset >> binding->niov_shift;
> >  	niov = &owner->area.niovs[index];
> >  
> >  	niov->desc.pp_magic = 0;
> > @@ -113,12 +114,13 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
> >  {
> >  	struct net_devmem_dmabuf_binding *binding = net_devmem_iov_binding(niov);
> >  	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
> > +	size_t niov_size = 1UL << binding->niov_shift;
> >  
> >  	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
> > -				       PAGE_SIZE)))
> > +				       niov_size)))
> >  		return;
> >  
> > -	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
> > +	gen_pool_free(binding->chunk_pool, dma_addr, niov_size);
> >  }
> >  
> >  void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
> > @@ -163,6 +165,9 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> >  	u32 xa_idx;
> >  	int err;
> >  
> > +	if (binding->niov_shift != PAGE_SHIFT)
> > +		mp_params.rx_page_size = 1U << binding->niov_shift;
> > +
> >  	err = netif_mp_open_rxq(dev, rxq_idx, &mp_params, extack);
> >  	if (err)
> >  		return err;
> > @@ -184,14 +189,16 @@ struct net_devmem_dmabuf_binding *
> >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  		       struct device *dma_dev,
> >  		       enum dma_data_direction direction,
> > -		       unsigned int dmabuf_fd, struct netdev_nl_sock *priv,
> > +		       unsigned int dmabuf_fd, unsigned int niov_shift,
> > +		       struct netdev_nl_sock *priv,
> >  		       struct netlink_ext_ack *extack)
> >  {
> >  	struct net_devmem_dmabuf_binding *binding;
> > +	size_t niov_size = 1UL << niov_shift;
> >  	static u32 id_alloc_next;
> > +	unsigned int sg_idx, i;
> >  	struct scatterlist *sg;
> >  	struct dma_buf *dmabuf;
> > -	unsigned int sg_idx, i;
> >  	unsigned long virtual;
> >  	int err;
> >  
> > @@ -213,6 +220,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  
> >  	binding->dev = dev;
> >  	binding->vdev = vdev;
> > +	binding->niov_shift = niov_shift;
> >  	xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> >  
> >  	err = percpu_ref_init(&binding->ref,
> > @@ -248,18 +256,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  			goto err_unmap;
> >  		}
> >  		binding->tx_vec = kvmalloc_objs(struct net_iov *,
> > -						dmabuf->size / PAGE_SIZE);
> > +						dmabuf->size >> niov_shift);
> >  		if (!binding->tx_vec) {
> >  			err = -ENOMEM;
> >  			goto err_unmap;
> >  		}
> >  	}
> >  
> > -	/* For simplicity we expect to make PAGE_SIZE allocations, but the
> > -	 * binding can be much more flexible than that. We may be able to
> > -	 * allocate MTU sized chunks here. Leave that for future work...
> > -	 */
> > -	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
> > +	binding->chunk_pool = gen_pool_create(niov_shift,
> >  					      dev_to_node(&dev->dev));
> >  	if (!binding->chunk_pool) {
> >  		err = -ENOMEM;
> > @@ -273,9 +277,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  		size_t len = sg_dma_len(sg);
> >  		struct net_iov *niov;
> >  
> > -		if (!IS_ALIGNED(len, PAGE_SIZE)) {
> > +		if (!IS_ALIGNED(dma_addr, niov_size) ||
> > +		    !IS_ALIGNED(len, niov_size)) {
> >  			err = -EINVAL;
> > -			NL_SET_ERR_MSG(extack, "dma-buf SG length must be PAGE_SIZE aligned");
> > +			NL_SET_ERR_MSG(extack,
> > +				       "dmabuf sg entry not aligned to niov size");
> 
> nit: should we NL_SET_ERR_MSG_FMT here and export chunk len and expected
> alignment?

sgtm!

> >  			goto err_free_chunks;
> >  		}
> >  
> > @@ -288,7 +294,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  
> >  		owner->area.base_virtual = virtual;
> >  		owner->base_dma_addr = dma_addr;
> > -		owner->area.num_niovs = len / PAGE_SIZE;
> > +		owner->area.num_niovs = len >> niov_shift;
> >  		owner->binding = binding;
> >  
> >  		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
> > @@ -313,7 +319,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  			page_pool_set_dma_addr_netmem(net_iov_to_netmem(niov),
> >  						      net_devmem_get_dma_addr(niov));
> >  			if (direction == DMA_TO_DEVICE)
> > -				binding->tx_vec[owner->area.base_virtual / PAGE_SIZE + i] = niov;
> > +				binding->tx_vec[(owner->area.base_virtual >> niov_shift) + i] = niov;
> >  		}
> >  
> >  		virtual += len;
> > @@ -430,13 +436,15 @@ struct net_iov *
> >  net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
> >  		       size_t virt_addr, size_t *off, size_t *size)
> >  {
> > +	size_t niov_size = 1UL << binding->niov_shift;
> > +
> >  	if (virt_addr >= binding->dmabuf->size)
> >  		return NULL;
> >  
> > -	*off = virt_addr % PAGE_SIZE;
> > -	*size = PAGE_SIZE - *off;
> > +	*off = virt_addr & (niov_size - 1);
> > +	*size = niov_size - *off;
> >  
> > -	return binding->tx_vec[virt_addr / PAGE_SIZE];
> > +	return binding->tx_vec[virt_addr >> binding->niov_shift];
> >  }
> >  
> >  /*** "Dmabuf devmem memory provider" ***/
> > @@ -454,8 +462,8 @@ int mp_dmabuf_devmem_init(struct page_pool *pool)
> >  	pool->dma_sync = false;
> >  	pool->dma_sync_for_cpu = false;
> >  
> > -	if (pool->p.order != 0)
> > -		return -E2BIG;
> > +	if (pool->p.order != binding->niov_shift - PAGE_SHIFT)
> > +		return -EINVAL;
> 
> Any specific reason you change E2BIG to EINVAL?

It seemed to reflect the new conditional more accurately, as in the case
of order < niov_shift the pool order is too small, not too big. TBH, I'm
not sure if that case is actually ever hit though, at least with current
drivers... 

Not married to it, open to go back to E2BIG.

Best,
Bobby
