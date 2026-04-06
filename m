Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3953164B7
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444691; cv=none; b=JNxoYvzn4leswCjyt3/f/XkAZqyGXfw7LFL7vWH6/RLRSRi0i0cHfBK3xVq+YP+AJxHdafxNKuD8438EPAJGLsrearTJ1Fo0oAQGf9niZpQcfJNaBSFz+1fvP9LHZoFlIQz9lUW7/hvTZ4k93A3OuzPR6tOlmW20oeeiEDDEThc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444691; c=relaxed/simple;
	bh=EGR2do1QkkfSK4R8lXhdlVvbF/4OvTtLuIBm/ueL2Ig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VoqizK4YbDSv+mQa3B4gnAN8LPXAOgSOkk6fbVEr3srNXMcbhzOBfP0pOH/pKFj1nOUIHuQFAkpld/Bfp8npOvVO/e+Aa13YJOkIaBDMsaohQka53900GlJQPmXIgZGQAmNsCqZpdeass4lF/haaMZzxWLj5hQyeeVPHqFv0sUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rangBls/; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rangBls/"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12c06d061abso2231896c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775444690; x=1776049490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVkIJQHKJwN6whJ0IODUma8G+uAZ5mIZh/A/X8+gNmk=;
        b=rangBls/zkVxKudmcOheDWMG+oVAuDkWIsmD9zPiFtrrFTJ5TfT9ITIMfYUdU9Qk3H
         2yem4So/7UfaVilMCMqllfrkKFAUJ5pYqGsqF3Hg44LIS8LtzIw2G6LbO4h0sRwj0kK8
         XbyvfCVQ/9bvGQDBk6QgIrdCnJbcKkxl7yIho7sHs1T0MbVpZ+fBM+cJCUmxKJ9ZbGHD
         QNWOQXHn9Sduu+daEBIyHSeKvb60PchfBEJXxnaTAm1U3S/4bDKO5yuReQOV6Xw26Wmd
         JWJ3T4KqWH3T/NZhKv1ksWxKGkzu3QFtVbiAdsf/ISerTQGL/8m8TMWAmB1mMkPYKlwU
         3kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444690; x=1776049490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVkIJQHKJwN6whJ0IODUma8G+uAZ5mIZh/A/X8+gNmk=;
        b=PleU9m0ztV/S3gAYXwvtZMjpS8wgJ6qDJP3IPnEny/+jESl/dxPYvYagGFXcJfHT3+
         ixSimmOtHyd0z8WmgRKXLCy/eueBwvwRI/Y4RmYAa+JSl7x0WgtER5G35d8DcNQDChTS
         qD8hXQaH+FKqGEiQ6NmZPxOsdGg04caDLzQt60sTtiH0FVmZxtxWvN/tt88mlNtbWXvc
         JO/rEtswFLJ1FpyKE9xY5Zmxra0aH8T78Ff9ySbssb+djc5ub79CJLnm77IgSJXKJUlF
         yvbaVtSHNDn1npvHnSYLmRZgVkz+5mGyryzl/KicoPktAxdejhmyk85236+9DFLUJzUx
         BHHg==
X-Forwarded-Encrypted: i=1; AJvYcCX6KQ36p9G3tjwi6TkuT41N9TTehZe4IhGC5g85F6uVSJTMzRvlkE/1txiQcT2N4wPXC+JSDojjBKyg4MJ0dng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxmXPdwbUnEDh++LOPHYqpEu4/vUqL+VTZblHm55JQeXzD2rVa
	R32XHmnIPnP4RI4dr/46y1U6CLb2wPWnAqanqqNkZA1usd3zhuIPQMtnk21lQVZqmUiy4kcPHfh
	okoSTyUgJCr55YkEBmuZOqA==
X-Received: from dlaj19.prod.google.com ([2002:a05:701b:2813:b0:12c:71e:5ab3])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:41a3:b0:12b:f616:1a1a with SMTP id a92af1059eb24-12bfb6ed5d7mr4563924c88.5.1775444689562;
 Sun, 05 Apr 2026 20:04:49 -0700 (PDT)
Date: Mon, 06 Apr 2026 03:03:37 +0000
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775444686; l=3743;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=EGR2do1QkkfSK4R8lXhdlVvbF/4OvTtLuIBm/ueL2Ig=; b=kBZdP1vgRBEMKFD8Ql/D+QTthUFmGyt+s2uF3pIAJ5/2cWekyzpy+8SK+gReSRDnnnCkwHDBH
 AOcmnLrGwKqAXa8n7ulyv93pMGz14j+kgAKiDVIIAxwCi9wQydtZHXE
X-Mailer: b4 0.14.3
Message-ID: <20260406-teaming-driver-internal-v5-1-e8a3f348a1c5@google.com>
Subject: [PATCH net-next v5 01/10] net: team: Annotate reads and writes for
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
Changes in v5:
- None

Changes in v4:
- None

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

