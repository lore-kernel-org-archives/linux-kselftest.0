Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952464;
	b=0HdoeMtOFZ5KXDBR8zuHrn4AIBLCGVscY/LBwk5bqE4KZ3Ewn8KihQK2QLQF/ACcEG0D
	 zz+JM6M7xG7Y4+yfAhlgiUvtjyZIq9P7NulGSp06S2bzVFPwJeJT7FXY9Ey/GZtrJI0vp
	 BRh6qmOeCPYMEPwc0BW4G1xWYwXUpgaInF+SY1ceZMJjl4+jw9dZ7OtKTw63wVftRdauW
	 7BcX6URioLK2PptCxPXmYMvHUOhqr+vU0eYapFDGrTanfMUTRf65hJXOIS6WzOMT27ngH
	 la8L0RjrSQqCMgZrbKOG2P/YwTEEjp/su0cLXQsn3t2vJtKCnuxQ2FS3CUoLII6lGJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
	b=UnD1knLV5xDk37GXPT4aRkpTK6lA1QjAq1e6k8b0mJWL0MwR8oliiXs7qb7nzHJk0sHb
	 VIBL0D/pAJuggCpKFIoS9qIi9sL0vUo8UjOKpQmndmirUeoKY5ZOVe9pRSgjIbX5BISkR
	 Blhl8xYfsFOqYGgznA5wX9n1+zer6BLjcCc7+8aqwd78F7IsWlp6qZe+TQXya9hLXRV5R
	 9pZYNmLxq4PB1qpX0v9oWyGhXgivmMGVy9hO6QFipHPQ4tCXBpXmXndaN4+V9/Hcg5xpx
	 KJyvLEf7UJM560n6MXwG5RZ6idXDvlrOWPtEVUNEIqtJZVhE0nDRstsSlYk80RMKmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhX7Jcov;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F9606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhX7Jcov
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso268563a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952463; x=1795557263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
        b=VhX7JcovyKmxrvgpIB50VgtnRKLOxpSCZaUD5vEX1j+ZH0rclqvrXKsgxWfxAQ0LYO
         jk9amyl+pksRr8fdhxOy8ejm8VaYDnwCogkH7TiAedxD1aVxwD0hmzEJQsD8E95LjcJW
         xb+eDL9hMkYYxlNZj4tCv7bjEEO/XFWV6iaQT4TxY9l2e6edpzujiXq3MBjkTHh7gmqY
         V6dNwKUYuPbarpG+jSEgod5QpdciWNgttrw4dfa6qS6mYhft6pBs2rPw5GgEnMQuTco2
         Vgita1KfYEyDGdqpkbjf4GMnvaC2h6e/81WNYUz0rXXORVFl1MaPSy3iRflFkwR/FCIZ
         BscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952463; x=1795557263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
        b=p8lJAtBYvSPXzVBAjgsqKjp3IIHVnVHpVeXi02EZiC4Z24zaRLfti6ln+4z7XorEDl
         J3iC6SLKNo7JdqP0V3PTILEkXU20SBrkZRDBgpd+V7QkU3+isvuUcFe1BY57dd7GhZSi
         kd/3W9fO9AWGrWy1plvaK8iqTd25AMBVc/JalYY2BjxcqVyQefCZVq8BWG4OBJJ6L+LX
         CCiLvOUghJNx9IVmT/8fcmXw4BTCcS7ZWGq9O0LUn4MJjUVzvwFwUIHkn6Eg54PnCBXX
         /Atb5kgWBLdoOWN58AqASmavAYc3fMgw+F5WCT3B4MKJ6saKioiYH+Y4KcloXbt1nDQD
         8/QQ==
X-Forwarded-Encrypted: i=1; AL+hErFa3c955xoEEON6HSveM4WFZhED6QlQBGwFdOK3lutYY3t0HaaCt6gLiHSfJzYJo3gudsbrDnBPBilRev+bp24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kfBnR0z8HL2avqY7MPgZpOif4ECaY1yrleJgszEBsuMXr4h26
	02rVtFpDf8OGBMcYWjY+s3C6hHTPYxJWB7Hu3B1yixX/MTBgj8gNbqLQ
