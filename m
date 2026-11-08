Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117492;
	b=MHg8MOz5wYSJmljzSUzgMuZrofHpZn8Ick82KEW6znBouGMRiSo0fWJR4B7f++DKOgeh
	 e7uPtjJU+mu9J75uIV2y1q0RqcyTkwZ5V9f9U4dYyLEBFHCImRN3TiZvGdaENCnWp36M+
	 obC19jnI5yszPdY5cWPHLt1vKiGN5HR8SrcHEIZbFaXcq4h8SkceQWk+Vxvlq5sciDoqe
	 Au6D3PYhIS1Xr+Jod9886lHRtv9dEhzov4GeUymaeC9zg1Peav8frL7yXCYkwWOBUBeO0
	 0CCiHDr6+YVYjkCM69xC66XWzgdZXorceoxjtlkpvkBgDMunl1AE2FUJ4WfwD7xpzsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=u3RHHi7TQr+0R9mtfdFGqUwCh1WYEhpEvKebAIxrXYk=;
	b=v4DE/qggszv7vU+JSagqwHSfnNoLfPmNIzfC5ikxkbqziFJ0QBIqT8RzBC27Q2/W+MCW
	 cShypKE07QHbHx1tidG9mpOi1dfMV7HwpB+vb4M89F3VXOesYdbzSbIeHeCi1fTlxbdxw
	 CKhIZjTIeHregCyBakbXSPSixOB4ARJR6hTRTFxui/98vJ8AJ3sApUORI5rOex6WgsYS3
	 OIddfj4NcWa/bEj+pg9MLwspGDb6o43KlBOXb5MiO9dHXpHAxCqMJrEh/TONGwNpcpLf1
	 M7nBoH50/FzvG0JUsZCSDygQAikx7y8itL06kIxnDC0aK9yRXRZwxpwbSamfkzgTHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ioW9iYYW;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0AA606A323
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 05:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0AA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ioW9iYYW
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ac19c6bc71so131909c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 21:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794117491; x=1794722291; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3RHHi7TQr+0R9mtfdFGqUwCh1WYEhpEvKebAIxrXYk=;
        b=ioW9iYYWMe5JoAQ+sUL6lY07mTIWSHoCgV1VCJTxQuUhJkaFRKjPAsztGrwOa0wp2C
         aTHRyeZbgp0UYd+2Z9OU2C8oN0UsWA0HFoGUl8zK8bFCDBIO7BWMkQf1/UV2cQCdSZV1
         xdAtuKP3D1j1OAifAhhAvpC4+7PDPRTl1HPoKnbIGXE8atEtnB6mlIGnZUJ3wYYI/t3l
         ntZVi/UW8aUNp8g78Gn6j+WXEKMDYu+m3U9bcQ+cxYveEwZlRomogDgzt4gHCaBJAaKl
         mjUNbHfZ+Z5Mqg5iir3jOdYMVxespOLfhgY1zGjJUkP9R3I6LdFMSnRYlTrztUWX/6P9
         UKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117491; x=1794722291;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3RHHi7TQr+0R9mtfdFGqUwCh1WYEhpEvKebAIxrXYk=;
        b=M+eJxHAY/ZnafSk8bcBEedODE8oOdMgPf8tYEL1iH+5AkFF5/SOAWjbAMvo/P/AoZW
         qEzie5iAyzeTvmE7Sk72GioPOyRMycp/6Iss7F1L8I3DsjeVh/ZMvmCYDdFdF9cu6cbO
         yuZuGZs/ExiyY/m90EinBKA82mmLDiAIA9l3LAwFiD/KODFdxo6hYp+MFmrGSV8V4LW2
         ixNFSdrL4sg5CjAeGOZ9cB6uxpWEySAI9vOQah8OUPxegL6dCB6qFyZJU2fl5LnpqGZO
         O8Vc4CoXGMrg/s3S99GYdmKUu6s79nvfUm6XS+/va1rwsX1h/F0c/eA0uXnCAYRMjbxO
         2t1A==
X-Forwarded-Encrypted: i=1; AKwUvBzoW2yyJT8Bd0q3f4TBYWLG0rjiT6ZEJP1LDLPScaQMGv1RWw5prGKlzUbOErsqBW96C55A2SlJ1t1DgY0ORS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KCNYoyTdV2Ibmhbwq059KIS3hrUF5Mc3afhC3VykYE5ixNrac
	loPFLP1v5hWN/hucZvxvCa6YA2KhzQM2abOQdjTs7vF1mAxG4EiYkcH32ePub/bS8ap4kx/9O3s
	91WrCVVnxc2PjgFOUxjiubQw1Fw==
X-Received: from dleg9.prod.google.com ([2002:a05:701b:4309:b0:1a3:1342:a32d])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4247:10b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b39fec5b8bmr1093729c88.36.1794117490920;
 Sat, 07 Nov 2026 21:58:10 -0800 (PST)
Date: Sun,  8 Nov 2026 05:58:04 +0000
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
Message-ID: <20261108055809.2122934-2-almasrymina@google.com>
Subject: [PATCH net-next v2 1/6] net: devmem: pass net_device pointer to net_devmem_lock_dev()
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

