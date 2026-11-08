Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117495;
	b=t67PlgXHDZ5YgQ2nxdiU3/oJHOhWrqU0MUfrqfO6N8MBTYdJGbRDUsGXhOtKGGYFtxmD
	 XuNkW2lSpvQANilQxA82nzGi+Klu6IshMiJf/9z1+UF/B5NWazav1vh64xrrsH2NBSCBK
	 3ZYWRHBbilBtf6Vb/IKQX6TyBp4UkKhcFUDPi2nTv7whFO8KKjxVJQfOMxxTwUMExPpwH
	 8+3Rk/G1m1vXCrEY+s/Jaj7MRjX4CfMgevytEchDYze/a9QS/aR30sAuMopJ5swQvnOiD
	 DflUn7ZoP6RHNja3dtnLGOrlFRuuaJNdPVIwZBvNqLktNnAeQ5AsiXlhKFWz17mNS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YVAD+M7+xHpbCIM3wy02erKctAGF8DXmNtMkqsE3v/w=;
	b=d4UuIdfiChGSAArutbPORk4eZ7TnjN+eCnLu7UdrUc01DUUR/GstUWjlVbkHKxNHg3RP
	 W/+Kmwm6p+4nDs+IkfhH2iFkAy2jLeE+UanHPiG7XXERdAQ1BYzhybQHfLWVQMOg1kw6B
	 +QRwZ5c+kQoFhyooH5ZTORj2zu7A5NsWdwQk2pRNjKEwRt8yjeLwRwR3QuOgbgYNP17br
	 9R2ba0hMT6LaN6Yw5+dUrMNuiFPSQ89Hu7ziNDWaBCToZR72+bY4URZzJFq377iLsUkQk
	 wo40luzyU5BryqykGqc0AyR2LlWW2Y2/3GPCchO3vY0+geJvBiOALpuXRX32eJXP5Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7tzrsyC;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8639E606D801
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 05:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8639E606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j7tzrsyC
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso326807eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 21:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117495; x=1794722295; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVAD+M7+xHpbCIM3wy02erKctAGF8DXmNtMkqsE3v/w=;
        b=j7tzrsyCKexvBq1CPFIAOJxJS+VHHa84LW0LF0nIxdSUMNehwmuUZZqYwX0uIF3225
         0aQowmJj9QwkfX6genXbL+kEaFRSOpnP6xBOqFbhUFJaOMV55KKp0j5X6PEwA89842Dr
         GMY31YoPpO6mCVv9XfOLgBohBG/4Sps503ZfeW6UXhVN0OxO2IUtVJFZIohiXfyZG2JS
         quq0/Y4U7TxrrKEL8CKssjMX+PD73ZU89J6At5KAvcCJl/Ec4o9wlB2i46tiJiaXzmQs
         4ajmzNtaWbYprGg3TkJ7T4EQ7eCQV8vMy3o3bZyL86ycg/HI8EKJKXAKkUUHeoG4+yKw
         7yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117495; x=1794722295;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVAD+M7+xHpbCIM3wy02erKctAGF8DXmNtMkqsE3v/w=;
        b=2Fthv0z8DdjyWcbofIBPtUUni/2++isdyBFWZvjS994baCZrkJpJJ6TsabSdr07i63
         CfNmuMOSawldISvWzJvkjmKw6unwmnaFt94RHfoqO8UzU2yiqlDp9oUyJKy22h7IScN9
         TKvJ5Gwa4V6SuNdhLhyWZqC4PmqjLKZthiDgeVN2Q8yDKOK8yfVtynDFDL26uy1KS930
         Fb3LaqnGOBU4Z3D6hda4H00Ghhi9AZ1YTdAG70khSkxcjnJdvXzo8H0YMho/J5q6i5mY
         tQ0YEWV5+qmg/1as4D8iBJKe/ufiyrVVv2bOO8ZDhY3vqvnn+RQ6v00rNtdNPEIZw/hr
         V4mw==
