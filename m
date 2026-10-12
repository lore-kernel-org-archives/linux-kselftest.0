Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEDB4C225A
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 17:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826990; cv=none; b=CFYDOcror0UX6ZEyr3ptn3EpFCoqTZw98cW0gSLanIDHnUe5a34M76uAIXYwEb4h7EuTiH+1UvK3GDe9+GzbFdl/e73ura6dttO9UdhuC63YLXfKtMJx8GbJkrgtN5Ob7CqNclgnMw3MASxByjF4t6br3jJGxv08IouFKmaNHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826990; c=relaxed/simple;
	bh=j1TaTyk/OTL5zdMp08SYdA2Dlge6Yv09Zs+4VMdCb4A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rinBGZKbNOsewTKYbrypas1w7o6s4efam3Lm7qaxG4Bpu5dqEsxomh+fZLlkGzGF4AA67NXH2NHq7Ns4XIOZwc/XP5Otu4slYMjg7XpMRc3SxfM5s77NuVZKqY8nt3a6JlkMn8RneCDZlEDFNmHUB8X6KXkovA2cIR1dyEcgOG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=giA0fnnI; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="giA0fnnI"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so4651128eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791826988; x=1792431788; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnXvDkHRygIjqcgALHUWN066KUbjGPQJV9Mzd8woTCg=;
        b=giA0fnnIREhBMCOyncwFKlJOTtwEC9sFXMd35Ms7dIt9IrXK/6xOGLd3tMjpDQBH6t
         2XVy7MRtlbG5QhallJV2lk7zeeCHh1+Dy41Ya0vNyzFWfIX8T9r9Cltz+jLi/sCL+Kta
         HLesRwloDU5VGIPPURHbMfQoEtKrPkrZrMcjeTrl1FH1lfdUhW3OaUjbFEEeIu8fXJF0
         LISkWY96h8ouDnDBYruG0cofgf5sEnco3RAndMtMCPBzlbUut0bYt2qMVdJvxPNdsONA
         2zmxFIIG9BjpKNZiNSFqHZ9s+UvisoCCcjce+fv9COVdzcmZf4WxnmkCsbQ9t7pWaRJ3
         0bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826988; x=1792431788;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnXvDkHRygIjqcgALHUWN066KUbjGPQJV9Mzd8woTCg=;
        b=fitdeMjQCd6IdCBNmDarQr9ILpUrQGfNfeaWFczzSaAa80yFIh6hDgffWFpIjOa6K2
         a1aZb5jTzDQCQzlPMWEDO6zQlhSUYjiGqbR2OhzSCllXCxF1dNgfAtHIZJKJAOIfnVDn
         eOA8pqeww9EOJv0Vw0cFApjpGiobQNJk58S5LiSi4VXw8eJ3STCRw0WcOF3pIlOxRGRT
         utMotk10oCMY6g4wNFJIn8KVxd9vJWVAk0yacCMvg7AydeESQckzRIT3JaNB2wLmDdZ3
         RYGevOm3yx3ELw10T0c08gy2LFAgUz0/8T7rR+RsTPa3pxtsHkE9n/6KNdSpimz+LgvO
         A2bA==
X-Forwarded-Encrypted: i=1; AKwUvBwkx0+JuU3QoHdUzYTRvnoXgpOWhR0YAk2TiqQtHlGvixUTLogu0X3DCbQ7RR8Ihf0+udAXztuFB8vZYGqWmZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJESbr7IEOnQHYWayrQKaWPDzI8K/2r4Ij+UwqLR2nvSZPfrdzn
	otX1FbZ3+a7cpPQsLB8FHvjuMvQK5V7IohquTNPVG7KERzLFcOPB8CFZ4IO8LjNd3VYPn+ELzF9
	QqnQtJCXFRsidb51yau/oefu0xA==
X-Received: from dlbtu4.prod.google.com ([2002:a05:7022:3c04:b0:157:8b19:354f])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4508:10b0:154:fa0b:6df1 with SMTP id a92af1059eb24-16a5e49d6c9mr12641181c88.37.1791826987357;
 Mon, 12 Oct 2026 10:43:07 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:42:59 +0000
In-Reply-To: <20261012174300.2338784-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012174300.2338784-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012174300.2338784-4-almasrymina@google.com>
Subject: [PATCH net v2 3/4] netdevsim: support devmem RX and TX bindings
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Mina Almasry <almasrymina@google.com>, 
	Taehee Yoo <ap420073@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"

Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
netdevsim net_device, and configure page_pool instances with
PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV | PP_FLAG_ALLOW_UNREADABLE_NETMEM
and queue_idx so devmem bind-rx and bind-tx netlink operations can be
tested against netdevsim in software selftests.

Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 drivers/net/netdevsim/bus.c    |  1 +
 drivers/net/netdevsim/netdev.c | 21 +++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

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
index b4a99f3ceac60..4415dc01c610b 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -414,16 +414,22 @@ static int nsim_poll(struct napi_struct *napi, int budget)
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
+		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV |
+			 PP_FLAG_ALLOW_UNREADABLE_NETMEM,
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
 
@@ -450,7 +456,7 @@ static int nsim_init_napi(struct netdevsim *ns)
 	for (i = 0; i < dev->num_rx_queues; i++) {
 		rq = ns->rq[i];
 
-		err = nsim_create_page_pool(&rq->page_pool, &rq->napi);
+		err = nsim_create_page_pool(dev, &rq->page_pool, &rq->napi, i);
 		if (err)
 			goto err_pp_destroy;
 	}
@@ -762,14 +768,16 @@ nsim_queue_mem_alloc(struct net_device *dev,
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
 
@@ -1051,6 +1059,7 @@ static int nsim_init_netdevsim(struct netdevsim *ns)
 	ns->netdev->netdev_ops = &nsim_netdev_ops;
 	ns->netdev->stat_ops = &nsim_stat_ops;
 	ns->netdev->queue_mgmt_ops = &nsim_queue_mgmt_ops;
+	ns->netdev->netmem_tx = NETMEM_TX_DMA;
 	netdev_lockdep_set_classes(ns->netdev);
 
 	err = nsim_udp_tunnels_info_create(ns->nsim_dev, ns->netdev);
-- 
2.56.0.385.gd3acb90ef8-goog

