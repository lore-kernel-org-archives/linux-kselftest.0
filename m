Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117496;
	b=s5w+tI5BpK6D0VlGGZLVomU9N2UZr8bbXFz365WvESxn3QmB9oRtav3LYnVTQ0hc4iAw
	 nI5sU9owc/wlUqMXya5lj6DfsTmaT6idJWeQHogLO/GE5r+ei/uWdeWmswR/dYLUU98x4
	 PQqigwM06CiaLmm8sY1ZVs7tlmS/fsouawHXfxW1X1eNxZxFetDwUFffpvnkVDkpPaU+4
	 rWq2R8lchioZYK1c7/EVoRHR+Nr5Q58SsZU8w/oDb8PaS519PEd0wV5WfDmxaD2atu74e
	 L20lvxKv7MYe62vUSX+ELjnOpXNYQk1Gp36KKR6LhgdJk/I6jnBMeVCNuW0OeA0sg/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7n5mV7LlVJBcizMSVH3942EO35b0cUF5y9HFomTyAB0=;
	b=PlDlr1Fek8viyQpXOwkqLqr6oKC8xQbAIRKHlmYD5meJQgCFO8MgIVeWZicP9O4spVDs
	 ZZm45aTe13eg0dn/sx2f/8DiZEC6XvctJ8r/oEiZyeK/bnVxSX1vqCNzu68bKIjpN579W
	 EuusgZRALXaXopFQEr/MCqnZEguHQwpwxSGEa9NaPnUTMunriKX+0n0vUqG+OmKylr+Iu
	 B0A1Us5i7BpxVw8Z7muHARaG2pPz2siqrccdFbWZZeUAynejR4d2363CBZkgZ48MAww5p
	 tOrQd3vUPfmL/I8FTVWUReHPnHFt4pF04VzvjlzdnKLcOX1tlXiaiFfQC0MfSYTqqeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gYDNJ9Yv;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD2606D80D
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 05:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFD2606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gYDNJ9Yv
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so560395c88.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 21:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117495; x=1794722295; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7n5mV7LlVJBcizMSVH3942EO35b0cUF5y9HFomTyAB0=;
        b=gYDNJ9YvcgaGgARpbqxXCMEam5H7M5s2M3dqSUKWhMtgQ/me5o82l0pOJ8rihw4zZF
         4tCrIu0Z0QfhxilC1PimzntouTAKdqBsHXWm5nX9fR8SeE265CDQ/eA0hE+uKErT5U7l
         tsUWgTDtOVzVulLwAIm9dR1lAUfBEA1nG2MZnyqF39XxRhvbXN00FSFdHFcEXFzAtU/c
         hCvLhIpbSFmICd0JYDMNhl2bu7nXnSX/u1h5i7SUPf7VskOdCK3VtR+/Ad7RxhSp2T6b
         ZMZU9D9rnrq0RUi8H1qkg2wljzSlcUqxAbp/JVcnHQlAi0K+WbII1n1WURJ/YXOoszJ5
         SK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117495; x=1794722295;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7n5mV7LlVJBcizMSVH3942EO35b0cUF5y9HFomTyAB0=;
        b=BF9apLuhWjgUs5/UTFUnTh5HxNAlDCPM4qcJ3UstK4hmaGMqJfTQBcm7jFU3KJVf91
         OisaaCPDc/XU0lWJHVOf4eNCR810UZ5O5LlzhWAgVKuDmA1lnaF29EmUUzvdJspx5Nj9
         h7WKmyhG5lbrVOZU0kx+mopnExrelAqH7pgRKfa0v995KzMjHgn955zZ9d66iK5yfB67
         ROqK9KBjWMQJR/084Zo0Wxda+g7TIYWbQqVqrAPeOIivaA8ymowXr2SlAlz4zdrCsSBf
         lzM7cb8kJ/KQl72ZiKTGwA4qjNj5s9xuBlc0JzPnlMx3W2aWVIik5ORwAgkcHr7S2RwX
         Op5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsqUSnun1twKT52sKHen4pvWCwIIs3fwNdLr78OP1FO21SozkGK/lb6FBjLMcKkPRirGwXZjOHOqw1IHSclU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wrz+6jIl596Z/DLt5oCZa/zBgfs78r8NpnCkHsbAGoPxEsFZ8
	+pHkRtevJETA0zI2Om7v4MMfbtoeshdYr47/HD+EAcjElZ3RJhNyC0ioPRzwNj5JViTCsit0kaD
	wi6sR4980SUOauZgXZJhBr0bwIg==
