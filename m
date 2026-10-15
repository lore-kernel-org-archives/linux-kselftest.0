Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B203FB7E0
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082374; cv=none; b=s1AHSxm7M8HzYVd5Y+7SfmTeJC0ti+WBCuGy06BRfhIhv9Qc3Alx3EGeDa028NRA5qaUEHI7fOx0ZlupmDQ5wnwhuNbcax0fBdVRrQtocEF/a134rik5FqUC/yJvYkuTRRJ8pTPI0DtVx2CVCeUdgHaHEA7M00MU9rWDSHGp56w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082374; c=relaxed/simple;
	bh=vO6YEQIMsSYDbMWgTeXfd0RkPWpXF5baIQZyZXdCBFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lWXbSiLDXLMzH0fN7+KLnCmQ1AJMu68DmGfASutwk2+pq39hfLXcrv6m8Vpd4grhbKCqLKtqrlrEt+1D8DRd6lWFrt2BL1bbSMRkA+j9oMF7v8xCUTDuI/I5Sh86kTJXZdAHB5LNKEor6GevnUaERYdqIpwoSLmLvsIqYpncM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bRJsHChG; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bRJsHChG"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso6653261c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792082361; x=1792687161; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01xy5PseRVpPPje1JnCly3s3YIplU78ERdCkYH+3Kds=;
        b=bRJsHChG3DrA2JmAqi7FcqG0MVg1r6kxt044hD9wtVlIdbMpnkUxKkAblAiN4r1flV
         xij0PTsh5Eh6D+q0waI+U4nY6IHaHvzsWMofjue2FjDjRJBPu5GkkwggJOrBOicw8nEn
         M0VYywW1HI82zr8Q741/o6akGR+h/YOvLGZ814yhIQhkv4rFJeMnwI5Y9FJHtnccZdsO
         tqEVCYSkWDwOmuEHxrEKu+AdA3Z72dKlVIuxvBLFtiQAMmMCaDAmHJdokqjZWiwxgnAU
         1+rNiKMqUuMAwO2zHXIUUR1FFaLdM3i8xTtY5yYW/pF8URP1u1pzuO1ooeKe4ryud1Q9
         xT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082361; x=1792687161;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01xy5PseRVpPPje1JnCly3s3YIplU78ERdCkYH+3Kds=;
        b=BduIAZlayN9Vm5rbU9HEu8bSkDi5hBRUDmFKgfAWbBydmqTiVrGemMwrnA62h5Ur60
         gVK7GoCUuR1HNmx1AxRqQlQeZbbfFLR9vgz5r/fiOh51NYnPn7PQqI8GyTO1LDrihrC3
         Ce9/7v87bIKDjryZuXLpuSfOA1zDtzwBVXsf/66hy6q95gDmi0kNinEsTxzZLfHpJ1E+
         gPTaPTaiEbpC2IIL+Bgp2G6vhQN+FsBcTBNIMKNw3ZdtDnGtV4GA3Bha0AG+wF9EwpnP
         Sqi7yNVZYNNT/Ze4JGBwDCc0mPtU1xQxXPwR/q6QrUDDqoKyJAxsiFvPO94ZGOGkwXAC
         nAOQ==
X-Forwarded-Encrypted: i=1; AKwUvByOrfttNi/YdniLQwFHJHJ69QGjbBTsSmuf0sW/N620os+8iybOAJ60phgohs1sJ0JE15/FQJo5sCf4a+TcsnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYInVu1JXEvVasn+QCMFPXAHazEvS/uVoT2Ug69l8rzuT2l5+bjf
	SQ2RAZ7J2O58w1SJI8WUJudYLrnXILLCdvKKpJ1kaJEPQl8kuAhByANsgTPBWsckyirclBd4WXt
	lGUp7KFqE06bLyC9m4TSUrGnvPA==
X-Received: from dlbts20-n1.prod.google.com ([2002:a05:7022:b054:10b0:17e:d816:7855])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2088:20b0:143:2719:566e with SMTP id a92af1059eb24-16a61a6e5f3mr27037111c88.42.1792082360355;
 Thu, 15 Oct 2026 09:39:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:39:14 +0000
In-Reply-To: <20261015163915.1166043-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015163915.1166043-4-almasrymina@google.com>
Subject: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
netdevsim net_device, and configure page_pool instances with
PP_FLAG_ALLOW_UNREADABLE_NETMEM and queue_idx, plus PP_FLAG_DMA_MAP |
PP_FLAG_DMA_SYNC_DEV when CONFIG_HAS_DMA is set, so devmem bind-rx and
bind-tx netlink operations can be tested against netdevsim in software
selftests.

The pp_hold debugfs file allocates pages from the queue 0 page pool, so
refuse it when that pool is backed by a memory provider, and take the
netdev instance lock there so a concurrent bind-rx cannot swap the pool
in between. The software PSP path checksums the payload when the peer
does not decapsulate, so drop unreadable skbs there.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Assisted-by: LLM
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
v3:
- Only request page pool DMA mapping when CONFIG_HAS_DMA is set
  (Sashiko).
- Refuse pp_hold on a page pool backed by a memory provider, under the
  netdev instance lock (Sashiko).
- Drop unreadable skbs in the software PSP path when it would have to
  checksum the payload (Sashiko).
---
 drivers/net/netdevsim/bus.c    |  1 +
 drivers/net/netdevsim/netdev.c | 27 +++++++++++++++++++++------
 drivers/net/netdevsim/psp.c    |  5 +++++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/net/netdevsim/bus.c b/drivers/net/netdevsim/bus.c
