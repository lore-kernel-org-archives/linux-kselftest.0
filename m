Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709572;
	b=2CiSwIBKcy6cXqZS1zAX8fScdqXSkC5NC6R/H2kyPnpfgai3GhrkUZuN6SWZyiyUE8GL
	 jK133iZmomSheA1rIn3VtWdfL7MALWbJbaVTstF3szIdbiHKKtHpwOV+pMwD//2rZ38ak
	 aTVDHtEg64d9KXlp1/Es2e7jqSHQPE1kuj7U4LwLyTPRCZsu+f9mFOejDyjb3aORNVBTE
	 X/UDKPs4SufExlXZA58BX2xUNiM5NbgtU6Ro/BRh1wcjxxtRt9c0FDRpictV2usYKlu0w
	 iAxRS04Ok7dAWPOo+QXnnewDVn+hcr/3gQiPhiV/eIQEFQfZeNz1DOP6cLOsr/cQIiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=M3P7ujHQBJpighPNvjdFs5yAEbsTyYNTue7OiVYVJQQ=;
	b=GA9mjwFsiEF5yfAeJjV+LrGNMm1t3OzpJXP0TvM6pj2fvjNIYaKPopeiiHvdxDA57S4S
	 m34T9Wqu/UWeiLul88NNnbTGV+ygiuJEt8VVUhtcjnpyI2XLZsJY281q7qrVPbDcP8mTe
	 IEAX+0zL8DEKApGfX6jzX5nWZdA9JYq2xU9xiixju3RrI+dnRfEDuv/Yz/gFQs5S9u7/S
	 x6WGSTmvyh+XBert2UYEvIf5DFuwQ7bxCEgeRkcBLXm1/vB4mjJka8aDDjRTpS38hlwUj
	 +Of+Jlv25g06prg+HZGr4Yt7l8Ziv6FDGaWreq6fISnWHErYAngS3KrVj7E2l9tpgiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EgEKYz0B;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090C606A89F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3090C606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EgEKYz0B
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2732142c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709571; x=1795314371; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3P7ujHQBJpighPNvjdFs5yAEbsTyYNTue7OiVYVJQQ=;
        b=EgEKYz0Bm+WCTC8JE7UBzWUGxO6HtTnCPy94pBDbjRzdfq5KFbSr4BcjfUDjDnmOXc
         tgYmATM3y6ACDdsvOijbF8imopDA1fxUBlAsBNf5xipjIjRx0xSsxtTWiLiGhDKcguhT
         kDtlF0JzClm/6AxgxRs2XhNH7vQLcKSf2tzx1SNlCfJCvjdfOollGNaiAmDc8XFFasp3
         5ItI9wZ7Z0Xmbgfy8miBzYXeAAF4CgQkrT1oXZ1RPTXrD7eVNk6LG0MDMM68Tdv6pLv4
         ShF4KYshTkY34y9FcXbwmbC0AoaKc2XjJHre+RUPDnP4eLgG5/9oNOjz4F/ytHz/PV9Z
         5XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709571; x=1795314371;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3P7ujHQBJpighPNvjdFs5yAEbsTyYNTue7OiVYVJQQ=;
        b=ZrO8md5RLQSMmDKYSj+qXGRN2UlHAmm7HiNkMcBGBCQZWwhacdXTYYmxbn76p1wg35
         Cu3RjEis7kE/hDk6SlGFZH4VetGwHtDHQ9pbMHuhoua1I96PDYD3bNLzb5PSwIP6n1wB
         jkLcT4MmixL6amQqo3Owuiuel6E47ww7CYRXuBgPO9UWBqZ56sE5ER5/CUPUbAivRxib
         p3Fy+C3c7Wsb2XEZkn+08JH0wz7FqHc2QC7+f+gkhaGLEN8DLqiR0pK2se7ClXWhvSGN
         XYT2WTHHUtwGLk5ljof0ULBEK+EwPxxYzWQeK2GGnbOwzhc99YAVOd6GozW2egj2/Ilz
         Ka0A==
X-Forwarded-Encrypted: i=1; AL+hErG0GKrw80V8+UzeBOrHDfPRL4rl/vUeD9kJV5B1CQdYpfHNtOPEEMeT7ftv72fHIULC647Kt0HcBdxAFcXboWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UK7JSkZwf5axCIoN9jvxlf//aJir5pWf88jkzOu63B0XZk3Rn
	ADxckac31IiN066/So7YCgdQy8SJG78sGf2rQ+3R0dNB8JytvymLxCxlJpLVNM7bqTAZB39MvRa
	sipx8HL9T1PH1iZk7CHMezb8pVg==
