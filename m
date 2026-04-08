Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3E36A004
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 02:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616754; cv=none; b=h0PCMvqs9zMu9j1oS3x5GehfN8pr2Z0Z5vFZ1UeFFl05MLai5WMT/ZUIjXaV9Xrim6LocuI9Jl/AMU4exuCttdRU9YIfBCrEPejavFXGzEQEgesSKv8VV4DrsdjNix0IgKKPy9Lrru2Cnddv0tEM/bY+nmyoWqbEsmOqJv+IEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616754; c=relaxed/simple;
	bh=ABDDARZ3LBRa/K2R4lTmrc2M2fscQVtdq2vQFlp7tVs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i/qqNpuHR7AnkXKTyaSVoneEU1Kzi5ItRZkmmDv2+R56pYAtcDtQGCJbsjjzj9hSBAHNJ5OcM1absf1nieKSScvLm3kWYnJBsni38uEfqEcXY7+nFHWGJ/qo415Xrm0wsuMgOLHA7vZElLyJ6IQ1gFwf6JQKpK0G8vlL8HpDdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNGo464d; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RNGo464d"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2d054421d19so11340175eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 19:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775616752; x=1776221552; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItnT3gTeM/wZiruuzHdFs4ZevuvK/cu62n/SK5ptp+Q=;
        b=RNGo464dwhE9MNdS9B8R5Fas3/YW0m6G6Pm2fQsC//Kf3jQX3gbuVzngG5uhuRP4v8
         H11N0T/HdKUN6e8oB/kEj9B1rJwW75UOIbj2XCvzhfmzCQw/Y6izhcXLjibXyurD0FiJ
         RGUw9Bd07YA/vuXQ+ku8y+It3iYchTJMlOes4Ia2cuPlHoBB+sIafemDTL4JqtJK4B9v
         DMVxjWsbvixGvEzZsTwsOmhuPbPu7xKptbtTHQR8taEy4F+2GSMW7KHOdNCrZfirYYFR
         4EScjjX0qeKtT5/BCBTJC89VpS1zcedoj4wcQ7/qTxT8efIvEnEEVIgPcXPlXLAucqLy
         Speg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775616752; x=1776221552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItnT3gTeM/wZiruuzHdFs4ZevuvK/cu62n/SK5ptp+Q=;
        b=sMnHh0ZSFp0maWK74j7NtfmNTZBXgMAhbyXxAI9BDyMR3bk9JsnYRoJKUXkLwIhtu8
         bPIjPiABMcu+0or7jDnXv+vkBOxIC65+nJBBZpuvyIm56m6QYGB8zTUZ76tHBfDyP7LX
         weuLqLHWDYPWF+Q/4HW03COYqfaUFIvjWHqTNQZYn+Qq1NIqv7R8AqqOyxv/2vbvKYHs
         8trfAF7jlh37EVVBblUlVN4ikObIbDPv0TElQcWXuCOKTj5/U1sUFbYlunq+Pr7r8sLK
         bl9CrF/xb1VEye6vVlFlTmQwAIfugMwbX4SmUHEEPv1Ut2PJeCtL8pNG1VW9rT4uyyDB
         oxxA==
X-Forwarded-Encrypted: i=1; AJvYcCWoosxirtKd2QVX8pvUHVOhH2CTZ25i5Y/a9Gxyk58mhFIQ7UtseWWK8i5idS8YLsELLpb4yfCQ5olqZeLSb8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Nn01mFZeTb3hHUwVpZCCr2AYBdh6P/2DbA9befhA2eFzk/2w
	FIiXuOiPi16lqdiSVIktTJNGXEvef2QhqAZKnJxK+Hx3FOz9odrecEZGUuIHX/lhOqqmL6JA3AI
	OTGVGYBonuC8hhhTyQxaGnQ==
X-Received: from dybma11.prod.google.com ([2002:a05:7301:168b:b0:2cc:9049:2bf6])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3c9b:b0:2d3:d3f:2429 with SMTP id 5a478bee46e88-2d30d3f2ce0mr394310eec.0.1775616752127;
 Tue, 07 Apr 2026 19:52:32 -0700 (PDT)
Date: Wed, 08 Apr 2026 02:52:21 +0000
In-Reply-To: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775616747; l=1423;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=ABDDARZ3LBRa/K2R4lTmrc2M2fscQVtdq2vQFlp7tVs=; b=r8cB68lfooR/1QW4AS+aBeHw0DbnRNjdO87i6cEXF/Acqd5qIrPf4eNSGhRzdGV/Z/oo96MIo
 yIGXIDlBRm6C+KwLRmMIBbs9OW0KXroMNL8Rxs6JMfMBHs1L3lun8yT
X-Mailer: b4 0.14.3
Message-ID: <20260408-teaming-driver-internal-v6-2-e5bcdcf72504@google.com>
Subject: [PATCH net-next v6 02/10] net: team: Remove unused team_mode_op, port_enabled
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>, 
	Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="utf-8"

This team_mode_op wasn't used by any of the team modes, so remove it.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Marc Harvey <marcharvey@google.com>
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
2.53.0.1213.gd9a14994de-goog

