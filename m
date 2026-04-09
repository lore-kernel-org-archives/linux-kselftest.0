Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA9D37187E
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703599; cv=none; b=ku4fHCe9JHCmqEK7Wc7HS9fvQRtEPFJ/XEzhpORNwvXPtT4ZklcUtiahPghLwGXylwvPnF7+2qtmAV+vHQAQ+RCXpPL0ixqS6HLJWnYs6rISthB3kmtHyQg4pj7M6PNJPTEWFcWSInDSqA8pbs//0GvvlLNFk4ilb/vOJNxbwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703599; c=relaxed/simple;
	bh=ysjEMdXBV3p9t7KlXpwCVPcXO8bpDjU9ioNzjR4UBLc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EQAIqRm24n3g4g7pxz5pPT1Sc3RYXG4aS1ctCgVAlZHuXgZvc+Odm/DZJgsFpdfnpmuTBFfcMpxccY7/unBxqZNkF/PtE+DGpDZIEcJ/YOrs3LXrdcLuBWNA5SZzBuTNSuatOe6P3Wn5KrhwAQOwAAmmjON1GUQckRLWj+ZyHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJUpvQdV; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJUpvQdV"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12c282d6d32so1641320c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 19:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775703596; x=1776308396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VrKcMgABSh6GKKrkwrLopmtbIwGc13QpOLpRzfT2BBE=;
        b=NJUpvQdVOpQVCgauhSnKiPOl+/XqDu6NT0H3AfRQeUO7bDk63MANR87YdSPrAPxbyU
         nFsMxEmMIMcQS+EayguVHIqw8z/t8kEf9ivL82904t7vRbRAGljZ79sTvW93ibB0ObUz
         sH32v2tRzPolSAEfiyKwQ2GkBpybepawnDXfZ2BVTcfq/XxFZDBpe8mzlGvACbVdYPvP
         s2YUPxXM2CUuKE/GroA4TCv7hDH7agSI0TD4VHzDHN/HUQCTFo8DYqjGatUvlC424CNW
         E32oVpNM7DdGw4hZUNqCM/PIu30a8EfmJ3Kphz2L37e76RsnUeKBnZTGR2oQ6UyLqwYM
         WTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775703596; x=1776308396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrKcMgABSh6GKKrkwrLopmtbIwGc13QpOLpRzfT2BBE=;
        b=DVpN0cOvi3ZuY5a9cj3wtwxRyTc84mvcEMKNgkQYP0J3FK0fIl8YxiDYF5vXSBVgXR
         9UGmIoOKokmCrx++CGH3Y3g4XQqinfM6WzO3q2I+Xg5olyoSburfUPlFQJ21L/6jZfFv
         8UzQW3Ag2PvPtK8HIHuc5iHG9kWMprVTJrLG3D6AeucpAHx3vwubbOCLIRur/J7bnu1+
         HugVmtq96wcyvLoQAF8v3yQ4bMKowwf2U4QKZMG1xp7VEoiguw4q+xBnXR98HFWUyvFc
         vi1XgGobjP5O3MvQaFNnHkv2ya5hGN2APGki8njsP2q++MfkPQ4dbDBVEcn42YNAGS0v
         e3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXMdDwB8vWByR+CM08DjJwHTIHXrvxyYyeXtlTxMj9V1EtY1FHlM4XfoXUdsFLtTKwOBdKLJ1ecoTGERwkucYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Sql/LvCeojCSvANjR7zzwSUwzIrnHu4K1engWF1ZpNthYPKn
	75k7AbOZolwbtdrjJsv+KHLXUfKw+b//2fhyXofYSIKnB+mYHRbUiyGWAwQ6yeUaTjbCsH9Ccxz
	581nNog5+48rxHrnqN2ND0g==
X-Received: from dlbut9.prod.google.com ([2002:a05:7022:7e09:b0:12c:144d:22ea])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:e1d:b0:128:d174:6382 with SMTP id a92af1059eb24-12bfb6fb412mr13842176c88.9.1775703596123;
 Wed, 08 Apr 2026 19:59:56 -0700 (PDT)
Date: Thu, 09 Apr 2026 02:59:31 +0000
In-Reply-To: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775703578; l=3270;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=ysjEMdXBV3p9t7KlXpwCVPcXO8bpDjU9ioNzjR4UBLc=; b=8b5XvO2riWg5eDoj8Wry6KQdNueRE980pAV+tGdmQalXwaP515Cz4RXSnyejeNPRie1s5UjFw
 6/SzuEHEsEOCx47llRUX2wvqSH79waq2/ElMmEAHxxHCRmolh3pDOCq
X-Mailer: b4 0.14.3
Message-ID: <20260409-teaming-driver-internal-v7-9-f47e7589685d@google.com>
Subject: [PATCH net-next v7 09/10] net: team: Add new tx_enabled team port option
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Marc Harvey <marcharvey@google.com>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="utf-8"

This option allows independent control over tx enablement without
affecting rx enablement. Like the rx_enabled option, this also
implicitly affects the enabled option.

If this option is not used, then the enabled option will continue to
behave as it did before.

Tested in a follow-up patch with a new selftest.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Marc Harvey <marcharvey@google.com>
---
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
2.53.0.1213.gd9a14994de-goog

