Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9773624DE
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935309; cv=none; b=b+KeOND9ldNbCSqPz20pbRTeGhZt8uJZBxH0bx6n3Xu0sg2UkSFYgeyWoEKtvYwZBuKYOJr7koYDfFYD1NmMz1SFytzjvzWhcEZdxEYJV/ZPti4PrORbOZ5bLKGsBkc8ncgdbCzb6gDb3chfr1Fvu3ZXO7ow31oE86lqQIct1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935309; c=relaxed/simple;
	bh=R94majz8mV0atvThgTkdKQEuUKBPnraEojIwhia5cJw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MGku+hZWekhfgFtbc7WeIHSfauRxNw8T3iNpvpQqFR9vASk4kWth+IElgid/D9FfX69H086WeveTOyUVWq2QyciFvr0+Ud7I1f+AuvqZOio0HUFmkYint9jX2FduG3MQLi8NBUG7OAEUyu+I4PBgmvCH75P6hUv07wv2ytewZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMyFCEBZ; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMyFCEBZ"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1275c6fc58aso6654707c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774935308; x=1775540108; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iI1ZGUI+LB9nzNnETr8lTsBK4ItFfJAr3/iqDBBl74E=;
        b=PMyFCEBZB/Uiu+QcR+j27A+DVGRwIg04QFSeNb2riRqpjZKwd98OYBsaLy2g0PgpZx
         +vX8SVOzJ22kYy59IK5YPgoYds1FUh3kU8hB93XvuTZQlhul5HyVUlmhijkqaso+UiNA
         mqPvJOH1vbwvvExgftoou//yvrinuT/9E0RZ/Uy+RVCJaLeGOwRtrCofl8q+XyVZDeKi
         tvI6dXxda4K28AWdp/hu8QRAYcWpwDBeoRbRbyl8rolCXQbC4uCWPyjfGN5xxz/3a9Jv
         3PapEbnGdMjKkt184kXHJg3h0GLnHvkh0kcODpnBprLZDC4h8rAKirNB+I7FPr3x/AC2
         7Tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935308; x=1775540108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI1ZGUI+LB9nzNnETr8lTsBK4ItFfJAr3/iqDBBl74E=;
        b=IpDcPfXzF/DA7laFudA38QgIzQruQqzjmFE7JM6GlUZ06Zd+HcJ7JbFIpf4uysYBpy
         uOm+VK407ZIwZ85fYcYt3xf5u/+lHxTnuaWEYjCVB8pRg9jImgpPtAwy+g3C3r684bZe
         Owxogj80p3f/TMeQsRp8ruzuobHuZMrYK7/dmExTSSWpWZj3Hh1jldJ4K6ojpEdY8S07
         CH9f1/tiu3mrOaQff+Xor00zNC0J6DodEGhg8C/+8YRMZ3GaLUTTpCdrjthz9wjvXLb2
         8wwWIH2dCzQAE8R0KiS3ZuV+yXg6p4dKYOlygm/vvj+TMAnrn6NQbzAoLogLWJ4tFU/9
         cyQA==
X-Forwarded-Encrypted: i=1; AJvYcCWpTWie2nIAytT22csGku2GITMhn0WiR1KzdU+4UT9jHZ+aKpcxyFapQaHDc2OSf4Vr2DFxX+OArLH29Ocx2v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7DvXlvIaj5XAdWKbqNpDBTosjTXFlymwOmbmZWwZ8IkF3My2
	/a40Hbw6nIkDHYL0qfBspnVnlQoxpQEACc67LyVt68Ew/9bNsTVe7IzuiujJzS3ZuYxGwdnBV7Z
	f//P3O7E220TDpGSrdf2tRw==
X-Received: from dlbrx13.prod.google.com ([2002:a05:7022:170d:b0:12a:8225:c504])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:3d01:b0:12a:91fe:f5c0 with SMTP id a92af1059eb24-12ab28e58f6mr8027760c88.32.1774935307472;
 Mon, 30 Mar 2026 22:35:07 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:33:49 +0000
In-Reply-To: <20260331053353.2504254-1-marcharvey@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331053353.2504254-1-marcharvey@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331053353.2504254-4-marcharvey@google.com>
Subject: [PATCH net-next 3/7] net: team: Rename port_disabled team mode op to port_tx_disabled
From: Marc Harvey <marcharvey@google.com>
To: jiri@resnulli.us, andrew+netdev@lunn.ch
Cc: willemb@google.com, maheshb@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="UTF-8"

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
2.53.0.1018.g2bb0e51243-goog

