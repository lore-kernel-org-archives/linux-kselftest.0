Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA53955CD
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773294; cv=none; b=fJp+4gPxOVf86wErRdubviUBQ7k30az4MlgmMWeo4ULbDqeC26WgxFVNBBdY5N5GJFU4O5Kk3tbRWwRF+awidXJpv54OtdoGsEORZvR/uFvV6Z4oLicuiwxrQ0KbSRlW9Qw1iXxuG6P7lMoIw1h3J92Y8CrRuINIJjk9MTQsQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773294; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VpsxXa/JSBewdClj5Tb+N39u/EscxeMegUsMUVyHu7hTbHZKsc7J1OGz+TCi0zdVxWvKrcwoapVm6p+fyZ53BmGTDQO3WIbjD4vw1S1QC/neoQd7Z21ccp6bVYjyGlez17cGgCfrfW41/VSXyTWL8EJ2pSORv5Tu5yTSTNDZ6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOqWgA/o; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOqWgA/o"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1773000eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773293; x=1792378093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=gOqWgA/o7HnfLsPx1JPq52guD/SalD/nNjTYb0LpVx3DgMdynBcXcJbPpJd/GIVVO2
         SxrxMvblhHHp/9YVfz7Mwlltf1jUFw1jmnkpjUfrCcXxyP/0b4MLxeHTQPE8tJpqD7nG
         aVwlEqB5IWoyor1vLEbP2GYPvshUmfKPy0txQeQqT61SmrvDHc6linP8DI0DZ8cQ6CSd
         xLk91JyQ4QioHAp8b0eqsDFHK6bc+opnTfkszaTjph0WMClf6SDTWq3UT01Psf+H564O
         D0sU6/vrnKjSKhx0hckhMjcbCkjUGOJSWJLdkY7m/wNFsP1CCQWaqLlzm/KhHA2suEiD
         3Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773293; x=1792378093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=A+vEiWWaPJp31K4mM93H/dNiKm6lOjj5pm++7rQYXp0Xgq1KuI3XJvv6CdequYZ3dG
         dV+xRqxiS6Ai6Dv+6uDyh6Cx7ej1PQLEhVq4m/2u7yGK97SFdc4Ct2L7vz9VcvV/5MND
         9LyEZtdGPQMjRGqm+NodfLVR+NlVbvPkMyesq7XWPLUIHQanhKrly+1EZnTz646X/UXY
         XW0E1l1TaNG3zr9VWh0xaxhaqKYvCFZbMFVe///4TgWQKb4VXbhvm1AlQarqwj/bZRdX
         d5Y4LA81IMR76I1sHBmM+HUVrBLB/zvXuTwYHvEOOvQZ1yG7iQEnAYs7sfqhD36FpWFh
         6JPA==
X-Forwarded-Encrypted: i=1; AKwUvBzPB2ni323qzk5zh/sWqFn21TSlAaVWj4BXfphwdu9/3aDlOJJhNFd4aRGzAnscEYyW79XS5Xk6PkJkIJHs8oE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ3FLdWpLFPvLQgaZoygRbKGHk83po0oPPY9C9VBMpCkjlmgdD
	2DznlwghfgGaAZBvJzlQOQ9c7oUjGb9Y0FEirVXQdd7NFz90ouvEUTdX
X-Gm-Gg: AYBFou0+fyi4CHvBnl83i6XXzljnCWmWzKjnvrco1gA3Q95mbt1lSOEcYJ7ScE7kld0
	uGZoAwv4mSHR9I5YsQxQoTdOOKu7zDPQulTmiWncS8pfgONFzYqh29Bs4jQuLgYxZsvOd6Tb+DZ
	fYwD/4IVPNSXLDdbTpyP62/PD7SURqHtQhYuzthB+FbcyEjySXGKLfxCxyn/1mN6RUeRHgQfeJy
	osplbC1/DfRhYZjh37kjXJGko+wFgqp7qa2pcSoFsJ/+tZPwYuS00QalO4jExFMWEkE3Gyn88UB
	wr1oqZTEXO5zIJffeTdIGo7VnhzHmadudddrvNSZMsxzrBEyOdzVtmpoU+JKUQ57/JVKe748W8f
	wLFAVJGKaHluyn6A1MkGSEa6Btmai1FYkRlHxBrGDpET9/GXu6OOlTu7IgAFCqEVSXJ3vYYVpt4
	16ml4dZgw84lqZ94KZH4kXHdfgL81ZeJgNIT3LUHJWC9+pQsT1pKAjvj1jWKvalrSLKDmdkyi2X
	dnIS3h2P2fx4tJYyqv6xOCXH3eA6Qajqj4p8RHVvIjUqVLOW5QvTtryWCd8COkdRzf5pPByUIsQ
	CPVqKWIksn6AX/UOvvuRU+dC/w66nUUDBafEJfAU8Wo=
X-Received: by 2002:a05:7300:7aa2:b0:351:a9b1:73c with SMTP id 5a478bee46e88-3537deccaffmr11904799eec.2.1791773292401;
        Sun, 11 Oct 2026 19:48:12 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm26075299eec.6.2026.10.11.19.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 19:48:12 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v5 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Mon, 12 Oct 2026 02:47:58 +0000
Message-Id: <20261012024800.400616-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
References: <20261012024800.400616-1-anilkaushikwireless@gmail.com>
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

