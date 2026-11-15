Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709570;
	b=ozc24/jVk2YoJGGH77q/jMafgcWjXMWKLz3TrhSLtmEmzhQhjVW19sWzt/p+66CReEsW
	 HSaq2hZuB0DN1J9p9sSkCjxuyeQTasjIS/ttJvq5h5sjIDWs6VjtARVgU4osBqQSc6zn7
	 EJ8Nzgi7QMsp9DzcpnYgLQUDeqJeA+RhgfdxVSuOLeiX853vELMTmtE0vhi8wOMaQfqV/
	 ug5bGEU1ld416yT3ANzTKOoMOKkeDSg9QD3BiNtCCwQb2l79mveoUdnBiSp1jOYYu5r79
	 zbhWBMFBaGRxBdrLf+dZUXxCNkYsC1Zd20DLzgdo/JXJKI4VWDHVe0TMr7Fjq0cTrCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Nu2KfAx9EwLYMiMTMGJ4z40Nsq0cjvafrI4oL87XKi4=;
	b=tJqcZh0d2/iWkFRTyC6edHPRT2xQpcqWelUBammh6OwJWd5rW0moQofY2obid5nNruZ3
	 4XN9eqY29OeNJeLhh2ZqPTYcGI7NB0ReHtUUAM21Z9fNLSs4lId9o4eLfA5ZffD0ut0Yq
	 Tvwnahr2QqUFRsU2Ych+dNOJAvfio+a+vOWUIX2qTEujuPXZxcfjbq88OL0wPrinzLpzx
	 7Ln1Nmyoz/yaKDhYzA7eS8MZrMvEfcVsp1evQK8sKh/Is2MAqV6/SgPMc+FWc4g4wvo5p
	 srO+m1/w7nUXXQjexM1nmVkCTxYfTnVqowh6BLqW1IbQ7kz90ij6psUbUp2QZ8gc06A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HSbeJN2w;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747B2606A337
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 747B2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HSbeJN2w
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso9513463eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794709570; x=1795314370; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu2KfAx9EwLYMiMTMGJ4z40Nsq0cjvafrI4oL87XKi4=;
        b=HSbeJN2wdAlO+lKssibklIeKvmcUvkTY1LSslYrERBgA0MAoo3DRsYhuDEYqSFvhLW
         YfiQOqywrW5NfVj+4Eyzmmasux+AgXzBEJ0GbAvBlK84dDV22/VTq5u8nr+YE0x4SOSn
         VhwXA3c1l4EIu07NxeZhZ/PjXmUo0ylc98SfVAKqulH8kgU9qot3oUy1pFZA6zN4eitL
         bMzUo2/XDCurqgNY9mqjqsZO03kthiBfoAVfS8SNpyle5UpwpUi4pwk8m79wVoAkJiRU
         gvKlvKOjk0aADb46lR7Xuf7U30DE7Aw8OAzTxGfJPpTDiP+DwZI7Gog1GuevWKnVOkQj
         LBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709570; x=1795314370;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu2KfAx9EwLYMiMTMGJ4z40Nsq0cjvafrI4oL87XKi4=;
        b=bIuUu8uRSF8Y3Le29sKxUHEUh+5hyDRutwX3ChJUP12uYMbO4c63ghRm/ljliar+3P
         BNPL4STyg2Oj+MSo/OTa57YYWmGgYuWEAE1+wRxqru+b1WlT39mnhlFKzWDa+ycT3F8X
         J8xJjMK7k5rpXVm/a5F50z/f05HljNy8FHx4JQPXjVt/zHiVseIQQ8OS4Y5g6nvArNx8
         hQ3xn8sqnD84ZnddTQJs515Nz/nfIZSsiw4LKYsp9uoO42TdOj10NuGk4J5U27J7qb9d
         ZZQDtr/wrX/Y6dFHPoPJdXqKLZEFmrGS6iLlGC0kL96MeoDg9r8igkbhHOvOyHGtnd+X
         Sxag==
X-Forwarded-Encrypted: i=1; AL+hErE7MKDx5Yq04sxaLeZ4baXHHYgGhfoSun9Wh9K9US2DcIjdAUDRfn9GiCnQ/pF56Cm12TeY0GJBh7si74zlgH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q8LM/dIQSpCxhDg93UYZOVsgKiQG9r/A6nUqpbRFHbPS987u0
	PB2u7yHu/gWSiIGcUdFTEeIyfd8YDSJuV/e2BYXPaTRQTa1ENDuE6/zJe1YeNTwpvr+BwOGd90N
	uV85RhCzUuiEKQbQljsFmsouyYA==
X-Received: from dlbur7-n2.prod.google.com ([2002:a05:7022:ea47:20b0:1b3:b4d2:9bba])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3b81:b0:1b2:610b:878 with SMTP id a92af1059eb24-1b50306917dmr7669737c88.6.1794709569270;
 Sat, 14 Nov 2026 18:26:09 -0800 (PST)
Date: Sun, 15 Nov 2026 02:26:02 +0000
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
Message-ID: <20261115022607.348112-2-almasrymina@google.com>
Subject: [PATCH net-next v3 1/6] net: devmem: pass net_device pointer to net_devmem_lock_dev()
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

Upcoming changes for leased queue support will track the physical DMA
device and the bound device in separate net_device pointers on struct
net_devmem_dmabuf_binding, with different teardown paths locking
different pointers.

Generalize net_devmem_lock_dev() to take a struct net_device **dev_ptr
instead of struct net_devmem_dmabuf_binding *. No functional change.

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 36 ++++++++++++++++++------------------
 net/core/devmem.h      |  4 ++--
 net/core/netdev-genl.c |  2 +-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 7eb91782585e3..6fa7b909b86e8 100644
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
2.56.0.611.g1030f0b940-goog