X-Forwarded-Encrypted: i=1; AL+hErEU6ghCF9ywez8hNxJ0kiP+Gq7TjJ63G7NUl88G4PGXzWq3XV89nfWJGY57YDDVS1kT4omZ3fQU6YmVIIFln8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MWwk8qE0ihv3fZUtuvJYMhcAf9JjwlpE2WhmeuzkpaOoL6X6A
	0ymakFosnTS0tvTTO8zYXFNA4zqacFTcoWPUxyrESvzaP+JHfBOyvRg6WBlUVVQIrhA542SL2bg
	rCu5DZ+a7fFPBZNqlnQ9cAjNwkQ==
X-Received: from dyaz2-n2.prod.google.com ([2002:a05:693c:6382:20b0:36a:e67:fbc2])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:6822:b0:366:83dd:46f7 with SMTP id 5a478bee46e88-37256becc67mr2029445eec.17.1794117494023;
 Sat, 07 Nov 2026 21:58:14 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:07 +0000
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
Message-ID: <20261108055809.2122934-5-almasrymina@google.com>
Subject: [PATCH net-next v2 4/6] net: devmem: always populate bind_dev and
 detach both devices on unregister
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

Previously, bind_dev was only populated when bind-tx was called on a
virtual netdev (where map_dev != netdev), and socket teardown, queue
uninstall, and net_devmem_dev_unregister() did not uniformly track both
bind_dev and map_dev across RX and TX bindings.

Always populate bind_dev with the net_device the user called bind-rx or
bind-tx on (equal to map_dev for direct bindings, or the virtual device
for leased bindings), and handle teardown and unregistration of both
pointers in either order:

- Lock &binding->bind_dev during socket teardown in
  netdev_nl_sock_priv_destroy() and pass binding->bind_dev to
  netif_mp_close_rxq() in net_devmem_unbind_dmabuf(), because bound_rxqs
  stores queues belonging to bind_dev and netif_mp_close_rxq() expects
  the leasee device so it can redirect through the lease and lock
  map_dev.
- Require binding->map_dev to remain non-NULL in
  net_devmem_get_binding() so TX lookups fail once map_dev unregisters
  even if bind_dev is still registered.
- Clear binding->bind_dev in mp_dmabuf_devmem_uninstall() once
  bound_rxqs is empty, leaving leased bindings mapped until the binding
  is freed or map_dev is unregistered, because
  netif_rxq_cleanup_unlease() runs while map_dev may still be up and
  ignores __netif_mp_close_rxq() failures.
