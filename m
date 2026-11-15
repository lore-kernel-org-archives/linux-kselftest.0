Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709573;
	b=XRJP2HyPKupt9S1bYlSRZRCU8fVFQ9UODHU++DmyL49vLY+rrot/Mxenfbx0292hbiH2
	 uBkxHJmhLsAq90aHEKXiER9cpUc6IAmPKE7BWljc7NRTecJchTnB0fYtCsgG8oExY+/Au
	 H+XHlQjCRqwO56pWNNUkmWySMKKEQHM+Ji2Iuggik/UMxMY2Kes0UQ3gLlt75GV4p+ZxH
	 m9OmLwx52dGBdNUMNr/5YDgDc3bXmJrmDTFX8831laNymrBaXpBZZTCSWPqziVoloJz2M
	 5kURZ/4njGzTWG+ghMAksLP0GOE4YVlER8Kl3BR/P8t81yazoNGshBYD4f2qjN2hbyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/64PQaoNM3+39zp/zVHlbk0maSvI3ctoo44uF1kR+GQ=;
	b=mLX9o9rgDCGBUFdiKsXHmFRoG7h4OMPok/c6TXkqvVV+K7sGM0H/auGj94rfNYOTthHm
	 os1mnMIdFqrtNhrXyzw81reD3lTYxy+JaQhloE9DNdnGrYPG5NAZsLf+dalk91LHdPXB4
	 T1R1y9PP4nBTQN/Zi9zo7H8VMUfFGJTWUrtI83FXs6m9ppAJkep4RPaeCY1wwQs9XbqY2
	 zs9c5ZwoTQcB3czQK6Yvx+pV2hATXMF3eqzKDGP8HSJRuMiD9+diUJnfgP6Rpfo1OF30W
	 qtbB3PT+2yKjPV1xfKlJu+uzwziweC6srEQIw2hCREWeryrC3svd9cjl6+5nMMqwU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SMZIl3fL;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E3A606A32C
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SMZIl3fL
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso9886275eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709572; x=1795314372; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/64PQaoNM3+39zp/zVHlbk0maSvI3ctoo44uF1kR+GQ=;
        b=SMZIl3fLu8MmGnbLhAuUfStW4QFstOOYbbFSqbWvz8gvTj5ls47cdW/zKDJOSHBl4a
         FTcTNJBjqGtnU7NkkFIjRUVCyHF/H5niqm9hcR0VE4g3LzxXkofnCP6WaUapmGLW4vD4
         j5pDyZcpiiRZK5moDWTpFGp6/+juRpJ/IQE7Pj0uGdfe3SVsu6BAeTtNVbxhSauChfgm
         RV1Pfd8s3Cvh6pU0ik4IJSOUs3LBjC/Q7dEN3PbUCrUM8wg46uVdXiA4Ay27dlGfl57g
         gGKSbku8+vBum8oxz4TUhcPYnTYiMgGvFYR/HjdEJkhxWcAtGc71JUFC6IQ8zVKu67vK
         9AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709572; x=1795314372;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/64PQaoNM3+39zp/zVHlbk0maSvI3ctoo44uF1kR+GQ=;
        b=HjMFw6FTxFcVL7zLz25l50fPwFHEzynG/VkSbrhZAwBbY+sJzFJaa6Z9emXnJJaM4s
         sRC5DYe3EcF01BUe5HUMP9Iamz7SiidHOHTSijeRLN+guQme3gJqCh74DS09sBNjRxtR
         epxt0XyRcfUqVu9YW6ORheqO3N6gvjMkktF9A4NWvteyLec+6C7W1YOZWJUt32ziTfcC
         6WIy05kWcQ0mnI8AsiyXg6f3R++kOYGPf0Oi1eiDYO4NglvD/4RUOU6hLA4zg7vn0+5C
         f7NKJjcDeoduu0VKrPXUZtDEkUex2tLJELFrOL3o1/U4eXYS1q64aSEmoBO08PZpGhoi
         L5rA==
X-Forwarded-Encrypted: i=1; AL+hErG1xFpe3TRiwVPfS1zKOefx7fGUmGLGbA3m1t3KKvk16nSBraO+SrZonB50f+Hhve7KjpGfYrBO1CqrVAx95WI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i2ICaBMtjbToEW1VR8gEgsJRB3f+zXdPKtTfage+wtDRI52om
	qWllzoxRieiiuQruxiPMbSMhQB6QQXj9aL3ZL8nWI3IUsXHSRqt0Xdsuf5IPuWw3QfyqKMaiCQC
	J6XqTjLNA39eSdeT5CGuN8vGD8g==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:1b2:41fa:646b])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b054:20b0:166:862b:9bcc with SMTP id a92af1059eb24-1b5030fb7e7mr7630640c88.18.1794709571904;
 Sat, 14 Nov 2026 18:26:11 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:04 +0000
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
Message-ID: <20261115022607.348112-4-almasrymina@google.com>
Subject: [PATCH net-next v3 3/6] net: guard memory provider RX queue open and
 close on unregister
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"

When an RX queue is leased from a physical backing net_device to a
virtual net_device (e.g., netkit), memory provider operations reach the
physical net_device through rxq->lease and lock it directly via
netdev_lock(dev) rather than looking it up via
netdev_get_by_index_lock().

Introduce a netif_lease_valid() helper checking netif_is_alive(dev)
under netdev_lock(dev) and use it in the lease-aware callers while
keeping __netif_mp_open_rxq() and __netif_mp_close_rxq() unaware of
queue leasing:

