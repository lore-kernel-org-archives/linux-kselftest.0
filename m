Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646881;
	b=KoWICzAPZXZ6C4arbqDn0l6MgKT9AfrXxfMuWdPT/+prtHpI8vg/OLG7Ttk6DJyzPQ8H
	 qF/1Cl1rH2sXWB0IfHsXM5aZRVHYCTQ0ypQTptScq6CQJ++zKwXQS9kOwj5wkhtZz3TTP
	 wPw9PXo3AjZBErVayCylsuUkQIUYelPdHwdawyVPXI8dDDyE7MQYGUJ87tdLDXyd1X7xk
	 3mhsrOdkV+MGIs97xYqXBEqJrIOYFYqFEehiflaHMvzO/w9lsVP7UVyCFG9p+zVnp8+rw
	 HY8E49zBVXX0eaWWd+GdYg/A011h09Dv8DuWBRjSduW+T3UMJAxMKjXAnjL0WwLAjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
	b=f5PfxSahnE+DDHoQxkITJcfEZZZ0ZDOovhQ/94U+MSgQDAyu0xhc6Q9ROQrIVQ5K7Rf3
	 O1ZUETBYFtqlzdefP7OmyB27SatcfO/CnYYuADW01O0BwSTGfZY5CALkf15YKG6yM9pPa
	 UuERdsYQUF81okVA4lcebuzDCTH8xHGJ4ssxHyuwPE80YD3xpldTbH/JmxYnrAsI4GV1H
	 s9yC84UHdWb02x0Y1R4EylZbEB+VfQ/OA+qDqLwH5XCpCWlJvcinLZMUceY97C+eGAiuI
	 SIlHsRy8zKIy7v6r6smKirn64D3KBiaV+G6IKRE5YabqhUuRTW1Qn8FIX7VCw377RlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1pyNmTK;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552EF606A336
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552EF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1pyNmTK
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-17c2de6994cso392361c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646880; x=1794251680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=h1pyNmTKcYcQnUiwUTUVjsqTy0kaz03M4BfbS/GlAuNuz+KfHvuLTfOEYvXGI94d8f
         mgxcWfCy4TxFZT/E6tvueuMo1h0KNnkcD0qVDqdv8OtZBnhPoVxWI63l2B0uQSmpe+O1
         gMsd1rTaRUkDE93+77cEJSqmfKefeSX1f9DTlEPuq0PHainXMPJHlJ86zYUq+AKO44MA
         FDFugdFz+CKDPm3z6Ze+stKoZjGNnFlMMGX6mXCskfH6CvSS5RQdUIXRK+utpSa/B2dw
         qDCxwytTP3hJcWgQvdfc9UhEYO4rEHkSUXQ0djJNa/9puuJC81CBPEPvGwnWuKJSE46K
         Bmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646880; x=1794251680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ho1C5cLiBr/3aZdyT0DQh3Y6a9MYv3XZDcIqBQFTI=;
        b=G9UykdSl7XjxnCGFOooXyXxz8uAR1BqvcBbk+jLiA0Ya4yJV0CdrVXW1UoMdT2kQuy
         MPzLI9crxuvvIOZt01hTtPloACZA+cTDM8CKsCU9fKMuPOUXEyfy/+wMobvH+Yt/S1ZX
         hVS7bI1nPkshJN721braluuj5vCXyvP8DGvSJnzPJUwl5oPIgNdp5J+kJh0CdO2s4TGR
         y4b923T2QOUyctKv6bUYujAX9C3UsLP6yk3SlrP3iGuUnKgRU0ZITguEEhw9mwWiKE92
         uRTda+xy+Tiz5EdqQpI2j3vOkuPTtut5KYWdiIbgS6lSXECzF++EfeR8OmJrP293zCqS
         qoyQ==
X-Forwarded-Encrypted: i=1; AKwUvByKCX3SD6dvJjfJTykBOUR8BmdE30wRf+Y02VkWSwzlty8BKwOvolrzUQubvKSM8sqzKIycCbzR4JOIbHjqUB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5L6nJBdi4G3VF5j5cOib99Xt2kqhpSLwrhTzaOuW+gBIdicyD
	3C0Uei9fVpsTBe4HJevJpytJMUu8z9qN4l1NGbJ1w5Imn3hMv1R5mVXG
X-Gm-Gg: AYBFou0QPIAqaW2QLiTda9vPMnV4z+V9PGAu2fjXB7qyBPeGUrcf1dhaaHpvQXDGkDJ
	O8uXi4FBc61niAGIgG5u9jR3ROUIZwfjuRcTEDhddzo4mKM22ll8STtu6ylddIzb7Pas9MnUwa/
	FfSFDoAbt3ssasoxYvyYkiY1JzK8VvIzqxs9wxcVmObW7SWbaBR46zIn9pbUuconk13BXKtC8tK
	+9A/S+uOxKvH6PbqFvyGcxNyx8azl12CA8e5nl7hfsapHvITMvfCVonV7hB/CgXLnNzRVpHlTgi
	P1GCS+jShzvTDxlYAw2a7yAd8gs+e1Y2Xdn8QdbzMlWiXX9maS1nsMhWP9j+QXsk/1l2xpG1biH
	lnmn2SXkrflOjp/Zx634fNwM15gA50ZBvcN37nDNnHFcjkXEkucF9hLDN7KCjg2139rJldr6EB7
	SaiXvhPwrT3u5hRZaMAkU6AXBPfA5zizSA+0CxqnoT+tjkn6O7dAohnfn3d0KK9x/zb6dc7QWj/
	QrY1f60t1XsbYYdeStoDIMCm2uZh5Zvko3OJvxoQqwxJgfSCDTDZZhJwZ2AHwJRY5AD3mNL693G
	hq9c2/BFl41A+sZbaW8bEhc=
X-Received: by 2002:a05:701b:4213:20b0:16c:4eef:a526 with SMTP id a92af1059eb24-1ac5a0b430bmr17520345c88.15.1793646880369;
        Mon, 02 Nov 2026 11:14:40 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm62825489c88.7.2026.11.02.11.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:40 -0800 (PST)
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
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/7] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Mon,  2 Nov 2026 11:14:32 -0800
Message-ID: <20261102191438.1059771-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