- In net_devmem_dev_unregister(dev), if binding->bind_dev == dev, clear
  NET_DEVMEM_BINDING_LIVE to stop new lookups, and clear
  binding->bind_dev only when bound_rxqs is empty or dev is not a queue
  leasee so leased RX bindings keep binding->bind_dev valid until
  ndo_uninit's netif_rxq_cleanup_unlease() uninstalls the virtual
  queues. If binding->map_dev == dev, clear NET_DEVMEM_BINDING_LIVE,
  unmap the dmabuf while map_dev is still valid, and clear
  binding->map_dev.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 62 ++++++++++++++++++++----------------------
 net/core/devmem.h      |  8 ++++--
 net/core/netdev-genl.c | 16 +++++------
 3 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6446355e787d4..bb785a871d1c4 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -86,7 +86,7 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
 
 /**
  * net_devmem_lock_dev() - lock a binding's net_device pointer if still alive
- * @dev_ptr:		pointer to the net_device field on a devmem binding
+ * @dev_ptr:		pointer to &binding->map_dev or &binding->bind_dev
  * @dev_tracker:	reftracker for the held net_device reference
  *
  * Safely dereference @dev_ptr, acquire netdev_lock() on the device, and
@@ -95,17 +95,18 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
  * Invariant: *@dev_ptr is set once at bind time and is only ever cleared to
  * NULL while holding netdev_lock() on that device (in
  * mp_dmabuf_devmem_uninstall(), net_devmem_unbind_dmabuf(), or
- * net_devmem_dev_unregister() during NETDEV_UNREGISTER before
- * synchronize_net() and netdev_run_todo() free the net_device).
+ * net_devmem_dev_unregister(), all before synchronize_net() and
+ * netdev_run_todo() free the net_device).
  *
  * Taking rcu_read_lock() guarantees that a non-NULL device read from
  * *@dev_ptr has not yet completed unregister_netdevice_many_notify()
  * (which waits for an RCU grace period via synchronize_net() after
- * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
- * safely acquire a reference before sleeping on netdev_lock(). Once
- * netdev_lock() is held, re-checking that READ_ONCE(*dev_ptr) == dev
- * guarantees that the device has not yet been detached from the binding and
- * cannot finish unregistering until net_devmem_unlock_dev().
+ * NETDEV_UNREGISTER and ndo_uninit before freeing the net_device), so
+ * netdev_hold() can safely acquire a reference before sleeping on
+ * netdev_lock(). Once netdev_lock() is held, re-checking that
+ * READ_ONCE(*dev_ptr) == dev guarantees that the device has not yet been
+ * detached from the binding and cannot finish unregistering until
+ * net_devmem_unlock_dev().
  *
  * Return: The locked and held net_device if *@dev_ptr is still non-NULL,
  * or NULL if already cleared.
@@ -227,14 +228,14 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 
 		rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
+		if (netif_mp_close_rxq(binding->bind_dev, rxq_idx, &mp_params))
 			busy = true;
 	}
 
-	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
-	    !busy) {
-		net_devmem_dmabuf_binding_unmap(binding);
-		WRITE_ONCE(binding->map_dev, NULL);
+	if (binding->bind_dev) {
+		if (binding->direction == DMA_FROM_DEVICE && !busy)
+			net_devmem_dmabuf_binding_unmap(binding);
+		WRITE_ONCE(binding->bind_dev, NULL);
 	}
 
 	percpu_ref_kill(&binding->ref);
@@ -252,24 +253,20 @@ void net_devmem_dev_unregister(struct net_device *dev)
 
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
-		if (binding->direction == DMA_FROM_DEVICE) {
-			if (READ_ONCE(binding->map_dev) != dev ||
-			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
-					NET_DEVMEM_BINDING_LIVE))
-				continue;
-		} else {
-			if (READ_ONCE(binding->bind_dev) == dev)
-				WRITE_ONCE(binding->bind_dev, NULL);
-			if (READ_ONCE(binding->map_dev) != dev)
-				continue;
-			WRITE_ONCE(binding->bind_dev, NULL);
+		if (READ_ONCE(binding->bind_dev) == dev) {
 			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
 					NET_DEVMEM_BINDING_LIVE);
+			if (xa_empty(&binding->bound_rxqs) ||
+			    !netif_is_queue_leasee(dev))
+				WRITE_ONCE(binding->bind_dev, NULL);
 		}
+		if (READ_ONCE(binding->map_dev) != dev)
+			continue;
 
+		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
+				NET_DEVMEM_BINDING_LIVE);
 		xa_unlock(&net_devmem_dmabuf_bindings);
-		if (!netif_is_queue_leasee(dev))
-			net_devmem_dmabuf_binding_unmap(binding);
+		net_devmem_dmabuf_binding_unmap(binding);
 		xa_lock(&net_devmem_dmabuf_bindings);
 		WRITE_ONCE(binding->map_dev, NULL);
 	}
@@ -529,7 +526,7 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 							 unsigned int dmabuf_id)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	struct net_device *dst_dev;
+	struct net_device *dst_dev, *map_dev;
 	struct dst_entry *dst;
 	int err = 0;
 
@@ -560,9 +557,10 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 	 * net_device.
 	 */
 	dst_dev = dst_dev_rcu(dst);
