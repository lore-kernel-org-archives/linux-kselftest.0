Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45ED3C343F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751587; cv=none; b=gIX/PvazDWzJ83d6XFgaBwW6othtL7/tbcks/KoSS4RbEMTxbNaW4cmSTHrmfBdXi9x58wGuM5R6RHJt+GSrNXYXqUbOq+Y7BGVQ7ThP/WgB9mHH9pZbtwX+VeZXim7etbOov8CHEfl7H76u8sFe+hCmfUEM7a8P9WxD/MlixW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751587; c=relaxed/simple;
	bh=KHjVHmdOcLNmGZAyn7tooEy1Kx+wxf3e5BSCVJsWmlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wov7AqNbULX8yyuk8A2mPKw4YSqlzr1m5rn3kn7zCSdcJa759AoXdiu4tEtVCgn0CVqrvHt6Or63xwAxLgmB4SNNJjnleMw56skArrbnoabPC4uerUVCmM6ahKVj83I1NsBBjINf0ogbxOCXWd9wuc2jPR+55zy6EdDhMC2ec/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qsF84kkQ; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qsF84kkQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773751583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khSgOBqCoxy3Zwj3XKNDf9aztagyH8OjV1iqIQwDlxU=;
	b=qsF84kkQSm+NvqMBabXhFbW7ZClpkoYV1MOKJPvxV0uV9RGf/KaSTSmp6tvIsaeFIiBm3I
	yMQDYtZ3LJW/JM/kH4c9vp0FxfjjOy0fzFGcF9AaOPGPruiGMxvTcx5a48Y5QzW7K/Nj+j
	XuSKwu69tnItm5YodcLOqwzaURC8yKs=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	syzbot+3d8bc31c45e11450f24c@syzkaller.appspotmail.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 1/2] team: fix header_ops type confusion with non-Ethernet ports
Date: Tue, 17 Mar 2026 20:45:53 +0800
Message-ID: <20260317124606.157035-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260317124606.157035-1-jiayuan.chen@linux.dev>
References: <20260317124606.157035-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jiayuan Chen <jiayuan.chen@shopee.com>

Similar to commit 950803f72547 ("bonding: fix type confusion in
bond_setup_by_slave()") team has the same class of header_ops type
confusion.

For non-Ethernet ports, team_setup_by_port() copies port_dev->header_ops
directly. When the team device later calls dev_hard_header() or
dev_parse_header(), these callbacks can run with the team net_device
instead of the real lower device, so netdev_priv(dev) is interpreted as
the wrong private type and can crash.

Fix this by introducing team header_ops wrappers for create/parse,
selecting a team port under RCU, and calling the lower device callbacks
with port->dev, so each callback always sees the correct net_device
context.

Also pass the selected lower device to the lower parse callback, so
recursion is bounded in stacked non-Ethernet topologies and parse
callbacks always run with the correct device context.

Fixes: 1d76efe1577b ("team: add support for non-ethernet devices")
Reported-by: syzbot+3d8bc31c45e11450f24c@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/69b46af7.050a0220.36eb34.000e.GAE@google.com/T/
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 drivers/net/team/team_core.c | 60 +++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index b7282f5c9632..b3f659ed06ca 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -2058,6 +2058,64 @@ static const struct ethtool_ops team_ethtool_ops = {
  * rt netlink interface
  ***********************/
 
+/* For tx path we need a linkup && enabled port; for parse any port suffices. */
+static struct team_port *team_header_port_get_rcu(struct team *team, bool txable)
+{
+	struct team_port *port;
+
+	list_for_each_entry_rcu(port, &team->port_list, list) {
+		if (!txable || team_port_txable(port))
+			return port;
+	}
+
+	return NULL;
+}
+
+static int team_header_create(struct sk_buff *skb, struct net_device *team_dev,
+			      unsigned short type, const void *daddr,
+			      const void *saddr, unsigned int len)
+{
+	struct team *team = netdev_priv(team_dev);
+	const struct header_ops *port_ops;
+	struct team_port *port;
+	int ret = 0;
+
+	rcu_read_lock();
+	port = team_header_port_get_rcu(team, true);
+	if (port) {
+		port_ops = READ_ONCE(port->dev->header_ops);
+		if (port_ops && port_ops->create)
+			ret = port_ops->create(skb, port->dev,
+					       type, daddr, saddr, len);
+	}
+	rcu_read_unlock();
+	return ret;
+}
+
+static int team_header_parse(const struct sk_buff *skb, const struct net_device *dev,
+			     unsigned char *haddr)
+{
+	struct team *team = netdev_priv(dev);
+	const struct header_ops *port_ops;
+	struct team_port *port;
+	int ret = 0;
+
+	rcu_read_lock();
+	port = team_header_port_get_rcu(team, false);
+	if (port) {
+		port_ops = READ_ONCE(port->dev->header_ops);
+		if (port_ops && port_ops->parse)
+			ret = port_ops->parse(skb, port->dev, haddr);
+	}
+	rcu_read_unlock();
+	return ret;
+}
+
+static const struct header_ops team_header_ops = {
+	.create		= team_header_create,
+	.parse		= team_header_parse,
+};
+
 static void team_setup_by_port(struct net_device *dev,
 			       struct net_device *port_dev)
 {
@@ -2066,7 +2124,7 @@ static void team_setup_by_port(struct net_device *dev,
 	if (port_dev->type == ARPHRD_ETHER)
 		dev->header_ops	= team->header_ops_cache;
 	else
-		dev->header_ops	= port_dev->header_ops;
+		dev->header_ops	= port_dev->header_ops ? &team_header_ops : NULL;
 	dev->type = port_dev->type;
 	dev->hard_header_len = port_dev->hard_header_len;
 	dev->needed_headroom = port_dev->needed_headroom;
-- 
2.43.0

