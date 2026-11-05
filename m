Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917285;
	b=NIAYQ8UkPjZOlxnTtlD9uBK8DA1od8efvVsUSWIg9LggGbMGZ7SCD6Dnd4Ix2DeHkb1L
	 Lbzw3opyPA4fQ4DjDFZrNuFBcXqbFcXCGfAC1A2ciVoVSvcywNm+GH1esrysIU7Xwl4rS
	 Y7vWLlaQ25E6ufv6p+jk4aWhw3ffLasWziLwtLFRnLhnlbHqTqpEcilM9Pt8IEaLrLIBp
	 AperYfRS4UZLahG7NqyK6H0G2u4o5aQOaJef2RgYPckDadUjKwM1xdM/6sLMu5XPfoI61
	 szKPteBy4N3qsU9eWMDirIgIArE/lVTceKCIvYJdMvjXGS1oDuxLRzBTDLWxD0hV2xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
	b=TO2gNAMVSxhRtWqAbSNxsb1IV8X0sa2BR+LyvgYeNbhrEllrtcZEcVECXKRi/WCLV+ox
	 ZHRnBR6hKh+1H6K/zMjOhYcJRzk9Sq6ZixFpT8GQWpXoLQKbQwL75nrc2kkwTLfAA1jF2
	 lm2ElD3pu6fU8sw4qnwB2XQC2UoWBhsOwq85vmMMoE3xh4t7P2sLXbeE4bg1XHjfsvZKA
	 nlTEgSmyiGD39TaGnckUPqrwhQUYFz+sbctELomGjoDU9Kis1A3cipk+YBvtxX0uDnEo2
	 Gp2cryZ6j0ZBs9t616n+NSyR+gBsClg1zMu8hj2OYAt42QLJY5CFLmPWR62B7vuS6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=(null) smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXK09pbb;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CB6082BC7
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B8CB6082BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXK09pbb
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so80296c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917269; x=1794522069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
        b=tXK09pbbOwh8AP9jNlpQhqDpUJfAjAae6Ku58Zgm44oOrfeRgdSy3UqYDB78OGEkcU
         +7aiH8UB+U/cTYuBSbGlhDQoEbs9Vjmeyf3p9O/kparVcGyxuc93925WNTKkW6a3BEzO
         kK/Sp3YdmtVRiF09ADY4T1DxgRws8BeCuiAIpg2IYjHqryzRmvfWPHfU/TX0kerBTqqP
         Z9XvevicmbaLbeiorRF3IL8ubRSPGIbqOCg8Q6r+m7CUkeDrHjJ0xWcSXEoZeV3ileAK
         XGTP86A9kpQXIAKr1zaON1csyIQLpcAgryipH13EsnYOQnbNlmrL/xzxbLANwK/Q5qrd
         5YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917269; x=1794522069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
        b=GCThtffZkndszT4s4dOwv6iACz69PjatiaLDL8MkUKxMpZewfOoSOy6J91xKVXp9ml
         hf71dvitbSmkA+32wfV8p2Da2eBBfundH7/BWU4t0H9aFxg0KeAMCtsmZ0Gd0bZqREKt
         ZC0dSvlJXDq3ZCXrfTXsdvcTPYeIWuhZ8AjXAkq6AAAXXrmGxurI59eBn9u3FLGbbVUV
         A43E3FYPYgtNnSGvSdXmVE3tJ4fCMRJYcyPUGU9H/p96+h/rzv6n/n6zaAkm+GI8bPUY
         0uHoyb1F01eI5fWgb+blpw9NPSzMiTiChCLWMeygj+WCBF8rMz/f9gq6Kri8ZV0ldorS
         LPPw==
X-Forwarded-Encrypted: i=1; AKwUvBz/rq7a1n/8VK56xUnCAGhJ9CTr+SM5qxwstRHN+4QF4t1KwVEdz40Bzv2f7uG9SqlRpwCoc3YbfLdZaHeXV/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z91kSAyacLTN1VpL2M5EJZ19LAwGSywjpn43J5ndzFIxiVr9N5D
	48n0hwJJNkvmi7E3nb1JbimIJ/JopwDjCJ2jqLaNPJ4ihtoI18k+YvKH
X-Gm-Gg: AYBFou0wYRu1s+3qrjHamVy9LIrfM5ENtDS7atjvy02PnSuPM2XsIZK8KgFI4frcoqT
	N5Tmi9j5oeMwzPIg7AdOKOwrNXMSNxPZPnHaVjQELVSDAcaS9RW+KHmtHRc7NZVpWst2kvHSQrZ
	bkkI/hvCJ13AS3OBxpNtAtmI1nT9rQp8QQDxfPM+lAvLbUl8YxEMtDKXGJPdVsQs6i0plLvi2e5
	/XuXrINJ0Ks9XAzm8501YRwl53+0LaRGvGmJQlqJjyyOfdVRMIk/YcqXPaygNTYBvd2QDSNMw2S
	Lx624srNM8MHuvtTzfqArLBL/18N95lsMPt7Q2PYG1nvurWA5QJHCskFf2STEWWnPcJP1Ri+OZw
	WaJW/6wpEC6pRfM0QsddwUZC/G+S4MG98pq4ixRoRNb+5EuD5wnVx22exCYPirSxqcX+6++buy7
	gov4s844Gei3gjmZHIkdtNKIIUX4Y4RuVpREe19VW+tlC2Pg/PZEPOE5abDsymtbze7BEoLu5oA
	bsfF2RyJRfze/S6l08tW+Lq16toFn56fWKmgsaTdHn0t7qTziIipFU7/k/oeRC328F6UreTq9fi
	9LacLRZ5ETiqclztMf8ltAc=
X-Received: by 2002:a05:701b:4292:20b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b25d37e36dmr449336c88.31.1793917268955;
        Thu, 05 Nov 2026 14:21:08 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm26931552c88.21.2026.11.05.14.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:08 -0800 (PST)
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
Subject: [PATCH net-next v3 7/9] net/mlx5e: lift the netmem TX frag size limit
Date: Thu,  5 Nov 2026 14:20:56 -0800
Message-ID: <20261105222058.944293-8-sdf@fomichev.me>
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

TX data segments have a 32-bit byte count, so devmem TX frags don't
need a size limit. Set netmem_tx_max_frag_size to U32_MAX.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index c3c2c5720c6f..28ba04bd5f4a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -5967,6 +5967,7 @@ static void mlx5e_build_nic_netdev(struct net_device *netdev)
 	netdev->priv_flags       |= IFF_UNICAST_FLT;
 
 	netdev->netmem_tx = NETMEM_TX_DMA;
+	netdev->netmem_tx_max_frag_size = U32_MAX;
 
 	netif_set_tso_max_size(netdev, GSO_MAX_SIZE);
 	mlx5e_set_xdp_feature(priv);
-- 
2.53.0-Meta

