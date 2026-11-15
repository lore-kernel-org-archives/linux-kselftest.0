Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771350;
	b=RWI/z1pzVqsHshYeKM6bZjn3b1e6Wr989WILNtzqRf2U6jC2TxWWyfXxGD9298pXVhnK
	 7LyfdfuFtkv63ABGfjODOG0jsK+MQR9hSZvRAynywYB4pYibQvMyPz0SZTlXKlYhN2Om/
	 TSMsRB5IGPiCRWYZAxjN0rvZ8pc1mp8NPdUXDt1CkVrXgGkGdfqoRXA2TED53QMGEforL
	 /bzkuUNwg6Ml2Ykwk9VRQUbR0Up9zy1lnXfzOURUZjgo+PXn5lLTs4GfZhbXE+bJdtpLq
	 jG72GSd6vJ/UkSLzTfdx917cJQLiU7ozVBuHxpBT1PiNgP8C+YxLsMc0Nh977XoPvPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A71Vxm6qPP+187+TkTcZc1nFho9ZnzIp6cYrVgpdGpg=;
	b=JpIS7NFVnEsWtS+XOAcr8/p2lRpcA8j4mwaaim/NgaRqDlrBdVPKfuYxIDIsxEFCOYqm
	 n40emlPW+b33tqgshpXFt4h0o4iYKYwoszIZ24XrcdFjcky3TkTPsg3wupTitBmGCmD3X
	 EMgejCIpWRAH19ICucwGAnGTCzDaqgdQ1Di0hqjTQMr25ClWI8A3Su7w44xdIY0JnXvaU
	 2rDmfmJExAl3tN0USD+eRRzkEHsmRpkH8C5ZZ7Vxlig+KaUHfvVaoAog88jCKI5ix5Hfv
	 UGybBhs10U/tBbQHJX2yF3zND4SVFlvaG0hJBwRq6QOpTxJhB5VvIf6b2mk+08DL3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BnRr26k3;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653E606A887
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6653E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BnRr26k3
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d21051042so464937566b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771345; x=1795376145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A71Vxm6qPP+187+TkTcZc1nFho9ZnzIp6cYrVgpdGpg=;
        b=BnRr26k399RsdMOHX5eH/Zxcr0/ZNWhSJ0dtvkwH/YUqVso17JVwuWk1gH0B4garbK
         CT4nnq3fpTI51stp3EpGM4ZB3aWoRlNcp61ZHTZN8jhjdzHyVYGEWmjPN6swd2ntHS1N
         IrvOiVM/qhoMax+IaloSB49L2W7FBrL5BKiv+3opc3jBBqBi1gHuJjX2PIrLzttChG5b
         Sbw5Mcq5pt4lIWRFGkV1T1UWIszVEz/BmZ16V8F8KDopQ86V/X1nR6fjdEoGmpCdiQGf
         aZm8HUU/D6yE0d/cvyGR7WzYuI2PEDBopzxMP3qw5vZW2z6gc+mjZcUnn+XHfU4lfsUn
         swyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771345; x=1795376145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A71Vxm6qPP+187+TkTcZc1nFho9ZnzIp6cYrVgpdGpg=;
        b=FauVnh7Z4Z+un8IU1uVBCEodDww8CLfIxRlm8XHVyZnTEJ8recXEaBO5umvAtHOgQP
         i+LxZUlWj8UsyuuMu2SEa9MI7H6EAEb9nKISKpMzLKG/LE8wdU3eotGIaB+ureJN9+ay
         hXvuy2httAIW7c17CACinPnF+mVATMXbwAnyI5Cz1xyEmbOnNzr9GoxCK0RKd9xVobrP
         aimQzX0jg7aEKSBsMHypeeZ5NCwctuYiiHYK+ld5aWtnu2Znl+sonZzOjaoDUfJNRdJb
         RnY2mjBzNZrZftSBS9xJJmUb4k8ieXpKio35V3kSyv6CeWUklBUxl1t+g4/xAPNcqrTD
         I7WQ==
