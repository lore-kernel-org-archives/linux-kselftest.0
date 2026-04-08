Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD94372EC0
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 02:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616764; cv=none; b=F0Jl6YXCwOU5FKq4wG+beZfle4ystrn6S1KF+S1k3PF+XWGHKAtG35UjNgA+oSAPPBNgtwmSUTBxr7c6mej0xYBRqXn2ajJteN7+ffs4nW17c6cVkGlu9HRUmXSixf1snT0zxHpL+KReu4ky3o9wx8W6zx4AeO3bWIvA2DS5ruI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616764; c=relaxed/simple;
	bh=oH22fdqSNJSpaqo3JGrJKQygV29uz4pTKSxAP7bGPfQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uj42+d//VccRdRmZ1z0Zz5Zpe3kiBfEm5Gldmp1KpYrT5VSAgMMbU81vNta+XjZ5bwy0xn3YqW3S3zYp3LmTtbBqPgAhCoM+8JF3nZVrAjGXe/0jNfnYri/mjx35K8URpAeTZREhZjWz4HIRl1LeifHyGZC/lXWQMoo2RDq0G5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hIYJ4Gea; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hIYJ4Gea"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-126e8ee6227so9417297c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 19:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775616759; x=1776221559; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ4xpDhza9yvGUIAi+VUP5bjGD/EsXUsUZaTLZUbPU4=;
        b=hIYJ4Geajq9V/7q4Zu+n9lcOEP6fOKqX1iYDSkh6C4MGFQBxZzJcr+aJ+531/gWLtJ
         oWfX+lJFIUax1tsS78vRmVjymGGT46DTMHBp4oOgqkbDwxaNEWO5nlFImlYrozauNkjN
         yBbrmf9feMmZIRYC331UjcmbPmSoWUdKcFZB+stiHPMlUNSVSYZuOkVgihzzwgAnhLMC
         KuzpJkmPBxy6OsgehpJrJ1D11+DiAXv7fpXx+PZTVmOmpk8Ln5CpzJedTRWPQE48z7le
         4s4k8YbYXh1kWd3FewdR6h/cUfEgVdC8J9Jv/GJBBaNSwI1YZHJRkft7IhNJxoel0AOv
         BcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775616759; x=1776221559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ4xpDhza9yvGUIAi+VUP5bjGD/EsXUsUZaTLZUbPU4=;
        b=gM6LxEfrWK1fUYicxxEbqXDqMEKG1uVFd+zbe17o2yiI2xY2PlL3zDvbxNeAa9C7LU
         e5Y+OXYfSJfv3Rpz7wg38B/xdVpA2kFpI0DSlAyBoKomFpI7GkpVSFXrbQ776pwDy597
         AnrDdyuNKCQTjJPE7KFE7z3IiFsihBIdioN+vkrB0Iz8+jH3KfQAsmimsIyNZJD66Oi+
         vvWwdD33WMhlfjSv7XsCCwTEDqG35zN2xiVaTUeTaVutPZEOfytmU+Aybs/ptVUAPykw
         mDFHiZhnNxLQr56qcMX8liEXyPdb40YCBWc/LyxQS5XHUNrf8IrwBCEK5SlGUqirAX74
         nSDg==
X-Forwarded-Encrypted: i=1; AJvYcCWCNtF/U9t/tCHVkAm8EmVgXSHWDEpuaInJlwNYhGAAZ4teB6pUlaWk0cGaDuOiOZdHc0wNxpw+cpaOIEvQ2LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyzJeSAVwAG7VIi9uOiAtta0162fqRc3d4A0R8+PdEwdh3jPVL
	P1LAQ0F7HxeTehcxzYG9V4FCSthh8no42ufuHGJ+Z5TuwqL3896KVc8VTqXkkkyxnU++DwmovRK
	AaQr+JSj/l3JkXftWgkZcoA==
X-Received: from dlaj10.prod.google.com ([2002:a05:701b:280a:b0:12c:580:a828])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:41a3:b0:12a:7181:2eff with SMTP id a92af1059eb24-12bfb6ec49emr8944307c88.4.1775616758530;
 Tue, 07 Apr 2026 19:52:38 -0700 (PDT)
