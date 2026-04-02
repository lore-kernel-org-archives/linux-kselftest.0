Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523F37D110
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111074; cv=none; b=e/51zAw+SWd9ghcvQFl5uGgNYoAue8zdfgRlUrzxc2S/rCN4pdmemKgDojxeXt/8hAo/2Ms3oQolOq2Xkuz0ihfLvWHQVwjNoRshZeM2pwFwCTbx80+rhNoUUakQZ/BIn+8F7Exmu+M0PDcAwxfjM1S0Ds/EkdVN3sNtwaZ+vWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111074; c=relaxed/simple;
	bh=AUm3gnfSO4aj/PFs0jYHaVA8JR9/Dwk/ruvgFviQV9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XEuoeMCZ3KGqj/ww8kAwU9tRTpD3czeL2xZuLIKnYrrmvhLtUyRDgNQeeYN5REGlZw7VZtonb3NHBAcfHhf70mTETwoLoNvmM8KxzLRBQUCMragZ3nKuKq9489LdKtvufM2oNMjgShE41bRODVVsX0x2JChNzr9PT86AuJzPGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D0e8uqJn; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D0e8uqJn"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ca0eb21c5fso3434395eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 23:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775111073; x=1775715873; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hyEaQHBBytCzXQjOPVRmX4B/IWDKMcKi4U0qg84H+fc=;
        b=D0e8uqJn8w9Wje92msTi0OjZAKUfuAalCnfHVSt/9K3qxlUpep9Etwj/tg/lBfbKmx
         v0cfZzB2EvUVHurIbVwbUuKY+zM0f7jDXEmVOCb6yGxxEfzjqQp6aW0ODo8FzeJkH1Zm
         ypWX4CrocbxSO8aF9u1J7jCAFSMwSzpH7zZ3hWJ9MTpPfY1rcWiGLXcnxy+0/t4//7R8
         0u3wnd0t/Wc+VcxEklZXLCHlOmVFo0RATWm82Uic2+T+IyOVOd1/LFpY39iBJvBeYfE8
         FYUF11VhAp/jxRz1SUvgiiCP7ClKsC7xTjjUwxRWm1ekPS7CNq9Jd0XA/bHOuCHyIcl5
         9dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111073; x=1775715873;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyEaQHBBytCzXQjOPVRmX4B/IWDKMcKi4U0qg84H+fc=;
        b=Vb2ue92fQgGIVRRvghNNSuyf9mveT//grvf3riCisHUDez1RcDKbyW6jFiyAJVEPQ/
         4Rdjijf22wAH2WG3BSCUWh8AQlWA3jUh5znzmrLz5Nm9SgfDX+3CLZdua6Zsf6DsLUAF
         wEYSURQbdCIbyewnDO8XGrGQUrJXQrHtYwv1KBsYU234trx8MT4o5WBZSTq1zat1WkZd
         /Ou3aUWTqhQJeRotqnuhBaEZjBqExejSbc1bX0BRux0xbzKoELDlB59LtyAZxWPMFWoR
         6uOjBq+VVXKHTV76GcMenhH2AocjWhB08JqXVlsA5z3/ZUHQJQcwsj5y2IqRdyIiLb97
         NNIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXftAEGftZvXzz7MKJxKueiiQa3tPMgB1USmhcIlpgskqtmA1vKQLj2GgfO/vvtp4ZK5KZ051XHSvgAQGDv0lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2kryjRebCKILSwGHCg1P8uWo5GEYeahbzgx6X0JqE0Og9oxZ
	HhPNf5+/6yDMg5hfDOVNqYYYE/3TVmBpHv557zfKqwt6sFKfPGB6yrUcchkQwFCHPYngRkycAtD
	DUtirZIctyPNjMcX6LH+dow==
X-Received: from dybmh14.prod.google.com ([2002:a05:7301:f0e:b0:2c7:8472:f365])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:cc12:b0:2c6:31f0:a018 with SMTP id 5a478bee46e88-2c9328a5ff7mr3758816eec.22.1775111072413;
 Wed, 01 Apr 2026 23:24:32 -0700 (PDT)
Date: Thu, 02 Apr 2026 06:24:14 +0000
In-Reply-To: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111069; l=3691;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=AUm3gnfSO4aj/PFs0jYHaVA8JR9/Dwk/ruvgFviQV9I=; b=lhF3ubuJ24hAxbdWVytZQQKAUOCPC9M0Efj69ETG8G+BErrYD9sJOMc44qiZDI6SGbD6kcAu3
 ivbcDXGcktnA/jxPgEASAyBHRWkKAP+TxcT95L2XBabA1wZUe4+q2bF
