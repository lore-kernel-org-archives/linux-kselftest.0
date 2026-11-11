Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362375;
	b=tH0o7wWTgA93cfiz/K0SPJclriIRWwRoBBBjvyiB8CfrqFhN31fpWg/pdygNT37RHzOh
	 biQCQQPJKFfpCRmnkOm322sWlhsNXm27mal/AP0jRe3P0RZlI+hnQd5dwXovgjjcnaAl7
	 oIW5B+Q1qBk7fhnDfoHSsFYx7Ia+DCnXnHiRyG6eysaY+nCjTq45mZdSykY7AwJqGEduO
	 nyozoqHSjvoOuxTpiD+Yjk3ZDlIo9MOHhYv8QHTwgF/4GU9es2oFcsEl2Iy2NcggxNNTw
	 ZCy92caI7kdSUsFdMEXSqWl4C6jWw6Wy/4Jx3+HT4O1w7tcrTlqAsMozz+4sOrBdweg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WzryhHStuQlBVjCAYw0PiX7ovDnbv3qfhee+mFhRhaQ=;
	b=1EQAfXZcgcBfeDq/CV9w+xDH6Nv1aPR8lUjritxAICkvGPIgM6MG89npv8GpcgCSVAmI
	 cV979BLddz8cARNugOHOaBV4InVVNFt43uZfl6eW3aOUtcqH0CCIWWxT05Z0qDW1YDQRM
	 4WzoEonxpkUpi1ZNouzY8lR600eV3ZzU+b/83LUCJRxUx0+7KWtKMAGUvN49whJZJ093N
	 ZeFZuONaY5FBs+GOd9srdvJ1Xy4Wh5idPf4gHDIkkyiJJjth+MTXWrNFzRO6HwfhF8ZAA
	 FLhiL5SP5DZYdK9UiyHbYIHVtj60AW1gwgF6XVAFtQkHKQ7troPZ52GDlW+JRimVtiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T0VRk9cy;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF69606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF69606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=T0VRk9cy
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4322d310e7so408864666b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794362373; x=1794967173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzryhHStuQlBVjCAYw0PiX7ovDnbv3qfhee+mFhRhaQ=;
        b=T0VRk9cyW5oSeiYyDz+wV5NVJ8rOFF1fugEdBoGMZNcYyTJVuzZdhlSKnDfVTGOkY7
         WxQ1c4TjxwX/TMvf3XvADgIt1SncBkH8gXxclu47MWVegv8Ds/763QcTVVLQsGvTliiF
         tSWtnZkGcwJbQu1JOwwFkMFM+HRoDxf9w809+So7raMfWDcKbbVBOntah8IgCv4MvsLd
         hdkxpovNIpy5NkEsEm9gvLwxHlbhDrQNmbaBvUCxW/S35LCX/3njQc2Z1w1t8779fjUI
         aq7th/FeAW5qHAFZGXSFfYJfDzyf8aI+gLMLlBrWHKVFmwKeOlim3nnk4hJRG72eULY2
         qWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362373; x=1794967173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzryhHStuQlBVjCAYw0PiX7ovDnbv3qfhee+mFhRhaQ=;
        b=QeW+TKBGsoFlStadwgcOjzMQu3foPs4ssPWG66pqBmZLyvnN4X0cMa7/eV09wlhAJh
         U7q8x0uVBLozg4yjBf03SSQz4fWozkD2+5UM5bOpT4ZkE/PJalO0MJHa1LT29Zt4GExn
         twEgnjGPkq9368izc4VvXWrAbDkGvLJ6L5henQPoW9NEQPwtUbmzs/VBFe/nhKbNRwlb
         soXGRGI8mHzY91tz6Xo4ynb10tkPT4dsg9yEpwpgpEnAOilGYHu6qH0ZUGzwo/zzX/Fu
         EECwuwg8z1L+2mGZ0S8qbuYtM3DYcTRGgX9OI1WCOmoCCAu48LksvGfaAlpkJHfXLnaJ
         lX2Q==
X-Forwarded-Encrypted: i=1; AL+hErFhmrDWAaKBYB/LNrmAdUvcfD1pRMyUhXpXUDAAZlzBwIJ05975mYGMgVa1miJuLNg6ZDoz9TTtI9HXxL3SNlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I0hfP/jbjaqQAnlW2SGJxU6Xz+/iyqF5yuYbB1cYd/SG8KNAD
	UqNqTl8uMpwwq1dkx47QnUHKYi0u73zjHpH/ht3GgygAw47jJh4ntzC+nIFuJKr3bFk=