X-Forwarded-Encrypted: i=1; AL+hErEUZhdMkuI4R7e8FxHzwWlYELdkuMgzmJmmp/K6ckZgYRnTP5rVTkM+nhpWbp1jcU2JiUqWXfk2rdU+dQCPKDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o2NOmNfZEXB/qM4slYf5RKV69S5b94EoQ1docoLw0oj3OHDzg
	qzwqhYYg64Wdn5HJQbMwXzKkR60yqhjBWyZmKcEuDZ9/HB7mf2Ln/9eI/+p+siL7mJY=
X-Gm-Gg: AYBFou1slPyGLQGM4ryjiBiyXubMkq5ZFqcmlrXFfXCs2bkN19FI82h6gA6YRZhDdxO
	POWzUytWs/AhV/Htzeqx4ADXVdzUl2lrhVkoSWO3IYjsDZpGfoRPJxzLB0cxuhoOYuOaquDWIwD
	ZfBnF0c+Id04Kd/HZHs/MbjBsp/xDQ6k13xe0SZpIbEpmi+Uuy8Tihfm/Mgt/3NcuqXEJ5OoTO3
	/wKMfCEuobX0NOuvrL7gpMc+xNzTo3gQlp2gI6AAi9/UyTI8lotegMnDnMsq25KTYbl7w4nc2/h
	Lo/aaKsVl5DTV++ylutkMrr5ELXzIt6T3Zwi1bZSTYhLwbAWmH9+pRUfGdxfkX4aOnSl4vlMeZK
	uxJk22djKXRzwj/mEqGKc3qHhQ24ph7WL/ZZ2oHSCDK1C3Y76wUsDHwzG7hTPLlq8KWhhF60rRJ
	1e/mEBcQ6RWFh+1hldOu0s0AtAiXdUeAHZFR4R0d/dxY/qNh+pNN5Xf3Y6T3JUOJNsQQbCE42Wt
	/fAfuUxby0/7ofxKvICXvIlUUlv/h3AeEVrChIwpLUeBw+6Xvfx+OlRvYkd+UjlbFsH6tCFJgDj
	0s8Xyz0LXzAvz4uY9VD3htDixJeI84MVM/2N0QDdXaIrGLaaASRlzCTs0g==
X-Received: by 2002:a17:906:9f8f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50963cf771mr650243166b.42.1794771344781;
        Sun, 15 Nov 2026 11:35:44 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:44 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	joe@dama.to,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 4/5] veth: use persistent NAPI config
Date: Sun, 15 Nov 2026 19:35:30 +0000
Message-ID: <20261115193531.57679-5-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115193531.57679-1-tianyi@cloudflare.com>
References: <20261115193531.57679-1-tianyi@cloudflare.com>
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

veth deletes the NAPI instances on link down, when NAPI is no longer
needed for GRO or XDP, and when ethtool -L reduces the number of RX
queues. When veth adds them again, each queue gets a new NAPI ID and
loses its per-NAPI settings. An AF_XDP socket bound to the queue keeps
the old NAPI ID, so its busy polling stops.

Use netif_napi_add_config(), as Documentation/networking/napi.rst asks
drivers to do whenever possible. The queue then keeps its NAPI ID and
its settings. virtio_net made the same change in commit d5d715207e29
("virtio_net: Use persistent NAPI config").

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
New in v3, as Sashiko suggested on v2 [1].

[1] https://lore.kernel.org/all/179470883411.2199510.13825316417997386083@kernel.org/
---
 drivers/net/veth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 470c4f95e4a1..1c7ee3bf65f0 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1057,7 +1057,7 @@ static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 	}
 
 	for (i = start; i < end; i++)
-		netif_napi_add(dev, &priv->rq[i].xdp_napi, veth_poll);
+		netif_napi_add_config(dev, &priv->rq[i].xdp_napi, veth_poll, i);
 
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
-- 
2.56.0

