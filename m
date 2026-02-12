Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D28199FBA
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770858113; cv=none; b=bMKLsIqNSF2cCQCLwpJI5Rl+XtdKMdoNyzS5x527FNQAghlfYJP6gdBllJSH7UCE2y5ci1sUuyDGf+7XGHsccwTPUEDQxOdEGhWkjY+wB2d5BYYA8NdOitNoVtLqDTiXafZ29WLEX9QmM84LGcouMUAXCWD1GVvHY3rU99+ot1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770858113; c=relaxed/simple;
	bh=zktDEYYU3DDBRPUPo4PVQU/HdJL8/6FwLa6TYkRnm1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XcAhyKxBpG4g7NI7rSK2S0oR7TcTcl0w72tu74xoaMtZnkB8PLr1b5BCUF4LJMVRNd7s1thp0vPG5wBP9rmzDpLkc+EJB9+KLoXzsU40KzjG/RJPqhElzlh2EhHDPuPaSsoKKWWH96b0Nd9Sbluhb5aAp6nO2niuSZqcd6CK+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH2OgMbu; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH2OgMbu"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7962119ff2bso62317067b3.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770858111; x=1771462911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeC44Eh/w10HWx6k5aqFmc4ViuCuD52xfeamBzvXwS4=;
        b=XH2OgMbujxDgCk98940EQ07oa9zNBVng00frwNtKeCOraNUCUBtL73i20O036f2/Fn
         hK7p7jWU6OnfkEVj4VfryhyaprlBjWFzZMr4fLzA68fNaaSJoKvVKuFsLQcmcmVk4fCM
         qqKhYeyvDmk9CBfp4jO2irJYwT3XmUZkp0j1jGASA3/a4v4rOW6vXxzFJoqR0Bm6LkY2
         hvgk8UcQTwZQ3puvVgMINmju9SWCoQBorUWQrnsNy67DId5WrfI3fEXNqlqlXvQDfnea
         KN02R9IcEPfFJYY3zvhRYuPD1cGex96fmQI4QEXxtKsea5g3tBTqY9nIa0Fd6C+PWrTs
         I0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770858111; x=1771462911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YeC44Eh/w10HWx6k5aqFmc4ViuCuD52xfeamBzvXwS4=;
        b=aN4/qqhCb9iBneNerPeVDp2+b24MOuznVXFVd7XxgV4HlVjLukiXO169DApBUajV/P
         F3msRe+8H5Vzjh2j5hcdxuiHXpZZ03l9+/Neigc1jHg34LzAWE0nfUX8HUtdbIYDMcbl
         8MZrDmJKn4Y317T+hyKGetRelkRolCeDjBiBjNkihi0jKfqMf8WgnqhWSoTIlPJT0w0s
         XG8QrslLRAH1YQReGQsxMQCXCPUsC48yffXMxxvQxPHUtjt7o0xvtwiBnq7ZAxl2nHRF
         eDkP6H8RTAtrY6PbhdDDiEOQHJd/ywSv2QUf9uf5yYkviXyeLOUICXfkn0+Zui81cSGc
         L7yw==
X-Forwarded-Encrypted: i=1; AJvYcCWLeiXxiQF57UhFJpmeJKeycTxONq9ZPFHTCP9tQQk0e3SdVaofOXAYPBXLAs5hhPuOhpN0qN9xgLmEGf1ktxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO4b7K5ZMZiWpbcMvszhnqwKyiMU+q1UFBq1JoNkwffoeLSIiW
	vcQMbuHBVoRBkrFXy+aVc1mX/5+wF9A0xM+mBtJklMUFJn2oMemS7VfE