X-Received: from dlbpt1.prod.google.com ([2002:a05:7022:e801:b0:1b0:ab15:db1d])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4354:b0:14c:1f57:3e86 with SMTP id a92af1059eb24-1b50312160emr6123231c88.47.1794709570523;
 Sat, 14 Nov 2026 18:26:10 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:03 +0000
In-Reply-To: <20261115022607.348112-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115022607.348112-3-almasrymina@google.com>
Subject: [PATCH net-next v3 2/6] net: devmem: rename binding dev and vdev to
 map_dev and bind_dev
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

struct net_devmem_dmabuf_binding currently tracks two device pointers
under the names 'dev' and 'vdev':

- 'dev' is the physical net_device whose dma_dev holds the DMA mapping.
- 'vdev' is the virtual net_device the user bound to when using leased
  queues.

Rename 'dev' to 'map_dev' and 'vdev' to 'bind_dev' (typed as struct
net_device *), and rename the matching local variable in
netdev_nl_bind_tx_doit() from 'bind_dev' to 'map_dev' to match. No
functional change.

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/dev.c         |  2 +-
 net/core/devmem.c      | 38 ++++++++++++++++++++------------------
 net/core/devmem.h      | 17 +++++++++--------
 net/core/netdev-genl.c | 31 +++++++++++++++----------------
 4 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index a230ecce9327d..405811b99589b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4192,7 +4192,7 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
 		if (net_is_devmem_iov(niov) &&
 		    (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
-		     READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
+		     READ_ONCE(net_devmem_iov_binding(niov)->map_dev) != dev))
 			goto out_free;
 	}
 
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6fa7b909b86e8..db60d1b5ea229 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -157,7 +157,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		     binding->area.num_niovs, binding->free_count);
 
 	kvfree(binding->area.niovs);
-	dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
+	dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
 	net_devmem_dmabuf_binding_unmap(binding);
 	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
 	net_devmem_unlock_dev(dev, &dev_tracker);
@@ -227,13 +227,14 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 
 		rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		if (netif_mp_close_rxq(binding->dev, rxq_idx, &mp_params))
+		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
 			busy = true;
 	}
 
-	if (binding->direction == DMA_FROM_DEVICE && binding->dev && !busy) {
+	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
+	    !busy) {
 		net_devmem_dmabuf_binding_unmap(binding);
-		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->map_dev, NULL);
 	}
 
 	percpu_ref_kill(&binding->ref);
@@ -252,16 +253,16 @@ void net_devmem_dev_unregister(struct net_device *dev)
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
 		if (binding->direction == DMA_FROM_DEVICE) {
-			if (READ_ONCE(binding->dev) != dev ||
+			if (READ_ONCE(binding->map_dev) != dev ||
 			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE))
 				continue;
 		} else {
-			if (READ_ONCE(binding->vdev) == dev)
-				WRITE_ONCE(binding->vdev, NULL);
-			if (READ_ONCE(binding->dev) != dev)
+			if (READ_ONCE(binding->bind_dev) == dev)
+				WRITE_ONCE(binding->bind_dev, NULL);
+			if (READ_ONCE(binding->map_dev) != dev)
 				continue;
-			WRITE_ONCE(binding->vdev, NULL);
+			WRITE_ONCE(binding->bind_dev, NULL);
 			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE);
 		}
@@ -270,7 +271,7 @@ void net_devmem_dev_unregister(struct net_device *dev)
 		if (!netif_is_queue_leasee(dev))
 			net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
-		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->map_dev, NULL);
 	}
 	xa_unlock(&net_devmem_dmabuf_bindings);
 }
@@ -304,7 +305,8 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 }
 
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, unsigned int niov_shift,
@@ -332,14 +334,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		return ERR_CAST(dmabuf);
 
 	binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
-			       dev_to_node(&dev->dev));
+			       dev_to_node(&map_dev->dev));
 	if (!binding) {
 		err = -ENOMEM;
 		goto err_put_dmabuf;
 	}
 
-	binding->dev = dev;
-	binding->vdev = vdev;
+	binding->map_dev = map_dev;
+	binding->bind_dev = bind_dev;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
 	binding->niov_shift = niov_shift;
@@ -558,8 +560,8 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	 */
 	dst_dev = dst_dev_rcu(dst);
 	if (unlikely(!dst_dev) ||
-	    unlikely(dst_dev != READ_ONCE(binding->dev) &&
-		     dst_dev != READ_ONCE(binding->vdev))) {
+	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
+		     dst_dev != READ_ONCE(binding->bind_dev))) {
 		err = -ENODEV;
 		goto out_unlock;
 	}