X-Mailer: b4 0.14.3
Message-ID: <20260402-teaming-driver-internal-v3-1-e8cfdec3b5c2@google.com>
Subject: [PATCH net-next v3 1/7] net: team: Annotate reads and writes for
 mixed lock accessed values
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

The team_port's "index" and the team's "en_port_count" are read in
the hot transmit path, but are only written to when holding the rtnl
lock.

Use READ_ONCE() for all lockless reads of these values, and use
WRITE_ONCE() for all writes.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v3:
- None

Changes in v2:
- None
---
 drivers/net/team/team_core.c        | 11 ++++++-----
 drivers/net/team/team_mode_random.c |  2 +-
 include/linux/if_team.h             |  4 ++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 566a5d102c23..becd066279a6 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -938,7 +938,8 @@ static void team_port_enable(struct team *team,
 {
 	if (team_port_enabled(port))
 		return;
-	port->index = team->en_port_count++;
+	WRITE_ONCE(port->index, team->en_port_count);
+	WRITE_ONCE(team->en_port_count, team->en_port_count + 1);
 	hlist_add_head_rcu(&port->hlist,
 			   team_port_index_hash(team, port->index));
 	team_adjust_ops(team);
@@ -958,7 +959,7 @@ static void __reconstruct_port_hlist(struct team *team, int rm_index)
 	for (i = rm_index + 1; i < team->en_port_count; i++) {
 		port = team_get_port_by_index(team, i);
 		hlist_del_rcu(&port->hlist);
-		port->index--;
+		WRITE_ONCE(port->index, port->index - 1);
 		hlist_add_head_rcu(&port->hlist,
 				   team_port_index_hash(team, port->index));
 	}
@@ -973,8 +974,8 @@ static void team_port_disable(struct team *team,
 		team->ops.port_disabled(team, port);
 	hlist_del_rcu(&port->hlist);
 	__reconstruct_port_hlist(team, port->index);
-	port->index = -1;
-	team->en_port_count--;
+	WRITE_ONCE(port->index, -1);
+	WRITE_ONCE(team->en_port_count, team->en_port_count - 1);
 	team_queue_override_port_del(team, port);
 	team_adjust_ops(team);
 	team_lower_state_changed(port);
@@ -1245,7 +1246,7 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 		netif_addr_unlock_bh(dev);
 	}
 
-	port->index = -1;
+	WRITE_ONCE(port->index, -1);
 	list_add_tail_rcu(&port->list, &team->port_list);
 	team_port_enable(team, port);
 	netdev_compute_master_upper_features(dev, true);
diff --git a/drivers/net/team/team_mode_random.c b/drivers/net/team/team_mode_random.c
index 53d0ce34b8ce..169a7bc865b2 100644
--- a/drivers/net/team/team_mode_random.c
+++ b/drivers/net/team/team_mode_random.c
@@ -16,7 +16,7 @@ static bool rnd_transmit(struct team *team, struct sk_buff *skb)
 	struct team_port *port;
 	int port_index;
 
-	port_index = get_random_u32_below(team->en_port_count);
+	port_index = get_random_u32_below(READ_ONCE(team->en_port_count));
 	port = team_get_port_by_index_rcu(team, port_index);
 	if (unlikely(!port))
 		goto drop;
diff --git a/include/linux/if_team.h b/include/linux/if_team.h
index ccb5327de26d..06f4d7400c1e 100644
--- a/include/linux/if_team.h
+++ b/include/linux/if_team.h
@@ -77,7 +77,7 @@ static inline struct team_port *team_port_get_rcu(const struct net_device *dev)
 
 static inline bool team_port_enabled(struct team_port *port)
 {
-	return port->index != -1;
+	return READ_ONCE(port->index) != -1;
 }
 
 static inline bool team_port_txable(struct team_port *port)
@@ -272,7 +272,7 @@ static inline struct team_port *team_get_port_by_index_rcu(struct team *team,
 	struct hlist_head *head = team_port_index_hash(team, port_index);
 
 	hlist_for_each_entry_rcu(port, head, hlist)
-		if (port->index == port_index)
+		if (READ_ONCE(port->index) == port_index)
 			return port;
 	return NULL;
 }

-- 
2.53.0.1185.g05d4b7b318-goog

