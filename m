Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349348;
	b=Ewn7khUvIOSojfJUohdKqVqQ+66iu6YqhQWPTXMfl9PygISZNXGz1tqPJFOcLv+iLFEC
	 JzX26/ZId4BpPXvyF3xqXufDUn458GWa0jro5DG85bGkUJ1W+spxO+9wtypZSXi9C06g8
	 iSHsM8ful43EjSSBWQ+7QPEmJF5wrtImO+zxkijxWaip4K8gIVbrmX6mwwe5WFUwb1syy
	 zmefX/7sMLQ1MLuxyz2W2qQvsVqto1lyTDhBwlie79Y02Ln8L9erp41P+M26ur8//m0pO
	 JmVX7HN6hKVFDjtFNMGc4k8JTibEAhTFdxqJcQWveThUzpIfKyMOyiPBe+y35MTkhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=jHyNlNvNR9ywwPFvdKaBIz/ONRS36ufClM70oq5pOOI=;
	b=mS19UMAlGno8cJ/MjXpQs5VqZ4zO+EiIV4Vte8dS31BEGc9YBX/pI45qRWX9crEkOkXW
	 bKnN8k6fPVeQxkMzZr+/bm+lDkohqIH9B5xWcEuScSv9r8lnj/766rrcQQVrlIABzvT3M
	 43o881oyACWxqOfNzTS1dFA3Fkp2mHf8WQMv4bvY6w+SZxL5hgDwnzPBDru+rjSHEPMw7
	 EgITqjkDqMFXJz/1QqGp6sKGwO6qo08PCyYI1q3EWc6o4GPW2VCohkcFmBFmbYwoF1sCr
	 u+cN5dGzvIwn3XiEGczXg7hPsJqrUai6l5Ki4jCw5LPfM6b2XV3r9gIYOZsiuaaCfLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fFEkHr3Q;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60A606A338
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 08:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A60A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fFEkHr3Q
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-193b5eb133eso633030c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793349342; x=1793954142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHyNlNvNR9ywwPFvdKaBIz/ONRS36ufClM70oq5pOOI=;
        b=fFEkHr3QnCG9UZIoOo+WAbDfKNns3G7QVO9zbzHSEwxHsIEsaL1XL7XUFWBlihZtN7
         SNB0sSZJ4JHmsrOCxu8W/5TWPmo0mq35LoDXhc0T/5uaWOl87acRSvFzN2Zu0Cf/WmwR
         up6ULMGlzWhBFjRKiVv6vjpXMeD1YHy6CqLBM/jOuXlC/AM5X3girSOgp9iPCj5yCmcY
         3nEByzasuQUkJydBV6lol8MPUob8benkLop5xEOUODPNxZWAApF7zhxzWqnSBNtZ95sN
         RSNnIuWD4dvmCy9Z/T+E97jxu1mlneVPwa+RKzO144M4836Am+i5AOmdeQIOYaAL1d3K
         v0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349342; x=1793954142;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHyNlNvNR9ywwPFvdKaBIz/ONRS36ufClM70oq5pOOI=;
        b=R3+ONA2jXHYJ+nxNdlC4syKrqj+6xu6MXzPelu3n6OjNn9i4HxYeHpZdX0tOOevWSd
         Uhdrx40ytuF1vx8qSK20SqJd8wpnsokSXlp+3pw28smvrKYyOqXGvJr2SEHQcHSUF5MZ
         f8p1YXEupi8TRONxMk+UnnluN38d/k3CGT/TPcwR6Lvte9IA5OSibg2qLKrgtoIHyyQB
         MZT7TqSN7EFIWyecEK7sX5UKeWdaI8oYOb4cRHhfpAqu0X15hCBnSrvAi26pq4EaLN9z
         nstUaq8lTk1ZgvjhnzWGyt92hIt9Ye2b4tGCVzrrMyMNp67PMWnv8nf+cZ7Q/LJnyPhd
         I1RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHK/u6t1bdrxuMmuxl6lyMNPsiayMk7IXyaoOvrRRZfRt1wRohwBmueBnQef1z1RDJVS5ePuJ9lM5oqpbnp5U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTIzuIkS8VwBhblnC/CQFfAsKo7IUDWWq82NEM46MaNMp4kG1d
	haP+L4hA30bh/wCbWAOLgra+3ILbz6ZOMJs4gT+xaygZIFLOGjiX7lWuorbsmirOuQ1XgaOPc6k
	B++B80iL2RbfOcAFJEyNGN498oQ==
X-Received: from dlbts24-n2.prod.google.com ([2002:a05:7022:b058:20b0:196:fddb:e14f])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:ca8a:b0:1a6:887b:16e5 with SMTP id a92af1059eb24-1ac5e31f9a1mr2527494c88.27.1793349342072;
 Fri, 30 Oct 2026 01:35:42 -0700 (PDT)
