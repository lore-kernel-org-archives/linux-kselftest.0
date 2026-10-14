Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD9542ECC
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 16:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994688; cv=none; b=VxUmV9g0EOFmugvtxZLitBbET3lB3x/EBNr8t6j2WvBM/PUo87Wql2wqnwbfx0iM4GU+V7nXZQ1pCn4FyMdJNUoTQAXzFxckkZC+OflJTbXdNMVNMEFX4Nr1tkl+EUGbR/FlT8OSzaSKhh8F8pG/lVG6W5yXtcwbnKJK4OX2c+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994688; c=relaxed/simple;
	bh=dAgXe0XNd45p+baSOsW9FDQI1TPsr+qqpXRiROQBMgM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mwYNFJ0WVy9DHf+B/dHND4dB/UBAFeU4bJKiCmpdF+f6qQSraJnvfng1DWlXTlRjzXZ1a/4qQoJTFngJ2RvO4OyFT2cwZqNeSOs0qp+5u76yeokN7Y+vHptvY/EBnCPgtyMzoYMuVx9VTfLgx+uQHhZGxXhD0kpbxiVsx23S3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fnBJCiEW; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fnBJCiEW"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso2074579eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791994680; x=1792599480; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivOUg8vGPcnE+LE9XwDoyhijZ8m1lm4RK26pVgGfAJ8=;
        b=fnBJCiEWumvYwPG9FTGioB9kqJfLSG1PlJO1vOTVW6l7UnZ6ih9KKqBR+caPDqOEFj
         1MgeQwi8Zg31fJDErHbgC7ZjJTRJyWzyA9CecrNyTmzqrkcsaQpuGCZE9gCGdeOZ7/Y2
         q31nmNQyrsHed1+NB3YH/ZNh3KMkpkYJZtmTPVMwLf/rstnV+NeC7lxCAAb5vXrxBitd
         rnX+tlF+VzqyxLt9fBsIcbpQs1RTKOMLoIHr1ywUW0+5DwVrs+GumCady1B2jk1LKU/y
         McdXyTDbh+njd7EkZUfwqqy2e1EC3YExZHfP1iPQNZ76+NfIAJCSxVh5S1bd3aIbTep/
         lR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994680; x=1792599480;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivOUg8vGPcnE+LE9XwDoyhijZ8m1lm4RK26pVgGfAJ8=;
        b=mBQtvBQjX43rWtNoyuIpvGx1lWi4btsXfZy+7F5Y8hTKExrFb2sGFLhgE81VYi1DOE
         P9C7t3XpGuVnKdDyOdcvcXNn1Y9jbXpBB7sHX90/OFm0iPjjfEWSfTxgBSFAQRWntjXW
         LBfS80YgUHtY/T1zXQWdSw24au6XM6wTSfoxFoI/nmeg2j30U0cMVCdZhqZW+Nks9ET7
         /D34yh92s9fqM70O1KSoqM+j0/0a7XKTtaOGoCMXK3j3wqe7U3Ac88rSfPJ9UVLCKPks
         qAJRp6qR4NBymd0fcuuz+H28rer6rSsqXY+1epe713R3ONfWIidLHE/rYLlDOAkq2jcZ
         IAKA==
X-Forwarded-Encrypted: i=1; AKwUvBxxrqBpj3kUL1dqj/Eq0ySAtocDtywNn67NAvW091hm0HK1Pmq+pWkRw6zIg8wy72Jb1EaAbpXlpK7O37S8Sfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYISKWi1m3dD6NFE8J2HVyW/hBWcpSFrPeXVnW8JBM97SjA9rtJu
	OHsJbWJEzuLNnLoDC6mCnSATgHuedgmfQ+Xj5PsUxWqhzNmiGMah7XATj0KIYFaWohWpv8S0nZX
	LyY8GuY/oVlWQG6AucrMOcwgx2A==
X-Received: from dycmv5.prod.google.com ([2002:a05:693c:2805:b0:351:5787:a37a])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:f8c:b0:35c:ea0d:a9a6 with SMTP id 5a478bee46e88-35cea0daeb8mr4982706eec.32.1791994677848;
 Wed, 14 Oct 2026 09:17:57 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:17:52 +0000
In-Reply-To: <20261014161754.3782346-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261014161754.3782346-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261014161754.3782346-3-almasrymina@google.com>
Subject: [PATCH net v3 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
From: Mina Almasry <almasrymina@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>, Dragos Tatulea <dtatulea@nvidia.com>
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
  binding->dev and binding->vdev. Then wait for in-flight RCU/TX readers
  with a single synchronize_net() and unmap the detached bindings'
  dma_bufs under binding->lock.
- When only binding->vdev (virtual device) unregisters while
  binding->dev lives, only clear binding->vdev so no new TX sends match
  the virtual device while allowing in-flight TX packets on binding->dev
  to finish DMA safely.

Fixes: bd61848900bf ("net: devmem: Implement TX path")
Fixes: 1abe839b34ae ("net: devmem: support TX over NETMEM_TX_NO_DMA devices")
Cc: Kaiyuan Zhang <kaiyuanz@google.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Assisted-by: LLM
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
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
 net/core/devmem.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 93cc2815d935a..dd07203076808 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -192,9 +192,55 @@ net_devmem_dev_unregister_rx(struct net_devmem_dmabuf_binding *binding,
 	mutex_unlock(&binding->lock);
 }
 
+static bool
+net_devmem_dev_unregister_tx(struct net_devmem_dmabuf_binding *binding,
+			     unsigned long xa_idx, struct net_device *dev)
+{
+	if (READ_ONCE(binding->dev) == dev) {
+		xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
+			      NET_DEVMEM_BINDING_LIVE);
+
+		mutex_lock(&binding->lock);
+		WRITE_ONCE(binding->dev, NULL);
+		WRITE_ONCE(binding->vdev, NULL);
+		mutex_unlock(&binding->lock);
+		return true;
+	}
+
+	if (READ_ONCE(binding->vdev) == dev) {
+		mutex_lock(&binding->lock);
+		WRITE_ONCE(binding->vdev, NULL);
+		mutex_unlock(&binding->lock);
+	}
+
+	return false;
+}
+
+static void net_devmem_unmap_detached_tx(void)
+{
+	struct net_devmem_dmabuf_binding *binding;
+	unsigned long xa_idx;
+
+	/* Ensure no tx net_devmem_lookup_dmabuf() or
+	 * validate_xmit_unreadable_skb() are in flight after detach.
+	 */
+	synchronize_net();
+
+	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
+		if (binding->direction != DMA_TO_DEVICE ||
+		    READ_ONCE(binding->dev))
+			continue;
+
+		mutex_lock(&binding->lock);
+		net_devmem_dmabuf_binding_unmap(binding);
+		mutex_unlock(&binding->lock);
+	}
+}
+
 void net_devmem_dev_unregister(struct net_device *dev)
 {
 	struct net_devmem_dmabuf_binding *binding;
+	bool tx_detached = false;
 	unsigned long xa_idx;
 
 	if (dev->reg_state != NETREG_UNREGISTERING)
@@ -204,7 +250,12 @@ void net_devmem_dev_unregister(struct net_device *dev)
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
 		if (binding->direction == DMA_FROM_DEVICE)
 			net_devmem_dev_unregister_rx(binding, xa_idx, dev);
+		else if (net_devmem_dev_unregister_tx(binding, xa_idx, dev))
+			tx_detached = true;
 	}
+
+	if (tx_detached)
+		net_devmem_unmap_detached_tx();
 	mutex_unlock(&net_devmem_lock);
 }
 
-- 
2.56.0.176.g3575e65682-goog