X-Gm-Gg: AZuq6aKwSSlx200wO+aAsTwbUdLHAxU4Cjd+1bdKQ1HXROMQJleOByjL7yOfRaSrvX2
	idcZe5a+yLStX+1e/Aq5jbGJNUIipgxoI/Uj3Auca3u/nmOrH7y7E4+hnLmYEuDFfSIV3wQL7lq
	7npCTBtfCnDTGId8vRYBoJQeKt5zrC+9C9MxS665/PqU04EnwqNPdWhE3EkyZn9F8ZzU33GBOx8
	0SEpUdHnwO70oFmfk15xFz7bZKLOnJ91CgegHJpB0jC2nw6wi98eZkH0lswjWHAU23f8YWRjPKd
	z5pay+e/vY6bocP1nXZI9cjs2FNnBvf2LHFta+u4LfC5RbpTTkIfgi3GeYEK7Vgj1pfSt89i9G+
	poNKgqz9Tf0X+T4mAhCtdUQMun0zTpD4xsxQ7or4YQGAXqw3xRvCcS47EwWmhLc/9Y05xEcbNPy
	HW38t/kZjTBuovT3uMtyl+Wg==
X-Received: by 2002:a05:690c:a053:b0:788:247f:3648 with SMTP id 00721157ae682-7973768d21fmr11485697b3.66.1770858110863;
        Wed, 11 Feb 2026 17:01:50 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16f201sm32051927b3.10.2026.02.11.17.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:01:50 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 11 Feb 2026 17:00:43 -0800
Subject: [PATCH net 3/4] eth: fbnic: set DMA_HINT_L4 for all flows
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-fbnic-tcp-hds-fixes-v1-3-55d050e6f606@meta.com>
References: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
In-Reply-To: <20260211-fbnic-tcp-hds-fixes-v1-0-55d050e6f606@meta.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Mohsin Bashir <mohsin.bashr@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

fbnic always advertises ETHTOOL_TCP_DATA_SPLIT_ENABLED via ethtool
.get_ringparam. To enable proper splitting for all flow types, even for
IP/Ethernet flows, this patch sets DMA_HINT_L4 unconditionally for all
RSS and NFC flow steering rules. According to the spec, L4 falls back to
L3 if no valid L4 is found, and L3 falls back to L2 if no L3 is found.
This makes sure that the correct header boundary is used regardless of
traffic type. This is important for zero-copy use cases where we must
ensure that all ZC packets are split correctly.

Fixes: 2b30fc01a6c7 ("eth: fbnic: Add support for HDS configuration")
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c | 3 +++
 drivers/net/ethernet/meta/fbnic/fbnic_rpc.c     | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
index 693ebdf38705..5edc28ba2955 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
@@ -1142,6 +1142,9 @@ static int fbnic_set_cls_rule_ins(struct fbnic_net *fbn,
 		return -EINVAL;
 	}
 
+	dest |= FIELD_PREP(FBNIC_RPC_ACT_TBL0_DMA_HINT,
+			   FBNIC_RCD_HDR_AL_DMA_HINT_L4);
+
 	/* Write action table values */
 	act_tcam->dest = dest;
 	act_tcam->rss_en_mask = fbnic_flow_hash_2_rss_en_mask(fbn, hash_idx);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c b/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c
index 7f31e890031c..42a186db43ea 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_rpc.c
@@ -338,9 +338,8 @@ void fbnic_rss_reinit(struct fbnic_dev *fbd, struct fbnic_net *fbn)
 		else if (tstamp_mask & (1u << flow_type))
 			dest |= FBNIC_RPC_ACT_TBL0_TS_ENA;
 
-		if (act1_value[flow_type] & FBNIC_RPC_TCAM_ACT1_L4_VALID)
-			dest |= FIELD_PREP(FBNIC_RPC_ACT_TBL0_DMA_HINT,
-					   FBNIC_RCD_HDR_AL_DMA_HINT_L4);
+		dest |= FIELD_PREP(FBNIC_RPC_ACT_TBL0_DMA_HINT,
+				   FBNIC_RCD_HDR_AL_DMA_HINT_L4);
 
 		rss_en_mask = fbnic_flow_hash_2_rss_en_mask(fbn, flow_type);
 

-- 
2.47.3