@@ -683,8 +685,8 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 		if (xa_empty(&binding->bound_rxqs)) {
 			if (!rxq->lease)
 				net_devmem_dmabuf_binding_unmap(binding);
-			ASSERT_EXCLUSIVE_WRITER(binding->dev);
-			WRITE_ONCE(binding->dev, NULL);
+			ASSERT_EXCLUSIVE_WRITER(binding->map_dev);
+			WRITE_ONCE(binding->map_dev, NULL);
 		}
 		break;
 	}
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c0aaba0041ff6..9dcb629e10bfd 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -22,14 +22,13 @@ struct net_devmem_dmabuf_binding {
 	struct dma_buf_attachment *attachment;
 	struct sg_table *sgt;
 	/* Physical NIC that does the actual DMA for this binding. Set at bind
-	 * time and cleared to NULL under netdev_lock(dev).
+	 * time and cleared to NULL under netdev_lock(map_dev).
 	 */
-	struct net_device *dev;
-	/* Opaque cookie identifying the virtual device (e.g. netkit) the user
-	 * called bind-tx on. Used only for pointer comparison via READ_ONCE()
-	 * and cleared with WRITE_ONCE() on unregistration. Never dereferenced.
+	struct net_device *map_dev;
+	/* Device the user called bind-rx or bind-tx on. Set at bind time and
+	 * cleared to NULL on unregistration.
 	 */
-	void *vdev;
+	struct net_device *bind_dev;
 	possible_net_t net;
 	kuid_t uid;
 	/* Serialize net_devmem_dmabuf_binding_unmap() on attachment and sgt */
@@ -91,7 +90,8 @@ struct net_devmem_dmabuf_binding {
 #if defined(CONFIG_NET_DEVMEM)
 void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
 struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd, unsigned int niov_shift,
@@ -171,7 +171,8 @@ static inline void net_devmem_net_iov_dec_ref(struct net_iov *niov)
 }
 
 static inline struct net_devmem_dmabuf_binding *
-net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
+net_devmem_bind_dmabuf(struct net_device *map_dev,
+		       struct net_device *bind_dev,
 		       struct device *dma_dev,
 		       enum dma_data_direction direction,
 		       unsigned int dmabuf_fd,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 2826f7e328340..962d7a8c75e9a 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1195,9 +1195,8 @@ netdev_find_netmem_tx_dev(struct net_device *dev)
 int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	struct net_device *bind_dev;
+	struct net_device *netdev, *map_dev;
 	struct netdev_nl_sock *priv;
-	struct net_device *netdev;
 	struct device *dma_dev;
 	u32 ifindex, dmabuf_fd;
 	struct sk_buff *rsp;
@@ -1245,27 +1244,27 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_unlock_netdev;
 	}
 
-	bind_dev = netdev_find_netmem_tx_dev(netdev);
-	if (!bind_dev) {
+	map_dev = netdev_find_netmem_tx_dev(netdev);
+	if (!map_dev) {
 		err = -EOPNOTSUPP;
 		NL_SET_ERR_MSG(info->extack,
 			       "No DMA-capable device found for netmem TX");
 		goto err_unlock_netdev;
 	}
 
-	if (bind_dev != netdev)
-		netdev_lock(bind_dev);
+	if (map_dev != netdev)
+		netdev_lock(map_dev);
 
-	dma_dev = netdev_queue_get_dma_dev(bind_dev, 0, NETDEV_QUEUE_TYPE_TX);
+	dma_dev = netdev_queue_get_dma_dev(map_dev, 0, NETDEV_QUEUE_TYPE_TX);
 
-	binding = net_devmem_bind_dmabuf(bind_dev,
-					 bind_dev != netdev ? netdev : NULL,
+	binding = net_devmem_bind_dmabuf(map_dev,
+					 map_dev != netdev ? netdev : NULL,
 					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
 					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
-		goto err_unlock_bind_dev;
+		goto err_unlock_map_dev;
 	}
 
 	/* rsp was allocated large enough */
@@ -1273,16 +1272,16 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 
 	genlmsg_end(rsp, hdr);
 
-	if (bind_dev != netdev)
-		netdev_unlock(bind_dev);
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 	netdev_unlock(netdev);
 	mutex_unlock(&priv->lock);
 
 	return genlmsg_reply(rsp, info);
 
-err_unlock_bind_dev:
-	if (bind_dev != netdev)
-		netdev_unlock(bind_dev);
+err_unlock_map_dev:
+	if (map_dev != netdev)
+		netdev_unlock(map_dev);
 err_unlock_netdev:
 	netdev_unlock(netdev);
 err_unlock_sock:
@@ -1476,7 +1475,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.0.611.g1030f0b940-goog

