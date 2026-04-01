Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DE329C49
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 06:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023547; cv=none; b=C74nMFuhq4ZNbRCzLaXPY+qfJqUxJ6+gdiTpDqzZVuMeMYG7Bkzjj2XWCD6DO+IeSwzF4MqhdDlNJMukTJWgVO4yygIjPg3xhYU09Vqq6gNMleKmg3n6huF5P/HaQDrFeUpYAvI+aQwmG0VDPDgEMnc/vHlVLwnlyr7ryKb3mto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023547; c=relaxed/simple;
	bh=YS3YiatLBj7qZwctFvA+P73cI4VV70CVdOZYZZPriYs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lbAPu+9YjNKu4blK/A4mscU4hoho9wg/SwhftE7XUqv0El/eGdpSvTJYi4sNK3wiIFBzyuTSFHPFWuD9YN2s5k32y8Hqti8kTXGJj+qRlNQ1g8HSztC0rEHpXV1WC71d837UMK8CCQNY/jcQEPV8yylWVFXRnNiQsSSa+ZOwCE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U2VbRUg0; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U2VbRUg0"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so5915697eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 23:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775023545; x=1775628345; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xA8gFrLqFTd0mUoJLyKqA0q3Ee0rtvXH48v8ujy7q5g=;
        b=U2VbRUg0sINu9P+I0+pGKCbPIWm3dn1KcrN4wu99zyihNj/UhmQNT3kK1pRpN0b2m2
         J7RQJ0I4oA6fXtyVuDNa/NQ2kpQad/HfIXRYYjatOy9Sy2PeSvnYnpHH4Z7XhM5DGBW+
         EOJH4j68URMOlq0Eqkt/IRi2s/WAdLaIy0Vrl/wJgwOA5PyLWylOcOMnwh71wCsE/E1k
         DRgsBq6NDW6dOfFCnMaj/3AEqOwgB0KHQNd9aGcIcBvPQQU1wn7yLkVnv1sZb8VilwA3
         uaeXBtEMKLU2H+2xYqpq5cl5eQ+vW4XJre/nTAkBhOtfe/ACKeCPKq08qhuf9xDjSd7h
         tOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023545; x=1775628345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xA8gFrLqFTd0mUoJLyKqA0q3Ee0rtvXH48v8ujy7q5g=;
        b=cfci36qZ2e5kf74Wz7aimM2EOpDP7+CF7cGAYhbzFNon9/QxSS5eZsZAC7/X3ElwEE
         dSMYwzU7J6tKfaSCt0Z1/rwdOVrlhWg4LMmKl6wsWoPcwmHCdssr/CPYPagFplpE9QUX
         +oBumbdK+vmet17MG7jxgfTJP/+/FZX3PZEg9s+PHCTGRhQlSbwcKmTCTcKv/2yfZwkt
         YuNOawzvqthwNH9WVJXbyqDYT7XEzqoUtqMNuckKIF9OLORUTT2Mgdv8KaX+09XPbdY7
         ldmbpo4vEjhgRc6AX4Cbs4nbKEYUO+men2l6LSDZKWDhwiw+mrZW+SlXlfXZ80IQOBPK
         TNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY+0DpPdfWnNDxLWSKbs+lMttWawLepYlmscwHGioSCifTw2UD3jXQzMx84TWuXaPef3NchEekkedSPk/DyFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuOSLQES9eolNDcfdckfmLN9huGorRSs88WnHujy3Z3yATuzFq
	uOEyGzEsMG9EBZXw65i1N6ZwTul6knXDpkUwTbbQcDIWFaAp4EB1e4BzVBH+5Q7LdBaY+IYQAM0
	0FBBPhDxJGu3dDNd4FBsm/g==
X-Received: from dybbp18.prod.google.com ([2002:a05:7300:a892:b0:2c8:7753:33ac])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:80cb:b0:2c7:2c0b:f33f with SMTP id 5a478bee46e88-2c9325b0162mr1371078eec.21.1775023544546;
 Tue, 31 Mar 2026 23:05:44 -0700 (PDT)
Date: Wed, 01 Apr 2026 06:05:27 +0000
In-Reply-To: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775023538; l=2533;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=YS3YiatLBj7qZwctFvA+P73cI4VV70CVdOZYZZPriYs=; b=CbIq+Ggm9PWPjSCVHiBf4TlPgoy7zSsGtrHeaWJ1Xtuiw0yEyFjDVqJzUY4UA3VG6x8C1Tu9N
 dGuLh4TZbQMAUKGvK9wVExy2ZjxaNXaim0VUFnfxcQMJ//GvcDdZHUm
X-Mailer: b4 0.14.3
Message-ID: <20260401-teaming-driver-internal-v2-3-f80c1291727b@google.com>
Subject: [PATCH net-next v2 3/7] net: team: Rename port_disabled team mode op
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
2.53.0.1118.gaef5881109-goog

