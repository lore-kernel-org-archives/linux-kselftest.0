Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9449BD74;
	Fri, 25 Sep 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333085; cv=none; b=tTIlyIoh2Ii6ahHnokEd5B9BZhaalJZ6wWl30JmCVuuecwykdSbS5zn3PqRD60SwAn3b1ref2YbTlyrAogg2qWga8e9Ch9N8iT8e/Mx7pT4QbEUWi/nknSwfY5DI3WNPlPkZvYYTn9UHDbsTNYvjKIqnphBGsuwNKVa5xB+Anfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333085; c=relaxed/simple;
	bh=iG9pj2skUPsyU6b7NBpL1pv7/4ug4kNEbH0MDRK1Pec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hva1g+YeiT8V3f5Tp9W5H5euxx9zsPsdN36aOfmyYFBuEoh5KcBeZEbWj341x2jbpE9Qxq7XyJ8WQ6y/2R8HD+Il4CLROj8aXAVcXEWnQL4a6gn9uP+O7G4iD5X7E0CqkghTh2rw9mHIDixVWbB4NnZPd3gurkOvi2Gegbyc/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFuVSrvl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFuVSrvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055E51F00898;
	Fri, 25 Sep 2026 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790333082;
	bh=iUyPXoJpUEDluulVmxI/gLZCd5rb6XTn+DDtS0T8Ssg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OFuVSrvlfVrFxiuJC1+ImHrcJztJ5IhV9bbwMasEzBgXT/oDPzJ//zVlMhRBPY08w
	 fWPYLsemB21s4DVqbnSqrVSkifpaM/8/Mc6Hss2hVxd95+wZn3g/yLBA4RRHs6qPiI
	 oKs+uo/VdoYugbgo8bsmXifppU6Hj0brgRbIHIT1BfGo/HVRBC09Rb/WRpbinxb7Im
	 zNZ+ZzOdHGHSx8S1LzcOdWcQNIlU5H5KrSOTcMg8DH2M9Rjs9/9+Za19hpMjKLmRJd
	 QZqkcNvZ5Dmnpp5SjrJCkDK4YLjcHqfBMWJGQbeNznIimL8lU139xE9lyfQxgFi5aD
	 Q+f4Cq9N9DrqA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Tao Cui <cuitao@kylinos.cn>,
	Pavel Begunkov <asml.silence@gmail.com>,
	David Wei <dw@davidwei.uk>
Subject: [PATCH net-next v4 3/5] net: Revalidate queue config for ringparam changes
Date: Fri, 25 Sep 2026 12:44:10 +0200
Message-ID: <20260925104417.2325213-4-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925104417.2325213-1-bjorn@kernel.org>
References: <20260925104417.2325213-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Memory-provider queue configuration is validated when the provider is
bound. A later ethtool ring change may invalidate it because drivers
can size queue memory from both ring depth and RX page size. The fbnic
consumer is added in the following patch.

Keep configured RX ring depths in netdev_config and stage proposed
values in cfg_pending. Validate every RX queue before calling the
driver. Each check validates the device defaults, then any queue
memory-provider override. Commit the values only after the driver
accepts them.

Drivers which consume stored ring depths through queue configuration
must initialize every RX depth before registering the netdev. Stored
values override callback defaults, including when zero.

The callback receives a rendered configuration rather than a queue ID.
Validation should depend on the configuration, not queue identity.
Checking defaults also covers the case where every queue has a
memory-provider override.

Drivers may normalize ring depths when applying them. Require the
validation callback to use the same normalization. Drivers must report
the applied depths through the ethtool_ringparam argument so the core
records the result.

Use the same transaction for ioctl and netlink. Drivers without
ndo_validate_qcfg skip the new validation.

Link: https://lore.kernel.org/all/20250421222827.283737-14-kuba@kernel.org/

