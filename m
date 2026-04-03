Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F4379964
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200474; cv=none; b=aPC64QzedISeHdHiWHHnmj0RMrYBsfj8t6ym1DkzMHNmZKHU/d0gjWYLQZcnU2wxCne3P/3vblIEaqMNLGxK+9DUhyW+U+FQ/7rkUXt+9C8B/3Y5r4AVHOYDE1tTSRd8HWWP404/hfnoRi7pk50J2iMpwCDQpxDAsTODJypqxQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200474; c=relaxed/simple;
	bh=JjS6MuWrzLQ484r+Wytp35TgT78rt/ZzACL6KUmL0o0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jx46dlknvySW4YgIqCtmt/zM5pJzuH9fjgbC1NH0z6HYtk9NFVyds2t2xZE2skB3RXhxXS03QlGaq4B3fifw5SBRRQA69kZdO/YbcG/C0TvIU73eFLPEWbrcyjJjEHQpWM5LYrkA6NOUdkNoSz8G5wGu+ywLWexDc8SbwQdYQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hW9gkIYJ; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hW9gkIYJ"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2202201eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775200473; x=1775805273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sH3+awQ2VJG9FRCmCvGcnPpepbVJPLxWI2KeuMcmXiQ=;
        b=hW9gkIYJtQ1qvaWk91pKISPu5N/MRg+yxakbe/DC1Q20i6sfRhqnZtqGuBJDubtg0k
         QwEbI39QKGeQceEPGiouhSNFOi6ttMid79GpiVhN9g6e13sNx7+Wcgu/IilKJvmKIcpS
         j51QBLPmdWy0Y6Un5u7sSKHLTctEQ5KuvcilrlzDLgqdRsXVNiE3GroOq6i4EP2HggP1
         yl5IpYq3hbQo6nJVknO8AHBuh7xFSQE8l7iAOaesWlu0rYe3G63c4maOgyXJESJc43Xl
         h4ZlVtAvFuMRjqD+ZLMQM8Ws0F/BZzbFdJiVTcze1kA+8P0iiavinX95F1EmpfiuozKh
         l6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200473; x=1775805273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sH3+awQ2VJG9FRCmCvGcnPpepbVJPLxWI2KeuMcmXiQ=;
        b=szhajsGZp462ztQy/hWZMAPMdNZccKUi8Mv2LmyKDn+5w/hMqtfS5/lhQqJOGVf6Gh
         DUvAP5RRXPZDKqwfxpqRVppcKA4q9TG6UbHLkHQ1jIxdTB8mbwO4+x/By1A34/N1yD0T
         uCGbLD3fiXWT2SGF1A4acxsurUtqogRmN+nbEwQ9bFj44mniaB1H3rkqyQpaWV/EcOsf
         658jTlNx5olj3tLA7xWe0h1CA8tIkRegorDY9P3XDhHrIUwxG8+EIcbyXXiOdFmcbdwV
         OVUDB7Kb9lUZ9Kb1SuA9DQFDozFfK3ycqQ4Uz/nZx7B1h7WMlDDR+y1W7MAngPcLG4S/
         8wqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8nJlU+99vKHudu1MOShrD2s92VZCcwq+4yzrBT5Qdnxr6UMNPx7krYSJlVDK2tJ8dj5mr259YvlT6AD/bkiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR/ZlUfVqYY3DfiA/cE09YuG2MGJSfY5jZkjEeP14O4ImzACBN
	JcrsawhFSMIYHHds8SiJ/GxJQRmSXQtp4e7pMqtkdIkbZScH+CiPLKaGqWT3G6nWqiB6A3TLEeZ
	ugZFtGzT5ospEqV8ZpJmYlQ==
X-Received: from dyaf11-n1.prod.google.com ([2002:a05:693c:838b:10b0:2cb:735c:182c])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2b14:b0:2c5:d833:a4fe with SMTP id 5a478bee46e88-2cbfa5bf117mr923062eec.10.1775200472427;
 Fri, 03 Apr 2026 00:14:32 -0700 (PDT)
Date: Fri, 03 Apr 2026 07:14:23 +0000
In-Reply-To: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775200467; l=1461;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=JjS6MuWrzLQ484r+Wytp35TgT78rt/ZzACL6KUmL0o0=; b=WaaKcCy6jw5XvMICkOKbYOhzmRWQdzj3dQmC//JznTNilpSYDLyMIPk7NU2fYSUCfczxIf585
 TUniz+tRtmCD+2aGkmk5rkyxA2PpoukSRZ62kUhqm0Eqbv4u7F5dDR4
X-Mailer: b4 0.14.3
Message-ID: <20260403-teaming-driver-internal-v4-2-d3032f33ca25@google.com>
Subject: [PATCH net-next v4 02/10] net: team: Remove unused team_mode_op, port_enabled
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

This team_mode_op wasn't used by any of the team modes, so remove it.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v4:
- None

Changes in v3:
- None

Changes in v2:
- None
---
 drivers/net/team/team_core.c | 2 --
 include/linux/if_team.h      | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index becd066279a6..e54bd21bd068 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -944,8 +944,6 @@ static void team_port_enable(struct team *team,
 			   team_port_index_hash(team, port->index));
 	team_adjust_ops(team);
 	team_queue_override_port_add(team, port);
-	if (team->ops.port_enabled)
-		team->ops.port_enabled(team, port);
 	team_notify_peers(team);
 	team_mcast_rejoin(team);
 	team_lower_state_changed(port);
diff --git a/include/linux/if_team.h b/include/linux/if_team.h
index 06f4d7400c1e..a761f5282bcf 100644
--- a/include/linux/if_team.h
+++ b/include/linux/if_team.h
@@ -121,7 +121,6 @@ struct team_mode_ops {
 	int (*port_enter)(struct team *team, struct team_port *port);
 	void (*port_leave)(struct team *team, struct team_port *port);
 	void (*port_change_dev_addr)(struct team *team, struct team_port *port);
-	void (*port_enabled)(struct team *team, struct team_port *port);
 	void (*port_disabled)(struct team *team, struct team_port *port);
 };
 

-- 
2.53.0.1185.g05d4b7b318-goog

