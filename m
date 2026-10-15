Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35EA52FE59
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082373; cv=none; b=G9VYzIWkEaiWptYIGKea4isRxlZXFjwxgSNQyjF6MM/7NEL5RgcuBtHUMFvF9qr25ik/RPbXe+8+bhVCu9bHtg8CoVGDN4EOAPikvw4GiFoEnQ6vN8dLXOaBl8ZM3Fqd7P3K48lMZcI79o6lYy4P2NGM0nxoBGfVJMBaSMn3EKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082373; c=relaxed/simple;
	bh=Txx+SO8uwxuJ3Ktm0Hsppbh1+qsaoXJIVwNfp/iA60c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sdcpuZhRNWeBy30VvMYFabrDWM1FGVRc24hzfo91sjdGUgOldRLFzKD9aLGaYszcADLN/tQJyAzPU2hSg+W5Ew1/Yj5fIJUwXrg5ieAZAhyGA6qa0z9gNBQoVSyPfDxkpvNy7VtBqq0DOVxVShE8Yc8gKFrAgOmEy/Qf2GpHzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vU3JClWM; arc=none smtp.client-ip=74.125.82.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vU3JClWM"
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso3684481eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792082360; x=1792687160; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vrwp4HC01Z0kE3Wy37HFrMt6VtKQXq+YFsCUGH+2uM=;
        b=vU3JClWMPNW5ElQ8feAR72mxmIX2PCnO4bxjp4/R11y5IM5XV/sD4kXV5htO4OqOdR
         7Vot/wqHdDiSK91zr5POlP2ZB5VCPDNBKZIgKx3NH9F5b/fSiBIOI2Qg2o5EhRVKVY8X
         odIoO4rNmn7j8+RiT9BD1JXLPlPdxBCYJ0r+j036EsADDOGSY4CFwG31l+jgr5gOomQg
         IGJ4/XzUDp4Cuy3imrMJueH/zn93HrvhDsXicPF7hgxtLAPNC/Jt8bBXwjQY5g6826c5
         2a1sFRl49SzFLyiBcmTaCUNgVt08W9ILrpPr6oNOA8lfR7r7esO/pmUNkkidd/o9wqw5
         fXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082360; x=1792687160;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vrwp4HC01Z0kE3Wy37HFrMt6VtKQXq+YFsCUGH+2uM=;
        b=OCK1r8zJh0UkHmwdDIfS05FWGPhW+VMGhOVr3eMf8GtLTneX448eL534PWKP3ptCXH
         N63+p5j8MsDPKo+0vksrLDTU1BL8Qj/NpdmJYgKknWbpZ180fIEmV/fjrIdpWN0mZ2hn
         fNUSLpHGFEQ/g+gpngX7hReXFTWwaX5JtxaYLpHt+KVorV+/F0KIUtsPvwwEJrbz3bdX
         KLGe9dp3/xfdMXCnL7q2+G+/pjv8FBxqtmAHBFRUDfD5KG0WkAYmc+DGK66wBVt2k4ZM
         YQB45oYrh7+ka8cSjTzYN5GkMDVcL/WxgqeTWpakTH2AgZahuz6li8tcBY9/hzpuoTu9
         Iusg==
X-Forwarded-Encrypted: i=1; AKwUvBw/aHnd9ZLarphSmOj46XeokSGm94pxkMxx7QJtDgrSF2w0oWx4I7h6w4cgDRJlggxuKIf/g3jWfI4e55j4eAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwX9fSK9FhOdLyHzeAmGuA7YsmysKdcRaSJ+RMci0Xqh4bY3S4
	C9YUk4bvgC6lJoxASfQfZ8h6gwYIJ5McftL67i2fbzXh2JcK93hqZhN7hgehCIqFXXqKLWv5k/B
	IiCDjv34SpdiGIO1G1moFhL8aSg==
X-Received: from dybtm1.prod.google.com ([2002:a05:7300:f0c1:b0:358:cd5e:4e5c])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:e002:b0:35d:5a2c:2321 with SMTP id 5a478bee46e88-35d5a2c2980mr8679042eec.20.1792082358745;
 Thu, 15 Oct 2026 09:39:18 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:39:13 +0000
