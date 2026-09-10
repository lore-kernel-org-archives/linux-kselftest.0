Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1C56C62C;
	Thu, 10 Sep 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063773; cv=none; b=oYJoLJ83DnU0mdtwq8fa/C+uqFjNjH+rH3DGrwwfMIVfKGBVvzHcztB5fvQvUk89gd1haDhc+9k9DXJUWsfVD8IyzsWT46RIGpD9flGju+F9L8Tn+GMdcPHVBgSO85ejd9lvkLH7z9yl7ATbhlMnWbKTlmj3qXZEfMjF/Fe6iNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063773; c=relaxed/simple;
	bh=Tfuw52YtaaBXZqgBSMLMoP4m9l9L0XwnDIp4xCS3rxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQQsSlkAH8C4kBRo8yzhQjQMeTMk4WMSjMQjxWbRvsat5X5oDEIEYnm1xVnztnh70qXYOEBeeXH5Cf+TT38vNCpzL0pCvJ1TUS26Li14JqBjgZ1+74UQoHnPw3LpG2JWDAd6n624n/ZXtnpW39hR22BsKyH01cGW/Ds2rVG6U9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npZH4chh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npZH4chh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B265C1F00893;
	Thu, 10 Sep 2026 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789063765;
	bh=XlwruAm6gWUToleBgBzypJygbCkpGPiNpwcXKoUZ3j0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=npZH4chhZ5WsZjoyg1RU6vzfevAlijWicz+nxbcZJbvD0WQBaYEUbkw46gkTCCuGd
	 LyYPZ1y/44a1r/xnN9kawBZpjE+vO3Fynhr9RN0kPjhbWNzES5EPOPr+NfGI9+yx3/
	 VC6pbTK2mqEpVsH5VyeNoNWeSNXTN2m/KCoR4TlUYBnlsFqGn1jVcqxLfusp1jy4PR
	 5pTQJ/J3VPlQUcEWwS9fPwx20qmsfniRrzaCbUu6o7HsjDX9ERhNeM2wLJOVZ1jTu9
	 0MSpvi0ORCs2CJNDfsvBSqIs+le2NF6iTGWRNH9VTnEm1EUtu1QQJ1ptf7FEaWTnsP
	 3gf2hchnx0FRw==
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
Subject: [PATCH net-next v2 1/5] net: Add netdev_config helpers
Date: Thu, 10 Sep 2026 20:09:01 +0200
Message-ID: <20260910180908.1506533-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910180908.1506533-1-bjorn@kernel.org>
References: <20260910180908.1506533-1-bjorn@kernel.org>
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
---
 net/core/dev.c           |  7 ++-----
 net/core/dev.h           |  5 +++++
 net/core/netdev_config.c | 37 +++++++++++++++++++++++++++++++++++++
 net/ethtool/netlink.c    | 15 +++++++--------
 4 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 290e0f099e6b..4a7c5a5e48e5 100644
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

