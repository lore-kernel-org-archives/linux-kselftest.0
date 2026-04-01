Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CF2FD681
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023543; cv=none; b=cg41Vu6qitmsZq7cF0MMZCULmrS/gZlvptyiwkhZBxd0x/b7sBWyXGI+uVXidIn+BXrtr2zm3ZgwTuGiFmgAhkyCOwmIzkoeNGf+upO4hniwOPfomJ24cpDlssvuZwqqTFIb1OQKyrUBBHR+ozm7WI38xZQEHqk26BoRzqsnG2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023543; c=relaxed/simple;
	bh=riyU8vHNfE+1WJo560BCnv4d01q2x8dxI6Sfshs/X8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ly/RdsQ4ZBSogQrdvyRapCn4prbxVlbE+acO2R1PXJIdTcFcY8u6/ecVAoVz0SIXTsFJIZFNI+6ZmKj/fuCYYju0vWDX4e9+0It2mHDdpLUMedIeOk5NWu8kohjPFx4gFw+zzCTiRnvWbTpzzqKoVrHqSAuQEcUO+AUhscmv+tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rLLJ5WXi; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rLLJ5WXi"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-128edc72e5bso3378436c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 23:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775023542; x=1775628342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ankry/lV9AonDaqBDI1RKEvyyWLrtwB+yzkL/8QxFk=;
        b=rLLJ5WXiDy2sUQhI1Px8GzwBkmfZZrpK5yQhHR2I60Rel13DArIDTetWhagkYXA1Ct
         GnF902c3YmJE89X5JH9kgJ0Eic48jUBZhPWCt7aw1DOlTOGd1PpaxjCw/0Qnri6I76iR
         yXG6OySPVT5uo6LBdOyI6ao1exIUQFnzO5VTgQUSuXPh57iqoTw2fGIQS+iSq3DOaGom
         kvr2XFc7Fh45HMah+H58MTDkuGVBrHmo+11TD5Y8wLhMyQFJtcl2XlsLep1y6nUAQOx/
         xRMVrv0bDmPO3K2AhFdrUxX6ZKrDibrCRVuY21SO/AB2pn8zub8SJxYM8AdYi43c4Pcb
         dmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023542; x=1775628342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ankry/lV9AonDaqBDI1RKEvyyWLrtwB+yzkL/8QxFk=;
        b=m7hZoPbzU1tEYurkKzTcfM3pjscw1fHLodpFRvPVF6VsaJ3Q07U4QdPug8eapPRrgd
         8fMoqmuEtnHRL71oqA+4h98iyyZNMUquOB7iypu6Q0bwt40UJyNwEPJcy3wSjhUit2K3
         97gbFTHxFq+3GgMWZrPoY3x/TBCLE4qlay+6j4c4Cr/78FDrIyled90cpoVbTzS7gQn+
         Jtb4lgF1HuuEbvjuplQt3Rien5HYvcDiH0qS13Ar/1kHOPC9FlACqHnN1EMqj62An6Zv
         m452e8N1FurKPPO08FGBaFviyIgMXDxmNGplfjG0FYFITn+fzkSTilhxcZNT9OHcUTnc
         oDsg==
X-Forwarded-Encrypted: i=1; AJvYcCXgpt5ske0PUYCYUuvXjbsKWpyzYB+tuUFE03I7h7+mtHDRHRWJB9U5w36agO0ZzgDjUTdGg+mMWEudanabHWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/n5B7mXdOwDyIamZI9o9qLAluYIaLTn1O1Ft+0Jx0Gzo92sG
	ICNSIARCFE8PGyVSLqPyWMp5VEHyQppqxt4P86qYA4C/qHa7C6CM3KvzV5lYwhyKYLQwK+ijDmq
	A9oKihONuw4DK48YuaaULkw==
X-Received: from dlea18-n2.prod.google.com ([2002:a05:701b:4212:20b0:128:dd22:12cd])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:670f:b0:128:bae9:c069 with SMTP id a92af1059eb24-12be654bc86mr1474279c88.33.1775023541385;
 Tue, 31 Mar 2026 23:05:41 -0700 (PDT)
Date: Wed, 01 Apr 2026 06:05:25 +0000
In-Reply-To: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775023538; l=3665;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=riyU8vHNfE+1WJo560BCnv4d01q2x8dxI6Sfshs/X8I=; b=e2Y6yARA2z8bZQKESrRpOLOxdHQcqYmWWB5p0Dl3ZHngh6oIVov5Cz5wfvs7aXHGgx5lkyvNl
 WgKwxdB3BopAAqgA0zp8YZW9xuE3SQQiiSUfDCEamE0S4NCwjkNhtjA
X-Mailer: b4 0.14.3
Message-ID: <20260401-teaming-driver-internal-v2-1-f80c1291727b@google.com>
Subject: [PATCH net-next v2 1/7] net: team: Annotate reads and writes for
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
2.53.0.1118.gaef5881109-goog