Signed-off-by: Björn Töpel <bjorn@kernel.org>
---
 include/linux/ethtool.h     |  4 ++-
 include/net/netdev_queues.h | 56 ++++++++++++++++++++++++++++++++-----
 net/core/dev.h              |  2 ++
 net/core/netdev_config.c    | 38 +++++++++++++++++++++++--
 net/ethtool/common.c        |  8 ++++++
 net/ethtool/common.h        |  2 ++
 net/ethtool/ioctl.c         | 24 ++++++++++++++--
 net/ethtool/rings.c         | 13 ++++++++-
 8 files changed, 133 insertions(+), 14 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c4c9ce038611..c3a41fbd5426 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -1025,7 +1025,9 @@ struct kernel_ethtool_ts_info {
  *	types should be set in @supported_coalesce_params.
  *	Returns a negative error code or zero.
  * @get_ringparam: Report ring sizes
- * @set_ringparam: Set ring sizes.  Returns a negative error code or zero.
+ * @set_ringparam: Set ring sizes. The &struct ethtool_ringparam argument is
+ *	also an output; drivers which normalize requested sizes must update it
+ *	with the applied sizes. Returns a negative error code or zero.
  * @get_pause_stats: Report pause frame statistics. Drivers must not zero
  *	statistics which they don't report. The stats structure is initialized
  *	to ETHTOOL_STAT_NOT_SET indicating driver does not report statistics.
diff --git a/include/net/netdev_queues.h b/include/net/netdev_queues.h
index 70c9fe9e83cc..c5335e935b7d 100644
--- a/include/net/netdev_queues.h
+++ b/include/net/netdev_queues.h
@@ -4,18 +4,56 @@
 
 #include <linux/netdevice.h>
 
+/**
+ * struct netdev_ring_config - accepted RX ring depth configuration
+ * @rx_pending:		Size of the regular RX ring.
+ * @rx_mini_pending:	Size of the RX mini ring.
+ * @rx_jumbo_pending:	Size of the RX jumbo ring.
+ *
+ * This stores only persistent configuration values. Capability fields,
+ * such as max ring sizes, are reported by drivers but are not part of the
+ * accepted configuration.
+ *
+ * These values are only used for queue-configuration validation today.
+ * Drivers which normalize ring sizes must update the struct ethtool_ringparam
+ * passed to set_ringparam() with the applied sizes.
+ */
+struct netdev_ring_config {
+	u32	rx_pending;
+	u32	rx_mini_pending;
+	u32	rx_jumbo_pending;
+};
+
 /**
  * struct netdev_config - queue-related configuration for a netdev
  * @hds_thresh:		HDS Threshold value.
  * @hds_config:		HDS value from userspace.
+ * @rings:		Accepted RX ring depths.
+ *
+ * Direct values, such as @hds_thresh and @rings, hold the accepted
+ * configuration and always override callback-provided defaults, including
+ * when zero. Drivers which use @rings for queue rendering must initialize
+ * every RX ring depth before registering the netdev.
  */
 struct netdev_config {
 	u32	hds_thresh;
 	u8	hds_config;
+
+	struct netdev_ring_config rings;
 };
 
+/**
+ * struct netdev_queue_config - rendered configuration for an RX queue
+ * @rx_page_size:	Size of one RX page-pool allocation.
+ * @rx_ring_size:	Configured size of the regular RX ring.
+ * @rx_mini_ring_size:	Configured size of the RX mini ring.
+ * @rx_jumbo_ring_size:	Configured size of the RX jumbo ring.
+ */
 struct netdev_queue_config {
 	u32	rx_page_size;
+	u32	rx_ring_size;
+	u32	rx_mini_ring_size;
+	u32	rx_jumbo_ring_size;
 };
 
 /* See the netdev.yaml spec for definition of each statistic */
@@ -139,16 +177,20 @@ enum {
  * @ndo_queue_get_dma_dev: Get dma device for zero-copy operations to be used
  *			   for this queue. Return NULL on error.
  *
- * @ndo_default_qcfg:	(Optional) Populate queue config struct with defaults.
- *			Queue config structs are passed to this helper before
- *			the user-requested settings are applied.
+ * @ndo_default_qcfg:	(Optional) Populate queue config with defaults. Queue
+ *			config structs are passed to this helper before the
+ *			user-requested settings are applied. Ring depths from
+ *			dev->cfg override these defaults. Drivers which consume
+ *			them must initialize dev->cfg->rings before registering
+ *			the netdev.
  *
  * @ndo_validate_qcfg: (Optional) Check if queue config is supported.
  *			Called when configuration affecting a queue may be
- *			changing, either due to NIC-wide config, or config
- *			scoped to the queue at a specified index.
- *			When NIC-wide config is changed the callback will
- *			be invoked for all queues.
+ *			changing. When NIC-wide config is changed the
+ *			callback will be invoked for the defaults and all
+ *			queue overrides. Drivers which normalize device-wide
+ *			values when applying them must use the same
+ *			normalization during validation.
  *
  * @ndo_queue_create:	Create a new RX queue on a virtual device that will
  *			be paired with a physical device's queue via leasing.
diff --git a/net/core/dev.h b/net/core/dev.h
index 6d8dbf556269..985396cc833a 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -110,6 +110,8 @@ int netdev_reconfig_start(struct net_device *dev);
 int netdev_queue_config_validate(struct net_device *dev, int rxq_idx,
 				 struct netdev_queue_config *qcfg,
 				 struct netlink_ext_ack *extack);
+int netdev_queue_config_revalidate(struct net_device *dev,
+				   struct netlink_ext_ack *extack);
 
 bool netif_rxq_has_mp(struct net_device *dev, unsigned int rxq_idx);
 bool netif_rxq_is_leased(struct net_device *dev, unsigned int rxq_idx);
diff --git a/net/core/netdev_config.c b/net/core/netdev_config.c
index b101341e3251..1975de42a60d 100644
--- a/net/core/netdev_config.c
+++ b/net/core/netdev_config.c
@@ -50,6 +50,15 @@ static int netdev_nop_validate_qcfg(struct net_device *dev,
 	return 0;
 }
 
+static void netdev_qcfg_apply_dev(struct netdev_queue_config *qcfg,
+				  const struct netdev_config *cfg)
+{
+	/* Device config overrides callback-provided fallbacks. */
+	qcfg->rx_ring_size = cfg->rings.rx_pending;
+	qcfg->rx_mini_ring_size = cfg->rings.rx_mini_pending;
+	qcfg->rx_jumbo_ring_size = cfg->rings.rx_jumbo_pending;
+}
+
 static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
 				 struct netdev_queue_config *qcfg,
 				 struct netlink_ext_ack *extack,
@@ -70,6 +79,7 @@ static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
 	/* Get defaults from the driver, in case user config not set */
 	if (dev->queue_mgmt_ops->ndo_default_qcfg)
 		dev->queue_mgmt_ops->ndo_default_qcfg(dev, qcfg);
+	netdev_qcfg_apply_dev(qcfg, dev->cfg_pending);
 	err = validate_cb(dev, qcfg, extack);
 	if (err)
 		return err;
@@ -91,9 +101,11 @@ static int __netdev_queue_config(struct net_device *dev, int rxq_idx,
  * @rxq_idx:  index of the queue of interest
  * @qcfg: queue configuration struct (output)
  *
- * Render the configuration for a given queue. This helper should be used
- * by drivers which support queue configuration to retrieve config for
- * a particular queue.
+ * Render the configuration for a given queue. During a configuration
+ * transaction this includes the proposed device-wide values in
+ * @dev->cfg_pending; otherwise @dev->cfg_pending points to the accepted
+ * configuration. This helper should be used by drivers which support queue
+ * configuration to retrieve config for a particular queue.
  *
  * @qcfg is an output parameter and is always fully initialized by this
  * function. Some values may not be set by the user, drivers may either
@@ -113,3 +125,23 @@ int netdev_queue_config_validate(struct net_device *dev, int rxq_idx,
 {
 	return __netdev_queue_config(dev, rxq_idx, qcfg, extack, true);
 }
+
+int netdev_queue_config_revalidate(struct net_device *dev,
+				   struct netlink_ext_ack *extack)
+{
+	const struct netdev_queue_mgmt_ops *qops = dev->queue_mgmt_ops;
+	struct netdev_queue_config qcfg;
+	unsigned int i;
+	int err;
+
+	if (!qops || !qops->ndo_validate_qcfg)
+		return 0;
+
+	for (i = 0; i < dev->real_num_rx_queues; i++) {
+		err = netdev_queue_config_validate(dev, i, &qcfg, extack);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 23db40618fed..ed1df37090ce 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -956,6 +956,14 @@ void ethtool_ringparam_get_cfg(struct net_device *dev,
 	kparam->hds_thresh = dev->cfg->hds_thresh;
 }
 
+void ethtool_ringparam_set_cfg(struct netdev_config *cfg,
+			       const struct ethtool_ringparam *param)
+{
+	cfg->rings.rx_pending = param->rx_pending;
+	cfg->rings.rx_mini_pending = param->rx_mini_pending;
+	cfg->rings.rx_jumbo_pending = param->rx_jumbo_pending;
+}
+
 static void ethtool_init_tsinfo(struct kernel_ethtool_ts_info *info)
 {
 	memset(info, 0, sizeof(*info));
diff --git a/net/ethtool/common.h b/net/ethtool/common.h
index ae32e7fdb563..b062e99e89db 100644
--- a/net/ethtool/common.h
+++ b/net/ethtool/common.h
@@ -53,6 +53,8 @@ void ethtool_ringparam_get_cfg(struct net_device *dev,
 			       struct ethtool_ringparam *param,
 			       struct kernel_ethtool_ringparam *kparam,
 			       struct netlink_ext_ack *extack);
+void ethtool_ringparam_set_cfg(struct netdev_config *cfg,
+			       const struct ethtool_ringparam *param);
 
 int ethtool_get_rx_ring_count(struct net_device *dev);
 
diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 4b0bc503f930..dad5a5412f48 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -35,6 +35,7 @@
 #include <net/netdev_queues.h>
 
 #include "common.h"
+#include "../core/dev.h"
 
 /* State held across locks and calls for commands which have devlink fallback */
 struct ethtool_devlink_compat {
@@ -2239,10 +2240,29 @@ static int ethtool_set_ringparam(struct net_device *dev, void __user *useraddr)
 	    ringparam.tx_pending > max.tx_max_pending)
 		return -EINVAL;
 
+	ret = netdev_reconfig_start(dev);
+	if (ret)
+		return ret;
+
+	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
+
+	ret = netdev_queue_config_revalidate(dev, NULL);
+	if (ret)
+		goto out_free_cfg;
+
 	ret = dev->ethtool_ops->set_ringparam(dev, &ringparam,
 					      &kernel_ringparam, NULL);
-	if (!ret)
-		ethtool_notify(dev, ETHTOOL_MSG_RINGS_NTF);
+	if (ret)
+		goto out_free_cfg;
+
+	/* Capture ring depth adjustments reported by the driver. */
+	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
+	swap(dev->cfg, dev->cfg_pending);
+	ethtool_notify(dev, ETHTOOL_MSG_RINGS_NTF);
+
+out_free_cfg:
+	__netdev_free_config(dev->cfg_pending);
+	dev->cfg_pending = dev->cfg;
 	return ret;
 }
 
diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
index 9054c89c5d7b..e3810c0320e3 100644
--- a/net/ethtool/rings.c
+++ b/net/ethtool/rings.c
@@ -4,6 +4,7 @@
 
 #include "common.h"
 #include "netlink.h"
+#include "../core/dev.h"
 
 struct rings_req_info {
 	struct ethnl_req_info		base;
@@ -299,10 +300,20 @@ ethnl_set_rings(struct ethnl_req_info *req_info, struct genl_info *info)
 
 	dev->cfg_pending->hds_config = kernel_ringparam.tcp_data_split;
 	dev->cfg_pending->hds_thresh = kernel_ringparam.hds_thresh;
+	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
+
+	ret = netdev_queue_config_revalidate(dev, info->extack);
+	if (ret)
+		return ret;
 
 	ret = dev->ethtool_ops->set_ringparam(dev, &ringparam,
 					      &kernel_ringparam, info->extack);
-	return ret < 0 ? ret : 1;
+	if (ret < 0)
+		return ret;
+
+	/* Capture ring depth adjustments reported by the driver. */
+	ethtool_ringparam_set_cfg(dev->cfg_pending, &ringparam);
+	return 1;
 }
 
 const struct ethnl_request_ops ethnl_rings_request_ops = {
-- 
2.55.0

