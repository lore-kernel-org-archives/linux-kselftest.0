Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D436BCF2
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703596; cv=none; b=FvqswBgyewBVzu31UFSGIZB9W2clXqPGkuO6ZrmSzy5DuMUxWhZIRkHNAxG/Btjva6dyW7o93Qy7/kOHmRQEoWNbVYqcLCR8e8Q9yMix/ezmubJ9mJu0zpMKnhFwZUVKPsYvVduv70S+Zd8I/tHsV7lt5gDOdYIHrImtPVh1XkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703596; c=relaxed/simple;
	bh=eMqaikrJDeYNfUMhslQU9p/PNnQcABSE67+YKPMPpAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ajQ432hx/poOs07ceHyjGMMBt9wXpJqmhS23tSetXVZCEdjpCMI1kSUmFo8RaM5i4Wwx5IoE0sJ+SQdJNhTGTAJsdLAlzVN/wX8gOIPZCo4EQkcPekr2gss/9M+rAVzT03xzx//4Mo6e9hMO9bl4suBSxMcEjUrHWtt51hy5mGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QqYRcEy0; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QqYRcEy0"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12bf9974587so1531937c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 19:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775703593; x=1776308393; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCOV5PVZ0/9+BmL80DppSiUK4xF2oayBnBsK0SdDfuw=;
        b=QqYRcEy0BJ4ls31Jz61mM7D1qN3+PFInttXg4oFQ78zIrHjssqXmNkguj14DzNP+ci
         RqE3iuvoVxnYQpPprnE4Ej8FaUS5bof9p5d9r6yDfl3HBru7dtMCcQ7VtRHR4Nf4Z3UP
         jRwCKtgfSeMbqBN4SsC5NC/28GV6d4rhekFd9K4xInJlmqnC9ry84NKB6Qaf0OmMPt3H
         fHonOKgUj4gcox9as8V6HCSbOARP4vgQlccPucM+KRcKo2Ao1ccQ3tZnoNVt0ORTw120
         YBLXZL4GugXqkecjfL4TEIdrrivuGzlQNhHHqE47ER1Dx6rj3/nBXSWlbXAIYBnbZeFj
         RYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775703593; x=1776308393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCOV5PVZ0/9+BmL80DppSiUK4xF2oayBnBsK0SdDfuw=;
        b=VDQ7vCWL5xqQm+0y0cxUIQr85Gdk89heIQEhIAw+WoahAdYE71nUVsG7VzvXUHOx8e
         9wJ0LMDaULACLKHH7fu28O8pOCztI8XxQnkWPn7w5HNhUMpopDyy6JZl/KeAAyFvM0jx
         cdFXJjQXgPlf/KitcWtpVo/i8FjXweRqB8h8QeIMPFOlbYKOYKi2t+i8HTfjZy8vJ5gH
         wFFGwTV5P5RrvX8ke3fWqh3SKTRnGRgBCZ6a4lk43T9YwvYCOpPt1CiMATqXqoOgmuxa
         0l1ZvvjTQsm7V9DjR8gN0tctUQhWBD3gW2bRwBOIBL1dRpj2Ibl1jf2uD5Ra9QMehISN
         ItDw==
X-Forwarded-Encrypted: i=1; AJvYcCWDa/udBwjHqdKhy6n6NR+akhzMm3isgAOKn9WQFo/KkbEmTpbeTtKpF8m5hjqp9lGWgo67jy1ljOLWoM3CeLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZ+BH+qLx/YMO+5Qvrp6UMWh9zBEKX6+8lBQ8YMI5ygu9j6A4
	YXQB9DBcJ0EIn87vznUkrsKHPBtSCrhN5VD+lBAoQ+++Lp8lrHWR//25LTh4wM8OsOTqlwlLYZu
	BCmEg56IidC8MZ4cC3+fk2g==
X-Received: from dlah17.prod.google.com ([2002:a05:701b:2611:b0:128:d48f:6f7d])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:41a3:b0:128:d5f1:d594 with SMTP id a92af1059eb24-12bfb6fb088mr13289634c88.10.1775703592949;
 Wed, 08 Apr 2026 19:59:52 -0700 (PDT)
Date: Thu, 09 Apr 2026 02:59:29 +0000
In-Reply-To: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775703578; l=9038;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=eMqaikrJDeYNfUMhslQU9p/PNnQcABSE67+YKPMPpAs=; b=JKCWRIPEHq6oMYZOQMA5reYkowB7HLyoQS9RT8lPeU9NrXdIsGVJiuhpMPT0HbjqBoP2zqbe7
 u398YHm1FsuCmb0QsWsGCpfrYot5L8PPlrlcXu/+4voPuiT3ikV671K
X-Mailer: b4 0.14.3
Message-ID: <20260409-teaming-driver-internal-v7-7-f47e7589685d@google.com>
Subject: [PATCH net-next v7 07/10] net: team: Track rx enablement separately
 from tx enablement
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Marc Harvey <marcharvey@google.com>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="utf-8"

