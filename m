Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5C3806B3
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 06:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111079; cv=none; b=hc9Yhw6RiRGdkGImbzOEH+6+gANsLH67pPYgGI2ZrqzXmOqlIryEwN+pgah0s20XE8TYCaylM4tOTKtOBdWcZ/kD+a5wlkQqjkYcA3Gof8gBgi6y17kn013cl5ao3Hr9/A8zIdpuMLAqLpUQEOfz9JTvCxCTFUzOb7V+nc1HaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111079; c=relaxed/simple;
	bh=HQjOdpWVp0pioXC2IZRDM9wty7V0fQbV6ok41MLNUd0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nAlKeN81wi+h51S7lzOnKsB3H8+LA2BlZnb0v2gV+TAHVR3WGt2Tt7mip6yoaKjUnY863rpWCh6e0jTdUZJrCECwEpn5a2Jfl388Uw7mZ7colcKvkiMVP8xyEI/G3+EhmSi6WCCh93vGE5dG4qovW/uqLUfYq+BMFp6BjbwnTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fHslOeID; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fHslOeID"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bda35eab74so521141eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775111076; x=1775715876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgsfKORANRJz+p1LPldcLkTl0RXQtetjHTccrdSgIh4=;
        b=fHslOeID+NKCsI8e1KfyRYhIHOty+ic0GZx/UUlKtSky63kOOmDyj+5QuPA+uEfU8C
         uEsaFP8MhHA4ETFYj59Ac47cEaAPNpgy24npIQp7gLfAlDWYoeug+V2LonH0IH8K5O3Z
         g2XU7ZJWNktiY5vxePzZ9Euds5B3Pw4z6ORWtzYQLTyMgJJ2iUzSF7vU5kzbGfyHFUiP
         Yicl8Lyw484kvadpWJP35aHa7OxGpu+BTu4F9XE94J86e2La8p6KteyMhzqPr8g2Rp6B
         23trA1+ayUzx9uiUmSxcfoDUwYK3O23/0Cv6fncES9yRzrV1mE5/e3NL0rBluraqUtnm
         Fkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111076; x=1775715876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgsfKORANRJz+p1LPldcLkTl0RXQtetjHTccrdSgIh4=;
        b=h3huJl7ENWmDWXXCSpwK+KPMYQ/O4sdR1QzFg28Y+pE9syFISIbcx8UX4GQ1cS7KV5
         lR7ZA6a1RbUBipc50T2TDoMHzgI/cm1AAxzt08zxXMrH4L81nlYEpPZNvWWlP2RxNdTx
         sZozt6n0uGnFgQYXGxlkuuRxVvqwGKvMMYfpflYGkYqE6FpypdONFaFq5KfzFAzOPZB4
         YpmCfvzWlTxEui7ac3OZe/i2wdpCH6YmSZrpsMZyoqDidPzqDFqKGx9rJ0fDzgcRHyU6
         VMfW0qrIPMKL7hkoXNp89b05McFLKLJ5e3r+lIi4nVRWOMysMYUCouLJNC7XGiDFBmx+
         O94w==
X-Forwarded-Encrypted: i=1; AJvYcCXy07BhS9p3TEybcMO4KSx08eOhnADNx3Xzsb0K2z6mEuvyfKI6pt9/K7FJL2twoMQAQ4HWfE3odenRpY9tVeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvdiJMr15aYSSpYnX7244cKOSp+yA7m2jCjLJhRMIm+iC7Zcvs
	buo9XG5+AHZlOIxQSyUTxRCT7qIVXPgMN0TB6P6TknBZnheXlgI4yyYmFwyJfg5Oc6cHHAtcc1a
	bEVw8TJWHJAGMRaptWV9O8w==
X-Received: from dybmd43.prod.google.com ([2002:a05:7301:182b:b0:2ca:4c73:9998])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2c14:b0:2be:ca4:e114 with SMTP id 5a478bee46e88-2cad6fca9dfmr478824eec.9.1775111075992;
 Wed, 01 Apr 2026 23:24:35 -0700 (PDT)
Date: Thu, 02 Apr 2026 06:24:16 +0000
In-Reply-To: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111069; l=2559;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=HQjOdpWVp0pioXC2IZRDM9wty7V0fQbV6ok41MLNUd0=; b=1EaJAA4bTmSBIRbv9Jbm0RlvkzzUF+Xp1V4ol+DxjjYozQyx+p/QF7F3rAJ0nYKWhUewTiuOU
 GFyrIj6olI7B4rq/DWW6kTIixrdSjtWCm1i929UMQ+0MwoyJZYInHn2
X-Mailer: b4 0.14.3
Message-ID: <20260402-teaming-driver-internal-v3-3-e8cfdec3b5c2@google.com>
Subject: [PATCH net-next v3 3/7] net: team: Rename port_disabled team mode op
 to port_tx_disabled
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

This team mode op is only used by the load balance mode, and it only
uses it in the tx path.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v3:
- None

Changes in v2:
- None
---
 drivers/net/team/team_core.c             | 4 ++--
 drivers/net/team/team_mode_loadbalance.c | 4 ++--
 include/linux/if_team.h                  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index e54bd21bd068..2ce31999c99f 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -968,8 +968,8 @@ static void team_port_disable(struct team *team,
 {
 	if (!team_port_enabled(port))
 		return;
-	if (team->ops.port_disabled)
-		team->ops.port_disabled(team, port);
+	if (team->ops.port_tx_disabled)
+		team->ops.port_tx_disabled(team, port);
 	hlist_del_rcu(&port->hlist);
 	__reconstruct_port_hlist(team, port->index);
 	WRITE_ONCE(port->index, -1);
diff --git a/drivers/net/team/team_mode_loadbalance.c b/drivers/net/team/team_mode_loadbalance.c
index 684954c2a8de..840f409d250b 100644
--- a/drivers/net/team/team_mode_loadbalance.c
+++ b/drivers/net/team/team_mode_loadbalance.c
@@ -655,7 +655,7 @@ static void lb_port_leave(struct team *team, struct team_port *port)
 	free_percpu(lb_port_priv->pcpu_stats);
 }
 
-static void lb_port_disabled(struct team *team, struct team_port *port)
+static void lb_port_tx_disabled(struct team *team, struct team_port *port)
 {
 	lb_tx_hash_to_port_mapping_null_port(team, port);
 }
@@ -665,7 +665,7 @@ static const struct team_mode_ops lb_mode_ops = {
 	.exit			= lb_exit,
 	.port_enter		= lb_port_enter,
 	.port_leave		= lb_port_leave,
-	.port_disabled		= lb_port_disabled,
+	.port_tx_disabled	= lb_port_tx_disabled,
 	.receive		= lb_receive,
 	.transmit		= lb_transmit,
 };
diff --git a/include/linux/if_team.h b/include/linux/if_team.h
index a761f5282bcf..740cb3100dfc 100644
--- a/include/linux/if_team.h
+++ b/include/linux/if_team.h
@@ -121,7 +121,7 @@ struct team_mode_ops {
 	int (*port_enter)(struct team *team, struct team_port *port);
 	void (*port_leave)(struct team *team, struct team_port *port);
 	void (*port_change_dev_addr)(struct team *team, struct team_port *port);
-	void (*port_disabled)(struct team *team, struct team_port *port);
+	void (*port_tx_disabled)(struct team *team, struct team_port *port);
 };
 
 extern int team_modeop_port_enter(struct team *team, struct team_port *port);

-- 
2.53.0.1185.g05d4b7b318-goog

