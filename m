Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615783624C2
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 02:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703584; cv=none; b=Lrx4YgaX4kkCTVMb5u38z81ZKQOFI9KiQvaAtvN5MFE44qBPXpHBX7ZjjHu9Lhd3skpEP1iu7uAh9ZPyBGzr9E9FMOWCYXufMDqRquTHR+ressA6Hr5LomF9qOoe7gVGGCff0881tywpAasBFj6N8HlGYUJQ5zH3zOWm7HlEHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703584; c=relaxed/simple;
	bh=Xc9JIcJ5tZ/hkJqVabouvK2yaEMKFNhceFeC8ZkDcNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bjXu0pNH5FGRNSQ4QVrZ7d07If8CCTFTMXnEAm3fsqScIUEDiCHYjJDlqVsBohkdZssjr6Vn/2OImhoevSKFZ5dbM+M2EmIQMY0onTjgACK/e0vyZrpmbSPmeFV9rpZ9LW0Z22sJ92meSFvJIAwT0jJCKkbYW+Qh9G4vEgucv4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/sazC7+; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/sazC7+"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c0ba59a830so421041eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 19:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775703581; x=1776308381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/2f0Yof1DLXmda+Ua8QZmvkVah9DOsLozAWk9vmUBRA=;
        b=C/sazC7+jIZKg7lu+wzCybHPCGEElizET0FMufXI1H82P9sRhrLKBpxGhfyO8CKGux
         X56zO9bARTt8mLrt1L0MdfKaawUEBjmvLDrKLijB/t1MClMufcsrBJ21KU9bx0U928a8
         5YZW0lLIer1VxNgCENDEGIqJXfjMj9V/I9mV40yoUQu0GTiui5auZNF35+65pAgx09LL
         dqNRxl4tW9zAHg19YI2Ntk0+LpSqDxeXgQ8kYwDrUENhCIdjzJ4QcLtxowLsSFRtRNAt
         STnijBUHoW7BPAWs+YyW385/8DtIwaIMg3VQZlRAPbM2bNraMLf9qo0uOiTgzGFJHxWo
         nD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775703581; x=1776308381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2f0Yof1DLXmda+Ua8QZmvkVah9DOsLozAWk9vmUBRA=;
        b=czygNvSNdhTvZPY5K971mdHSOCmTArs8YohpYrLXOaMDkrjTIrqookMVDnhy9yMCpH
         tov/YJwMiruzMvfUv1bUx6ZivU0z6jXdJjkY9ov46lH0k1ZgiqHMo4VHne42wdBQ7jWu
         y9ssSl773pxGI6s9nfFE15pjTuueJM0zFMWcu3Ttm0Ip/6vzypp/xaUUhP7+hz15kO/8
         XzpM3PN0l2wGVR0NSAKKapGOFOsGtvBeb80RMSfe0/t3ybgG3926k0pLv4FfPWP1jzhH
         7uSV0856Lt++hk1tEdRQu7X3JN/VHzoWqV+c8iPi2jz6V+OAT8IgMW2P1vOKjZ8DzTrx
         n7OA==
X-Forwarded-Encrypted: i=1; AJvYcCW0O5m4tu8h8y7Euu6PgKmX9TRI/PXREiVROprOVaGdwWKAn1oVxICPaMzdr+R+dcXLYqaUoCPQlDLdUPa5Ogg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXGuLSlrUw43G6Oan/GdHwqVFMxuEPIksbMrBC4jNSWIEMT/4
	UkJVboBt8UdafnFQFqjPCNrSSmgvc8b1945bEJd3ROukv1yyUdhEJ/Jq59vvlFprOoLQoiJlZNx
	S4GEAKOwMAyad32J5gIsrYQ==
X-Received: from dybb3.prod.google.com ([2002:a05:693c:6083:b0:2c1:14f7:5dce])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:128a:b0:2c7:31b2:44ad with SMTP id 5a478bee46e88-2d40efe9181mr1009203eec.31.1775703581227;
 Wed, 08 Apr 2026 19:59:41 -0700 (PDT)
Date: Thu, 09 Apr 2026 02:59:23 +0000
In-Reply-To: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775703578; l=3679;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=Xc9JIcJ5tZ/hkJqVabouvK2yaEMKFNhceFeC8ZkDcNI=; b=Qzfoc1UhcNP9VdkzktVkL290Rg0+5GHuvxE0qARgNlVoHVMAoO7IkAkS3fRO2PQrVOnA7H7WB
 dQVF7Vz0Yc7D+h6OV+E+Yl6i4Pxm0NP7YNrEkIc5znzUUMhrpdiqVsI
X-Mailer: b4 0.14.3
Message-ID: <20260409-teaming-driver-internal-v7-1-f47e7589685d@google.com>
Subject: [PATCH net-next v7 01/10] net: team: Annotate reads and writes for
 mixed lock accessed values
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Marc Harvey <marcharvey@google.com>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="utf-8"

The team_port's "index" and the team's "en_port_count" are read in
the hot transmit path, but are only written to when holding the rtnl
lock.

Use READ_ONCE() for all lockless reads of these values, and use
WRITE_ONCE() for all writes.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
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
2.53.0.1213.gd9a14994de-goog