Separate the rx and tx enablement/disablement into different
functions so that it is easier to interact with them independently
later.

Although this patch changes receive and transmit paths, the actual
behavior of the teaming driver should remain unchanged, since there
is no option introduced yet to change rx or tx enablement
independently. Those options will be added in follow-up patches.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v5:
- Reorder function calls in team_port_enable() to make sure the call
  order stays the same as before.
- Link to v4: https://lore.kernel.org/netdev/20260403-teaming-driver-internal-v4-7-d3032f33ca25@google.com/

Changes in v4:
- New patch: split from the original monolithic v3 patch "net: team:
  Decouple rx and tx enablement in the team driver".
- Link to v3: https://lore.kernel.org/netdev/20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com/
---
 drivers/net/team/team_core.c             | 104 ++++++++++++++++++++++++-------
 drivers/net/team/team_mode_loadbalance.c |   2 +-
 include/linux/if_team.h                  |  16 ++++-
 3 files changed, 95 insertions(+), 27 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 826769473878..e437099a5a17 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -87,7 +87,7 @@ static void team_lower_state_changed(struct team_port *port)
 	struct netdev_lag_lower_state_info info;
 
 	info.link_up = port->linkup;
-	info.tx_enabled = team_port_enabled(port);
+	info.tx_enabled = team_port_tx_enabled(port);
 	netdev_lower_state_changed(port->dev, &info);
 }
 
@@ -538,7 +538,7 @@ static void team_adjust_ops(struct team *team)
 	else
 		team->ops.transmit = team->mode->ops->transmit;
 