index 5c55c308487b4..f87f5e037b6fb 100644
--- a/drivers/net/netdevsim/bus.c
+++ b/drivers/net/netdevsim/bus.c
@@ -462,6 +462,7 @@ nsim_bus_dev_new(unsigned int id, unsigned int port_count, unsigned int num_queu
 	nsim_bus_dev->port_count = port_count;
 	nsim_bus_dev->num_queues = num_queues;
 	nsim_bus_dev->initial_net = current->nsproxy->net_ns;
+	dma_coerce_mask_and_coherent(&nsim_bus_dev->dev, DMA_BIT_MASK(64));
 	/* Disallow using nsim_bus_dev */
 	smp_store_release(&nsim_bus_dev->init, false);
 
diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index b4a99f3ceac60..357ea9e5623b3 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -414,19 +414,27 @@ static int nsim_poll(struct napi_struct *napi, int budget)
 	return done;
 }
 
-static int nsim_create_page_pool(struct page_pool **p, struct napi_struct *napi)
+static int nsim_create_page_pool(struct net_device *dev, struct page_pool **p,
+				 struct napi_struct *napi, int idx)
 {
+	struct netdevsim *ns = netdev_priv(dev);
 	struct page_pool_params params = {
 		.order = 0,
 		.pool_size = NSIM_RING_SIZE,
+		.flags = PP_FLAG_ALLOW_UNREADABLE_NETMEM,
+		.max_len = PAGE_SIZE,
 		.nid = NUMA_NO_NODE,
-		.dev = &napi->dev->dev,
+		.dev = &ns->nsim_bus_dev->dev,
 		.napi = napi,
 		.dma_dir = DMA_BIDIRECTIONAL,
-		.netdev = napi->dev,
+		.netdev = dev,
+		.queue_idx = idx,
 	};
 	struct page_pool *pool;
 
+	if (IS_ENABLED(CONFIG_HAS_DMA))
+		params.flags |= PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
+
 	pool = page_pool_create(&params);
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
@@ -450,7 +458,7 @@ static int nsim_init_napi(struct netdevsim *ns)
 	for (i = 0; i < dev->num_rx_queues; i++) {
 		rq = ns->rq[i];
 
-		err = nsim_create_page_pool(&rq->page_pool, &rq->napi);
+		err = nsim_create_page_pool(dev, &rq->page_pool, &rq->napi, i);
 		if (err)
 			goto err_pp_destroy;
 	}
@@ -762,14 +770,16 @@ nsim_queue_mem_alloc(struct net_device *dev,
 	if (ns->rq_reset_mode == 1) {
 		if (!netif_running(ns->netdev))
 			return -ENETDOWN;
-		return nsim_create_page_pool(&qmem->pp, &ns->rq[idx]->napi);
+		return nsim_create_page_pool(dev, &qmem->pp,
+					     &ns->rq[idx]->napi, idx);
 	}
 
 	qmem->rq = nsim_queue_alloc();
 	if (!qmem->rq)
 		return -ENOMEM;
 
-	err = nsim_create_page_pool(&qmem->rq->page_pool, &qmem->rq->napi);
+	err = nsim_create_page_pool(dev, &qmem->rq->page_pool, &qmem->rq->napi,
+				    idx);
 	if (err)
 		goto err_free;
 
@@ -929,12 +939,15 @@ nsim_pp_hold_write(struct file *file, const char __user *data,
 		return ret;
 
 	rtnl_lock();
+	netdev_lock(ns->netdev);
 	ret = count;
 	if (val == !!ns->page)
 		goto exit;
 
 	if (!netif_running(ns->netdev) && val) {
 		ret = -ENETDOWN;
+	} else if (val && page_pool_is_unreadable(ns->rq[0]->page_pool)) {
+		ret = -EOPNOTSUPP;
 	} else if (val) {
 		ns->page = page_pool_dev_alloc_pages(ns->rq[0]->page_pool);
 		if (!ns->page)
@@ -946,6 +959,7 @@ nsim_pp_hold_write(struct file *file, const char __user *data,
 	}
 
 exit:
+	netdev_unlock(ns->netdev);
 	rtnl_unlock();
 	return ret;
 }
@@ -1051,6 +1065,7 @@ static int nsim_init_netdevsim(struct netdevsim *ns)
 	ns->netdev->netdev_ops = &nsim_netdev_ops;
 	ns->netdev->stat_ops = &nsim_stat_ops;
 	ns->netdev->queue_mgmt_ops = &nsim_queue_mgmt_ops;
+	ns->netdev->netmem_tx = NETMEM_TX_DMA;
 	netdev_lockdep_set_classes(ns->netdev);
 
 	err = nsim_udp_tunnels_info_create(ns->nsim_dev, ns->netdev);
diff --git a/drivers/net/netdevsim/psp.c b/drivers/net/netdevsim/psp.c
index 6b3532b5e360d..908cc0d391dc6 100644
--- a/drivers/net/netdevsim/psp.c
+++ b/drivers/net/netdevsim/psp.c
@@ -86,6 +86,11 @@ nsim_do_psp(struct sk_buff *skb, struct netdevsim *ns,
 		__wsum csum;
 		int udplen;
 
+		if (!skb_frags_readable(skb)) {
+			rc = SKB_DROP_REASON_PSP_OUTPUT;
+			goto out_unlock;
+		}
+
 		/* Do not decapsulate. Receive the skb with the udp and psp
 		 * headers still there as if this is a normal udp packet.
 		 * psp_dev_encapsulate() sets udp checksum to 0, so we need to
-- 
2.56.0.176.g3575e65682-goog

