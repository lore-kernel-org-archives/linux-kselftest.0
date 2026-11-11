Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437265;
	b=EwLA8UxQ0xTZH0az+FBYYocTO1PzEGOJ45ZhulvL0HYUhTPkwlVmqjySik1a4IXUHkHK
	 apOKm3NXrjEYFLO1QWItgczuapT19RkzToHNJbuGKZhWRQ3UIghUbzJVUFd3PWsug7Gxo
	 EzUR/7Wj/UtYtGF/LtlCu91rUWaK7hnFyecAyhLskdG6uP0olZPzxIyxHLWWdgMWa5N8D
	 PDtc4fyNaNtpHOvHGb/wSofrV3W2ph9XhEJSlQmaOWOXWsAb6pMvgHYEjFjR1yZgxcSVS
	 owXfTjlaX7HZPostoNatalJbByxcz8mcrPSIXfvHD3hdKbjTgMI63aDkjFQvcaTPq6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v7W0xNYpiy5LlSzPIX4rQ16P/K0fxOUo2Bge+Pct8Kg=;
	b=nCauNcr25lwkYGRZcc5dLheG4vLULXEw8OxgEqg04l1i7StzeI64vY1/6+SRXlHq6HJe
	 XYCtEjj1He4AEsQ8EK1R1leLzVzxyli8ddcPE8uWPbf7GFXi1RjpBp/TmLxvr/xQwxOkf
	 aSPOd+6XCXC8g2ly1eNGLOc+eVfLoUYxclBPr6okfP+LdYgbCH/X/Zt4VD6EaPty+w8C4
	 tYUu1OtJfzhZ9j1ilh/meI6Jx0bGhoKU14EKOl2Xcv4FofOx8smUZ2D1d5sGYRAIx/Thl
	 9/hy4PZF8vmdOVuXmp7ph7lvUzCR/Ml+WzNF8pAD2lftMB3Bl3LYU7AIZKuAfLvUK9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTooIN3Q;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48775606B750
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48775606B750
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTooIN3Q
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so2553092eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437263; x=1795042063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7W0xNYpiy5LlSzPIX4rQ16P/K0fxOUo2Bge+Pct8Kg=;
        b=DTooIN3QoP8/9pVMHn481N0AQOgxeEutkom8yEbz05kzxThTnvfycNhmfLfhQr+4dC
         eaAxuGYTj19ii0QDr6qYhgUoC1FKGTPnT6NHD5aeIJcvGpW2+UqzXBLAhCGk6TxkXdem
         WKqVGf802TMuZjVAyE+woEqFEUws+x6LIQaZyZxdurSz6eMIV9OMhpoI2gj/EKIVqpAL
         i7FiXALbuSkKCmV/104GLFgKiYV+qyckq1eXXTA40fTxCuSa3p3VGAIqbyxAkNk/wQAq
         xVNKdz2XxvSnZgFI2fjksYnkgdPpFY9eQZUa4LjT998m5MmMyjdtUuOCKRPK9hJPuHZu
         RCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437263; x=1795042063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7W0xNYpiy5LlSzPIX4rQ16P/K0fxOUo2Bge+Pct8Kg=;
        b=j32/a01k5BRcNJfPO7xvC/Xkrxr2q9Y6K/bkxBYdbOYHaSFfDC6Ua/KfdwYFtF2raP
         ngjS0L2xcjspUzlgbF8EBYMWgQL6X9OIiYJMT44Togzz0ygiRbaYxgQqjHlsjPnhV7lY
         tvoD21sZDkxIH069BgMmJoCGZZwZPuqdYAUHcilMXc4Iq6xWoUg++FEoaQqJiS1SkMJJ
         p19yqbZO5uMmHt53W9g8d5MPzbxWOQw+1OVrQcWfDDIweMPAXSpaoGCXE/Al+iflPCkS
         Y+ZGr1TsSyXkVHQ0IcA8QugqdxNE5CxS/m1sIj0wBtDeWo7Rb+M5mnXFlzJxE2p3pyB3
         8lUg==
X-Forwarded-Encrypted: i=1; AL+hErFTvnHEjqRC7RTL7o0z++CjvrcVqsyeJYytfCBGR4xYjw6sxlDsAmxkwWsMY8H7XNv3Ausm9hZ80WLDuIY4Wbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k5y27y709/drE/eXyK+uc6u9NGUzKVcF84oMedO+Iarn4lvS9
	Qp0AsWDGiFN6iGsixY4Iz1yFPJxGyVrPwUo9E3DcLj3fBkA2o0QJQ5uz
X-Gm-Gg: AYBFou11S9sukkxsRztA4xWECRFBquFwZWwIthBzrd1oV/hlJe2OMTWC2cqHiGk+Wnr
	bTJnCgej2n5RbWIMTH4CDJ4NpeL4hN99WTQmCIvIR9ktEMJ7zQkX/5cy/9cj6raxO1ug13SMCZC
	eAOm+BCIqfkldyjGXvft7MvmzuR7ojgzqkclyqULTWwRiqjq7ziYZrHRYT6WeV0BTs7vnPPJr7L
	o+aQkPaX1VXPMaNU8de5cnFyeAHDO51tewVSPdYcK1MCNKhajepYebN19KI63pDgDfngaO8Y/5G
	bmbmaNbsjBbC/i24kSNPU7wIy1aneIYusA3A/oJ/ReRcmL94KjZOTO4zDy1OgHcuBbS4fbCoi/j
	2EuYk+ExtON8qPvd571iFOoYyHS3eYM/PrV1ULbENDjXKYnHC/VWYXbKqVRnJkTLVJ/5eI6LR/G
	p+YS4wuQR5q4fseezt8gEFicAPseWMnlkeujB1Kqv3AVTqVMp7YFAt4LrzlCIqG90TW59ND1oAN
	8MyDyz7c7SYxbsqOV8gHN9T1lXjfSvtptr0YuOuYB7tE+M2cpCJl2TCbnRIxUCxJEHIIr4W37FC
	Ut/7FCK2zKjs4kFdB6SLlCi158YDsVIB5yqFv6GkRfjs
X-Received: by 2002:a05:7300:aca6:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3768579fd19mr5751002eec.13.1794437263206;
        Wed, 11 Nov 2026 14:47:43 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm20685173eec.7.2026.11.11.14.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:47:42 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	almasrymina@google.com,
	sdf@fomichev.me,
	leitao@debian.org,
	dtatulea@nvidia.com,
	asml.silence@gmail.com,
	bobbyeshleman@meta.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 1/5] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Wed, 11 Nov 2026 14:47:36 -0800
Message-ID: <20261111224740.2744522-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
References: <20261111224740.2744522-1-sdf@fomichev.me>
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
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 33c4cacc8ffe..f20b61180ab2 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14320,6 +14320,11 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
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

