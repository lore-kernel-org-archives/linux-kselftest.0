Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124428C84A
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935301; cv=none; b=NxGyMA9kQ4mnMyu0gTauNyCUm2oJp2rvNfMKR1eq9Y0P/huK4+uEKIJkt2JL14jh0KrmqlU8fR2r9HoeWNSyknVCGNGmHe/c7VhP+T6Ej6Ed5QI2AMmXu8YJkOV8XHo+ykNQUZIBZOQhzicr7iRV3GAewhYF5RL5GeMD/0msa0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935301; c=relaxed/simple;
	bh=HWY6RyNiDvHQLuF3ImSLICWRLWpkafCxRt+OD3tVgyk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TkczIql1obnh11YgocvhZ/BuO8gEQ/X4MdlSVhjKY3EJDbZmyE2rKyQPLuzboNAZF0/qrA+BFijcbb9ejuu9eEjbo+ThjIseDsn+HpXX0TpC3wCFfrsj66ndn3MkaLslrBq/pDE5sNApj+LA3nQ5ju/hB2dm1UEmn+7HPrTFqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qfafoTx6; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qfafoTx6"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c0ba59a830so6498940eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774935297; x=1775540097; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tl2OATA8Qg3HWeAwYs7IcUb/e5eYAIR3FP8Q3rgg4s=;
        b=qfafoTx6M19EY3p+iZEIG+aBXN6h3ynGoyYPoS+vPmmk+Y7J80OhvOkMO5ltsETBQz
         P0xdJQqXSI/3u8BSUKO6Hpj2DFKl7UCsqaSu1oUB8E5scEWxktEhP6oNAlrQ7l3Bx8W0
         ifBC0atNhDrz897Z7+qJrrEMJOsYMvaqEGZ8vAvuv6Mii0Ud+o9hChJRn0XJdbe8lRgl
         kK0zDqu2yidTNFd5I6TtTCD0XKIxwuEgku0b+BuJ3vbbIa86V28aUCDoav3b+2btblE3
         0zR795ytpXg0Y/IodgLlFISORcni8Ko98MnglPwCPSQJ3OPa/MlPAu9xSpiub2jRjtRb
         xusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935297; x=1775540097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tl2OATA8Qg3HWeAwYs7IcUb/e5eYAIR3FP8Q3rgg4s=;
        b=AmGSw2f5COMr+lJjRuyU8jsuwcUAHrrTZiUXMGM6SPrmfmzr3mqzzKqmqLcRm9vfsu
         VPf2sXGi2eEmniTWNWro3ldEIQ1iaqeGzI6cJSW5j/1GFTu4SVu6FbDLjUx12rtFC4et
         ueDC79R1avG/2pRJ9Z6lpSo876XN+0cT3Yf0b87zkpcH1givkOoT4BK6NJ3/RjgOb15S
         gMuyawz45v2NLb/uTdftYwtjFx45zqR2ANgO9x77Se00Bulw5iTtSbqA/s9IZdNe6vEH
         Al7DLHcUD9lqzOn6zfaVpbPVegOiDMxHEZNbgr/wV7l9I88q0YXpbGbJ3la5wmG2zCh8
         pcXA==
X-Forwarded-Encrypted: i=1; AJvYcCWmV6TqTJc/H3At3vpEoenJ73BAmtw4eGXlDWrgTPvd0F45RR3CEJ7xbqtgVkfl4HCQxkZjhUU0LKC5c0Wkg20=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWm0YJbktlmDiRGqslm7FE4yRcEmziMRx3ihRCuiGNeTRnqpt
	B5gWUSdCca8vYuk29fFhB+CgWcA9RfbWkShTUG6iUXVGWIGg+MrLTqoELeGzeuBk6O0XNlCCghD
	8w33JupCvgVZ4guoZqJe9yg==
X-Received: from dycpp5.prod.google.com ([2002:a05:7301:dd85:b0:2c6:7749:1784])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:2a2f:b0:2c5:d833:a4fe with SMTP id 5a478bee46e88-2c5d833c6a4mr3715418eec.10.1774935297306;
 Mon, 30 Mar 2026 22:34:57 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:33:48 +0000
In-Reply-To: <20260331053353.2504254-1-marcharvey@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331053353.2504254-1-marcharvey@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331053353.2504254-3-marcharvey@google.com>
Subject: [PATCH net-next 2/7] net: team: Remove unused team_mode_op, port_enabled
From: Marc Harvey <marcharvey@google.com>
To: jiri@resnulli.us, andrew+netdev@lunn.ch
Cc: willemb@google.com, maheshb@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="UTF-8"

This team_mode_op wasn't used by any of the team modes, so remove it.

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
2.53.0.1018.g2bb0e51243-goog

