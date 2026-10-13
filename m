Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B0474266
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861015; cv=none; b=rNPEn0+4JpA/XbAmyPhNrd2AUt1sU020D8FWp/cirQs8gYlCIq1F3p7pIzVmt5wswPRKTQRUAnTLPZkZwXyRCtCaq9+iTj6RCRtmJ15mSfH3K/tMifllGmVKtQZV5Hzo8laV+itS85+tjLes1FBJh0t5hxM9hgCjaRdMKG2HaMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861015; c=relaxed/simple;
	bh=3OTy30U9zaA/EoJrB2LEVikw7T9erylLWW9kg7srSqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTOepXq/OP76ru3YrA/bZMf1hhPlnuwPZZ7ps5+O1VwFmAThnH/KOxObN4vrstomcIul7SA3IkmrHnNv8y/Rwq4VBzZnVFy5EWpfbMWDzKzIycdWPJe15urD9Np1oq+zPDbYMBwBpUPnTavukwmBH56L6dNinGsDEdHFHWVz0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CW9LDfkx; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CW9LDfkx"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1743862eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 20:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861013; x=1792465813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=CW9LDfkx5ST+t9PXJuJ6WeI66c5rw//HS97b7Oc9iAXK0jIOsoqUC+XSWLoUp2nQ45
         Dj7E+ZPDm69HHJumLbEQlIu+RgI978X0G2oAawC8x2TQKa2ZLS7G0jUzFgp+8QVeW51D
         9OaHl745qs0y6WaIaPcdg/pQg9L0TtGjC3eRSOAoFSuEbl+ixZt1K4DOvsaXkC/T9ZXK
         5lIQL4sBpaLCjCzPp5AOSzOqYiOQrePcF+KQbQkzBqEcFdwt1mo0qphEcPz+VD2pAypQ
         Uz20usOE2hqDLjtQmBV1gO12pq8rh1sx0kiXRTsjq/dtltvi463Dg4bwHlhwsbJiM+Np
         VdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861013; x=1792465813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV/uHpIyvSDg1rMqWOrJjW5nbbNl8aiS8yrcLtotir0=;
        b=GSgI/A38mCx8dROSRX4YsozCFOhSrjc0HljwhJb2QuUKw2rqBKGFxtwFuBPYz8HbkU
         I9kZwvCucaMk+1m8X1EB9/7EEdjdMGVSNNjSbTpKwef3kgse7T2CpB8vn7HXym/gXh4P
         sBtLMMzZj/ynrjKPLTcaN7eeUHdK5z6NG1woEzliAlg5Jf31Fwg9U9gEIOLljM2N7y82
         T3DQFhaCmKrWQSg/tlHQrOZVhuPc319gJQTTXQ80PdO1jOQynn5eq9OQRZPjcrY9am7+
         xl+fMnD6xjk0IV5stKJAuQ2soPn2l8gEud61fHqDSUDEgDMjaWFRNOhMUOJgSBWV8YVG
         3Slg==
X-Forwarded-Encrypted: i=1; AKwUvByoeZF5veB38XV3co6nPGuq7+BNe+6whz29f8ATSg9MOuEZRzKhq7gd2tZBGvFVO+wHFZw/rXagXycCG2O8YPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv9Ll2ECEe8aeVVidk7frSf9j/Y9P+Wx2mejCiRDzi/zIPAesr
	SxsQdeRLM3ssMiLeCtWFqler26Rg4hSTjhScT+fohOJLuY/TJx8HxTIg
X-Gm-Gg: AYBFou2HAX2/FVybNx6qJxe1frUOoSv8bc0vsqQaAgjJ8hOal9eWgo0uprY6+dDsZSN
	LrzUqORjgrlJNNDBb1PYDF40fLPjFPXFCFj3qMKxr9nNcpmRxUOG09l6oMQJQMr4Oz6RsVkxuoq
	IRO3AdM3b8ctOJchmFQTDg1IdFexxfOlmXO5ZGxp+V2UBhVZBTvSGxNXy7Yeum1/gah5H0oVUxy
	E9dISh1EfamdVqG5Xm5sjRMqGgfAwvwWBqBy/9sa1066OlWxep5lGvpTvL4WaItXfzHBCA4OSnD
	yp1m/gMKggQQclqHFOmD+rM4Mk3KiEr+4WmFXM8duyNVTT5aYxSAl+/4dTGyoDBJp2b8b+Vp8bB
	nwV/zPxvquj+v7lyCooeG/1Bq3DM7jMFrbQ/nufta/N4koRxPrwZwF2Uyc04sgscoUkE9xrH0VW
	7yq3QUnSe6/wm0qZO2zJ9giLwahs5TrdxFW0EcFWWisc75Q7+D8CDws0tHhZwHT4DGhi/Ibm6iX
	wl0Ha+D+wQwaZiP849kmzN1e3vd9PZ4rU0r8JR/Gd8gZlI8N70OqwIE7M/bO3Lq5hRh/bZhyKWO
	y+s9B1rGGDoQnPdKIZWlRBqciZ/S7eQ76IAppT1jPybARO/EwCGueg==
X-Received: by 2002:a05:7300:aca5:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3581f594a27mr17419754eec.24.1791861012821;
        Mon, 12 Oct 2026 20:10:12 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm41129053eec.27.2026.10.12.20.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:10:12 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/3] gtp: set a valid genl command in PDP context get and dump replies
Date: Tue, 13 Oct 2026 03:09:58 +0000
Message-Id: <20261013031000.528393-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
References: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
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