Upcoming changes for leased queue support will track the physical DMA
device and the bound device in separate net_device pointers on struct
net_devmem_dmabuf_binding, with different teardown paths locking
different pointers.

Generalize net_devmem_lock_dev() to take a struct net_device **dev_ptr
instead of struct net_devmem_dmabuf_binding *. No functional change.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c      | 36 ++++++++++++++++++------------------
 net/core/devmem.h      |  4 ++--
 net/core/netdev-genl.c |  2 +-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 5c7d9640e9d14..f164c90e90b3b 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -85,39 +85,39 @@ net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
 }
 
 /**
- * net_devmem_lock_dev() - lock a binding's net_device if still alive
- * @binding:		devmem binding whose @dev pointer to lock
+ * net_devmem_lock_dev() - lock a binding's net_device pointer if still alive
+ * @dev_ptr:		pointer to the net_device field on a devmem binding
  * @dev_tracker:	reftracker for the held net_device reference
  *
- * Safely dereference @binding->dev, acquire netdev_lock() on the device, and
- * verify that @binding->dev has not been cleared while waiting for the lock.
+ * Safely dereference @dev_ptr, acquire netdev_lock() on the device, and
+ * verify that *@dev_ptr has not been cleared while waiting for the lock.
  *
- * Invariant: @binding->dev is set once at bind time and is only ever cleared to
- * NULL while holding netdev_lock(dev) (in mp_dmabuf_devmem_uninstall(),
- * net_devmem_unbind_dmabuf(), or net_devmem_dev_unregister() during
- * NETDEV_UNREGISTER before synchronize_net() and netdev_run_todo() free the
- * net_device).
+ * Invariant: *@dev_ptr is set once at bind time and is only ever cleared to
+ * NULL while holding netdev_lock() on that device (in
+ * mp_dmabuf_devmem_uninstall(), net_devmem_unbind_dmabuf(), or
+ * net_devmem_dev_unregister() during NETDEV_UNREGISTER before
+ * synchronize_net() and netdev_run_todo() free the net_device).
  *
- * Taking rcu_read_lock() guarantees that a non-NULL @dev read from
- * @binding->dev has not yet completed unregister_netdevice_many_notify()
+ * Taking rcu_read_lock() guarantees that a non-NULL device read from
+ * *@dev_ptr has not yet completed unregister_netdevice_many_notify()
  * (which waits for an RCU grace period via synchronize_net() after
  * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
  * safely acquire a reference before sleeping on netdev_lock(). Once
- * netdev_lock(dev) is held, re-checking that READ_ONCE(binding->dev) == dev
- * guarantees that the device has not yet been detached from @binding and
+ * netdev_lock() is held, re-checking that READ_ONCE(*dev_ptr) == dev
+ * guarantees that the device has not yet been detached from the binding and
  * cannot finish unregistering until net_devmem_unlock_dev().
  *
- * Return: The locked and held net_device if @binding->dev is still non-NULL,
+ * Return: The locked and held net_device if *@dev_ptr is still non-NULL,
  * or NULL if already cleared.
  */
 struct net_device *
-net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
+net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker)
 {
 	struct net_device *dev;
 
 	rcu_read_lock();
-	dev = READ_ONCE(binding->dev);
+	dev = READ_ONCE(*dev_ptr);
 	if (!dev) {
 		rcu_read_unlock();
 		return NULL;
@@ -126,7 +126,7 @@ net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
 	rcu_read_unlock();
 
 	netdev_lock(dev);
-	if (READ_ONCE(binding->dev) != dev) {
+	if (READ_ONCE(*dev_ptr) != dev) {
 		netdev_unlock(dev);
 		netdev_put(dev, dev_tracker);
 		return NULL;
@@ -157,7 +157,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
 		     binding->area.num_niovs, binding->free_count);
 
 	kvfree(binding->area.niovs);
-	dev = net_devmem_lock_dev(binding, &dev_tracker);
+	dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
 	net_devmem_dmabuf_binding_unmap(binding);
 	xa_erase(&net_devmem_dmabuf_bindings, binding->id);
 	net_devmem_unlock_dev(dev, &dev_tracker);
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c4f476947dfaa..c0aaba0041ff6 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -100,7 +100,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 		       struct netlink_ext_ack *extack);
 struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id);
 struct net_device *
-net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
+net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker);
 void net_devmem_unlock_dev(struct net_device *dev,
 			   netdevice_tracker *dev_tracker);
@@ -189,7 +189,7 @@ static inline struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
 }
 
 static inline struct net_device *
-net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
+net_devmem_lock_dev(struct net_device **dev_ptr,
 		    netdevice_tracker *dev_tracker)
 {
 	return NULL;
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 9c5bf17b04e57..2826f7e328340 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -1476,7 +1476,7 @@ void netdev_nl_sock_priv_destroy(struct netdev_nl_sock *priv)
 
 	mutex_lock(&priv->lock);
 	list_for_each_entry_safe(binding, temp, &priv->bindings, list) {
-		dev = net_devmem_lock_dev(binding, &dev_tracker);
+		dev = net_devmem_lock_dev(&binding->dev, &dev_tracker);
 		net_devmem_unbind_dmabuf(binding);
 		net_devmem_unlock_dev(dev, &dev_tracker);
 	}
-- 
2.56.0.455.g6c5a503b38-goog

