Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A76A47F762;
	Tue, 15 Sep 2026 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789496489; cv=none; b=c+qFI2C5YZrHH0VDbiHQ9DPJaHiZzG/yYI3iIEUHd46R+fb+4jsSuIeo1mkwgVKbLErUojh/s23Q4PULowVBVdu12DDTEGVslxJXewA94lmWU/XGcu8x8NYs+xJREpDuSzfawgVw8469j0lFHD2FaQz/Oltu0iq/3wluqUtllFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789496489; c=relaxed/simple;
	bh=7kr0Abdf9UQwniI2HJKdHmXHZfxsGOwHkgIqN6ln1I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qDLQ6sEZ8u3bemeiYFpKFlfxJQNuVEbxYGYtLsCILYlygoBRpP2G1LpkuMIrVDYqrfnkgYYo9WiZfOrHEbHcemMgTvf3d+wU9SQd596iFSlRjO+8SDvQvJ+PJboYz+IvcNjU6wyIQoKPo7LlQK7tE3agG3wjwEvhZdaoAOkJVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn2ALZbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pn2ALZbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEA11F00893;
	Tue, 15 Sep 2026 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496487;
	bh=XRfOCE19sPiadPAjSZCa+Bu2R0Lh1cOwK64g37Am6HI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pn2ALZbtUUUBjYNEWHSB2WoBRUgNxEHLdIyWEFI6aSQsnxE7hsHn4PizFFliyd5Gn
	 Ig6exOxqdbQiR+m7rD4Ns5fONJLVg54b/DaI3fqk4xfwZ+J13aJH7wfVNaj6QNzqX6
	 vcizsU364SnbaoPazGqsdFi66iDVcCxkt2tVz49hjh3cZkg3wGcDIyBT5gr3sZpCqm
	 GcUG+379y6jhW5qSVq5bO6SPQuiYf4wJ8JdZtqtwuVw5Y/fXOUwKi3N88R2Vy6z8Ya
	 MZWogmEkdQIPYjkjeycvmRI6DC3eE/ZALl1FPSP1CGz2JivS6Q6bkhPD4oqf1JjayJ
	 +7G7u7Fld557g==
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
Cc: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
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
	David Wei <dw@davidwei.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH net-next v3 1/5] net: Add netdev_config helpers
Date: Tue, 15 Sep 2026 20:20:59 +0200
Message-ID: <20260915182105.4162425-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915182105.4162425-1-bjorn@kernel.org>
References: <20260915182105.4162425-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jakub Kicinski <kuba@kernel.org>

netdev_config manipulation will become slightly more complicated
soon and will be used by both ethtool and the queue API.
Encapsulate the logic in helper functions.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 net/core/dev.c           |  7 ++-----
 net/core/dev.h           |  5 +++++
 net/core/netdev_config.c | 37 +++++++++++++++++++++++++++++++++++++
 net/ethtool/netlink.c    | 15 +++++++--------
 4 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index ecfbd72d5d1a..b113f412bbf1 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12195,10 +12195,8 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	if (!dev->ethtool)
 		goto free_all;
 
-	dev->cfg = kzalloc_obj(*dev->cfg, GFP_KERNEL_ACCOUNT);
-	if (!dev->cfg)
+	if (netdev_alloc_config(dev))
 		goto free_all;
-	dev->cfg_pending = dev->cfg;
 
 	dev->num_napi_configs = maxqs;
 	napi_config_sz = array_size(maxqs, sizeof(*dev->napi_config));
@@ -12270,8 +12268,7 @@ void free_netdev(struct net_device *dev)
 		return;
 	}
 
-	WARN_ON(dev->cfg != dev->cfg_pending);
-	kfree(dev->cfg);
+	netdev_free_config(dev);
 	kfree(dev->ethtool);
 	netif_free_tx_queues(dev);
 	netif_free_rx_queues(dev);
diff --git a/net/core/dev.h b/net/core/dev.h
index b757faead4d1..4b52ff779cba 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -102,6 +102,11 @@ extern struct rw_semaphore dev_addr_sem;
 extern struct list_head net_todo_list;
 void netdev_run_todo(void);
 
+int netdev_alloc_config(struct net_device *dev);
+void __netdev_free_config(struct netdev_config *cfg);
+void netdev_free_config(struct net_device *dev);
+int netdev_reconfig_start(struct net_device *dev);
+
 int netdev_queue_config_validate(struct net_device *dev, int rxq_idx,
 				 struct netdev_queue_config *qcfg,
 				 struct netlink_ext_ack *extack);
diff --git a/net/core/netdev_config.c b/net/core/netdev_config.c
index f14af365d5cd..b101341e3251 100644
--- a/net/core/netdev_config.c
+++ b/net/core/netdev_config.c
@@ -6,6 +6,43 @@
 
 #include "dev.h"
 
+int netdev_alloc_config(struct net_device *dev)
+{
+	struct netdev_config *cfg;
+
+	cfg = kzalloc_obj(*dev->cfg, GFP_KERNEL_ACCOUNT);
+	if (!cfg)
+		return -ENOMEM;
+
+	dev->cfg = cfg;
+	dev->cfg_pending = cfg;
+	return 0;
+}
+
+void __netdev_free_config(struct netdev_config *cfg)
+{
+	kfree(cfg);
+}
+
+void netdev_free_config(struct net_device *dev)
+{
+	WARN_ON(dev->cfg != dev->cfg_pending);
+	__netdev_free_config(dev->cfg);
+}
+
+int netdev_reconfig_start(struct net_device *dev)
+{
+	struct netdev_config *cfg;
+
+	WARN_ON(dev->cfg != dev->cfg_pending);
+	cfg = kmemdup(dev->cfg, sizeof(*dev->cfg), GFP_KERNEL_ACCOUNT);
+	if (!cfg)
+		return -ENOMEM;
+
+	dev->cfg_pending = cfg;
+	return 0;
+}
+
 static int netdev_nop_validate_qcfg(struct net_device *dev,
 				    struct netdev_queue_config *qcfg,
 				    struct netlink_ext_ack *extack)
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 1af395b54330..383e911f50f7 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -11,6 +11,8 @@
 #include "module_fw.h"
 #include "netlink.h"
 
+#include "../core/dev.h"
+
 static struct genl_family ethtool_genl_family;
 
 static bool ethnl_ok __read_mostly;
@@ -934,12 +936,9 @@ static int ethnl_default_set_doit(struct sk_buff *skb, struct genl_info *info)
 	if (need_rtnl)
 		rtnl_lock();
 	netdev_lock_ops(dev);
-	dev->cfg_pending = kmemdup(dev->cfg, sizeof(*dev->cfg),
-				   GFP_KERNEL_ACCOUNT);
-	if (!dev->cfg_pending) {
-		ret = -ENOMEM;
-		goto out_tie_cfg;
-	}
+	ret = netdev_reconfig_start(dev);
+	if (ret)
+		goto out_unlock;
 
 	ret = ethnl_ops_begin(dev);
 	if (ret < 0)
@@ -958,9 +957,9 @@ static int ethnl_default_set_doit(struct sk_buff *skb, struct genl_info *info)
 out_ops:
 	ethnl_ops_complete(dev);
 out_free_cfg:
-	kfree(dev->cfg_pending);
-out_tie_cfg:
+	__netdev_free_config(dev->cfg_pending);
 	dev->cfg_pending = dev->cfg;
+out_unlock:
 	netdev_unlock_ops(dev);
 	if (need_rtnl)
 		rtnl_unlock();
-- 
2.55.0

