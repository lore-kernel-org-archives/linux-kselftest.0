Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C53164B7
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444696; cv=none; b=GwXfC4FtvcdDjefEkoHGk13L6VSenLE3rAlaa3/rogULxnxgk8H7nR2nAnroeKFdTDhDrbELPrPUajER79Tv83oxCpGFdQ8QAVuyOIocUCel2CIpAytYNxjSVPHn8COBe29Gx+Qc9mxMnpGV/Kda/2ek0LDyjmhhWJ0ByEoHFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444696; c=relaxed/simple;
	bh=o6Pod91e7/9t3b2/Bm72vJKPPOfa7e2ANUl5kI+qtIg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rox9e0gBG44i1CPlcmWwFOLNmTx9DMDUVps2F89d6X46pdV1NN3RkppvYD3WXuUMyr00HbUXgvS294pdILXobiwzuAUJ6HfnjEazL47j6ikitgdaHos2Ddju68f0Xn75GRW0sj2CiMvECXTDSX89AeUPg7Pi1TbmMdnxavpW0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XzdSgbUY; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XzdSgbUY"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so23362310eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775444694; x=1776049494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4URTC5SIPOJboJ7bC77dvH5LDjPWmAdcDPJzBNM8Qk0=;
        b=XzdSgbUYPhRTcVnSmrQwLYsupAbzqyzkR4nN/sEWdecEToW7PFf3KZ1uZigRCmwBDO
         Jz7aoDxkf1w0E4AwpSCsBRBW1sBDmkxQxTGuxDer9BoyC3F9SpqcQr4xPj3LCpfuMPhG
         CrweWJlM0yYyNiG5E24dGXgd2gMofimbArbgyKQ17ry+zQ86oQHBHydpeLflGn7DZO6l
         0fK69tzZpY2Ekm/eUyL7qcEWPmxnLhzEptKCB3IugtJIwP2KG3ZX9nb03zMsmhUKjtkw
         1VkEZNpdlRO/wNVcMcy3dpWLZ0z/ba2yefiRSPdljAPIrXGNz7aJvUwW3dgZT4j+WyVI
         vDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444694; x=1776049494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4URTC5SIPOJboJ7bC77dvH5LDjPWmAdcDPJzBNM8Qk0=;
        b=eFh2cwOjqY48Ke5T0dAvdOMwivelsSqkKGtVzQUGp8eBt5WXsa7K9gHb+q5iOCS1YD
         lOLdphGzs92Xktld9WKF+2bp0gODDMbPrtQtJPbI04YKwYbyhFzmB5U4v6RJZ1tMXKY9
         aCjAPVyL8QMF6zLrkkD1kARiFhY0jdZmnW2DdyNc4eZxv7EIIvTTjI6+/LGkq/+L96xF
         gWm2OEtVbTG43KhFRuVxUykHT3M7ZG4g4AG0vDn1DPynLjFnUfg+t1J7X9GlYb+9CDjx
         5ikMthY++5T1HxqRWIawkhO2SRdwvaDuFL0Ri0fokfvTpkIw1Qcwt+udZdPfKo+35O1L
         1QPA==
X-Forwarded-Encrypted: i=1; AJvYcCW/cQ8OLi7SMPbeJ2CdykWJL6w9VaukOBeUKXDWIpiRhd42FvzIEBrMblu/IAwI1lNQlTwAdXQzuSpFb06UVdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3qg64OaHWL0KeL+yINlRMmyF/HIDaSE6lfmqfp4L5dw2DDi7
	YO4jMels7na0oC6YE0sSjx7ENAySOGkhqbra85n1mYUwyYstGRfBNjPVmep4ikEsSz1wYOMRz2E
	3zc1OpU8FGoatvdBl4IJ0kA==
X-Received: from dycac24.prod.google.com ([2002:a05:7301:5518:b0:2c4:3a40:8acd])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:fd09:b0:2c6:1557:998f with SMTP id 5a478bee46e88-2cbfc16c435mr5221567eec.25.1775444693757;
 Sun, 05 Apr 2026 20:04:53 -0700 (PDT)
Date: Mon, 06 Apr 2026 03:03:39 +0000
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775444686; l=2611;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=o6Pod91e7/9t3b2/Bm72vJKPPOfa7e2ANUl5kI+qtIg=; b=zTZohA5zj/dgsl5f+2TjmB6csNXcByUzymeOpU3t0RybGmZFJCp2RtVTm8BvbI0KFTCh6XUBg
 H/fbAcXs6sgAVlVx2yrW5k94zPotbsNiT2B25EIRA9uA3u5LCM7E5Kz
X-Mailer: b4 0.14.3
Message-ID: <20260406-teaming-driver-internal-v5-3-e8a3f348a1c5@google.com>
Subject: [PATCH net-next v5 03/10] net: team: Rename port_disabled team mode
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
Changes in v5:
- None

Changes in v4:
- None

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

