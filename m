Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E538735F
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200484; cv=none; b=N6aXbVhGO0qTAi2ssRy1qc+on3lfhcgq53lLxJgml/vUz8xflxdAHiIJr1EKOgtMun0po2+1+PAcinJ/jEaTVsxlZXov9yAiDr3BG1WZ1POfHWf+zPwKM9PTkZRLXFNdjcldqy4djI3nixVWGBvBY1QE286YiKfMHcSplbFP9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200484; c=relaxed/simple;
	bh=nuo0DHK7VQ/i6dfq7yT/KT+VIJKVcVO1c6MvP8D9yp0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S4zLH+2rWIOoqNmWNCpT33a5lEIOv5Jc3WcyIPcGaLtNpyMkNfK0eyJbtWAnBn0qkowZqUlRO1AtzFg75vuco1vji6Wn4uajgyMz0tunTbBrMJsf50/PYbKs/xv3rKqtpTZAtSDbhL1mr5pOkOL+A4/wsY8QnB0sAUJCAJysWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyj9MDqa; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyj9MDqa"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdd327d970so1121522eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 00:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775200483; x=1775805283; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ5euJZqrhZn3iV1Pl7AmL73nfBI/YKGmKDSeBhbmog=;
        b=vyj9MDqaq1WVcjX4687B0ntn3RhsLvhAY1GwU6Ps4rHrZBdqZykqL7AvvfojPNDznC
         cXE9cWGoU+/Exbq8NUKwiK3nqHv1AoYVpb8xmoaFYpBevhuObIVJ9RuuK4w/XHHuEEqi
         yr+3kyn2S4XfFwNlYyJ5bsyKbaUozL5suxsLyi8VOzzJ/N43RyfHiAduJg1W0wUaE0yC
         TvroGSNh8JqJRcKyAtGxI1WUJZQPkAsIfWOP0oK5sXaXoyjSIQ5YkF5ycwl8+g+D3h7p
         D8DJVH2pg1Rgm7hm4fXzv3QEd6hBRySP6TjMGJZCeVxH+1N7sTeW4+ukOF0FNJmjV8Tx
         aRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200483; x=1775805283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ5euJZqrhZn3iV1Pl7AmL73nfBI/YKGmKDSeBhbmog=;
        b=ltFWc2+6QAwS+hgODA9ddTSNvxUri5VLn5vnwM4wr2GfMGruKL3uED9xxG2DoPxKBe
         JapNNiKVdSVnx73D9MHtkqsQ/0ImNQa1kpFGlLzSyuhdpzKOIT6kPq8zgUHIU9a/kAsC
         JKGNRwjqrV7qzfgxaYlWXttkU5+FxlQuJ0kyPn3uTcJZ+rZQj4ZiwYXgN99+pZKx8Eat
         5VXwLBbGdGbaZizA5mNSbjaVQbsq43KskVRXIRTzuY+2xqrHtJN0iPtzIE6/kGoXk0bS
         0ge31zH/Ak08moD5hPp4Q8x1c+qIRjeeA7SJUIHJHo5a39tVMOVvtNwRm769WAgeVpoT
         jDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhVxTDMh5+Yvm0tpjJtKYXXdJh0N4HFYNekzRV9XmlEvflsBOOZtWEEq8BxjecxiqpEr1nrrD7LcRy4cyF27Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93+OhtCsmx08GE8u0U3wWc3BcbNW5kTcHO74swo2UKarfUD35
	G4dRnsOGTqLcemj2KLn6xPZ1rciQBhYBNjKlIfd/RhIfz9zrONMivpkkNZppVFkr+f5/HgF9WXl
	O/ZmnENHtGNzY8MVabDJSBQ==
X-Received: from dybph22.prod.google.com ([2002:a05:7301:4196:b0:2c1:5ad0:b659])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1284:b0:128:cf41:d6e4 with SMTP id a92af1059eb24-12bf0899182mr2300718c88.21.1775200482416;
 Fri, 03 Apr 2026 00:14:42 -0700 (PDT)
Date: Fri, 03 Apr 2026 07:14:29 +0000
In-Reply-To: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775200467; l=2883;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=nuo0DHK7VQ/i6dfq7yT/KT+VIJKVcVO1c6MvP8D9yp0=; b=Dl7qLYfcAC/GnZzJvEtW3P4+XWtI0Wi8e+Y5Gw1vvAXU8OB2dic9jCu0ecn6+TUUW7l+0OD1N
 rIgAOrDO8ioCSbACUasgZbgAkcZDf97zf5Rs4rwRgZE7mmjP0hCZ716
X-Mailer: b4 0.14.3
Message-ID: <20260403-teaming-driver-internal-v4-8-d3032f33ca25@google.com>
Subject: [PATCH net-next v4 08/10] net: team: Add new rx_enabled team port option
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

Allow independent control over rx enablement via the rx_enabled option
without affecting tx enablement. This affects the normal enabled
option since a port is only considered enabled if both tx and rx are
enabled.

If this option is not used, then the enabled option will continue to
behave exactly as it did before.

Tested in a follow-up patch with a new selftest.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v4:
- New patch: split from the original monolithic v3 patch "net: team:
  Decouple rx and tx enablement in the team driver".
- Link to v3: https://lore.kernel.org/netdev/20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com/
---
 drivers/net/team/team_core.c | 49 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 0f95f2f04d27..78c10111329f 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -941,6 +941,28 @@ static void __team_port_disable_rx(struct team *team,
 	WRITE_ONCE(port->rx_enabled, false);
 }
 
+static void team_port_enable_rx(struct team *team,
+				struct team_port *port)
+{
+	if (team_port_rx_enabled(port))
+		return;
+
+	__team_port_enable_rx(team, port);
+	team_adjust_ops(team);
+	team_notify_peers(team);
+	team_mcast_rejoin(team);
+}
+
+static void team_port_disable_rx(struct team *team,
+				 struct team_port *port)
+{
+	if (!team_port_rx_enabled(port))
+		return;
+
+	__team_port_disable_rx(team, port);
+	team_adjust_ops(team);
+}
+
 /*
  * Enable just TX on the port by adding to tx-enabled port hashlist and
  * setting port->tx_index (Might be racy so reader could see incorrect
@@ -1488,6 +1510,26 @@ static int team_port_en_option_set(struct team *team,
 	return 0;
 }
 
+static void team_port_rx_en_option_get(struct team *team,
+				       struct team_gsetter_ctx *ctx)
+{
+	struct team_port *port = ctx->info->port;
+
+	ctx->data.bool_val = team_port_rx_enabled(port);
+}
+
+static int team_port_rx_en_option_set(struct team *team,
+				      struct team_gsetter_ctx *ctx)
+{
+	struct team_port *port = ctx->info->port;
+
+	if (ctx->data.bool_val)
+		team_port_enable_rx(team, port);
+	else
+		team_port_disable_rx(team, port);
+	return 0;
+}
+
 static void team_user_linkup_option_get(struct team *team,
 					struct team_gsetter_ctx *ctx)
 {
@@ -1609,6 +1651,13 @@ static const struct team_option team_options[] = {
 		.getter = team_port_en_option_get,
 		.setter = team_port_en_option_set,
 	},
+	{
+		.name = "rx_enabled",
+		.type = TEAM_OPTION_TYPE_BOOL,
+		.per_port = true,
+		.getter = team_port_rx_en_option_get,
+		.setter = team_port_rx_en_option_set,
+	},
 	{
 		.name = "user_linkup",
 		.type = TEAM_OPTION_TYPE_BOOL,

-- 
2.53.0.1185.g05d4b7b318-goog

