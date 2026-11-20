Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153800;
	b=Hqt52YCAnDAMrpXnJ4+DimhGeOn5gzppTY7H8zOXZPxS9zhDIZ6Tk2pe5iqOazfZKNbn
	 5qeGepq6BHaTl/1jCMHCURsAO9mQWbLqBTL3org7M3zZO4dtwLJznaof07V1TwliNba/z
	 wVPuCOl2fJ35Fd6fcCuk4/+lXmUa8MLTVgg+tSIv0gnIIyx2Y9j9NOgR1d/uWETty/+gr
	 BrDz7FIqRpN/UPjJxaYUJKltGbDsc79oO8+cMjc5h7EZfO2A5EzO1VwJBqUklzyArEKZb
	 5I0tYHfMzsTtZlYMmP5rOyhids7j1kxEcS0qxIrYjcN9uERvBDLtaEfQgmf55AzpIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sS0SldeaXn5TDHjcJ95CUMiwZNHLb7Du4QpHdaM76sw=;
	b=19KT9/4LVStUc4nyPVBsL6SuRjEV0WEFqJdP9h6yOATzFP7WD0S6Ys0T/n/WzHQvy6At
	 2HjXrHiAtRs7e2GxU/5YtWO9mPEWuW/IlkmylOVVTuAqAMZEvY+Yg+j3aZMLGYXA3xREp
	 vdcgRWVgHyL0p7zf0wQA2YGQ1dXN64+8wJxjVga30XMNByAkaYg6Rc/TXRuJ/DifwCx6J
	 VuWUJoZl3DWtd5aHUK2/9TgQ7iqz2+7jT3hO9FpVf2p5/QrPS8JhW0IMz3bLUpZiTRFMd
	 lhuZc5bUbjfHrMnpDT3PTYOqGV09LfW3k3D/kvlpdUXw5GL/KmvlCAfGvHaOMnS3Q0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SRRnGKL5;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFC606A334
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FFC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SRRnGKL5
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3821eb27024so870206eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795153799; x=1795758599; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sS0SldeaXn5TDHjcJ95CUMiwZNHLb7Du4QpHdaM76sw=;
        b=SRRnGKL5wOqFwJHawY8ldOYdwZWMCZWBYypSYWeAhK4pqRoNpxen1kex981B13DWh2
         DTbh/3KTNprRYJzTaWiEWJ//0kyJKATx270AAYjJbNOMuoQPBJh/BuDfyqEUvFd69tgo
         Wb7I+6dWTlAg/MkLhPIUjZU5gDrqRhV45SkN1W0/Omesku2G7B5a5d4kMNeF7jWBdw5d
         jlOHrHE3vz8Ww8TlBeKa4anIf/zIG7j2PzQpV0dJW74nbEpOT68PeboL41Jr+K4nB2tm
         ex4WS/y681UVP51Ofgyc1jtk3jD+SJfaosBiPMRSCoJ2ZvmgdFKJ+ktsfdkSkU6YOone
         J2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153799; x=1795758599;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS0SldeaXn5TDHjcJ95CUMiwZNHLb7Du4QpHdaM76sw=;
        b=vysGDXO32495cB27zLdlezV+iSgt/ZQuXA3TMaqFMueD8zKEgSLsiLAi1ctIHYuW25
         qR8Dbpn6/AYynJ661c3HkPFsArIhJHEV7rhq3yS8l7v/5wRsjast5vIW9f+DgK2XT/CL
         bsh17teexwLk9eaPmeE1WDzJhaLVKEthbTy6alG1uO/TUh5sFPF3hhexw4+z4tgsij1K
         AJ4v8uTodjDNbCAtcMtndRHFwrDFHis2u4dpBiJojFFfOjn8sy6OnKIo8rPYXgxFxlYp
         06Gc5QPYnhRsoay9GHd7eQvOzPfz472h4Nj8OoguGB7W1YedTCgZs79sXE8ZbzF3ZF2w
         d7/A==
X-Forwarded-Encrypted: i=1; AL+hErFeyj+K2kQwR9y6SP/Dcqf4krtTWCYK+AHR1NAfpm+VQjpH8v6vmPmtO6/9ajsgGUxt183Inixqr7qtSi1WSXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lyN4vQHmCB9HwFcVmidbRPW/r4eHrCG7JbcNOEpOqBrGU7wLo
	vnQwau5grAlPCQk9bvkkp+aaCHaBl749ewkflC1NJCjpXtpeDA8VP4fyNUNJsizuIgrm8qCcnV6
	mqa+38fy8WG4Jq9UYq3oE7F4EVg==
X-Received: from dyev10.prod.google.com ([2002:a05:7300:430a:b0:343:520f:7a80])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr2272904eec.16.1795153798802;
 Thu, 19 Nov 2026 21:49:58 -0800 (PST)
Date: Fri, 20 Nov 2026 04:59:12 +0000
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
Message-ID: <20261120045918.1239746-2-almasrymina@google.com>
Subject: [PATCH net-next v4 1/7] net: devmem: pass net_device pointer to net_devmem_lock_dev()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
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

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c      | 36 ++++++++++++++++++------------------
 net/core/devmem.h      |  4 ++--
 net/core/netdev-genl.c |  2 +-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 3714364b5d9a5..056e185410cd4 100644
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
index d2ccb1090496d..5f96808da59fd 100644
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
2.56.1.750.gf70dc682cf-goog