-	if (unlikely(!dst_dev) ||
-	    unlikely(dst_dev != READ_ONCE(binding->map_dev) &&
-		     dst_dev != READ_ONCE(binding->bind_dev))) {
+	map_dev = READ_ONCE(binding->map_dev);
+	if (unlikely(!dst_dev || !map_dev ||
+		     (dst_dev != map_dev &&
+		      dst_dev != READ_ONCE(binding->bind_dev)))) {
 		err = -ENODEV;
 		goto out_unlock;
 	}
@@ -686,8 +684,8 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
 		if (xa_empty(&binding->bound_rxqs)) {
 			if (!rxq->lease)
 				net_devmem_dmabuf_binding_unmap(binding);
-			ASSERT_EXCLUSIVE_WRITER(binding->map_dev);
-			WRITE_ONCE(binding->map_dev, NULL);
+			ASSERT_EXCLUSIVE_WRITER(binding->bind_dev);
+			WRITE_ONCE(binding->bind_dev, NULL);
 		}
 		break;
 	}
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 9dcb629e10bfd..ff431e5e398e0 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -25,8 +25,10 @@ struct net_devmem_dmabuf_binding {
 	 * time and cleared to NULL under netdev_lock(map_dev).
 	 */
 	struct net_device *map_dev;
-	/* Device the user called bind-rx or bind-tx on. Set at bind time and
-	 * cleared to NULL on unregistration.
+	/* Device the user called bind-rx or bind-tx on. Equal to map_dev for
+	 * direct bindings, or the virtual device (e.g. netkit) for leased
+	 * bindings. Set at bind time and cleared to NULL under
+	 * netdev_lock(bind_dev).
 	 */
 	struct net_device *bind_dev;
 	possible_net_t net;
@@ -44,7 +46,7 @@ struct net_devmem_dmabuf_binding {
 	 * those refs are dropped and the binding is no longer desired or in
 	 * use. RX bindings are unmapped earlier when their queues are closed or
 	 * uninstalled, unless a leased or busy queue may still use the binding.
-	 * TX bindings are also unmapped earlier if their device is
+	 * Both RX and TX bindings are also unmapped earlier if map_dev is
 	 * unregistered.
 	 *
 	 * net_devmem_net_iov_inc_ref() on dmabuf net_iovs will increment this
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 962d7a8c75e9a..9e56c26fc65f9 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1110,9 +1110,10 @@ int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
 		goto err_rxq_bitmap;
 	}
 
-	binding = net_devmem_bind_dmabuf(netdev, NULL, dma_dev, DMA_FROM_DEVICE,
-					 dmabuf_fd, niov_shift, priv,
-					 NETLINK_CB(skb).sk, info->extack);
+	binding = net_devmem_bind_dmabuf(netdev, netdev, dma_dev,
+					 DMA_FROM_DEVICE, dmabuf_fd,
+					 niov_shift, priv, NETLINK_CB(skb).sk,
+					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
 		goto err_rxq_bitmap;
@@ -1257,10 +1258,9 @@ int netdev_nl_bind_tx_doit(struct sk_buff *skb, struct genl_info *info)
 
 	dma_dev = netdev_queue_get_dma_dev(map_dev, 0, NETDEV_QUEUE_TYPE_TX);
 
-	binding = net_devmem_bind_dmabuf(map_dev,
-					 map_dev != netdev ? netdev : NULL,
-					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
-					 PAGE_SHIFT, priv, NETLINK_CB(skb).sk,
+	binding = net_devmem_bind_dmabuf(map_dev, netdev, dma_dev,
+					 DMA_TO_DEVICE, dmabuf_fd, PAGE_SHIFT,
+					 priv, NETLINK_CB(skb).sk,
 					 info->extack);
 	if (IS_ERR(binding)) {
 		err = PTR_ERR(binding);
@@ -1475,7 +1475,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(&binding->map_dev, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->bind_dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.0.455.g6c5a503b38-goog