Date: Wed, 08 Apr 2026 02:52:25 +0000
In-Reply-To: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775616747; l=10753;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=oH22fdqSNJSpaqo3JGrJKQygV29uz4pTKSxAP7bGPfQ=; b=2mr8LC0g5CNSv+yuDeTTAGFvkUuSrp7b6OA3/rT10RLlKxf3L9hoC6Yv+aYE2NWNZ+XBdRoiR
 cW6Ls5OtyY2AGgrje0u896MaSZRVnqHN0NEaeR/udi17467fShE+MN+
X-Mailer: b4 0.14.3
Message-ID: <20260408-teaming-driver-internal-v6-6-e5bcdcf72504@google.com>
Subject: [PATCH net-next v6 06/10] net: team: Rename enablement functions and
 struct members to tx
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>, 
	Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="utf-8"

Add no functional changes, but rename enablement functions, variables
etc. that are used in teaming driver transmit decisions.

Since rx and tx enablement are still coupled, some of the variables
renamed in this patch are still used for the rx path, but that will
change in a follow-up patch.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v4:
- New patch: split from the original monolithic v3 patch "net: team:
  Decouple rx and tx enablement in the team driver".
- Link to v3: https://lore.kernel.org/netdev/20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com/
---
 drivers/net/team/team_core.c             | 44 +++++++++++++++---------------
 drivers/net/team/team_mode_loadbalance.c |  2 +-
 drivers/net/team/team_mode_random.c      |  4 +--
 drivers/net/team/team_mode_roundrobin.c  |  2 +-
 include/linux/if_team.h                  | 46 +++++++++++++++++---------------
 5 files changed, 51 insertions(+), 47 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 2ce31999c99f..826769473878 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -532,13 +532,13 @@ static void team_adjust_ops(struct team *team)
 	 * correct ops are always set.
 	 */
 
