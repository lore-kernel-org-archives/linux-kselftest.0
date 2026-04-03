Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD56037F8B8
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200483; cv=none; b=nCnZna4q262YCzMtdEpDcKMAc1WUxcL3K20D62Hs4oevXWzOO9xzg1v1H7+TuhZA+u04Z3K2Qxg0fypW4dGZS9hISctf+yvw+e45W8VbRZOLg23lPZWot/UC7saXXXtvILwS1nEXNbjwSOYIGCGrWzrZQqwBzH53N3qlSB8ZdFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200483; c=relaxed/simple;
	bh=IBHKnjHvN0686H6wGmzBNFiUh2lW+6wSCrOsJW7Imdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pktI/9MWdligSSTXFJojc6/h8NycvjCX+Drnciwqd5YmAeku3vXy/lNeoKA5LURMZqPA9RYIFX77xUsxAk5FxJ56FXOdFuWCKSM2At4mzOmjFdk5uNd0LsOZxWkRy6rkqbwAk0jnYYWkB9i551APo0vcZWiZVdF+JV/9hXgu+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=US2q6lVQ; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="US2q6lVQ"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c16233ee11so2499202eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 00:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775200481; x=1775805281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9b7ncp2n1BmDNM5shtlXSZlN1OT8DIe5j7j07dqIEw=;
        b=US2q6lVQZwJuXQ4V53IIzB3XNpjwPZ1V+2oRDsM2UEKDR49fWJDwMfSoJ09J+iDHnY
         1NDzl7A0O2bjMVksjvuEkzyLkesOHJU+4TGhm9UjXwgAmUB892aATl38tSppmAa++tkV
         tEFv+46Df/wWDYczoXg45Obt2c6kCXTRnWJ1B+DVmqz/+tAPT01RtybJGFPW8uH6BZlC
         U2JJg7RuC4qd7lQdj2K+SU+3CJf/OI3tK74tRpNVnMu5O7ADfLYQPqQxIYv1ftmf5dj2
         ALQ5pWplYGOKCTEJ6ww5gL601PiMimI91ZLI4ViMGZ9Z3lwckulN/dIZ+SuXKMIdMOYD
         EbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200481; x=1775805281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9b7ncp2n1BmDNM5shtlXSZlN1OT8DIe5j7j07dqIEw=;
        b=Xq7D8ykjxZxM4kUUu/o50+ClxgcTSe1fRBWCXRlPYhyiCDBar4c4W0AX7pkKYOLxH7
         VuAnQ7KsXaBhlefEg3JOLIZbv6EYDx0Ys1olj8hLDZODXH+QfuYgi+pnzNwLXdjNB1wZ
         B1eC76bGPtVGO8s9x3w0KdMW4hrRQr2DcqZcnUhEb51euE+K+m07hRr0lGpVhJC5hIIg
         IX1Nyhk+o5cMTQdI24oGvHYZWWppyAruYeCmL4IEvTtlq2OlFey6Xb2rKFXlCNqTRcj+
         hxFJL8vPEKZ9C+OLwblIT9mjuBsi9wzCJwSXC/k8BsdUWI33evzCdFc/pHRLiYcDExre
         PbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpWWC7/MA3GiJLR6DU/fO2lYte2ZCZM3gXjP+naDNU7xla8u5THzB5uGSL/SeprWNqhKmzvJ657d6Z9JNoPfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsiIqyT37O3EjUpUjGv5Xnh7oQiiPVf98iVVd0SGYYo1MS93YI
	HdPhs1YL/6ctRj3MPl1KqV9ff7Mz80rtFeIMD75Q2v1ZEW9dM1vQxI3qnemAgZKVqqz2TRNkQFx
	98NBBjufC73LFVcySKeNdjA==
X-Received: from dyckg22.prod.google.com ([2002:a05:7301:d196:b0:2c6:55cf:de3a])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4090:b0:2c1:7ea5:ec29 with SMTP id 5a478bee46e88-2cbf9af8882mr933292eec.4.1775200480763;
 Fri, 03 Apr 2026 00:14:40 -0700 (PDT)
Date: Fri, 03 Apr 2026 07:14:28 +0000
In-Reply-To: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775200467; l=8749;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=IBHKnjHvN0686H6wGmzBNFiUh2lW+6wSCrOsJW7Imdw=; b=boDsAUwzJ3frTRyQVA8xaVfoWQI/aoMMKABFClLO7aYedlu3U3iKTOTVrzilVG8N8b55PyCf/
 iVXXua7Qh3EDIu27CBqbZGhzhPfV1E0IrLlqO7pG7m91RQPQbbVA5rl
X-Mailer: b4 0.14.3
Message-ID: <20260403-teaming-driver-internal-v4-7-d3032f33ca25@google.com>
Subject: [PATCH net-next v4 07/10] net: team: Track rx enablement separately
 from tx enablement
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

Separate the rx and tx enablement/disablement into different
functions so that it is easier to interact with them independently
later.

Although this patch changes receive and transmit paths, the actual
behavior of the teaming driver should remain unchanged, since there
is no option introduced yet to change rx or tx enablement
independently. Those options will be added in follow-up patches.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v4:
- New patch: split from the original monolithic v3 patch "net: team:
  Decouple rx and tx enablement in the team driver".
- Link to v3: https://lore.kernel.org/netdev/20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com/
---
 drivers/net/team/team_core.c             | 105 ++++++++++++++++++++++++-------
 drivers/net/team/team_mode_loadbalance.c |   2 +-
 include/linux/if_team.h                  |  16 ++++-
 3 files changed, 96 insertions(+), 27 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 826769473878..0f95f2f04d27 100644
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
@@ -965,20 +972,70 @@ static void __reconstruct_port_hlist(struct team *team, int rm_index)
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
+	if (!tx_was_enabled) {
+		__team_port_enable_tx(team, port);
+		team_queue_override_port_add(team, port);
+	}
+
 	team_adjust_ops(team);
-	team_lower_state_changed(port);
+	team_notify_peers(team);
+
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
+	team_adjust_ops(team);
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
2.53.0.1185.g05d4b7b318-goog

