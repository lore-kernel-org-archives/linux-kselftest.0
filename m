Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328673358B8
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444706; cv=none; b=uqJuhi+5QSUQgInsbygDugvYTS1RKIYjo4OMYhp31EMPKAUsDXpK1YqUHCMGvUc7IHzZ42B/uWELvhjhvgZD8C+P/MrFHi4HTFBunzWLsWTSTiyrTml3huD8cNS49IiYLurmn6zeDb3R/mt1ExigIcsqHKbFdpWGQKn3al5q/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444706; c=relaxed/simple;
	bh=H/uaajKx1vxdRV09vwrGqxbZzExtD3ya3Un5atGXWk8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LKqwvacipIEKBaQKJCHO5xx9lLjSkRZR1Qm/m3iDQq9JGEMOz3dCt6YM99MttPPHqN9mN9PCU1b7HHF6F/FQX3kkIwWSYUjgCHOgjIJ4o0xBIgt3C25VGCPte9EuuptN++dsDprjdn9duldoztVjXBv/2kxmFq7lxhtHyVoTWf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SdRyB2A5; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SdRyB2A5"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so23362758eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775444703; x=1776049503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMtKRElyEZ3OLu3Q3K0AjubNzm6h9+s3y74+ZNAiAAU=;
        b=SdRyB2A5C4MFBb0W13NLKBq0HGeuECjHVMpkmh6qIBsQ1FX+/5CAPqPM0MmkaRWFCa
         KtG6agyXPdjjZIIh8XJDgwvHsmsflJ2WiLYL90+JOfzwiggrRbE3d7tG+ZPi0wPPY6eE
         K3nii3xmR1nVqT+Qe34lc/hJeW93Pyt9uqk3SbqkKEHAwoLC3RsoK0zoudZZBbq8dVdg
         m3YlbR+HveBwWY+TAwv7k7YQ8XIYsvwLTJZ6dpvEqr2rVFCKp+hGhOqK4t7gNEQqg2AL
         c1fmz6ywnJiEMHOZG83RuxWfmfdO4vpWQ/wtzpZRMiXGCT49XLIqbxt/6IzdxbHCTNRs
         +/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444703; x=1776049503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMtKRElyEZ3OLu3Q3K0AjubNzm6h9+s3y74+ZNAiAAU=;
        b=ORS1ofu5FxOKnZaDnoCp+0pw2UoQZA7kwYhpDshQQI04Y2HoPxuwLybCJXujqY1ocL
         FF/ww7tSfrEM2H4bc+e9QwhDqwVbz4zXeUF37dn6hMrZx0Oe/ffp9gy+jFB2Bo7ZO/v2
         YiSjvfIc5NK7bfc6PkWNReMTdBCp9UqK/0H9sDVfbMPHmrpXXDyc+22/90OdpjH04BfM
         AEmoNSyfYF/qFRIF0vcniOkrlOJSVNAmRFdr4UZ5lKVfkMZ4vkGdFl3odTNkGplwd5lY
         Kqcu65pux755tQOBYm4hE6woibTcoFPGh1d25K2O2GW/Bkn841f89Rk2pL/wSzbsr0rI
         m9GA==
X-Forwarded-Encrypted: i=1; AJvYcCXcccADW0PDeROz8Auv+RMOyYOtzZskJCPYDzDJIE/G1/MksSnIOwzu6bmgbviYsmK+9lo5uEduNExAa3puNjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfOs7BrcSjkGTqnXdww1089PtEhO+988uNK9KHRdsezvU220q2
	DZMFJ/Tdj8gI2jMTDlW1F4w7oQYQ9d6h9cogJTsuyH7ik1wReE83Y9J9bDlHeBCbBk+6bdG2Chh
	1QlFUv23Ih0wq76dHI6RwYA==
X-Received: from dybmx6.prod.google.com ([2002:a05:7300:d406:b0:2cc:a944:fd94])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:371f:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2cbfc763331mr5532479eec.28.1775444703191;
 Sun, 05 Apr 2026 20:05:03 -0700 (PDT)
