Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB713DFC8E
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846197; cv=none; b=HRNnOIwzJBILHD7Su3hWVf8+YCEpCoFyCiU8xhOuLQz1UW/ZZI9iMXlY28+kxlu3sNsoMxNr3C9g9gL1U3JW8Teqz3nF01SfroOhcJUILKP+K1CoHQe99SL33YX6q8WH2rAJKJLUhSiqMZgd6z656DF1BFhkkNFM0Trk74nb8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846197; c=relaxed/simple;
	bh=WStRe1/0Wz+hf4gR4e3RW1oufmmkSS+wZ/H5+uXCgV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=daEs7TkFJPxsDalm9jfcxhUx5wgiyI736VQ8MOCscYanKTRQ019aj0KeeuxUs4hLHqHKO+5PeFzaFvF6fQGIb3Z/vmyRzZiISBNzvHjP9P83mMswXjx9Wq3QsZBpvQb4d/jms6S5OLBOxqkqXJePkqn38BtCleHPfIKzmTCFWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1279eced0b9so9853428c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846192; x=1774450992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iTqzBOwdX4uC4eD+hYEJXSIIw+hEOfHwxGCB1JltZQ=;
        b=CgqilJXjHhY0RdnYAG/f7g3m+0ngJ7cliQ1ZG8XIbY5Y/Tm/ZyzhI9WqR/n6llZf7+
         TDYfPj93f5vdOmCOckFgiC+GrhcFT7hdQbX5N3YT5TfezyW5Eym5qejpTMt1GuMWS+lz
         iFC07R5LqWi3mzxyQVDo2u1BEmAe7yHvdIHWM0WHjk/bE2FNgL6fW92I3aMl8BFmWbwH
         Lkd+oPepkEM/PiHcTB/aRgDlsQKFWvP6fgYJ/rJmttlbJZ70M9bXJa9p4oUM8/aCSFW5
         zV08aTDjUXV7pO2Io5022mJsuneTKViBRalsCya8rv7VpuWC0FVnphZpANdnYN0HldCN
         6s7g==
X-Forwarded-Encrypted: i=1; AJvYcCVEWpt4PAcnOZVHC0zwZjNe5SSe1PpdWVLbaQDdhqHm2jbothtTHb1oG8oPjJwoIWnlL6Aa9sXgAIJI8voSsLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTfBaIrQp73kFCfhp5mRwnDca6BZAajbIwhXEDhFNjmGMESi/t
	Ep1hV4qCSD3rz2gi2OJySOm5NEqlBro1tSnD1dq664YHYSIYTUWK9zc=
X-Gm-Gg: ATEYQzzGnsJnAwEcn412Yaf5QIDlas0AdYBtcxnA00+KpRHkzEI1XwYJX+H5KKKVVPU
	4vpBREc1sEo5WPazhX+/hLwVbWp64A6f1ZiQg5YwxVQV2GGbjFeJ9KCk3+ZEMYUIBi6xZEFKDdX
	LrbxJtIfZuMhdAlzy5+GfP3XNqFKlKxEEm0yaVy22K263ESTjAzbMNNpxY9L7cstC901bDXYNSj
	QHT70LkJHr6hkn7GEYcB+IcnFsWVcBSWNuiZcekQ7CqSsNob+TZgC5BpuHzYiqggZ3v0iIi20I7
	Twe4ewSC4wS8fXpCyNQtZW3+mOXRobszbw6RePffeGnlVVcHUSUx/zXCpoRY5ej05fLFT/J+MDG
	XDc4a1EVPokUmxo4dlrrG8pCPXK/IQEuKdhu+tAff5/fXCmDEdoYk+7udJth4iNhQesYHu1LfuR
	m3bACf0ODdLEnvzSpaWI5zlN7zoh4w/qc65f5ESdPCfk1E+qKe4JxzOGg48UlrNa/VQQVQYjbOb
	5HqACgrsCpIP43Amg==
X-Received: by 2002:a05:7022:30b:b0:123:345b:ba05 with SMTP id a92af1059eb24-129a7147911mr1815897c88.22.1773846191975;
        Wed, 18 Mar 2026 08:03:11 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a723f9d7sm3590178c88.2.2026.03.18.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:11 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 03/13] net: introduce ndo_set_rx_mode_async and dev_rx_mode_work
Date: Wed, 18 Mar 2026 08:02:55 -0700
Message-ID: <20260318150305.123900-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ndo_set_rx_mode_async callback that drivers can implement instead
of the legacy ndo_set_rx_mode. The legacy callback runs under the
netif_addr_lock spinlock with BHs disabled, preventing drivers from
sleeping. The async variant runs from a work queue with rtnl_lock and
netdev_lock_ops held, in fully sleepable context.

