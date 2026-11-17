Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952466;
	b=2AlhCn0KdbOhdKdiCFUj5BwgM4vswvgyRPq6N6kipLc69FPPdRxCve6iPoN3wLkpC/7A
	 oFmw7mvwKEvXIIBY56lHsY+qJTGysztOHcrxtJHoGR5Zvg+hOTuuv9CmAfq+BPxaDZ/We
	 uxTlqR+9Pazk9zZYCXMi0yD4UdEMqywukvrXihrjoq7/UVVxIYu9NN3Lw2ElBAo8FzW5L
	 55GmfI0xDiYQpkSK+rwmeLZBg7U/SwXKPruGYiQPpYdfuXOIcxClSauXa/br/V7PzCNZ7
	 +2tthVL2Tc3dHc0FrYeF9BfJooDbhU1JjCYiw9Ux/Mq8tSGLLGKuq/dnjfVnYsrAJQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
	b=LAa12DZlItt6kk2wd+tn7ny+z2+pOSXrpA8AZnAdq1o2v0Bt6i/ltAEq3fNWlIHzXPwo
	 ITjJ4jRbB0rg4si4/9xhFzPSubW7Yb1g9zs4wJV1TvieVirgLRaUYWhAaXa5VRA2qR7Mj
	 FmLqscz+7cRWWKXiKqm2oloSsTsahMR0r0b1JD8NX1phMqsfAzu0fxGI28pTNa6cPDkCG
	 X7A1ebfeBA6B5YHGLGBkGncH4qTMnzj5iRgHhzmqOAQ3a0Vl3RGPFCV0vBQDKSax+R4uS
	 JMtlQ4Jm7hKrpI83HynkFlHRU0gnSsgiSXXlS1hdtcQblsDKAynAfNDok3tgmxKBATg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyTUrrZa;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5524606A33A
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5524606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyTUrrZa
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddc597d062so210401a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952465; x=1795557265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
        b=oyTUrrZaD3U6y9iF+/WP+iFGaDphOp0jPL1Lj4o8T/ibG0uWJRDRZ+strisDHToiZ4
         5zksiJEWUTZfJijxq1Kl+swar4Ig0xS//XLtmin+XCR5PLYB1Bvysk/EqOvCi8q5SpcY
         mVQ87q3ifB6buhCe40BNFXKi4rvxr7yXLQEAUJfV08U06CXGOMNVhQQ6m5a2co6+nQFi
         lB72YB92mVtvx3gLewTANqO7aC6Xftjwt9Dnbdbyjyzyp3bb0yz56psmuXGEBpnocZmE
         qooxP0bNqNKao9SK7S7WH5IiXkdBmKNwARMVFjKG/c2pRu1JoKaUpgsA/1DJV1gcd2Af
         3euA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952465; x=1795557265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRUpC1ia/SGGyXZ7wtl3dvuAfgYqDQrahDr+fyr7qzo=;
        b=fSfdYhNiFwYfaHEwrxPJTDS5rfT13vz1OYzOHNkbS+hCO6dRzhO0FmiMDosJ9bhz8U
         Jdhn7/fqEncEHkij3BcljLfZf0cxk22zd52UKDHOt9H33BhK9ZIDZMxJNc3US7mVyEKv
         T19DL/KK2Hv4kuOlwcwJGnhxxanS8WMJrsAcZUHbX9CB0zOkMzxbwv0XO+j/xZ5m/Rja
         5WOLGSR3wxLJXDRJHB9o+Jv1D61lEpa2H3LWIkMeDIRAKuO7eYXZGmYypPsRRxE0pHz4
         g1A5dIh6ZAkRgdMliI41/9nrHA239j0TQT618QBqBSSLC1oRpJ7/jxNasJ8B2Z2Yve4B
         xrVA==
X-Forwarded-Encrypted: i=1; AL+hErGRtJH53tf7/DPjd7tPq/Q2STI6LU5xPCBnoBxikQDBIslNp0GHo2ogzyU9So46VB1Rz5xjbiP6HipwTxeiWVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z87rC1zh/GzUEyxPtTYK1yIoGTyXYq07D1AHeHIdfsW/b35WBgF
	yDhoGqziE5uzHh9CksQn42qL5IswGc7QjzfP6rgLIogBZIwjyBM0cDTw
X-Gm-Gg: AZFdTZcEUJWaX9796epTSyyYQ6KOLNFkzCb+5Er+rRKT49VHxtEZqyo8IwV5T470OVS
	RIskvfoFudzC7Ck4Ej/lnYo2KCPhLmCnhiwfeN74tGLUxCe9gK2Rb/AD9/iTG1mj6T0EejzVZ1a
	qVqVS6mOT4X/dlubVyoAlMAhqJVaUIOekZmqrXxXLr3HuRtPn4Av/0P6zIIxRP17UKfNhs4mhu2
	5GNJQT2A3q/J3MUK9VszIaWCnps4vqCA/ULx8yqaJfKjKJxGusAs//VgAfkUDAmR2SPooJuv3sW
	XDGqz6jP9SIPrmyGGLMZ5dmG5XN0p7n7xHIoMmPPiBbd8iB6nH0vX8N6rZRgvS2KAJXmlxIpcgC
	HJcsZQ0BopxNB0WZqCkTZC3g+5r2eAKiHUM76epINquOikBlO8pLGrdmFwUMotG1eNTqB8xpVbe
	v0WsNp/p3XhOK3PRezG8s9vaMdzOQx8J4OiL+8dam5xCskBZUK57RugYz68wn2xuMmHzwzTBtD7
	pg5Osf4hSRBV3eAsHU6ACgw5JVlJvNKMQMAIdp6Iygh3zDwWx18LzNc6xFelpDke/yulzumtWk3
	xV3fpNsMmRw1dOB0nJJgDUr/7nmA4hP2We4=
X-Received: by 2002:a17:90b:37cb:b0:3b3:b0e5:57fb with SMTP id 98e67ed59e1d1-3b3d07e372emr802152a91.60.1794952464869;
        Tue, 17 Nov 2026 13:54:24 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:44::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm5872992a91.10.2026.11.17.13.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:24 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 3/5] eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
Date: Tue, 17 Nov 2026 13:54:14 -0800
Message-ID: <20261117215416.1901246-4-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

fbnic_stop() frees the NAPI vectors, which clears fbn->tx[] while
num_tx_queues is left unchanged. fbnic_get_ts_stats() walks fbn->tx[]
without checking for NULL, so asking for timestamping statistics while
the interface is down dereferences a NULL ring.

This was found by AI and reproduced on HW.

  # ip link set dev eth0 down; ethtool -I -T eth0
  BUG: kernel NULL pointer dereference, address: 0000000000000050
  RIP: 0010:fbnic_get_ts_stats+0x38/0x60
  Call Trace:
   tsinfo_prepare_data+0x82/0xb0
   ethnl_default_doit+0x213/0x470
   genl_family_rcv_msg_doit+0xdd/0x110
   ...

Fixes: 96f358f75d1a ("eth: fbnic: add ethtool timestamping statistics")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
index e774740fcb5d..0cd03cbf2713 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
@@ -1740,6 +1740,9 @@ static void fbnic_get_ts_stats(struct net_device *netdev,
 	ts_stats->lost = fbn->tx_stats.twq.ts_lost;
 	for (i = 0; i < fbn->num_tx_queues; i++) {
 		ring = fbn->tx[i];
+		if (!ring)
+			continue;
+
 		do {
 			start = u64_stats_fetch_begin(&ring->stats.syncp);
 			ts_packets = ring->stats.twq.ts_packets;
-- 
2.52.1