X-Received: from dlbtu15.prod.google.com ([2002:a05:7022:3c0f:b0:15d:6b8d:2adc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:7f01:b0:1b0:f268:3419 with SMTP id a92af1059eb24-1b39fe87bedmr1005367c88.7.1794117495052;
 Sat, 07 Nov 2026 21:58:15 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:08 +0000
In-Reply-To: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261108055809.2122934-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108055809.2122934-6-almasrymina@google.com>
Subject: [PATCH net-next v2 5/6] net: devmem: resolve physical map_dev for
 leased RX bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
virtual netdev in binding->map_dev without tracking the physical backing
netdev at all. Unregistering the physical backing netdev while a leased
RX binding was active failed to detach and unmap the dmabuf.

Return the physical backing net_device from netdev_nl_get_dma_dev() when
the RX queue is leased from another netdev, lock map_dev around
net_devmem_bind_dmabuf() when map_dev != netdev (matching
netdev_nl_bind_tx_doit()), and assert in net_devmem_bind_dmabuf() that
both bind_dev and map_dev are locked.

Because a leased map_dev is reached via rxq->lease->dev and locked with
raw netdev_lock(map_dev) rather than netdev_get_by_index_lock(), it may
already have entered NETREG_UNREGISTERING and completed
net_devmem_dev_unregister(map_dev) before cascaded unregistration of
bind_dev tears down the lease. Reject binding in
net_devmem_bind_dmabuf() if map_dev->reg_state != NETREG_REGISTERED.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 12 ++++++++++++
 net/core/netdev-genl.c | 19 ++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index bb785a871d1c4..2dac581a57e13 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -321,6 +321,18 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	size_t i;
 	long err;
 
+	netdev_assert_locked(bind_dev);
+	netdev_assert_locked(map_dev);
+
+	/* When map_dev != bind_dev, map_dev is locked via the queue lease
+	 * rather than netdev_get_by_index_lock(), so it may already be
+	 * unregistering before cascaded bind_dev unregistration runs.
+	 */
+	if (map_dev->reg_state != NETREG_REGISTERED) {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		return ERR_PTR(-ENODEV);
+	}
+
 	if (!dma_dev) {
 		NL_SET_ERR_MSG(extack, "Device doesn't support DMA");
 		return ERR_PTR(-EOPNOTSUPP);
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 9e56c26fc65f9..442362f23fe88 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1005,12 +1005,15 @@ static int netdev_nl_read_rxq_bitmap(struct genl_info *info,
 
 static struct device *
 netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
+		      struct net_device **map_dev,
 		      struct netlink_ext_ack *extack)
 {
 	struct device *dma_dev = NULL;
 	u32 rxq_idx, prev_rxq_idx;
 
+	*map_dev = netdev;
 	for_each_set_bit(rxq_idx, rxq_bitmap, netdev->real_num_rx_queues) {
+		struct netdev_rx_queue *rxq;
 		struct device *rxq_dma_dev;
 
 		rxq_dma_dev = netdev_queue_get_dma_dev(netdev, rxq_idx,
@@ -1023,6 +1026,11 @@ netdev_nl_get_dma_dev(struct net_device *netdev, unsigned long *rxq_bitmap,
 
 		dma_dev = rxq_dma_dev;
 		prev_rxq_idx = rxq_idx;
+		if (netif_rxq_is_leased(netdev, rxq_idx) &&
+		    netif_is_queue_leasee(netdev)) {
+			rxq = __netif_get_rx_queue(netdev, rxq_idx);
+			*map_dev = rxq->lease->dev;
+		}
 	}
 
 	return dma_dev;
@@ -1032,9 +1040,9 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
 	unsigned int niov_shift = PAGE_SHIFT;
+	struct net_device *netdev, *map_dev;
 	u32 ifindex, dmabuf_fd, rxq_idx;
 	struct netdev_nl_sock *priv;
-	struct net_device *netdev;
 	unsigned long *rxq_bitmap;
 	struct device *dma_dev;
 	struct sk_buff *rsp;
@@ -1104,16 +1112,21 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 	if (err)
 		goto err_rxq_bitmap;
 
-	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, info->extack);
+	dma_dev = netdev_nl_get_dma_dev(netdev, rxq_bitmap, &map_dev,
+					info->extack);
 	if (IS_ERR(dma_dev)) {
 		err = PTR_ERR(dma_dev);
 		goto err_rxq_bitmap;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, netdev, dma_dev,
+	if (map_dev != netdev)
+		netdev_lock(map_dev);
+	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
 					 DMA_FROM_DEVICE, dmabuf_fd,
 					 niov_shift, priv, NETLINK_CB(skb).sk,
 					 info->extack);
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
-- 
2.56.0.455.g6c5a503b38-goog

