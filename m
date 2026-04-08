Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D499137419F
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 02:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616756; cv=none; b=BbzoX52i8obAt2Ts+2xTa269hyx0GW8jXjag6lUBswgmzJkzWtB2dsQgpQVe3FZI/8ak10o5nqHVgSkz87vncq/vheXX4k9BKbSyO3q4Y9bIjC9gnkx/TlR8V8PYgGblJ0bSkWM43VOt/HCxow/xk3wLwE1MK9NjTLjf6sLFQNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616756; c=relaxed/simple;
	bh=tLf1bkN9uV/Iw7z58TBlDPGRsvBgwjwEW1soOYNlMng=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XLPGwZsWnP3fv9horTJvsQ+55LL1Ggds+okpjO+fUXtZxvarUmWrmZcPbzcrPbg9jEW1ZSh+hfM4aoiSmNXICJi7ZbmVyJMtM2GqZIL17BRGCtDc+BIrPCmG5PLL4WZdYcEmoAWisBHbY/j7UdTMmDvJPA+1MjPwyTadWqBbzX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JIniq80d; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JIniq80d"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12711ec96fbso22664094c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 19:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775616754; x=1776221554; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax5N/AY2QUWPAPxLLKbm2VOEjrgk/KSItcsgBYVbAAY=;
        b=JIniq80dsUrGfsTfWzz4U55SmKvVKLk42s63/BSktf9VN9Wyou01H7xbAg0HNlcxRk
         2Y5yeaemp3ab7FNU2AOg92odKPikfWocm8qvFVcNt+45aqnukO777NY438nlhqLNSSV6
         gWTBoIlPNx8vvXCm2BJe3wkRYT1woIj7l04nlJo9Pd91nTGF0PaIu7beurvT9NeuWQuR
         m9a+wI3l4NosNxItKOOL7Mu2jBf36vgC56VujgF8zKC/gWQrTpjRreSql2WpiYhpA9nz
         Pdjydd8EAXBaUnlxglirDNnod/qt90XsqxvWTaE1pJ3R8wr6nsvmUQmmD5UZipWs2TpV
         7pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775616754; x=1776221554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ax5N/AY2QUWPAPxLLKbm2VOEjrgk/KSItcsgBYVbAAY=;
        b=eOHXUs5tBLaUeRqMad0jqa5utO8bTW7uMwyU8/STjHbiECqN3+v7/chS2O54dlmy2o
         RrlEk1RcPLkeQ8KAIqZqqmUXrShGHTIfJ+mCyoK0zPvdQt8rOH3iJClOSTkinGGwwYs5
         sJfAFP063AEeEZiz9F/aej3fIxw7Qp+rTWZN5E6UA3XqAPn6PtPet0RD/KEkPwfN6SFy
         GA0p1EoEzSFCYHL0a9ThTbephaJfdJMd8WO10HWikzvLIBkHf/9+pp2HM0zapslrrXyG
         2nkfSwifwG6mg5PZsR6XeWHBoIjMvOOA4R9nZmS7Hr4UFyOZqq7Mubt2nP5X7mYMA64H
         Xbvg==
X-Forwarded-Encrypted: i=1; AJvYcCWUqZA16zDO4JkznuwSUW+vf5HQ+IOVyxwUSLUghOlnBY0NGRMLDRrN7Py/FLzli9N/siLek/aV6xmdSXbgoRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+EKgC4K4t+8LHdcGcl4fP71YsylG4AZ2LcYnZBkzf+qS81+W
	eNV5ZsKG4x7P4za0rPodey6Ug8FqX0/rECZZEPcLy9/crb4t8F8Fiivr7zqz06+nQVx94FyTCES
	8G+34krvYw4djNnYpF4SP7A==
X-Received: from dlaj20.prod.google.com ([2002:a05:701b:2814:b0:12a:6c32:ffce])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4396:b0:128:d2a5:709c with SMTP id a92af1059eb24-12bfb76f887mr9974725c88.33.1775616753732;
 Tue, 07 Apr 2026 19:52:33 -0700 (PDT)
Date: Wed, 08 Apr 2026 02:52:22 +0000
In-Reply-To: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775616747; l=2504;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=tLf1bkN9uV/Iw7z58TBlDPGRsvBgwjwEW1soOYNlMng=; b=z/hty/splzkDAHFuVlNKIT9qqTuMq3/lMpSVznb6sXy8z5QUeqtOlQ20UqrB5K3Trejhd+ocB
 MFSJECD/SaeC90xQho4F/lLItmaTaC2pShaV/vS6BFWsZVL4j3cDZof
X-Mailer: b4 0.14.3
Message-ID: <20260408-teaming-driver-internal-v6-3-e5bcdcf72504@google.com>
Subject: [PATCH net-next v6 03/10] net: team: Rename port_disabled team mode
 op to port_tx_disabled
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
2.53.0.1213.gd9a14994de-goog