X-Gm-Gg: AYBFou0b/qv2TH780I8sqk8+fnGmOYptMhQPDlsiZ9efe4sjL/Oy9WZBomm69SnTWfj
	t8dz5EvyFM7jQM4lbzMvaESy3dkb1HUhOf7N05tokcJgYUXzJ5kE/b0unCpeSfcSLXB8o8h8NgM
	xYX6B4WdZrTFjaDBceMy9BLblyzLsqO4Khmk/WZ4fgjtZKs0el0eBKx3glpNXztnElZEKP/3Isa
	HeSSCK7V5ojJfL1ysxU0yx2Bk4tvGpi/x4DV77Ox5ElHZo6TdBNP1b4jTDhzikL+voTKaL0z533
	BYXFGBJUfFLZKXiq5PkAw8bLCy2rBd1GE29xWLyKUfSTq3Tb4buru919G89U5jtM832DaJ/DYfN
	yqGC+/Hnmju3q71JRoci0d5YftrH3PttmMguIHSsB7vpthWed3o8dRb7upmgapM8XYDfj47Qse3
	gfxozfvI0KINTbh7dszAaiJvI+OB1brLFg4vRXmTLj60zrvI3YhJHpPdrw3FXzl0uNWwLMm4aez
	c4cUrxE8DsKqj6KoytZAPIQZ2z10ylzjfpudpFbCX5gHUWCl2J1Ms6zFTh5CwBB7CKPvtI/Njx0
	EowakPftsBuIyA2ar8Ajb/vI45ppVvGTvkuEbgu7pBau+PJ6yjxnup25hQ==
X-Received: by 2002:a17:907:9289:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c5066cf5ef5mr59870266b.40.1794362373265;
        Tue, 10 Nov 2026 17:59:33 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm147498a12.12.2026.11.10.17.59.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 17:59:31 -0800 (PST)
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
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 2/3] veth: link RX queues to their NAPI instances
Date: Wed, 11 Nov 2026 01:59:21 +0000
Message-ID: <20261111015922.67745-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111015922.67745-1-tianyi@cloudflare.com>
References: <20261111015922.67745-1-tianyi@cloudflare.com>
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

veth does not link its RX queues to their NAPI instances. queue-get
therefore reports no napi-id for them. napi-get lists the NAPI instances
of a veth, and their thread PIDs when NAPI is threaded. It does not show
which RX queue each instance polls. Userspace cannot tell which NAPI
thread to pin for a given queue, or which NAPI to change with napi-set.

There is also no way to busy poll an AF_XDP socket bound to a veth
queue. Since commit b95ed5517354 ("xsk: Bring back busy polling support
in XDP_COPY"), xsk_bind() takes the NAPI ID of a copy-mode socket from
rxq->napi. veth never sets rxq->napi, so the socket gets no NAPI ID.

Call netif_queue_set_napi() after napi_enable(), which assigns the NAPI
ID. Call it again with NULL before napi_disable(). veth is not ops
locked, so netif_queue_set_napi() requires RTNL. veth enables and
disables NAPI only in ndo_open, ndo_stop, ndo_bpf, ndo_set_features and
ethtool's set_channels. All of them are called under RTNL.

Suggested-by: Jesper Dangaard Brouer <hawk@kernel.org>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/veth.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index f5097696df15..c04277186405 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1062,6 +1062,8 @@ static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 		netif_napi_add(dev, &rq->xdp_napi, veth_poll);
 		rcu_assign_pointer(rq->xdp_prog, priv->_xdp_prog);
 		napi_enable(&rq->xdp_napi);
+		netif_queue_set_napi(dev, i, NETDEV_QUEUE_TYPE_RX,
+				     &rq->xdp_napi);
 		rcu_assign_pointer(priv->rq[i].napi, &priv->rq[i].xdp_napi);
 	}
 
@@ -1094,6 +1096,7 @@ static void veth_napi_del_range(struct net_device *dev, int start, int end)
 		struct veth_rq *rq = &priv->rq[i];
 
 		rcu_assign_pointer(priv->rq[i].napi, NULL);
+		netif_queue_set_napi(dev, i, NETDEV_QUEUE_TYPE_RX, NULL);
 		napi_disable(&rq->xdp_napi);
 		rcu_assign_pointer(rq->xdp_prog, NULL);
 		__netif_napi_del(&rq->xdp_napi);
-- 
2.56.0