When __dev_set_rx_mode() sees ndo_set_rx_mode_async, it schedules
dev_rx_mode_work instead of calling the driver inline. The work
function takes two snapshots of each address list (uc/mc) under
the addr_lock, then drops the lock and calls the driver with the
work copies. After the driver returns, it reconciles the snapshots
back to the real lists under the lock.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 Documentation/networking/netdevices.rst |  8 +++
 include/linux/netdevice.h               | 20 ++++++
 net/core/dev.c                          | 94 +++++++++++++++++++++++--
 3 files changed, 115 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 35704d115312..dc83d78d3b27 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -289,6 +289,14 @@ struct net_device synchronization rules
 ndo_set_rx_mode:
 	Synchronization: netif_addr_lock spinlock.
 	Context: BHs disabled
+	Notes: Deprecated in favor of sleepable ndo_set_rx_mode_async.
+
+ndo_set_rx_mode_async:
+	Synchronization: rtnl_lock() semaphore. In addition, netdev instance
+	lock if the driver implements queue management or shaper API.
+	Context: process (from a work queue)
+	Notes: Sleepable version of ndo_set_rx_mode. Receives snapshots
+	of the unicast and multicast address lists.
 
 ndo_setup_tc:
 	``TC_SETUP_BLOCK`` and ``TC_SETUP_FT`` are running under NFT locks
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 469b7cdb3237..7ede1f56bd70 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1117,6 +1117,16 @@ struct netdev_net_notifier {
  *	This function is called device changes address list filtering.
  *	If driver handles unicast address filtering, it should set
  *	IFF_UNICAST_FLT in its priv_flags.
+ *	Cannot sleep, called with netif_addr_lock_bh held.
+ *	Deprecated in favor of sleepable ndo_set_rx_mode_async.
+ *
+ * void (*ndo_set_rx_mode_async)(struct net_device *dev,
+ *				  struct netdev_hw_addr_list *uc,
+ *				  struct netdev_hw_addr_list *mc);
+ *	Sleepable version of ndo_set_rx_mode. Called from a work queue
+ *	with rtnl_lock and netdev_lock_ops(dev) held. The uc/mc parameters
+ *	are snapshots of the address lists - iterate with
+ *	netdev_hw_addr_list_for_each(ha, uc).
  *
  * int (*ndo_set_mac_address)(struct net_device *dev, void *addr);
  *	This function  is called when the Media Access Control address
@@ -1437,6 +1447,9 @@ struct net_device_ops {
 	void			(*ndo_change_rx_flags)(struct net_device *dev,
 						       int flags);
 	void			(*ndo_set_rx_mode)(struct net_device *dev);
+	void			(*ndo_set_rx_mode_async)(struct net_device *dev,
+					struct netdev_hw_addr_list *uc,
+					struct netdev_hw_addr_list *mc);
 	int			(*ndo_set_mac_address)(struct net_device *dev,
 						       void *addr);
 	int			(*ndo_validate_addr)(struct net_device *dev);
@@ -1903,6 +1916,7 @@ enum netdev_reg_state {
  *				has been enabled due to the need to listen to
  *				additional unicast addresses in a device that
  *				does not implement ndo_set_rx_mode()
+ *	@rx_mode_work:		Work queue entry for ndo_set_rx_mode_async()
  *	@uc:			unicast mac addresses
  *	@mc:			multicast mac addresses
  *	@dev_addrs:		list of device hw addresses
@@ -2293,6 +2307,7 @@ struct net_device {
 	unsigned int		promiscuity;
 	unsigned int		allmulti;
 	bool			uc_promisc;
+	struct work_struct	rx_mode_work;
 #ifdef CONFIG_LOCKDEP
 	unsigned char		nested_level;
 #endif
@@ -4661,6 +4676,11 @@ static inline bool netif_device_present(const struct net_device *dev)
 	return test_bit(__LINK_STATE_PRESENT, &dev->state);
 }
 
+static inline bool netif_up_and_present(const struct net_device *dev)
+{
+	return (dev->flags & IFF_UP) && netif_device_present(dev);
+}
+
 void netif_device_detach(struct net_device *dev);
 
 void netif_device_attach(struct net_device *dev);
diff --git a/net/core/dev.c b/net/core/dev.c
index 200d44883fc1..77fdbe836754 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -2381,6 +2381,8 @@ static void netstamp_clear(struct work_struct *work)
 static DECLARE_WORK(netstamp_work, netstamp_clear);
 #endif
 
+static struct workqueue_struct *rx_mode_wq;
+
 void net_enable_timestamp(void)
 {
 #ifdef CONFIG_JUMP_LABEL
@@ -9669,22 +9671,83 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
 	return 0;
 }
 
-/*
- *	Upload unicast and multicast address lists to device and
- *	configure RX filtering. When the device doesn't support unicast
- *	filtering it is put in promiscuous mode while unicast addresses
- *	are present.
+static void dev_rx_mode_work(struct work_struct *work)
+{
+	struct net_device *dev = container_of(work, struct net_device,
+					      rx_mode_work);
+	struct netdev_hw_addr_list uc_snap, mc_snap, uc_ref, mc_ref;
+	const struct net_device_ops *ops = dev->netdev_ops;
+	int err;
+
+	__hw_addr_init(&uc_snap);
+	__hw_addr_init(&mc_snap);
+	__hw_addr_init(&uc_ref);
+	__hw_addr_init(&mc_ref);
+
+	rtnl_lock();
+	netdev_lock_ops(dev);
+
+	if (!netif_up_and_present(dev))
+		goto out;
+
+	if (ops->ndo_set_rx_mode_async) {
+		netif_addr_lock_bh(dev);
+
+		err = __hw_addr_list_snapshot(&uc_snap, &dev->uc,
+					      dev->addr_len);
+		if (!err)
+			err = __hw_addr_list_snapshot(&uc_ref, &dev->uc,
+						      dev->addr_len);
+		if (!err)
+			err = __hw_addr_list_snapshot(&mc_snap, &dev->mc,
+						      dev->addr_len);
+		if (!err)
+			err = __hw_addr_list_snapshot(&mc_ref, &dev->mc,
+						      dev->addr_len);
+		netif_addr_unlock_bh(dev);
+
+		if (err) {
+			__hw_addr_flush(&uc_snap);
+			__hw_addr_flush(&uc_ref);
+			__hw_addr_flush(&mc_snap);
+			goto out;
+		}
+
+		ops->ndo_set_rx_mode_async(dev, &uc_snap, &mc_snap);
+
+		netif_addr_lock_bh(dev);
+		__hw_addr_list_reconcile(&dev->uc, &uc_snap,
+					 &uc_ref, dev->addr_len);
+		__hw_addr_list_reconcile(&dev->mc, &mc_snap,
+					 &mc_ref, dev->addr_len);
+		netif_addr_unlock_bh(dev);
+	}
+
+out:
+	netdev_unlock_ops(dev);
+	rtnl_unlock();
+}
+
+/**
+ * __dev_set_rx_mode() - upload unicast and multicast address lists to device
+ * and configure RX filtering.
+ * @dev: device
+ *
+ * When the device doesn't support unicast filtering it is put in promiscuous
+ * mode while unicast addresses are present.
  */
 void __dev_set_rx_mode(struct net_device *dev)
 {
 	const struct net_device_ops *ops = dev->netdev_ops;
 
 	/* dev_open will call this function so the list will stay sane. */
-	if (!(dev->flags&IFF_UP))
+	if (!netif_up_and_present(dev))
 		return;
 
-	if (!netif_device_present(dev))
+	if (ops->ndo_set_rx_mode_async) {
+		queue_work(rx_mode_wq, &dev->rx_mode_work);
 		return;
+	}
 
 	if (!(dev->priv_flags & IFF_UNICAST_FLT)) {
 		/* Unicast addresses changes may only happen under the rtnl,
@@ -11708,6 +11771,16 @@ void netdev_run_todo(void)
 
 	__rtnl_unlock();
 
+	/* Make sure all pending rx_mode work completes before returning.
+	 *
+	 * rx_mode_wq may be NULL during early boot:
+	 * core_initcall(netlink_proto_init) vs subsys_initcall(net_dev_init).
+	 *
+	 * Check current_work() to avoid flushing from the wq.
+	 */
+	if (rx_mode_wq && !current_work())
+		flush_workqueue(rx_mode_wq);
+
 	/* Wait for rcu callbacks to finish before next phase */
 	if (!list_empty(&list))
 		rcu_barrier();
@@ -12099,6 +12172,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 #endif
 
 	mutex_init(&dev->lock);
+	INIT_WORK(&dev->rx_mode_work, dev_rx_mode_work);
 
 	dev->priv_flags = IFF_XMIT_DST_RELEASE | IFF_XMIT_DST_RELEASE_PERM;
 	setup(dev);
@@ -12203,6 +12277,8 @@ void free_netdev(struct net_device *dev)
 
 	kfree(rcu_dereference_protected(dev->ingress_queue, 1));
 
+	cancel_work_sync(&dev->rx_mode_work);
+
 	/* Flush device addresses */
 	dev_addr_flush(dev);
 
@@ -13296,6 +13372,10 @@ static int __init net_dev_init(void)
 	if (register_pernet_device(&default_device_ops))
 		goto out;
 
+	rx_mode_wq = alloc_ordered_workqueue("rx_mode_wq", 0);
+	if (!rx_mode_wq)
+		goto out;
+
 	open_softirq(NET_TX_SOFTIRQ, net_tx_action);
 	open_softirq(NET_RX_SOFTIRQ, net_rx_action);
 
-- 
2.53.0

