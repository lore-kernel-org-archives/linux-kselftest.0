Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153802;
	b=O/rnQNcVotwc3+jEzXIfQDFd1paqpe3PSYAUgQuqs3TaV8guavp0CFTS4mih+i+HncMw
	 wX4wJTW2ZIxD3q8dTgozYpUbsQglBqMvqUaIjtjWvye5AY2AURUCDXdkfMjFpNTudGppr
	 aAQYkhetkA9U+4imOm7K6AZUo1MHjVCOmIYHP6cfYQnJtGQxBpD/AzgzW6DWf1cr2tPFQ
	 1/SOvY0/4XxHp/PH21OJkgvWuzsvb5epLXN068CxqfG9iQ6ro9I5PWr/ZG1mwkiuc+T5g
	 Us7tCenuk/bevhEJ/N2ExCqE3u1RR3VFh/SgO+p7LN/RCTBrlMSvcLIMfFtuOAQN49g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fH6erOYRRukt5/Pl9ogmntwRsxmmRFZAXo7NJHpHxTs=;
	b=Qsj1EpIyy63qbSnIXmKt4Q1MvcmXpKTOOE0CcFYbD1Ru8v/zPIr6grg1s99ed1J5BdOi
	 awkmjNDbTCL2JJFJ5RLtyax0yur8Ag7NDB4v7Y4QrdzTDYvfGkfCiKs+XRKaImuuwxIyW
	 pHkaMdIUqjvSuTu4cixK/YiQySXf0RnE7/W+/i2x4PZ5zSSBwemVqBBHScsV4JbnDJoB0
	 HxIbzY25VmdvZUXW+Q8rSio/xBt4W8MXKSmoIoA0NEqNjbRpUofs4XZcbugQL6NKgBZ8M
	 lWeH9cchpXEie/2UGj/DJw4C1rw7Mi3+fLCTsCFLdtSnbTwHI9DSNL1rZ0NDESFZqkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Fbjq/iRj";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F323C606A33A
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F323C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fbjq/iRj
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso595516eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153801; x=1795758601; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fH6erOYRRukt5/Pl9ogmntwRsxmmRFZAXo7NJHpHxTs=;
        b=Fbjq/iRjnKfE/tHeL92/UTEhIA+9acKAAB6BnA0nyckMF/rJtNi1WeMdghT0AGlilF
         rW58AuWYgfyNVHma/XZbHqkiUPkOUMdemFOWaF2G5IYxawwXzw1oFYUErDlvYgDeH7+Y
         eCy9s2Sm/XzdPDiNowpD6j9/QzKOggwTUkOe+ZCkNCDV26UR1Ea4h2RdjUU039Wq2q02
         MOojDFWlRtc4lsDHTQ1GEXpJSmfqcC+SeVp5z48MzXltPAXmwyRxOiaUUyJkMbC3MJas
         Bg9HVorlM7DLYW5i+7fjRu9/iQJPxF8zlLDKtWfqPf3oqVZGnbbtZgF2amI9X1I/Otph
         4z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153801; x=1795758601;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fH6erOYRRukt5/Pl9ogmntwRsxmmRFZAXo7NJHpHxTs=;
        b=QUyNTNOFJb7vYnabG5H8r3/jrp2lmHWL5AUjf2WIDRr+YXk3DvKsjFtGf+lCgZNOH6
         fo+Mt5PvRNxiVmopTd5w0S+vFzBG6huNv5qgzxUV01h6O24rCdmCmf94Q30oF50Yb1dg
         sR20gDWgnhnhqTRdi7rt15Y51XgpEfex5PuPMClPn9yzl+Ux6AvIdINz8NW0kSKWkFY2
         VWPIUU1effc6hpChe712nEy9EmYz60NnD+bmaeINQpY0Cgj1Rqoa3QQdDSrRB0ShC67k
         HB/+uK7ElOr8FKB+wp9mTaKxNOKjHRfmwdml6UeK3WdYm3WF23m3jtVOzD/f6zkuC3d+
         i8RQ==
X-Forwarded-Encrypted: i=1; AL+hErGz6KN4jZnDilBHc+2RovC3oPkpyMzhV/zjUKDhGxajeQ8+e/Riqpsi7APRDqpa3tSDmmEo+XrX0wfgkXJNCEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sB+QFPYX/HtuITm91qPKYc0NSTF8UQKnLidiWB9zD9JlKtjZZ
	LlNJu+2WTwZa3P/v00dabIQ0HAOdDvBikSRJd/L3c8e3YWMOVKmfgR82QhTIjn6TLkCZ1P6owPu
	FCCVmZIBByCKHoPJrhLyeOkwAdw==
X-Received: from dybsr17.prod.google.com ([2002:a05:7301:7191:b0:385:8165:80dc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr2006239eec.17.1795153800865;
 Thu, 19 Nov 2026 21:50:00 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:14 +0000
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
Message-ID: <20261120045918.1239746-4-almasrymina@google.com>
Subject: [PATCH net-next v4 3/7] net: guard memory provider RX queue open and
 close on unregister
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

These issues were discovered during AI code review (Sashiko) of the
earlier non-leased devmem unregister series and confirmed by code
inspection (not observed in production or reproduced on real hardware).
Tested with the nl_netdev.py selftest on netdevsim added in this series.

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
2.56.1.750.gf70dc682cf-goog

