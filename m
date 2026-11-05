Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917262;
	b=byrpziJLM8C+F7ieywfeQm/EUhp2R10v0rIaSty+7o49davjEUZejhfawariDQCJiW0h
	 EBRl/L6+lT9C41jBvT0GPCyZOQMwIILYlFzmEsYqfyNWfqtD/RxO6v8hUCtSh2p7TOe2q
	 wTQk5S51ei5fDfLUaV9tCD6GwvxXbujD2d0XWu6fGSy8K4g1E6wlmiKoSBykb3lU/kSrs
	 cvGjjYeTa9Y/QLBiRehkDqNAK/8aoJdPCWZ9Dm3x/AfzQZjr2zPVtOCGVuQPSOZvcGzxy
	 ltqLLdryGRirhfk9es0c2KFxw1OYGPwpO/Zp0LeYPjAXlXVzzOiwT28gMcwJW0mxUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
	b=swv8kGO19JzyZCTcjgqxPYrKv8GaqqfGxT0K/spRXQXL/z26ZB4O8PVf4SndsN8fo9ph
	 Z+9DsRPOTyBgWPHfMvv2OiAUW/AHDxcyw98VAywu63b79S4qGUI4ZiqNPQAwqxDE6L7X+
	 jgjL+R1gIsmOoIxoJZtkSSiWRaye10cHy6MIqXjY4Zp4pweYj8IOyIJBdUKKDejyl1RnJ
	 dXJZ8ZofYXLro7BxdBZo6KL/ntsYAWa+ayugigQ7hZtBPY1igYRxhhoy91LZu3XmHJ6yk
	 02NK3lu/ljccaWVJQGMyejvo4OTMD4ZZTeyBS4pAmD2ZPf11SzdDBKf0Mb+m3SUPRhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+KzCRPw;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E7606A32E
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564E7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+KzCRPw
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so39005c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917261; x=1794522061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
        b=e+KzCRPwGRMk1BKNG+tsQfz+EP0W1rS4Z26bw7m+52ZDtQj2tRPd8kF2bk/cIbpAng
         oGqnOFDZLoU/JqjgFICwTFI1ou/Nv3AnHlnTGRyo8K7mbaGg9wvwossPFQhXfa6VqkZG
         8UlgrnKuX+60euKUPpM1cQwbJLyxunEH1kaU6zYvGzoKEGDA6PTH/YT2PGCENTQkLofL
         OBryTBIZs6DNLJSHweKDiqBC+plTqFqp2ifPBhB6qvV7AQdDT9oB2lBU9Z2XDQouFnAM
         3YZYRzJTaJWSxCbyV0BBHUU02ueo+SWcZesSKmd1c94t74F6KEoYeVRccSoDXKRF3F45
         lnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917261; x=1794522061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BAX35U8nNHwzvrvZe/2+mPjA18tDD45pOn0BmV7GNC0=;
        b=ctPlG0iv/9uBJhCbC4jWAnTkdfQXH248a3jDg+6GN5ld4v7UceUZoee7Yp7QbeZ9YZ
         NK3j+37DXUqBGWHg/aWZuWq4BVYOPxJrkBmUEFgHDBZnts1WRXvDfXB8mi2yv58s8+bu
         wHM9aEdfVt5XyexcdAKxrQb0hqDvjsyLCLkQCXNZvzgJDPM+Ry/MkSMAsK78F44O5ApA
         dJJAN9Go4/95r7p4m1GeI1pik8Xe77+nXQqEEmRJGrF6SFoJqx+ZfaGhsh1YunCztnrh
         AH8UzRaCl90tOKzVov0aBt1dsZAbsNbYGL3ZuCyHgYwfLAF7DLRyJ52PoIFA70uDjuNX
         3+ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqXYO1SeyLPUUen/W0ht9devNN5drFc3wOwvZzqc49xHLeILXK3aEX4labXiruWBc9WCYr1KP5eKJFxhXOS64=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bFCM2+qgp/cpVc6VzFrjy0f0iRWvsVeaXbJaJIVjfvPC30aHv
	bBXDTHGAfkr3VTPZQAbHpWXJXXeeZsqv2uFbwxOMCCuv115oPN7VG6rZ
X-Gm-Gg: AYBFou3IZgPC8/BrY9bbXgqQ3hSiT9mgml1gTCPflwGm6P14qwfCP4XjxEszjC1f9UR
	Fud4AJXJkaOiHaQsvHD9lIX9BQERocZtaAV339Zu3Q7GAcE1iepwtIGjTZeDc3SQlzyy9XU8+nW
	jw9ndKMJ5yuKH+g63B2Jj6B0ImM4COqMjxXsJFtolClLgJ4kR6B3dbTEsGt1eMP9dbpZ/MT61Gl
	qZwo24B7wwc2WAT0Zf4/ptCTB3s4dJQpFEhpNibaabfDSYhHhNu8kAAFOFmrMHj1YQcqZAbhIuI
	Unq1Nc3oLHrBe8gSKowBETzq0iw4QEo5PbkH/IdAlV05o9G517gQnsnyDOx4VkUi126nAneBWQi
	2T0GvZ/40Twb2KZtZ3R7GH/bp0Jn6RQdG7i0dnrjOgo29GtQZNQg3UgJ1We5zgXzhSJzwpxNSr3
	gZdi2yg0gNfAdV88+OyGCNXvr9wiCSJP1hwZyBxzuY7/jW3ScqS0JDyVvkfMsyTk8AlztTCPoIQ
	2/Fnw8JEV/96dS5qCvxAnEaGDOmHIJXtp4tRjKHrvdA7muq+9zgzUOEliEnI2nHmVFGFG7TaXtq
	n6vRaPqCF+HEWeoAIRl8qmXJBHF4Zdn4bt6DJ1t4b3sx
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bafmr512275c88.2.1793917261068;
        Thu, 05 Nov 2026 14:21:01 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm20396895c88.1.2026.11.05.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:00 -0800 (PST)
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
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 1/9] bnxt_en: let the stack segment GSO skbs with too many frags
Date: Thu,  5 Nov 2026 14:20:50 -0800
Message-ID: <20261105222058.944293-2-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

