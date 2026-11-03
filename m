Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749916;
	b=hUoAOa6ut826v3Zom1t8QoG/Vqqr5lrX/kiydzAOe51KhRrSxZODClLxGnpaTrxhTD4s
	 dqkmoxdYrVnf5Q1gA7UrSzqEKYpv/2kK+xWg4fkv+2qzezJN928NhUAGi0A7ar29+kT7f
	 gpWbn1keT78U++YnoIiXXoi7m6AzkGiYOjYKczfsmcPD3pjNQV4X1cqUsNGOsSIKIlprP
	 ZQJpDEP4uevej025LCskib7xdjCp4WUXhy+9b1p/sWE6ETk3JI3QDwXrSv2Vg9GNZUy94
	 yUfMk7vlVPxTsCPSsP32ZUm2E08tVTuESZWVFn6nR8f20iTe5tYWDdIZ+F+WEbNDPnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
	b=QuSHO5Xku7lG7m8jElICLfIyUREHcB9a3R+SzbkMcW7RAnwsX43cRAtXJFe2ONyRfLMo
	 hgxfqXRO3Ck/G4bfx2i2yE/8ZMdF5bwolaDn5HdAGk9lAM1WxdKw9wiAoXS/gUjxGLSV1
	 871mNCf8QwbrtvQQGIOOYKf/lHZuGDKXL3ZrQfWBfNbyVAKCoz8eLwp1k0mqLSWAmL8Pb
	 gh23Az6go4wSkrqM2M/8Yh31U8KfzzFNaBxu3w0jTfUEVF4VGzkuITmiytztQ/o8ZBOjg
	 Q/GMTrv71lXOiIHt/lIuNqaGJheRWiCrfQdnIFoZ20b9BEBX9pu9s3NH0wWgzTyH5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymIuamZd;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82654606A338
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82654606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymIuamZd
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so101784eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749916; x=1794354716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=ymIuamZduOqjQP+JlREaO486TG55zElM5UJP0I+Z7Srd38FOkvIVfnj0cQ19vFaX8T
         vbW1UjHBuM3xOXLeE0vqO7dMUwNoQ8T1pdUy7Su39nL+CjrnAoND3xnXyWjPBrEeQ6ay
         XiGoBmRKi65wZvpxF4WB6wv2tJd6RuAWTpXy+/uWGZzlqO6u4XSV96XvYBl6EdXOfIe3
         yB9H0TjCH0Johjhyr+V+LleBKot5OGITADugJg/+iJZAhZbI1DjgR9th6PXnL7tSCyfL
         ZFJzvNcbRauR4GYj3uHb6VOPD6t9MB2XJHyiK/vAtqMQX+NRxJT62oGDmHNQCG8zJGbt
         W/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749916; x=1794354716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=vLIstogRoj5nsh4JhbgjSAMIS1NDKUZx+8tyhQL3CsQo69fcUkNaOPTVpvfJwcOzxX
         P8046T/Lq+QK/IJHF9eQd4bQG7Jyhn2NcMv8tMlm0wQ7Jq60g7rcfisuXmjX6VT4sn7m
         PWsbYC85riMdoqgLeoHREGvbFnHO4sRAwxBLFA+9Yk9cDxhcve9JlI0ONF0dFvaDqRnO
         4jVG8q9V2ntvHkn6rfL/jKAQbHNNf8tCLkfZ5cc+k2xyLSfaZAcH6GsR3A2WXEKxriZf
         NlWXLU/RdpewvoPJatmt+iayUju4BRZyPqX1YV8lplzU1JPumLigTsvdHvK1/7rHkeMV
         sEmw==
X-Forwarded-Encrypted: i=1; AKwUvBzLRce75HQOt3jNfYkcqFERhXG9hRAfy/lPdMLwXusMGCLRceNN8yCci+sJY+djWu5zIW97V45dl5p+umAI7lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zGNNFBzCmVymtlVJJNeU1LkXRYErrBPP8d/1teUE1m6rUPx3f
	y5W59O6boriSs6G0amfioEiZXcgF8xXJz4NTfpkxYHVUQNYaqdSq6uSy
X-Gm-Gg: AYBFou2uQJNM/0QDmhVaeLeIfoqY72jGYd09dXn+4KVaAYOQ4/uM2TURJPhAL78xs4/
	k8PGyLOfy2KJDf4iF7gJUoU0UvjAwqjy4+k+Er7Emb5EP1J5SVTRGzMFkQ6j1Q6g2Na8QZpKVK1
	krDQRUPcSkZfKIkO/YFRPDoAqUUSsQwFnvq7OkxO5OCohZ1AsMJGFPBewosARHBykB/gSzReb6p
	rzTT8u9YPPVtxIHuYWwmH86c+RII4kQ3uui/o/aLANyM6VwV91yD8eouAM8ZMvlKe8S4p9rd+Xj
	JCfd7Dd3tf1qW9IirB7c3jfsHX3RJF3gKfu8NGeogHrDdGjn2OLNMNVCPhpTeK1x74MyZzo5EJh
	GhEnsjtlG3X/mRLIS0zgvdL+W4N63NoEr/FM4CmKp2Kf37fi43We1Ny37Nb9GoMUVNDciM179nM
	kbCorYYDZ0Yci1MbwmyUU0985m6QCfN/lNeMoHd+eyz9fyM/EosHJoe3nbUYKdfFyXH/+AaIqnH
	kpvCDQqiuQL0rPtzn4lgvX+3hDx6W9hhAKw+pR658tpOBFUMLz0OrInW3t3sftBZosg0V6Oyzgv
	rHjA1KGDS4Pc0FTnFWFmgrY=
X-Received: by 2002:a05:7022:e807:b0:1b2:4188:840b with SMTP id a92af1059eb24-1b2418884a4mr4392819c88.25.1793749915551;
        Tue, 03 Nov 2026 15:51:55 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm3165448c88.17.2026.11.03.15.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:55 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 1/7] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Tue,  3 Nov 2026 15:51:46 -0800
Message-ID: <20261103235152.1904727-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
more frags than a packet can have BDs. For GSO skbs, linearizing needs a
large allocation, can produce a head which doesn't fit in a BD with BIG
TCP, and always fails for unreadable skbs. Clear the GSO features of
such skbs in ndo_features_check instead, so that the stack segments
them. Non-GSO skbs are still linearized.

Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 757c7266ce15..e7a4190a8c78 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14300,6 +14300,11 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
 				skb_shinfo(skb)->gso_size))
 		features &= ~NETIF_F_GSO_MASK;
 
+#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
+	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
+		features &= ~NETIF_F_GSO_MASK;
+#endif
+
 	switch (vlan_get_protocol(skb)) {
 	case htons(ETH_P_IP):
 		if (!skb->encapsulation)
-- 
2.53.0-Meta

