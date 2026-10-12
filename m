Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808C4C1507
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826989; cv=none; b=ZtDBBVpkPWVmkM+zF70aALV2smIQKP0zajt+srumOmNzQsyZaUMmV7wqMrxE4cghKgHEG3is5QScPDolqBwuPKIUubDxDyjbjdhEBgNfn4AbI3u9xZmmPXa4RH9SrUvs9LhyPJK9OkE5EG6MzEUNF6Jlu31lmSR2AbsCifcP3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826989; c=relaxed/simple;
	bh=iqpTvKnH6d6zWZnJaE1iHLhrSSe6o6jscNKrnrdieWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=btvrTxLfCitGSMqgsv0BPpY1IBp8LEaud3XEfeCv0BW+lwovTrtDvg8oqWXGc1AQYfm3Oy8oTLPrzXaSLG0r/mqxlfGJKLWLlLRoO0YShqz2Kqw6Dz43y8KavpkRO5Qw9QZZRVmRSkNEND/ZbALZ/5mWXKoLPpxjdthSebIT2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pXsjwSjx; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pXsjwSjx"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6124829eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791826987; x=1792431787; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IPXKRkhi+tNf7WTVrgtIUiWsyJoo8B14Fo7i04lARs=;
        b=pXsjwSjx5mZRTT1KNOk9IytWdXD25zsWiGw2q7lXWVmBiJYnbCnioMQmpG4W8VD8ao
         omVdFgvC6onlJl+JpvOYcbeoflA58Aglv2lnrKZPsZAbNmckb/ClvD1Gm6Wl0+m4yBbE
         zJRP9pS1LM67Ot45kgwauXQkVGCG+F+pNEplMvrCGDF0FQmL4ilH8mZ+TiPhdFgT2UO9
         q0SLbndzvdfRXeM8MB9+SaDzwH+vD9pdYncTuathbwt8VyZBIB66YoHDJ6uxcITl13PQ
         08fPl1owgDy1M0XoZX5aoBCqxAKDjV8NegOrF9R1quJJL4kzj1PHLZn4ZWkq7wyB7us+
         Cirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826987; x=1792431787;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IPXKRkhi+tNf7WTVrgtIUiWsyJoo8B14Fo7i04lARs=;
        b=tvNDVhneMy2q7F9Vom88jEVTpLOcVirK93E4ECsElF+/KlTUGnBV3iLyqVvT2Lf3XA
         lUauPPFiLaHOIr3uLDeQ7GGlQl/+ebzq2O795wXSeF1JY87SAE3RE0hD5LtZt4/F06UQ
         /Z+dZJOPQMP3g1KYUcDJJgPMAQ49f9GF6kL5x5YturPgLJN69wX+WRjSAdFGOGFoLyrc
         4zqt3Pxf+AGL6+yC304FmRrxkCe+tvPyugKrj5hhK917CQF/wgp702v+U0p29OksHgR/
         gA3WupuvHRLbwYpFg/tzMAK0pZhhBCU5LonO7i7Kf+K/sltJCqLAolAmHTi75Yin3EhY
         Il3A==
X-Forwarded-Encrypted: i=1; AKwUvBx+pi1+4h/hFD1zA2+rBR1HdtGtgxtQPEVS2W63fSV4waG17n24vvjk3mc1L+QAty5W79LSD+TKBUBTeJDXw9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjRcBqObiXVKz/0KA6oSnlmVBGLzmdXhcZsWq8ivLVPFKI0is0
	SNAb+qAMHWcKDHhZrd+0uKUYh0Qzvy/t/JlsXZdjD8OyBxXezkG6qfNi+mHnyJNUrvNSqT+F8De
	j4IAVrQxAoI7FG3js7k208Em7vA==
X-Received: from dyay11.prod.google.com ([2002:a05:693c:62cb:b0:33c:286e:b614])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:ce13:b0:35a:3045:3aff with SMTP id 5a478bee46e88-35a3054a74bmr6086881eec.29.1791826986262;
 Mon, 12 Oct 2026 10:43:06 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:42:58 +0000
In-Reply-To: <20261012174300.2338784-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012174300.2338784-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012174300.2338784-3-almasrymina@google.com>
Subject: [PATCH net v2 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
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
  clear the binding's NET_DEVMEM_BINDING_LIVE mark, clear both
  binding->dev and binding->vdev, wait for in-flight RCU/TX readers via
  synchronize_net(), and unmap the dma_buf under binding->lock.
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
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
v2:
- Build on the net_devmem_dev_unregister() walk from the previous patch,
  so unbound TX bindings are also detached (Sashiko). Clear the
  binding's LIVE mark instead of erasing its ID.
- The walk holds net_devmem_lock, which the final free also takes
  before erasing the binding, instead of using RCU and
  percpu_ref_tryget(), so it no longer takes a binding reference
  (Stanislav).
---
 net/core/devmem.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 02d607cc87217..a1c029f6ae47f 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -192,6 +192,36 @@ net_devmem_dev_unregister_rx(struct net_devmem_dmabuf_binding *binding,
 	mutex_unlock(&binding->lock);
 }
 
+static void
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
+
+		/* Ensure no tx net_devmem_lookup_dmabuf() or
+		 * validate_xmit_unreadable_skb() are in flight after detach.
+		 */
+		synchronize_net();
+
+		mutex_lock(&binding->lock);
+		net_devmem_dmabuf_binding_unmap(binding);
+		mutex_unlock(&binding->lock);
+	} else if (READ_ONCE(binding->vdev) == dev) {
+		mutex_lock(&binding->lock);
+		WRITE_ONCE(binding->vdev, NULL);
+		mutex_unlock(&binding->lock);
+
+		synchronize_net();
+	}
+}
+
 void net_devmem_dev_unregister(struct net_device *dev)
 {
 	struct net_devmem_dmabuf_binding *binding;
@@ -201,6 +231,8 @@ void net_devmem_dev_unregister(struct net_device *dev)
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
 		if (binding->direction == DMA_FROM_DEVICE)
 			net_devmem_dev_unregister_rx(binding, xa_idx, dev);
+		else
+			net_devmem_dev_unregister_tx(binding, xa_idx, dev);
 	}
 	mutex_unlock(&net_devmem_lock);
 }
-- 
2.56.0.385.gd3acb90ef8-goog

