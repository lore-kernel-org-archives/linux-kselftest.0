Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD14329C7F
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444695; cv=none; b=I2w6GaONl3HqxsXy8YiL0EmE+zyuYFqhKXomnTxTXbthyB9Eh6RQWlsvlakDlmEDkJRbB+2w3DVts0fTNIvj8fzDZEcJZ8Uyp6TNoMSUgHFS7Y12+RZYqcBi9ruZwFmtkfWCZlaTaCNOzlAdSDgWPliC88UitNuqPIhJnVz+1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444695; c=relaxed/simple;
	bh=dDEsjk6lTezLXsoeUbs9k8ZxA3nYUDwshHj9esC4o5k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U5GAPeo6ikC1SGMpk4OV98PLlbefvOrT+3BzVD/Lzb2pP56mRWrUuDQmHKUTXQ023j7BvYUH7Xp1u2F4j4uHKdMkwEAgpexQg/MCsZ23oKVGlDgEuT0mlviA7oI3Y8O4oIQ3MlJ9JARbxCmsQ1OrXAAIlTi65nehTZa/DLhp5PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KvIBkvrK; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KvIBkvrK"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12bf9974587so14777098c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775444692; x=1776049492; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3pDnUicyot0V41/RigwjoadTUASPAO7D8CjiFKP3m/g=;
        b=KvIBkvrKTQyokCEmr56h53+LAvhO7EFoIPskqdf+ZPYEA6I7lAOatr6TCf1FHyhsmx
         CnfuISs8OmoBGe+iG7+cvFJjAqUlOdDcPDcBy3IgXO1DYiq9EB02RKOIoPp6xNzI6YX/
         mSo3YGo++QLU6VK+zKrSstgd6iLXsUWQfhImr/r3gLZAIHKdTNdhiFw6H/WeP/IyDHt/
         jRv8q4TQyd8d2UrLxk5+u63tjS7fH52/8qlb/sVE2mCTZiFqFrNhMEbFp4xyV+RLPVN7
         Csclv7O+QqKtvoowMa4uc2StDjFomTW3/VOUVYKluTXPEe2jJI68jsn1RjJC62P0BAdU
         80hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444692; x=1776049492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pDnUicyot0V41/RigwjoadTUASPAO7D8CjiFKP3m/g=;
        b=RMj6yNpISkSh6DvOBu4NN+EHV6bEMTmaJHRp+1jLqioa+ArXp6eUIhpADbC23PZ3OG
         cWDJsTffo5axj2WlvWgvgSvrh28Bs8DPK1/FItjdHPJdh4acYEsL1Y4w2VgVcR7vLzHF
         pAWRPsynKaeIe/xzsopZ/bEW/R1Sfj6eaMUsPnTwgqvkx2qZQz9v7kAVyGZDNpsAXKb3
         ps49j93lrq6FRghSmOxNErM9Aq00Qiry3cuBjirXgunTw2SloK83dkdP+2+u5JRjIhPi
         WhzCU2SIENKSD1uTD7oA+/nylWqfRPnQVzU0qvfmxqf6k+4RIJchK+F6i1KsjSWLLNRg
         NjCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2QmA/lJNj640ZsNWiyjWQILo2NNltKR/CLlHvlog7D+ARrwvUf3KYOIRK/Bguk9v9az5I1IzSTa9F5cti5tI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3We3Yb6nam924zck43aO7uoxgMRdERTGpHY5rJKAADx1289/t
	eWS+EKcQPk16ZV/zVE+6VIwHL/T7Rlk5yObb//UFKfazr270EFfZK3iYC5fZ1wT1woXJ73QRa4M
	ZdXg4CEB79sCL0xc/LU1vxw==
X-Received: from dlbrl19.prod.google.com ([2002:a05:7022:f513:b0:12a:c3aa:1a1e])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ec14:b0:128:bae0:e03c with SMTP id a92af1059eb24-12bfb765c2emr5877606c88.30.1775444692085;
 Sun, 05 Apr 2026 20:04:52 -0700 (PDT)
Date: Mon, 06 Apr 2026 03:03:38 +0000
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775444686; l=1487;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=dDEsjk6lTezLXsoeUbs9k8ZxA3nYUDwshHj9esC4o5k=; b=+vEU6Ba3XhmzULJa0Fkia7jJUI2tfFYs2cBvO+aA2ci9u60lkgE8aUNl8IiZ1mwAsf8l4WkWA
 0hG6WAKgNUEAmJBIYy4YBNd61LW2J2gXcOQcYYnW+me3tJQa8XCZ5JQ
X-Mailer: b4 0.14.3
Message-ID: <20260406-teaming-driver-internal-v5-2-e8a3f348a1c5@google.com>
Subject: [PATCH net-next v5 02/10] net: team: Remove unused team_mode_op, port_enabled
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
Changes in v5:
- None

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

