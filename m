Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9DC36C0D2
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935275; cv=none; b=r7itnvBKrm5cxHf+fc4k7RFrhpccCgfU+il/gkybL8WjVGlcnYpu366aPmJeJVNC0ygw+VHouP4TSlkjGK9VkvgtvQMmKl1e2dv6jyj9MOdsDkHMgwRdCwkGZt/OXhSEiLOUeay5fxp+E6e1jLpH8DffRfM/NbwTEghSnef0JFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935275; c=relaxed/simple;
	bh=IxEtXO/nWpkXJrRDFmzIhybDIIm+ESmVcrEy2sP3Swg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aSa0PfBfiri/nuQTa2Nn6SEufmAnwxmLAXcCFOHfuCp0bJnmJ6OXotCwHvStVugcHhIJO8Xt9/54T5f8GtQlzfo7bkDkQXzMQpQqyBiKN72gulPvK8034quNNLXQ/stKHSv41ddLhJJZcS6lbFjgh8/LAtr3rrGSPvmaRT2WdlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JYiOyFBs; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JYiOyFBs"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12a77b008deso813962c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774935271; x=1775540071; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N54/SZrWs/Wp3KYTfHz5r2t2gDbOlOuPDGz9B0R98TY=;
        b=JYiOyFBsIkdGXmaUwMnj7GRyY/eyAeRRwV/h6GxhBKikjd8vSjw+J/k6ACl01W2p0U
         JLr/W1lt/AwgMTHIr9sFQaVQ2oHKjOaqUov/kkp074ViSaJ2YG4HSSlL5/oMcPNtDiFp
         4hD16mdeNVuvsoBdcAeT1toVyXAN928tFPIfGByO1zfIfdQBOxquWeQ5vcRmv/9Y4zFF
         22f7dRZ8YMGA7h/QM6p5dYP7HXy37Gwf2Wm5srGjQ8ALWj5uDqjQboutj4EtsYv4dN2J
         Ozy55B0PVbQwv/Z6WHnqRxY16DtuKARFVn7xjPPiSsIrokByuLOIDOHLi2YWZ/k9QHgp
         Q3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935271; x=1775540071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N54/SZrWs/Wp3KYTfHz5r2t2gDbOlOuPDGz9B0R98TY=;
        b=HFNjJRbbq7EwrXAPwMHFsXGzV1uKmA5TQDBT6ugeY1wesUHCCpBcqhoSissvuXyK/F
         F5araChEzpzJ6pCnesQDb9/K59is1YpK/zL8wKFv3HI5nrIjF8361CNkgrBJug64RTMa
         QjnkEiG2MBI3jIflDeqU1t2aMEDvEMdpLxM1vIlbesyUyYg2iz5Qq4bJJM1MZh+7kAND
         VBd9JNi8HIaiStdlibd4Y6y+98Hkh3PrGyl8qIbZ7j54adaceH7+Y43mhR1zqwlwVTHC
         C6VO8LPPblQtUTkrpgYcfVdh9/kGAdqMfcl2Ex2AadgeTEQKoOu1FEyjN0hy/j9vk7NH
         VG0g==
X-Forwarded-Encrypted: i=1; AJvYcCUKP7mDQHGgLopMzQZ1vQik1qkgLwajUUDZGPoIqwyJ86PH/kUzrIkOKC6vNNH+Yh6qoFlCQ3CzS/Wji6Sq5oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaSvG7lQ2IV6w7c9ym5aokjndYo4+wDKWJeIKyCPuBh7s5IHf
	2tlqAcsj4fbrwdjNYJjUoh7ydGdkhGat2bs6t0qAH9cGQJf6jxT1wm3U+w9mtZKYAtehTKcG1z9
	Ige4SMVuOkWxjamh/43NQug==
X-Received: from dlbts5-n2.prod.google.com ([2002:a05:7022:b045:20b0:12a:c447:d6bf])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:48f:b0:127:867f:2448 with SMTP id a92af1059eb24-12ab28e4c7fmr8006150c88.26.1774935270644;
 Mon, 30 Mar 2026 22:34:30 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:33:47 +0000
In-Reply-To: <20260331053353.2504254-1-marcharvey@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331053353.2504254-1-marcharvey@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331053353.2504254-2-marcharvey@google.com>
Subject: [PATCH net-next 1/7] net: team: Annotate reads and writes for mixed
 lock accessed values
From: Marc Harvey <marcharvey@google.com>
To: jiri@resnulli.us, andrew+netdev@lunn.ch
Cc: willemb@google.com, maheshb@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="UTF-8"

The team_port's "index" and the team's "en_port_count" are read in
the hot transmit path, but are only written to when holding the rtnl
lock.

Use READ_ONCE() for all lockless reads of these values, and use
WRITE_ONCE() for all writes.

Signed-off-by: Marc Harvey <marcharvey@google.com>
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
2.53.0.1018.g2bb0e51243-goog