-	if (!team->tx_en_port_count || !team_is_mode_set(team) ||
+	if (!team->rx_en_port_count || !team_is_mode_set(team) ||
 	    !team->mode->ops->receive)
 		team->ops.receive = team_dummy_receive;
 	else
@@ -734,7 +734,7 @@ static rx_handler_result_t team_handle_frame(struct sk_buff **pskb)
 
 	port = team_port_get_rcu(skb->dev);
 	team = port->team;
-	if (!team_port_enabled(port)) {
+	if (!team_port_rx_enabled(port)) {
 		if (is_link_local_ether_addr(eth_hdr(skb)->h_dest))
 			/* link-local packets are mostly useful when stack receives them
 			 * with the link they arrive on.
@@ -876,7 +876,7 @@ static void __team_queue_override_enabled_check(struct team *team)
 static void team_queue_override_port_prio_changed(struct team *team,
 						  struct team_port *port)
 {
-	if (!port->queue_id || !team_port_enabled(port))
+	if (!port->queue_id || !team_port_tx_enabled(port))
 		return;
 	__team_queue_override_port_del(team, port);
 	__team_queue_override_port_add(team, port);
@@ -887,7 +887,7 @@ static void team_queue_override_port_change_queue_id(struct team *team,
 						     struct team_port *port,
 						     u16 new_queue_id)
 {
-	if (team_port_enabled(port)) {
+	if (team_port_tx_enabled(port)) {
 		__team_queue_override_port_del(team, port);
 		port->queue_id = new_queue_id;
 		__team_queue_override_port_add(team, port);
@@ -927,26 +927,33 @@ static bool team_port_find(const struct team *team,
 	return false;
 }
 
+static void __team_port_enable_rx(struct team *team,
+				  struct team_port *port)
+{
+	team->rx_en_port_count++;
+	WRITE_ONCE(port->rx_enabled, true);
+}
+
+static void __team_port_disable_rx(struct team *team,
+				   struct team_port *port)
+{
+	team->rx_en_port_count--;
+	WRITE_ONCE(port->rx_enabled, false);
+}
+
 /*
- * Enable/disable port by adding to enabled port hashlist and setting
- * port->tx_index (Might be racy so reader could see incorrect ifindex when
- * processing a flying packet, but that is not a problem). Write guarded
- * by RTNL.
+ * Enable just TX on the port by adding to tx-enabled port hashlist and
+ * setting port->tx_index (Might be racy so reader could see incorrect
+ * ifindex when processing a flying packet, but that is not a problem).
+ * Write guarded by RTNL.
  */
-static void team_port_enable(struct team *team,
-			     struct team_port *port)
+static void __team_port_enable_tx(struct team *team,
+				  struct team_port *port)
 {
-	if (team_port_enabled(port))
-		return;
 	WRITE_ONCE(port->tx_index, team->tx_en_port_count);
 	WRITE_ONCE(team->tx_en_port_count, team->tx_en_port_count + 1);
 	hlist_add_head_rcu(&port->tx_hlist,
 			   team_tx_port_index_hash(team, port->tx_index));
-	team_adjust_ops(team);
-	team_queue_override_port_add(team, port);
-	team_notify_peers(team);
-	team_mcast_rejoin(team);
-	team_lower_state_changed(port);
 }
 
 static void __reconstruct_port_hlist(struct team *team, int rm_index)
@@ -965,20 +972,69 @@ static void __reconstruct_port_hlist(struct team *team, int rm_index)
 	}
 }
 
-static void team_port_disable(struct team *team,
-			      struct team_port *port)
+static void __team_port_disable_tx(struct team *team,
+				   struct team_port *port)
 {
-	if (!team_port_enabled(port))
-		return;
 	if (team->ops.port_tx_disabled)
 		team->ops.port_tx_disabled(team, port);
+
 	hlist_del_rcu(&port->tx_hlist);
 	__reconstruct_port_hlist(team, port->tx_index);
+
 	WRITE_ONCE(port->tx_index, -1);
 	WRITE_ONCE(team->tx_en_port_count, team->tx_en_port_count - 1);
-	team_queue_override_port_del(team, port);
+}
+
+/*
+ * Enable TX AND RX on the port.
+ */
+static void team_port_enable(struct team *team,
+			     struct team_port *port)
+{
+	bool rx_was_enabled;
+	bool tx_was_enabled;
+
+	if (team_port_enabled(port))
+		return;
+
+	rx_was_enabled = team_port_rx_enabled(port);
+	tx_was_enabled = team_port_tx_enabled(port);
+
+	if (!rx_was_enabled)
+		__team_port_enable_rx(team, port);
+	if (!tx_was_enabled)
+		__team_port_enable_tx(team, port);
+
+	team_adjust_ops(team);
+	if (!tx_was_enabled)
+		team_queue_override_port_add(team, port);
+	team_notify_peers(team);
+	if (!rx_was_enabled)
+		team_mcast_rejoin(team);
+	if (!tx_was_enabled)
+		team_lower_state_changed(port);
+}
+
+static void team_port_disable(struct team *team,
+			      struct team_port *port)
+{
+	bool rx_was_enabled = team_port_rx_enabled(port);
+	bool tx_was_enabled = team_port_tx_enabled(port);
+
+	if (!tx_was_enabled && !rx_was_enabled)
+		return;
+
+	if (tx_was_enabled) {
+		__team_port_disable_tx(team, port);
+		team_queue_override_port_del(team, port);
+	}
+	if (rx_was_enabled)
+		__team_port_disable_rx(team, port);
+
 	team_adjust_ops(team);
-	team_lower_state_changed(port);
+
+	if (tx_was_enabled)
+		team_lower_state_changed(port);
 }
 
 static int team_port_enter(struct team *team, struct team_port *port)
diff --git a/drivers/net/team/team_mode_loadbalance.c b/drivers/net/team/team_mode_loadbalance.c
index 4833fbfe241e..38a459649569 100644
--- a/drivers/net/team/team_mode_loadbalance.c
+++ b/drivers/net/team/team_mode_loadbalance.c
@@ -380,7 +380,7 @@ static int lb_tx_hash_to_port_mapping_set(struct team *team,
 
 	list_for_each_entry(port, &team->port_list, list) {
 		if (ctx->data.u32_val == port->dev->ifindex &&
-		    team_port_enabled(port)) {
+		    team_port_tx_enabled(port)) {
 			rcu_assign_pointer(LB_HTPM_PORT_BY_HASH(lb_priv, hash),
 					   port);
 			return 0;
diff --git a/include/linux/if_team.h b/include/linux/if_team.h
index c777170ef552..3d21e06fda67 100644
--- a/include/linux/if_team.h
+++ b/include/linux/if_team.h
@@ -31,6 +31,7 @@ struct team_port {
 	struct list_head list; /* node in ordinary list */
 	struct team *team;
 	int tx_index; /* index of tx enabled port. If disabled, -1 */
+	bool rx_enabled;
 
 	bool linkup; /* either state.linkup or user.linkup */
 
@@ -75,14 +76,24 @@ static inline struct team_port *team_port_get_rcu(const struct net_device *dev)
 	return rcu_dereference(dev->rx_handler_data);
 }
 
-static inline bool team_port_enabled(struct team_port *port)
+static inline bool team_port_rx_enabled(struct team_port *port)
+{
+	return READ_ONCE(port->rx_enabled);
+}
+
+static inline bool team_port_tx_enabled(struct team_port *port)
 {
 	return READ_ONCE(port->tx_index) != -1;
 }
 
+static inline bool team_port_enabled(struct team_port *port)
+{
+	return team_port_rx_enabled(port) && team_port_tx_enabled(port);
+}
+
 static inline bool team_port_txable(struct team_port *port)
 {
-	return port->linkup && team_port_enabled(port);
+	return port->linkup && team_port_tx_enabled(port);
 }
 
 static inline bool team_port_dev_txable(const struct net_device *port_dev)
@@ -193,6 +204,7 @@ struct team {
 	 * List of tx-enabled ports and counts of rx and tx-enabled ports.
 	 */
 	int tx_en_port_count;
+	int rx_en_port_count;
 	struct hlist_head tx_en_port_hlist[TEAM_PORT_HASHENTRIES];
 
 	struct list_head port_list; /* list of all ports */

-- 
2.53.0.1213.gd9a14994de-goog