1. In netif_mp_open_rxq(), if the leased physical device is already
   unregistering (!netif_lease_valid(dev)), netdev_get_by_index_lock()
   on the virtual netdev succeeds before cascaded unregistration runs,
   allowing a new memory provider to be installed on the physical device
   while it is unregistering. Reject the open with -ENODEV.

2. In netif_mp_close_rxq() and netif_rxq_cleanup_unlease(),
   __netif_mp_close_rxq() reconfigures the physical RX queue so that it
   can continue operating with a regular page_pool when the physical
   netdev outlives the virtual queue or memory provider. When the
   physical backing netdev is itself unregistering
   (!netif_lease_valid(dev)), its queue will not outlive the lease and,
   matching the non-leased unregistration path (where
   dev_memory_provider_uninstall() detaches the provider without calling
   netdev_rx_queue_reconfig()), the physical queue should not be
   reconfigured. However, unlike non-leased queues,
   mp_dmabuf_devmem_uninstall() on the physical netdev does not match
   bound_rxqs (which stores the virtual rxq), leaving
   phys_rxq->mp_params populated until socket teardown or the virtual
   leasee's netif_rxq_cleanup_unlease() runs. When
   !netif_lease_valid(dev), skip __netif_mp_close_rxq() and clear
   mp_params on the physical queue directly so that a subsequent
   netif_rxq_cleanup_unlease() or dev_memory_provider_uninstall() sees
   !mp_ops and does not uninstall a second time.

Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/dev.h             |  7 +++++++
 net/core/netdev_rx_queue.c | 31 ++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/net/core/dev.h b/net/core/dev.h
index 4e9e8cd156977..50cfede051db1 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -119,6 +119,13 @@ bool netif_rxq_has_mp(struct net_device *dev, unsigned int rxq_idx);
 bool netif_rxq_is_leased(struct net_device *dev, unsigned int rxq_idx);
 bool netif_is_queue_leasee(const struct net_device *dev);
 
+static inline bool netif_lease_valid(const struct net_device *dev)
+{
+	netdev_assert_locked(dev);
+
+	return netif_is_alive(dev);
+}
+
 void __netif_mp_uninstall_rxq(struct netdev_rx_queue *rxq,
 			      const struct pp_memory_provider_params *p);
 
diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
index a7261fedd5e76..98b51b2ac8ee1 100644
--- a/net/core/netdev_rx_queue.c
+++ b/net/core/netdev_rx_queue.c
@@ -270,7 +270,12 @@ int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
 	}
 
 	netdev_lock(dev);
-	ret = __netif_mp_open_rxq(dev, rxq_idx, p, extack);
+	if (netif_lease_valid(dev)) {
+		ret = __netif_mp_open_rxq(dev, rxq_idx, p, extack);
+	} else {
+		NL_SET_ERR_MSG(extack, "Device is being unregistered");
+		ret = -ENODEV;
+	}
 	netdev_unlock(dev);
 	return ret;
 }
@@ -309,19 +314,29 @@ static int __netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
 int netif_mp_close_rxq(struct net_device *dev, unsigned int rxq_idx,
 		       const struct pp_memory_provider_params *old_p)
 {
-	int ret;
+	struct netdev_rx_queue *rxq;
+	int ret = 0;
 
 	if (WARN_ON_ONCE(rxq_idx >= dev->real_num_rx_queues))
 		return -EINVAL;
 	if (!netif_rxq_is_leased(dev, rxq_idx))
 		return __netif_mp_close_rxq(dev, rxq_idx, old_p);
 
-	if (!__netif_get_rx_queue_lease(&dev, &rxq_idx, NETIF_VIRT_TO_PHYS)) {
+	rxq = __netif_get_rx_queue_lease(&dev, &rxq_idx, NETIF_VIRT_TO_PHYS);
+	if (!rxq) {
 		WARN_ON_ONCE(1);
 		return -EINVAL;
 	}
 	netdev_lock(dev);
-	ret = __netif_mp_close_rxq(dev, rxq_idx, old_p);
+	/* If the physical netdev is already unregistering, the queue will not
+	 * outlive the lease; only clear mp_params so subsequent
+	 * netif_rxq_cleanup_unlease() or dev_memory_provider_uninstall() is a
+	 * no-op.
+	 */
+	if (netif_lease_valid(dev))
+		ret = __netif_mp_close_rxq(dev, rxq_idx, old_p);
+	else
+		memset(&rxq->mp_params, 0, sizeof(rxq->mp_params));
 	netdev_unlock(dev);
 	return ret;
 }
@@ -340,6 +355,9 @@ void __netif_mp_uninstall_rxq(struct netdev_rx_queue *rxq,
  * the lease redirection. The extra __netif_mp_close_rxq is needed
  * since the physical queue can outlive the virtual queue in the lease
  * case, so it needs to be reconfigured to clear the memory provider.
+ * If the physical netdev is also unregistering, its queue will not
+ * outlive the lease, so only clear mp_params without reconfiguring the
+ * queue.
  */
 void netif_rxq_cleanup_unlease(struct netdev_rx_queue *phys_rxq,
 			       struct netdev_rx_queue *virt_rxq)
@@ -350,6 +368,9 @@ void netif_rxq_cleanup_unlease(struct netdev_rx_queue *phys_rxq,
 	if (!p.mp_ops)
 		return;
 
-	__netif_mp_close_rxq(phys_rxq->dev, rxq_idx, &p);
+	if (netif_lease_valid(phys_rxq->dev))
+		__netif_mp_close_rxq(phys_rxq->dev, rxq_idx, &p);
+	else
+		memset(&phys_rxq->mp_params, 0, sizeof(phys_rxq->mp_params));
 	__netif_mp_uninstall_rxq(virt_rxq, &p);
 }
-- 
2.56.0.611.g1030f0b940-goog

