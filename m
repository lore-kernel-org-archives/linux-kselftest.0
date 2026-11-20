Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153806;
	b=m3Rcon5PkD79qB2l1cja+M0K7yMJP1xg6w6zAQyG/dZap4pWf6RQizAgZKd3FnP1GklD
	 SiKibtVco5+bNpJqM8Qikp6PTBgw8icjfnsU+zLEH7rm8RKqvYZY2HeOqY/OHfM0GaMVf
	 7pvcT1Q04vS0qe/5+9HQcVn06jKgeLm+WontFbR+4tNnpVcw5jeu5tcMWICOJXSWfCsaL
	 rTWC0NgoVNK5ajJn9mA2YvqyS61vLPpCaR1qUhiCaNLJWJnzJ/WPnYGQhXF/oC4WuEdfP
	 DMNoBT7K5tG8qZ3j9kHldqd+3LDW+oPr65BfU7d608kqUx4gWR94mwjNQ6G9CXlyh0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jqsV+n/aEFW1J3tzl66Q3V5Op5g6kiSECAivZHtlWsU=;
	b=mArRozXK1xieL+b4PQloYJIPcZ2MUCugUPKMrmuClT7OG3+tojFBhxroZouXxb7kkQS+
	 6mglrTKIrZW8yta3R+tQ21MknRE2PL5X1n33QRxvwaoZXtnwe3CExA94/cxo6JUCLVtR2
	 ZchtPi75ugI8rqVXFlCAsURBykh+k/BV1BTnV+L0AzQSZiXpaGbRPsfRhIKNxiDZVKFAt
	 n4Eu/ydv2h6gZwP8NJFWuI0oXbkynTtpcNjUa8kCNrRpZBAbK75AGiG5XDiNOJ4dE56XB
	 1iGmGAJybjeboMRijpptl65bK2J+eWzWbHjEipw1iqqeerf+XlIU49LJEjuEh+OVOhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UuOr6da7;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1D4606A337
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1D4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UuOr6da7
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso629839c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153805; x=1795758605; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqsV+n/aEFW1J3tzl66Q3V5Op5g6kiSECAivZHtlWsU=;
        b=UuOr6da7o03Io0++giFxoeYuORoum89OZAjceGAF9RqdMPsJljddLPbz0OS2U8qM6A
         8W59V9mv/DqihSL2Oqe+IY5YZXSgE3tkdRSj7f7/a3ztiFlFAq8sUz8RJuPKB+dIsPJ7
         cLWzTczubNgRmjnMjTI+HPdESnYNJIEsMbfWIrnOAfr60FoP6Za5bonFUIrQkld+7vA+
         3hGaa5L8B5zw1fk0lt1MPt3O02Gz+3ClqEdP4iL7cxiLGWDOd0YmRODCalSJwOHIYL2W
         mcnisbYuzDs4QQA/zV0sn/9PFtb+7fltfTk5ijWhpXwSROZi3xTLxXuzoQPYjx0Kxaho
         XrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153805; x=1795758605;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqsV+n/aEFW1J3tzl66Q3V5Op5g6kiSECAivZHtlWsU=;
        b=xlttxBzZC8frNtrx92beGlMZgfZtXEhPnR874Fhn8lggn1s45fj6XingxOv6XbCS7N
         H5crFHbFOgwmHSbn1E2qKDi143gohRjxfANVbGBpuR6ab3sdgbMSoy/AHqmjpLhNmskC
         CgiWHOqg2DPvGw5CWsDuenhD0GPIGz5RvNcXywveGnt2qESjuxRB003GsHxTd4CYciKw
         OxCc2fJKWBPLrpXOAJvcT9sqaUAqmxRB6WPDtYh4bqFglc/lZJHqfkFgPxLyXW0+ctxc
         3+Kp+HHHD+UnaeP7Qx7/bPI5WDptWx4QCXyjh0jQUsoly38RFawPv5EJHFkEZWBhrRJF
         yF6g==
X-Forwarded-Encrypted: i=1; AL+hErEWoQtKF1QVmL73/8QcRQSXs/DLq+L82iUqFoFzekGgHaEJV3XoblFeCbp8Zu63F/w2g3kreQZC9jNuZlExeMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HzISMYO82EoAKKKzxqZLtA9DnNTywVjmK1Ma0aEvrb8Z91F3y
	ZoF4b6QOuiCE8HY07naIrrw57Y+69VcNbdLTiae6v7ynP0FgmDz8oSTxOc4Og8FYLMpnIVARweh
	6kdV+7LmLbeaCa/lqc9r1Sv/I1Q==
X-Received: from dleg6-n1.prod.google.com ([2002:a05:701b:4306:10b0:19d:e7f1:171c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea8d:b0:1b2:373c:997 with SMTP id a92af1059eb24-1b5568f3c7bmr1740253c88.25.1795153804911;
 Thu, 19 Nov 2026 21:50:04 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:17 +0000
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120045918.1239746-7-almasrymina@google.com>
Subject: [PATCH net-next v4 6/7] net: devmem: resolve physical map_dev for
 leased RX bindings
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
virtual netdev in binding->map_dev without tracking the physical backing
netdev at all. When the physical backing netdev unregistered while a
leased RX binding was active, net_devmem_dev_unregister() did not match
the physical netdev and mp_dmabuf_devmem_uninstall() on the virtual
queue skipped unmapping because rxq->lease was set, leaving the dmabuf
attachment mapped against the freed physical dma_dev until
__net_devmem_dmabuf_binding_free() triggered a use-after-free in
dma_unmap_sg_attrs().

Return the physical backing net_device from netdev_nl_get_dma_dev() when
the RX queue is leased from another netdev, lock map_dev around
net_devmem_bind_dmabuf() when map_dev != netdev (matching
netdev_nl_bind_tx_doit()), assert in net_devmem_bind_dmabuf() that both
bind_dev and map_dev are locked, and reject binding when
!netif_lease_valid(map_dev).

Now that binding->map_dev always points to the physical DMA device for
both RX and TX bindings (never a queue leasee), drop the
!netif_is_queue_leasee(dev) guard in net_devmem_dev_unregister().

This issue was discovered during AI code review (Sashiko) of the earlier
non-leased devmem unregister series and confirmed by code inspection
(not observed in production or reproduced on real hardware). Tested with
the nl_netdev.py selftest on netdevsim added in this series.

Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 11 +++++++++--
 net/core/netdev-genl.c | 19 ++++++++++++++++---
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 80c3e149cd762..84bb7cebe9a39 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -284,8 +284,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 			continue;
 
 		xa_unlock(&net_devmem_dmabuf_bindings);
-		if (!netif_is_queue_leasee(dev))
-			net_devmem_dmabuf_binding_unmap(binding);
+		net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
 		WRITE_ONCE(binding->map_dev, NULL);
 	}
@@ -354,6 +353,14 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
 	size_t i;
 	long err;
 
+	netdev_assert_locked(bind_dev);
+	netdev_assert_locked(map_dev);
+
+	if (!netif_lease_valid(map_dev)) {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		return ERR_PTR(-ENODEV);
+	}
+
 	if (!dma_dev) {
 		NL_SET_ERR_MSG(extack, "Device doesn't support DMA");
 		return ERR_PTR(-EOPNOTSUPP);
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index c2b8ec0058a34..74e3f3d89ab4b 100644
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
2.56.1.750.gf70dc682cf-goog