-	if (!team->en_port_count || !team_is_mode_set(team) ||
+	if (!team->tx_en_port_count || !team_is_mode_set(team) ||
 	    !team->mode->ops->transmit)
 		team->ops.transmit = team_dummy_transmit;
 	else
 		team->ops.transmit = team->mode->ops->transmit;
 
-	if (!team->en_port_count || !team_is_mode_set(team) ||
+	if (!team->tx_en_port_count || !team_is_mode_set(team) ||
 	    !team->mode->ops->receive)
 		team->ops.receive = team_dummy_receive;
 	else
@@ -831,7 +831,7 @@ static bool team_queue_override_port_has_gt_prio_than(struct team_port *port,
 		return true;
 	if (port->priority > cur->priority)
 		return false;
-	if (port->index < cur->index)
+	if (port->tx_index < cur->tx_index)
 		return true;
 	return false;
 }
@@ -929,7 +929,7 @@ static bool team_port_find(const struct team *team,
 
 /*
  * Enable/disable port by adding to enabled port hashlist and setting
- * port->index (Might be racy so reader could see incorrect ifindex when
+ * port->tx_index (Might be racy so reader could see incorrect ifindex when
  * processing a flying packet, but that is not a problem). Write guarded
  * by RTNL.
  */
@@ -938,10 +938,10 @@ static void team_port_enable(struct team *team,
 {
 	if (team_port_enabled(port))
 		return;
-	WRITE_ONCE(port->index, team->en_port_count);
-	WRITE_ONCE(team->en_port_count, team->en_port_count + 1);
-	hlist_add_head_rcu(&port->hlist,
-			   team_port_index_hash(team, port->index));
+	WRITE_ONCE(port->tx_index, team->tx_en_port_count);
+	WRITE_ONCE(team->tx_en_port_count, team->tx_en_port_count + 1);
+	hlist_add_head_rcu(&port->tx_hlist,
+			   team_tx_port_index_hash(team, port->tx_index));
 	team_adjust_ops(team);
 	team_queue_override_port_add(team, port);
 	team_notify_peers(team);
@@ -951,15 +951,17 @@ static void team_port_enable(struct team *team,
 
 static void __reconstruct_port_hlist(struct team *team, int rm_index)
 {
-	int i;
+	struct hlist_head *tx_port_index_hash;
 	struct team_port *port;
+	int i;
 
-	for (i = rm_index + 1; i < team->en_port_count; i++) {
-		port = team_get_port_by_index(team, i);
-		hlist_del_rcu(&port->hlist);
-		WRITE_ONCE(port->index, port->index - 1);
-		hlist_add_head_rcu(&port->hlist,
-				   team_port_index_hash(team, port->index));
+	for (i = rm_index + 1; i < team->tx_en_port_count; i++) {
+		port = team_get_port_by_tx_index(team, i);
+		hlist_del_rcu(&port->tx_hlist);
+		WRITE_ONCE(port->tx_index, port->tx_index - 1);
+		tx_port_index_hash = team_tx_port_index_hash(team,
+							     port->tx_index);
+		hlist_add_head_rcu(&port->tx_hlist, tx_port_index_hash);
 	}
 }
 
@@ -970,10 +972,10 @@ static void team_port_disable(struct team *team,
 		return;
 	if (team->ops.port_tx_disabled)
 		team->ops.port_tx_disabled(team, port);
-	hlist_del_rcu(&port->hlist);
-	__reconstruct_port_hlist(team, port->index);
-	WRITE_ONCE(port->index, -1);
-	WRITE_ONCE(team->en_port_count, team->en_port_count - 1);
+	hlist_del_rcu(&port->tx_hlist);
+	__reconstruct_port_hlist(team, port->tx_index);
+	WRITE_ONCE(port->tx_index, -1);
+	WRITE_ONCE(team->tx_en_port_count, team->tx_en_port_count - 1);
 	team_queue_override_port_del(team, port);
 	team_adjust_ops(team);
 	team_lower_state_changed(port);
@@ -1244,7 +1246,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		netif_addr_unlock_bh(dev);
 	}
 
-	WRITE_ONCE(port->index, -1);
+	WRITE_ONCE(port->tx_index, -1);
 	list_add_tail_rcu(&port->list, &team->port_list);
 	team_port_enable(team, port);
 	netdev_compute_master_upper_features(dev, true);
@@ -1595,7 +1597,7 @@ static int team_init(struct net_device *dev)
 		return -ENOMEM;
 
 	for (i = 0; i < TEAM_PORT_HASHENTRIES; i++)
-		INIT_HLIST_HEAD(&team->en_port_hlist[i]);
+		INIT_HLIST_HEAD(&team->tx_en_port_hlist[i]);
 	INIT_LIST_HEAD(&team->port_list);
 	err = team_queue_override_init(team);
 	if (err)
diff --git a/drivers/net/team/team_mode_loadbalance.c b/drivers/net/team/team_mode_loadbalance.c
index 840f409d250b..4833fbfe241e 100644
--- a/drivers/net/team/team_mode_loadbalance.c
+++ b/drivers/net/team/team_mode_loadbalance.c
@@ -120,7 +120,7 @@ static struct team_port *lb_hash_select_tx_port(struct team *team,
 {
 	int port_index = team_num_to_port_index(team, hash);
 
-	return team_get_port_by_index_rcu(team, port_index);
+	return team_get_port_by_tx_index_rcu(team, port_index);
 }
 
 /* Hash to port mapping select tx port */
diff --git a/drivers/net/team/team_mode_random.c b/drivers/net/team/team_mode_random.c
index 169a7bc865b2..370e974f3dca 100644
--- a/drivers/net/team/team_mode_random.c
+++ b/drivers/net/team/team_mode_random.c
@@ -16,8 +16,8 @@ static bool rnd_transmit(struct team *team, struct sk_buff *skb)
 	struct team_port *port;
 	int port_index;
 
-	port_index = get_random_u32_below(READ_ONCE(team->en_port_count));
-	port = team_get_port_by_index_rcu(team, port_index);
+	port_index = get_random_u32_below(READ_ONCE(team->tx_en_port_count));
+	port = team_get_port_by_tx_index_rcu(team, port_index);
 	if (unlikely(!port))
 		goto drop;
 	port = team_get_first_port_txable_rcu(team, port);
diff --git a/drivers/net/team/team_mode_roundrobin.c b/drivers/net/team/team_mode_roundrobin.c
index dd405d82c6ac..ecbeef28c221 100644
--- a/drivers/net/team/team_mode_roundrobin.c
+++ b/drivers/net/team/team_mode_roundrobin.c
@@ -27,7 +27,7 @@ static bool rr_transmit(struct team *team, struct sk_buff *skb)
 
 	port_index = team_num_to_port_index(team,
 					    rr_priv(team)->sent_packets++);
-	port = team_get_port_by_index_rcu(team, port_index);
+	port = team_get_port_by_tx_index_rcu(team, port_index);
 	if (unlikely(!port))
 		goto drop;
 	port = team_get_first_port_txable_rcu(team, port);
diff --git a/include/linux/if_team.h b/include/linux/if_team.h
index 740cb3100dfc..c777170ef552 100644
--- a/include/linux/if_team.h
+++ b/include/linux/if_team.h
@@ -27,10 +27,10 @@ struct team;
 
 struct team_port {
 	struct net_device *dev;
-	struct hlist_node hlist; /* node in enabled ports hash list */
+	struct hlist_node tx_hlist; /* node in tx-enabled ports hash list */
 	struct list_head list; /* node in ordinary list */
 	struct team *team;
-	int index; /* index of enabled port. If disabled, it's set to -1 */
+	int tx_index; /* index of tx enabled port. If disabled, -1 */
 
 	bool linkup; /* either state.linkup or user.linkup */
 
@@ -77,7 +77,7 @@ static inline struct team_port *team_port_get_rcu(const struct net_device *dev)
 
 static inline bool team_port_enabled(struct team_port *port)
 {
-	return READ_ONCE(port->index) != -1;
+	return READ_ONCE(port->tx_index) != -1;
 }
 
 static inline bool team_port_txable(struct team_port *port)
@@ -190,10 +190,10 @@ struct team {
 	const struct header_ops *header_ops_cache;
 
 	/*
-	 * List of enabled ports and their count
+	 * List of tx-enabled ports and counts of rx and tx-enabled ports.
 	 */
-	int en_port_count;
-	struct hlist_head en_port_hlist[TEAM_PORT_HASHENTRIES];
+	int tx_en_port_count;
+	struct hlist_head tx_en_port_hlist[TEAM_PORT_HASHENTRIES];
 
 	struct list_head port_list; /* list of all ports */
 
@@ -237,41 +237,43 @@ static inline int team_dev_queue_xmit(struct team *team, struct team_port *port,
 	return dev_queue_xmit(skb);
 }
 
-static inline struct hlist_head *team_port_index_hash(struct team *team,
-						      int port_index)
+static inline struct hlist_head *team_tx_port_index_hash(struct team *team,
+							 int tx_port_index)
 {
-	return &team->en_port_hlist[port_index & (TEAM_PORT_HASHENTRIES - 1)];
+	unsigned int list_entry = tx_port_index & (TEAM_PORT_HASHENTRIES - 1);
+
+	return &team->tx_en_port_hlist[list_entry];
 }
 
-static inline struct team_port *team_get_port_by_index(struct team *team,
-						       int port_index)
+static inline struct team_port *team_get_port_by_tx_index(struct team *team,
+							  int tx_port_index)
 {
+	struct hlist_head *head = team_tx_port_index_hash(team, tx_port_index);
 	struct team_port *port;
-	struct hlist_head *head = team_port_index_hash(team, port_index);
 
-	hlist_for_each_entry(port, head, hlist)
-		if (port->index == port_index)
+	hlist_for_each_entry(port, head, tx_hlist)
+		if (port->tx_index == tx_port_index)
 			return port;
 	return NULL;
 }
 
 static inline int team_num_to_port_index(struct team *team, unsigned int num)
 {
-	int en_port_count = READ_ONCE(team->en_port_count);
+	int tx_en_port_count = READ_ONCE(team->tx_en_port_count);
 
-	if (unlikely(!en_port_count))
+	if (unlikely(!tx_en_port_count))
 		return 0;
-	return num % en_port_count;
+	return num % tx_en_port_count;
 }
 
-static inline struct team_port *team_get_port_by_index_rcu(struct team *team,
-							   int port_index)
+static inline struct team_port *team_get_port_by_tx_index_rcu(struct team *team,
+							      int tx_port_index)
 {
+	struct hlist_head *head = team_tx_port_index_hash(team, tx_port_index);
 	struct team_port *port;
-	struct hlist_head *head = team_port_index_hash(team, port_index);
 
-	hlist_for_each_entry_rcu(port, head, hlist)
-		if (READ_ONCE(port->index) == port_index)
+	hlist_for_each_entry_rcu(port, head, tx_hlist)
+		if (READ_ONCE(port->tx_index) == tx_port_index)
 			return port;
 	return NULL;
 }

-- 
2.53.0.1213.gd9a14994de-goog

