Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709574;
	b=nWYuPR8gCeiFEoNLvLK5uWP4MCl3OTgNIub83iHIyt4Ms1mgYtDMJFfnYhw8HxlqWtS2
	 E+Zc2D/Wzfb6nDgkIdq89XIce8UKZfSZQsYeU6CXVipaQWA4KHMXiHFW+JTYYZqbu89yd
	 b/DnTHsAesMYZkdsaEf48wwYJyICYtrcqRQIoe7kg/5msPtJ7PULrD58VJuIznCU29edH
	 aeEYvZJbyBKuRBRQK9ZrQt1OcaATuM7O3BcvjKd6BmvzdBxNI+P06CSzdJMUOU6xm1D+C
	 eIxojW4SjH4DwJ7EP5cWj0IodecqROdDcOTEAoEmmdNeC8uV/QtkAnrchxIoE9WxzXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eECfHLaCbEEgM0ZXaBP3huoO+pd4ECG+BptJBzbXIEk=;
	b=IrXSmM3JkfQxYCxYHjkymF2MjRsfjsPtYuIfyRH5EC/m4lt5hKCkuytL36mjG+ikx4s9
	 zTd3t+ApNXpilBzdfUvFR4vOyeC+evaXwzaRHKUehas54MbD/0TT99CzYN1TATxey5DdL
	 maPe7EVFqE217WpZdrz54OG7QwQM6/IMc3/GYKB6Q+F+VDXIUWJ3A/N/FPLPh6u0+ug5a
	 QLizERtDz1OIVLp2Cz2HxUEeHcsgH2mi94AMT5Eipexb9lCDY2+vwYQJxg3xqqMaP/iSa
	 uXj0wDUyTxX7zbzLfQv/WODxkcyrC7/wQaBRTF47kz1cJzryvy2TT55dLQpIcdNJHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Iq8a52sc;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63A60A2605
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A63A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Iq8a52sc
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so491662eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709573; x=1795314373; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eECfHLaCbEEgM0ZXaBP3huoO+pd4ECG+BptJBzbXIEk=;
        b=Iq8a52sc5LD4DGePxfbKEFrtAKxCkqeYFfVGf90WzdQyvKIuodm1zVAD7dSkmgWefa
         5wGPMTAdBEA/YYR7Qda1Pbphq4XEJWhF8ICa61BHX0W5UcL+8HF1dhtB5Qs1Y4PGaRcH
         VORnvj7GQe2gkcnXhXQ/ssBsp8/2kmExkdkRz1Ip+C7vjgpaVDb0bKPW7pVsneeCR3bf
         2F9UwrirtddyWs6VL76oNpxnfbN9uqcPY/ny4IBuSuLu3ZlySFi4x2Rva2YixpMCFepr
         LmEaB2ubcSKAxEqqVJmwwumGUV0dNYZ5JSUFplhC6PycXMx6RKt49dmIOZfYYcDoDwlH
         Ar+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709573; x=1795314373;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eECfHLaCbEEgM0ZXaBP3huoO+pd4ECG+BptJBzbXIEk=;
        b=Sig2kmNbytD3VeIQsdiBqBTAPf550jaYyTgOW6E1SN8hQJtUYpQJ9h39f+yLTkr3oa
         XWWjIbjn+8SSyrFNHEJbsPq0kLGRgcg/Vpvn8+33FXrkBERohMS1uyZqDBsIdDY6exU6
         9E0sP/BVzb6mKrWwdppf1yF82YPBDXMiho9NUlFn9ImSJNLqKnZUkiI99z727RyXI5yG
         Z3CcYwO/wUQZjPTHJpA9blBwdkjbZBhDgFYqdANzhUiusMQMMaWKw+ML7RyH8Jp6X9Ea
         xInJkErRaoJST6Talcy2xs8yh+KMCOpbhbemAfFK13T6+jnIOSKVtZMnBTE8AvWTWyrM
         AflA==
X-Forwarded-Encrypted: i=1; AL+hErEucKwQQOnHMXzU+jFYzM/w4Vs8UHPBYJOwBzZxVzGAE6pA8Y99cv5DaDTaJOXvSgs30E4uUgou4XlVWnSrMSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6e1QTYrdbCsuOGytCr7umFvJL8aj4j2aKdUcx2XpgAyefSOsN
	/dThsuHQ8l+8Ui6ukbuj3ZuW9Gs6ofF56IBw43GSJnZQFhhsYRLTeHE6LF2MfFox4XpQuhQWh/u
	wuBsTtRLicmsHc+6wTG9qmFPWcQ==
X-Received: from dyaw16-n2.prod.google.com ([2002:a05:693c:4150:20b0:34c:9660:9612])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6184:20b0:36e:a179:85f2 with SMTP id 5a478bee46e88-379675fea57mr6264010eec.23.1794709572939;
 Sat, 14 Nov 2026 18:26:12 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:05 +0000
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
Message-ID: <20261115022607.348112-5-almasrymina@google.com>
Subject: [PATCH net-next v3 4/6] net: devmem: always populate bind_dev and
 detach both devices on unregister
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
 net/core/devmem.c      | 76 +++++++++++++++++++++---------------------
 net/core/devmem.h      |  8 +++--
 net/core/netdev-genl.c | 16 ++++-----
 3 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index db60d1b5ea229..a17ee27dc7cef 100644
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
@@ -219,22 +220,23 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
 	if (binding->list.next)
 		list_del(&binding->list);
 
-	xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
-		const struct pp_memory_provider_params mp_params = {
-			.mp_priv	= binding,
-			.mp_ops		= &dmabuf_devmem_ops,
-		};
+	if (binding->bind_dev) {
+		xa_for_each(&binding->bound_rxqs, xa_idx, rxq) {
+			const struct pp_memory_provider_params mp_params = {
+				.mp_priv	= binding,
+				.mp_ops		= &dmabuf_devmem_ops,
+			};
 
-		rxq_idx = get_netdev_rx_queue_index(rxq);
+			rxq_idx = get_netdev_rx_queue_index(rxq);
 
-		if (netif_mp_close_rxq(binding->map_dev, rxq_idx, &mp_params))
-			busy = true;
-	}
+			if (netif_mp_close_rxq(binding->bind_dev, rxq_idx,
+					       &mp_params))
+				busy = true;
+		}
 
-	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
-	    !busy) {
-		net_devmem_dmabuf_binding_unmap(binding);
-		WRITE_ONCE(binding->map_dev, NULL);
+		if (binding->direction == DMA_FROM_DEVICE && !busy)
+			net_devmem_dmabuf_binding_unmap(binding);
+		WRITE_ONCE(binding->bind_dev, NULL);
 	}
 
 	percpu_ref_kill(&binding->ref);
@@ -252,21 +254,18 @@ void net_devmem_dev_unregister(struct net_device *dev)
 
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
 		if (!netif_is_queue_leasee(dev))
 			net_devmem_dmabuf_binding_unmap(binding);
@@ -528,7 +527,7 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
 							 unsigned int dmabuf_id)
 {
 	struct net_devmem_dmabuf_binding *binding;
-	struct net_device *dst_dev;
+	struct net_device *dst_dev, *map_dev;
 	struct dst_entry *dst;
 	int err = 0;
 
@@ -559,9 +558,10 @@ struct net_devmem_dmabuf_binding *net_devmem_get_binding(struct sock *sk,
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
@@ -685,8 +685,8 @@ static void mp_dmabuf_devmem_uninstall(void *mp_priv,
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
2.56.0.611.g1030f0b940-goog