X-Gm-Gg: AZFdTZehP6eN2OhI/Fuo2WxmDUJMEXdaC3RRMeIU2R2ENaH5ce/nv81g0I0fdfAej/v
	cV2EOZ/eCLOP722V1LV4lS+fKOMXJ1Q/SoIGSDmtyyqtMhO+bXUDy6QKC1YwJOG0i9zajV2Km+j
	q8+brVcut6mSb2lxmN1R72rnMBd7+l46f3/VvGqZ1rquH3gN3Ilh7m++IWAhLSKBUheEOXED1IQ
	CmBzE51nBX4JtQTCggQFoqjm0mtYChBRqZlDrlaGXGbT0n01L9jI6tPJFYRbQKle6BLSySSjfsb
	47PgXvIKmrI9KMYU/ncm7Vk/5a1c5I18q1YXvbqMGQy/2mJE6NbpLBABS4zr3dTtdvXxvLUUaG4
	XDuyvYWqIIDUzqXYWNn6cgLIXK+9RkuQ3MA9rCoAZl4D61z/2aymsd0sTB0656YWxLrJT7bqvAj
	1mM2ZBblL7+Y/uIrP1QX94VVwNFn2NkE022jTCMKjqbXDeNUdwjzxauTWvCTBD+JV4AL7IsO7PJ
	ns/Go0yZMu+cJZ1zsNIPQCiMQ1QgPIFIF04RtM7wLADsnkrxSqsALulpAQ17Tf0RrZMoUHEJkaR
	DOblWx06ESqy7nS5mSgaelVkhw0u3zsvA8c=
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr748364a91.48.1794952463115;
        Tue, 17 Nov 2026 13:54:23 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:3::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4bea17sm91996a12.28.2026.11.17.13.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:21 -0800 (PST)
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
Subject: [PATCH net v2 2/5] eth: fbnic: skip disabled Tx rings when setting the queue NAPI
Date: Tue, 17 Nov 2026 13:54:13 -0800
Message-ID: <20261117215416.1901246-3-dimitri.daskalakis1@gmail.com>
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

When Rx and Tx channels are not combined, each Rx vector gets a Tx
triad whose sub0 is disabled with a q_idx of 0. fbnic_set_netif_napi()
and fbnic_reset_netif_napi() don't skip it, so every Rx vector
associates Tx queue 0 with its own NAPI, and the netlink queue info
reports the wrong NAPI for Tx queue 0.

This bug was found by AI and verified on HW.

Reproduced with "ethtool -L eth0 combined 0 rx 34 tx 34", and reading
the NAPI IDs with "ynl --family netdev --dump queue-get":

  before: tx 0 napi-id 580, tx 1 napi-id 514, rx 33 napi-id 580
                       ^^^ rx 33's NAPI, not vector 0's
  after:  tx 0 napi-id 513, tx 1 napi-id 514, rx 33 napi-id 580

Fixes: cf4facfb132a ("eth: fbnic: Add support for XDP queues")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 5efed21e5932..89e7b806363b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -2184,6 +2184,9 @@ static void fbnic_set_netif_napi(struct fbnic_napi_vector *nv)
 	for (i = 0; i < nv->txt_count; i++) {
 		struct fbnic_q_triad *qt = &nv->qt[i];
 
+		if (qt->sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
+
 		netif_queue_set_napi(nv->napi.dev, qt->sub0.q_idx,
 				     NETDEV_QUEUE_TYPE_TX, &nv->napi);
 	}
@@ -2205,6 +2208,9 @@ static void fbnic_reset_netif_napi(struct fbnic_napi_vector *nv)
 	for (i = 0; i < nv->txt_count; i++) {
 		struct fbnic_q_triad *qt = &nv->qt[i];
 
+		if (qt->sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
+
 		netif_queue_set_napi(nv->napi.dev, qt->sub0.q_idx,
 				     NETDEV_QUEUE_TYPE_TX, NULL);
 	}
-- 
2.52.1