Date: Mon, 06 Apr 2026 03:03:45 +0000
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775444686; l=3253;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=H/uaajKx1vxdRV09vwrGqxbZzExtD3ya3Un5atGXWk8=; b=h5qA5SF9nK/bazgpPfM5lJVbAyXedwzZHVXoheWKPxzNkpTkG8fZC3GXpDYTdQ2auUu8jpOwV
 rV6SYSND4pTB1DBzZafyh3IkrjpvzQGgEc25MnIK6FOo7HE/4e1lMcg
X-Mailer: b4 0.14.3
Message-ID: <20260406-teaming-driver-internal-v5-9-e8a3f348a1c5@google.com>
Subject: [PATCH net-next v5 09/10] net: team: Add new tx_enabled team port option
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

This option allows independent control over tx enablement without
affecting rx enablement. Like the rx_enabled option, this also
implicitly affects the enabled option.

If this option is not used, then the enabled option will continue to
behave as it did before.

Tested in a follow-up patch with a new selftest.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v5:
- None

Changes in v4:
- New patch: split from the original monolithic v3 patch "net: team:
  Decouple rx and tx enablement in the team driver".
- Link to v3: https://lore.kernel.org/netdev/20260402-teaming-driver-internal-v3-6-e8cfdec3b5c2@google.com/
---
 drivers/net/team/team_core.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index 67f77de4cf10..0c87f9972457 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -978,6 +978,21 @@ static void __team_port_enable_tx(struct team *team,
 			   team_tx_port_index_hash(team, port->tx_index));
 }
 
+static void team_port_enable_tx(struct team *team,
+				struct team_port *port)
+{
+	if (team_port_tx_enabled(port))
+		return;
+
+	__team_port_enable_tx(team, port);
+	team_adjust_ops(team);
+	team_queue_override_port_add(team, port);
+
+	/* Don't rejoin multicast, since this port might not be receiving. */
+	team_notify_peers(team);
+	team_lower_state_changed(port);
+}
+
 static void __reconstruct_port_hlist(struct team *team, int rm_index)
 {
 	struct hlist_head *tx_port_index_hash;
@@ -1007,6 +1022,19 @@ static void __team_port_disable_tx(struct team *team,
 	WRITE_ONCE(team->tx_en_port_count, team->tx_en_port_count - 1);
 }
 
+static void team_port_disable_tx(struct team *team,
+				 struct team_port *port)
+{
+	if (!team_port_tx_enabled(port))
+		return;
+
+	__team_port_disable_tx(team, port);
+
+	team_queue_override_port_del(team, port);
+	team_adjust_ops(team);
+	team_lower_state_changed(port);
+}
+
 /*
  * Enable TX AND RX on the port.
  */
@@ -1529,6 +1557,26 @@ static int team_port_rx_en_option_set(struct team *team,
 	return 0;
 }
 
+static void team_port_tx_en_option_get(struct team *team,
+				       struct team_gsetter_ctx *ctx)
+{
+	struct team_port *port = ctx->info->port;
+
+	ctx->data.bool_val = team_port_tx_enabled(port);
+}
+
+static int team_port_tx_en_option_set(struct team *team,
+				      struct team_gsetter_ctx *ctx)
+{
+	struct team_port *port = ctx->info->port;
+
+	if (ctx->data.bool_val)
+		team_port_enable_tx(team, port);
+	else
+		team_port_disable_tx(team, port);
+	return 0;
+}
+
 static void team_user_linkup_option_get(struct team *team,
 					struct team_gsetter_ctx *ctx)
 {
@@ -1657,6 +1705,13 @@ static const struct team_option team_options[] = {
 		.getter = team_port_rx_en_option_get,
 		.setter = team_port_rx_en_option_set,
 	},
+	{
+		.name = "tx_enabled",
+		.type = TEAM_OPTION_TYPE_BOOL,
+		.per_port = true,
+		.getter = team_port_tx_en_option_get,
+		.setter = team_port_tx_en_option_set,
+	},
 	{
 		.name = "user_linkup",
 		.type = TEAM_OPTION_TYPE_BOOL,

-- 
2.53.0.1185.g05d4b7b318-goog