In-Reply-To: <20261015163915.1166043-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015163915.1166043-3-almasrymina@google.com>
Subject: [PATCH net v4 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
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

TX devmem bindings (NETDEV_CMD_BIND_TX) have no bound RX queues, so
mp_dmabuf_devmem_uninstall() never runs when binding->dev or
binding->vdev unregisters. As a result, binding->dev and binding->vdev
dangle pointing to freed struct net_device memory, and the dma_buf
remains attached and mapped after device removal.

Closing the netlink socket after netdev unregistration dereferences the
freed struct net_device in netdev_nl_sock_priv_destroy():

  BUG: unable to handle page fault for address: ffff88824ca9b000
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:netdev_nl_sock_priv_destroy+0xbd/0x1e0
  Call Trace:
   genl_release+0xf5/0x190
   netlink_release+0xd01/0x18d0
   __sock_release+0xb0/0x270
   sock_close+0x18/0x20

Extend net_devmem_dev_unregister() to TX bindings, including ones
whose netlink socket is already closed but which TCP retransmits keep
alive:
- When binding->dev (the physical DMA-capable device) unregisters,
  clear the binding's NET_DEVMEM_BINDING_LIVE mark and both
  binding->dev and binding->vdev, and unmap the dma_buf under
  binding->lock. No grace period is needed: the device is already
  closed, so nothing hands the DMA addresses to the hardware anymore,
  and concurrent senders only compare against binding->dev.
- When only binding->vdev (virtual device) unregisters while
  binding->dev lives, only clear binding->vdev so no new TX sends match
  the virtual device while allowing in-flight TX packets on binding->dev
  to finish DMA safely.

Fixes: bd61848900bf ("net: devmem: Implement TX path")
Fixes: 1abe839b34ae ("net: devmem: support TX over NETMEM_TX_NO_DMA devices")
Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Cc: Kaiyuan Zhang <kaiyuanz@google.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Assisted-by: LLM
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
v4:
- Detach and unmap TX bindings directly from the xarray walk, without a
  grace period or a second pass (Stanislav).

v3:
- Detach all matching TX bindings first, then call synchronize_net()
  once before unmapping them, instead of once per binding. Don't wait
  for a grace period when only binding->vdev is cleared, since vdev is
  never dereferenced (Sashiko).
- Don't detach TX bindings when the device only moves to another netns
  (Sashiko).

v2:
- Build on the net_devmem_dev_unregister() walk from the previous patch,
  so unbound TX bindings are also detached (Sashiko). Clear the
  binding's LIVE mark instead of erasing its ID.
- The walk holds net_devmem_lock, which the final free also takes
  before erasing the binding, instead of using RCU and
  percpu_ref_tryget(), so it no longer takes a binding reference
  (Stanislav).
---
 net/core/devmem.c | 22 +++++++++++++++++++++-
 net/core/devmem.h |  3 ++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 20d95b24d5951..d33a092c6e4bb 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -207,11 +207,30 @@ net_devmem_dev_unregister_rx(struct net_devmem_dmabuf_binding *binding,
 			    NET_DEVMEM_BINDING_LIVE);
 }
 
+static bool
+net_devmem_dev_unregister_tx(struct net_devmem_dmabuf_binding *binding,
+			     unsigned long xa_idx, struct net_device *dev)
+{
+	if (binding->direction != DMA_TO_DEVICE)
+		return false;
+
+	if (READ_ONCE(binding->vdev) == dev)
+		WRITE_ONCE(binding->vdev, NULL);
+
+	if (READ_ONCE(binding->dev) != dev)
+		return false;
+
+	__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
+			NET_DEVMEM_BINDING_LIVE);
+	return true;
+}
+
 static void net_devmem_dev_detach(struct net_devmem_dmabuf_binding *binding,
 				  struct net_device *dev)
 {
 	mutex_lock(&binding->lock);
 	WRITE_ONCE(binding->dev, NULL);
+	WRITE_ONCE(binding->vdev, NULL);
 	if (!netif_is_queue_leasee(dev))
 		net_devmem_dmabuf_binding_unmap(binding);
 	mutex_unlock(&binding->lock);
@@ -229,7 +248,8 @@ void net_devmem_dev_unregister(struct net_device *dev)
 
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
-		if (!net_devmem_dev_unregister_rx(binding, xa_idx, dev))
+		if (!net_devmem_dev_unregister_rx(binding, xa_idx, dev) &&
+		    !net_devmem_dev_unregister_tx(binding, xa_idx, dev))
 			continue;
 
 		xa_unlock(&net_devmem_dmabuf_bindings);
diff --git a/net/core/devmem.h b/net/core/devmem.h
index a834e0f698c7e..ce069e1736416 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -39,7 +39,8 @@ struct net_devmem_dmabuf_binding {
 	 * The binding undos itself and unmaps the underlying dmabuf once all
 	 * those refs are dropped and the binding is no longer desired or in
 	 * use. RX bindings are unmapped earlier, once they are no longer
-	 * installed on any queue.
+	 * installed on any queue. TX bindings are unmapped earlier if their
+	 * device is unregistered.
 	 *
 	 * net_devmem_get_net_iov() on dmabuf net_iovs will increment this
 	 * reference, making sure that the binding remains alive until all the
-- 
2.56.0.176.g3575e65682-goog

