Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226CA3624D3
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616765; cv=none; b=JnslYWRk2NBXOEV+qULgWkG7WcL85cXhUPHf1DoS8cti4K1BW0dUzQ2NL5gMNa5juV41jYs4y91frkfEvFmX8FeuEXSEKlU1A0wXLVVJ7q+kbEDVNowfHVvLBy5S3koemv94Q/k1kUA+NNTzGCMwT5lp+kLJTBLl3fn9uoiWmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616765; c=relaxed/simple;
	bh=dBMLccK+J+0/DzFeaxJbXeK8uOY7wkjClTEHtsz1Xv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r4IS0kNodtlRE0FgF8CqP/ndYDuq73PZjIZf/8NRgHzGcdr8lo/L7O06SMpiTxldCrPzzbG98SB+3vK8j4movHK5Rjtz9ZvbgpgiyuXcFBCJQFJ9EUEkDR0Ms921kb8urbvORDzwbD8kNmisjEM60kxsWe3WSlRMerL7bORHMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uw/qXNOj; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uw/qXNOj"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so34275515eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 19:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775616762; x=1776221562; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5z3QxMvishe4U8CjYjl/4RpCskWtOirL2kQpSgWFR0=;
        b=uw/qXNOjyBAKdVcGb+sPnrr6bK1ZtZ+Igtp8ZXpJNJbBxFFvOucLPFILuQd2WpA2JE
         jKC3KGhQ1cKMj646dlJ0bY59vMKdyI7Cv+mA8ol+P/W6dg7qRVCRPhqFE8jKLPlN3TjF
         Pn4YWq7pi/iVxKBNUr6klWMVRCpEvT1t3HnB/euhQHYoIqmwS6DSrAOAXlUvzWWCEQcl
         YNcVxuaUcSSoltilObN6uH1A/4QpJO8bq74KlNXJ03BOfe99NndvClvmHtk9ObIGM5uB
         pOBwM2f2oqM98R2W6Ug+lAokh6gxoi5F0AUuVM/xlxIi8HjndedIYUBA78+fbB9SIeNV
         Bm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775616762; x=1776221562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5z3QxMvishe4U8CjYjl/4RpCskWtOirL2kQpSgWFR0=;
        b=CpAleMJlVrQOqUSMTpyJj/+ljh0UH4/setQAUIrAgxF7P4CyXnE1HOSm4vTWJFap28
         YyB1B+6ETkwmjy+F0hObHtiL5UxjaPWV3wS1mxyrEoSJNXXbptYXJILbKhgMu9Xpxn1e
         F82HeZJzeQzBWhsEHXIoHhIEcYCHr8U3jPIXh+94pHhqbq0jwEMG+ZupNLmwTwPD8YiR
         lymaRj4/r2geYjjvKWwYnJYfrgjAk8PzZFXfViM6jgGuZH5iwRivaQR4S3qioWtmaAV5
         sUzFDz+Occ0J7CbfHEygf7KxxScL8se7IJG8JDix9S9Dz08a7LjMB5ZFE9SQz969M9Td
         vpdg==
X-Forwarded-Encrypted: i=1; AJvYcCX4j+xl2LQ7WN/5/Cw12aV2bwo6t0hSxZ+hY9phx443MUPRxDcmp4M7vYa7M5wuIPnf01ok/SP0YmaxnN/jHtg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl27gjHLK95tjMKGZv9qU32hD43CkNofnwxEOaM1UOB6++QdrG
	YAovyuh4SojpnsaRgyCABvVXxGtL5MQlmNGxfFbpzZn9f1Aql6XRvKhaIRlWXKKUfEDwoBbqSeK
	f+Mx7uqjqIFrs1QgxOe6BRw==
X-Received: from dybmi2.prod.google.com ([2002:a05:7301:f82:b0:2cb:90d4:7906])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:5793:b0:2b0:571a:28a5 with SMTP id 5a478bee46e88-2cbfba8dc09mr10999585eec.18.1775616762001;
 Tue, 07 Apr 2026 19:52:42 -0700 (PDT)
Date: Wed, 08 Apr 2026 02:52:27 +0000
In-Reply-To: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775616747; l=2926;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=dBMLccK+J+0/DzFeaxJbXeK8uOY7wkjClTEHtsz1Xv4=; b=f31grsLfcHIFyaF/YLTciGxq8Kxc5MxTHNUJxKdaCfV6HH/fpD2ElJTVw7GNveoy7tCPAvzB1
 QYDxEHQLJUaAjECyq4iILSPjSV4W5amz8sauDx/lkX5ZUP6hFvhjYEC
X-Mailer: b4 0.14.3
Message-ID: <20260408-teaming-driver-internal-v6-8-e5bcdcf72504@google.com>
Subject: [PATCH net-next v6 08/10] net: team: Add new rx_enabled team port option
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>, 
	Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="utf-8"

Allow independent control over rx enablement via the rx_enabled option
without affecting tx enablement. This affects the normal enabled
option since a port is only considered enabled if both tx and rx are
enabled.

If this option is not used, then the enabled option will continue to
behave exactly as it did before.

Tested in a follow-up patch with a new selftest.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
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
index e437099a5a17..67f77de4cf10 100644
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
@@ -1487,6 +1509,26 @@ static int team_port_en_option_set(struct team *team,
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
@@ -1608,6 +1650,13 @@ static const struct team_option team_options[] = {
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
2.53.0.1213.gd9a14994de-goog