Date: Fri, 30 Oct 2026 08:35:36 +0000
In-Reply-To: <20261030083539.777877-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030083539.777877-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030083539.777877-3-almasrymina@google.com>
Subject: [PATCH net v5 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Taehee Yoo <ap420073@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
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

Extend net_devmem_dev_unregister() and __net_devmem_dmabuf_binding_free()
to TX bindings, including ones whose netlink socket is already closed
but which TCP retransmits keep alive:
- When binding->dev (the physical DMA-capable device) unregisters,
  clear the binding's NET_DEVMEM_BINDING_LIVE mark, unmap the dma_buf,
  and clear both binding->vdev and binding->dev. No grace period is
  needed: the device is already closed, so nothing hands the DMA
  addresses to the hardware anymore, and concurrent senders only compare
  against binding->dev.
- When only binding->vdev (virtual device) unregisters while
  binding->dev lives, only clear binding->vdev so no new TX sends match
  the virtual device while allowing in-flight TX packets on binding->dev
  to finish DMA safely.

This issue was found via LLM-assisted code review (Sashiko) and
reproduced and verified with the new nl_netdev.py selftest on netdevsim
(not tested on real hardware).

Fixes: bd61848900bf ("net: devmem: Implement TX path")
Fixes: 1abe839b34ae ("net: devmem: support TX over NETMEM_TX_NO_DMA devices")
Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
Cc: Kaiyuan Zhang <kaiyuanz@google.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Kaifeng Wang <kaifengw@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
v5:
- Inline the TX unregistration check into net_devmem_dev_unregister()
  (Stanislav), and clear binding->vdev under the xarray lock (Sashiko).
- Lock binding->dev in __net_devmem_dmabuf_binding_free() for TX
  bindings as well now that net_devmem_dev_unregister() detaches them
  (Sashiko).

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
 net/core/devmem.c | 24 ++++++++++++++++--------
 net/core/devmem.h |  6 ++++--
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 4610de805ef08..5c7d9640e9d14 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -149,7 +149,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 {
 	struct net_devmem_dmabuf_binding *binding = container_of(wq, typeof(*binding), unbind_w);
 	netdevice_tracker dev_tracker;
-	struct net_device *dev = NULL;
+	struct net_device *dev;
 
 	if (binding->freelist)
 		WARN(binding->free_count != binding->area.num_niovs,
@@ -157,8 +157,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		     binding->area.num_niovs, binding->free_count);
 
 	kvfree(binding->area.niovs);
-	if (binding->direction == DMA_FROM_DEVICE)
-		dev = net_devmem_lock_dev(binding, &dev_tracker);
+	dev = net_devmem_lock_dev(binding, &dev_tracker);
 	net_devmem_dmabuf_binding_unmap(binding);
 	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
 	net_devmem_unlock_dev(dev, &dev_tracker);
@@ -252,11 +251,20 @@ void net_devmem_dev_unregister(struct net_device *dev)
 
 	xa_lock(&net_devmem_dmabuf_bindings);
 	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
-		if (binding->direction != DMA_FROM_DEVICE ||
-		    READ_ONCE(binding->dev) != dev ||
-		    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
-				NET_DEVMEM_BINDING_LIVE))
-			continue;
+		if (binding->direction == DMA_FROM_DEVICE) {
+			if (READ_ONCE(binding->dev) != dev ||
+			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
+					NET_DEVMEM_BINDING_LIVE))
+				continue;
+		} else {
+			if (READ_ONCE(binding->vdev) == dev)
+				WRITE_ONCE(binding->vdev, NULL);
+			if (READ_ONCE(binding->dev) != dev)
+				continue;
+			WRITE_ONCE(binding->vdev, NULL);
+			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
+					NET_DEVMEM_BINDING_LIVE);
+		}
 
 		xa_unlock(&net_devmem_dmabuf_bindings);
 		if (!netif_is_queue_leasee(dev))
diff --git a/net/core/devmem.h b/net/core/devmem.h
index a9c38ed6eaa44..c4f476947dfaa 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -26,8 +26,8 @@ struct net_devmem_dmabuf_binding {
 	 */
 	struct net_device *dev;
 	/* Opaque cookie identifying the virtual device (e.g. netkit) the user
-	 * called bind-tx on. Used only for pointer comparison. Never
-	 * dereferenced.
+	 * called bind-tx on. Used only for pointer comparison via READ_ONCE()
+	 * and cleared with WRITE_ONCE() on unregistration. Never dereferenced.
 	 */
 	void *vdev;
 	possible_net_t net;
@@ -45,6 +45,8 @@ struct net_devmem_dmabuf_binding {
 	 * those refs are dropped and the binding is no longer desired or in
 	 * use. RX bindings are unmapped earlier when their queues are closed or
 	 * uninstalled, unless a leased or busy queue may still use the binding.
+	 * TX bindings are also unmapped earlier if their device is
+	 * unregistered.
 	 *
 	 * net_devmem_net_iov_inc_ref() on dmabuf net_iovs will increment this
 	 * reference, making sure that the binding remains alive until all the
-- 
2.56.0.385.gac671c819a-goog

