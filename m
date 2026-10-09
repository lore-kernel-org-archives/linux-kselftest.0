Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290B424D46
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525999; cv=none; b=Qlg0t+k6wlayeVib9ft5SWD58KtWOI1KRZsTfiJkkgh56rIReqHQGi+Caj9+X43HOI+R57/awD0J12Paef8I2ldY88YbhQwdx1KXk/+hz1jZ3lVFqNJmzepqZGYic5c14L5yIeOPic99f365qg0Oract9zp4HwFxJzEzEoUZ7HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525999; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cqkT9K19YrXaCRRQuMJog/MvP/evRGW3ACyG8YB8MZI8t/QxfCN9WqxGKPfmTUHONHz25tRmoLs04mD/2iuUgC9234H7i5N8LZtD556naxP/T9ddQINmSPcvsmp+a882i7l2ydHVuca17EV959JGNilRJWfmxjFtk38hzWDxsds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4MX8mbC; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4MX8mbC"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so5906641eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525996; x=1792130796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=D4MX8mbC497vZEToxnEYBOpmZodZBfPnn9155EiMp+HLkzHkzg8BBdBrbFfM4z8Hmy
         QX+GU9JXQVDYTupdzxtyVp5BasbGUdppet9alRHAzTMNJIzpGaW4cdTO33KJxk1sqFxe
         1vccgtRQtUoUW7MwgXntBP4YszFCKi/bxO3puxQZh02/XpeVR409SI8cIvm19oRSnKP6
         Ws8M3hJBaPqPwI12h2pIKnAC8d31Ut5/ncyc4xQbfxX4jBwVQKfVsLDv007jNYlzzOdO
         6UDhxdFmEbuDr4kg1GwOlPgmlwmZIlXO0QCS+oBe8j73Dd1W06K/19HX3ij7pgtWM2de
         ysIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525996; x=1792130796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=jK0kvJHuLYm1Tmr9raXVtbWq2Z5ApkR5tQO9qfeSw+0vL3pPaZ6lrBRBNeab0dXdfq
         fkINgNLwbKEN1sKMH8sA9eBQZd5SxQpbEIsR24oSGkpo1llIO+DpfklMWOluojLsOmBu
         yXv5UZEo2IyUla8J3xnY9mp4yIC2+Kna8sT63p53PLt7s4H3GT/HtlAiU6zKh9wQ3Mf2
         UewsJxMy7FBi39bA0e/NJJZI/YTfyDD/bDxJRtFyTrPAGyX5nNti6nHPZ4yRI+G5sPcW
         tPcAWkzUeKqUIVNSR+zD9cuQ8dFbmMdM+wNEiPrCNcQfBJX57gv+usPKOJh4dSH/ixxa
         JUyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV+8IApbSsrP9Aj1Sb9GWVaeC+SzSB4+bCGhMsexf5JOlQsuLVM1igs7gB9hFxHk6xo4Lf40/HTIqQHo/QzHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYILqXBPg40ygFAqgpm3HQX+wKfiMFUOGCr3LQWy6WuXkG8dHaSy
	30SVaVgjDgHUuxFSifYi/bOa9l4r85kITRzB5mgiBZ/cHqNhix1kN6Ky
X-Gm-Gg: AYBFou37L8bHAuppexriXKAXsNKNKVqz4IX0697tFN2LV7xO7iUDweiz9N6vsx8IGaF
	M9Ror7RLuKdMbdOAIZIJn0lvhniGk7cDZBdFphEy77tmPMEcduLB9+RMeYvLtYR8eDtA3sazNYG
	rbB2rbSIVTUzUKXknUGQY2nWyO0In5VGE+UH207YLopUb58oLeJ2mDcQfVogAWYedwehzIkf+QI
	e44P/jXAM8+XG8F+hYf/+H6BdTVzE2M7oQ/D9jPCrBjUqV8ZgPLAFdJ/JjgQixZAKVd1muWISKD
	kKDf9fY2Ubsg4j78bKgY2IkEd1BUtnBS1HBjbI3I10m/dSFkadoD8l96xS9FznTonyhhsuZoVQy
	kLP00UC0uTf3hLawxXa3M2g8kCslxO++ymL/wW4UXL1fiP9P+8NsW3Y0werqo7V21OLGcu6xxzL
	KSMqlgMl/o0cK5CLTI6leTALJYkEGu1yrjpFrqCrHFsM0Q0yUjexBXz5yR4GuLUS/on3+p0tdaH
	r9nn5m503jpk/JunDW//RqXdryRwWyyZhb0ov5/tk2CeP8z4R5ve3ItRuEdl8AkQVl1J+8pABnR
	va59TiGSN/i/aY9laiEOb8kcfj7vLokjcV66Fp8YULI=
X-Received: by 2002:a05:693c:4090:b0:351:1230:e379 with SMTP id 5a478bee46e88-3537df59719mr1717655eec.6.1791525996087;
        Thu, 08 Oct 2026 23:06:36 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm4185544eec.31.2026.10.08.23.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:06:35 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Fri,  9 Oct 2026 06:06:13 +0000
Message-Id: <20261009060615.4177402-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
References: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gtp_genl_fill_info() stamps the reply with the command its callers pass
in. gtp_genl_get_pdp() and gtp_genl_dump_pdp() pass nlmsg_type, which in
a genl message is the dynamically assigned family id rather than a
GTP_CMD_* value, so replies to a PDP context get or dump carry a
meaningless command number.

libgtpnl ignores the command and is unaffected, but parsers that check
it (for example the ynl tooling) treat the reply as an unknown command
and discard it. Pass GTP_CMD_GETPDP, as gtp_tunnel_notify() already
passes a real command on the notification path. No uapi change.

Fixes: 459aa660eb1d ("gtp: add initial driver for datapath of GPRS Tunneling Protocol (GTP-U)")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 drivers/net/gtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 4aff23bcfdd1..99836b773e5c 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -2279,7 +2279,7 @@ static int gtp_genl_get_pdp(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	err = gtp_genl_fill_info(skb2, NETLINK_CB(skb).portid, info->snd_seq,
-				 0, info->nlhdr->nlmsg_type, pctx);
+				 0, GTP_CMD_GETPDP, pctx);
 	if (err < 0)
 		goto err_unlock_free;
 
@@ -2326,7 +2326,7 @@ static int gtp_genl_dump_pdp(struct sk_buff *skb,
 					    NETLINK_CB(cb->skb).portid,
 					    cb->nlh->nlmsg_seq,
 					    NLM_F_MULTI,
-					    cb->nlh->nlmsg_type, pctx)) {
+					    GTP_CMD_GETPDP, pctx)) {
 					cb->args[0] = i;
 					cb->args[1] = j;
 					cb->args[2] = (unsigned long)gtp;
-- 
2.25.1

