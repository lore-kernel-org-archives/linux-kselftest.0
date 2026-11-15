Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771346;
	b=owCWhfXRCaNxnBMuONBCec051qFzCk3liMcCz9lmLHuEBlRkP2fbowkiFUyzFwvWGAVn
	 2UfNeT5nNvUsR+hgoD8ucA242Px7EppmDMsJ4/820OrhhyucYjoYtQDk+/7dKk0kchZYX
	 erZ8cpSYU5JEkMArarFfFrKh5qGYm/J04jMeCdBSazlofztIDOjzcT+wkYGLevGMBkEfQ
	 B7L6VMW3XOa8Nu08P9rMPv18dInZBsoKNPwNTejRVUaQX78CvUDCrghnct0Iou6QYlacm
	 w4Rnk3wuklB8Yzqh9xdP7Qsg0ZWWf104MqDlnnPkR+fE9gmnUc64UrRSzta2YauRcbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j+9Eww07QSnuPfPdAGrAWpz3n8x4NlApyIViVNGE2Rs=;
	b=hlqjLyJrcaraLqoJkcw9CdZ+SxCzprX7LVarm/heT16y6hIKByinoLF3oN5hvesv1VRl
	 Xfj8Mw8uDnSJdkLhLjwcn1rdB2nRC1CkXntPcLTx9n7QBESRlo+mYkopDKRwxlNmMGjDT
	 qsO0Wza1Gsl1KURUcV7ICvYVXTlkdqjv6HY89oJ1PoImwVedaBHISsd8Adnajnn8iCRV9
	 tmklENDPzthdqbo2n38aCps4KRduqFT3tGaDZYFpste1CcY6RFQhugEC3xmktkVm3Fg7/
	 tOjKWVAAvBqwOJTDmUkkviKl6UXfvASHb5BdrQIwnlTXYoAyIFNaq+J+foXwECC6Cnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=HXSN4Aab;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADDD606A88B
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADDD606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=HXSN4Aab
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d28f75d62so552458466b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 11:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771340; x=1795376140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+9Eww07QSnuPfPdAGrAWpz3n8x4NlApyIViVNGE2Rs=;
        b=HXSN4AabSc0xFbzvP3lfjK3rXrzpQizGnweDKmW78qPo4LF3MLDWwN7erZKotV1GZS
         WPfaCjmK0Ijkkl+CtI2sZ/7tiuOzujdsIfgKzfSGnM+ksmsqCZTVApKVezMZZ7RIM7vv
         oBx2hC2ZgglhxWpdMrTdy/p7P/eYGmnlxJp7neuu/H/i/6lDYYfzPAfDq2ony1QimRuf
         uJuVdpS8ihHU+dqEXq92fbsDvvyVvSBTyoH886nzvz39gnp0+ppVgwVSLgJYoCqxEjG4
         A9uyMMOFntHqgZ2S9EQsFmu6xxqf6mR6m1r69iLRspoV2bZdMHeCD+0GNAtesU2u91pt
         dVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771340; x=1795376140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j+9Eww07QSnuPfPdAGrAWpz3n8x4NlApyIViVNGE2Rs=;
        b=GH4R217bsdmSbQzlmOBBfbAvoJZf0O/5eLv+AB+BBrTNJ23/WHWVZYlmD/5R9Ajofb
         3kv7IUSwB0+5f+Sb3uSmX2aIn24fUs/aPNG55oGlRYsXZ0H4bVsbkWYU2ys2y9X4kRL4
         pzR+UXhOyrkLeK6FO0LsBwhhNozPiX6qL6yC3UkQ5MCYUz2eogTgRkVtpNXK5sbYU9xo
         3g7Fth6NUm/q78MAyEUchrUOVqilU6BF7Csv/qJK4AdvEm0AlLTb10OPv2F6FYhBr6Cf
         4nQKl9EI1O54dMW3zkL7D7uDcE5IG0envMX0snWeDN9i5fAY4TsVrlljtpTbz/2xkb/2
         HY2A==
X-Forwarded-Encrypted: i=1; AL+hErGfcTvi03EC1dFo7gZjR/Z8lpub+SVp5NAp1UZ/UNPl1aKpLYR7IYn8Djta2jk6WSUcrLuFFxY1WvYWlVzturI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v9MAJIYUykPIJQVxCau7HPRzDbWeYkbVKSCsvnW7y0AyRt9Zz
	dk+Jk6gdw6sI2z9O1GOJ/3hPWWXyVa8u8tzPCymUBlALHecMW1XXobcGMpAexGZCbh4=
X-Gm-Gg: AYBFou3mFSvxRcNDpMZRf6zfsSP9nozb2mbQy1isHRqITitYjDg5mS4WUcHNP326hmW
	oWJb9QAPeQ6zj1BhWf5kRmkcbjFT0mC/lEG0yNhMcOYxS/42vBTWek+xF9vHGUpgtecMXOwwC6P
	WKqgH0ATac0lt8oglmO1PHEZuzGBlJiERvuzUGNeAOiDUn+/Pn/E429+GNC15XRo2GGLFc33M44
	vvN1cYSNlnC6sMLR6OHD8/5IIPNVK5t0KlFW6vc2s8Iclr+dNxBUKhKQMovk/LgI+9Tay3QJmJG
	Gim5RQzbnSoSsRpKVpYjxnRvYcNLgpvpL/buFKjckC0niLU/Lpau4nUwiVaQu0IOcZlvZHiEZyb
	MkZfxOwPpxh6NmTgNrp5nKPECjcCe9SReLanC97DusRcUQFRtBsN70aOU9nnMZEZTAAtXW/lYFW
	QsQdXlaYEBuaXo+6iIa6xiCJigfv7nijsXbGBpwdz0SAOVvz3MayaWPaQUqDB4CgW3JgA5N4wUl
	M8BDEwyVaIGh0708WStPAegtEuoDTJ+2B2LU0JdRCSG3mCJkwb8Mn4nGYAbQBFQPVDakDfIHoNG
	IS/KAVjGQv7p4xBtnppFBt1aKDOPkowiKafxNVHGXI/NqcLlBlRiA73O0g==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr689355666b.42.1794771340127;
        Sun, 15 Nov 2026 11:35:40 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:39 -0800 (PST)
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
Subject: [PATCH net-next v3 2/5] veth: link RX queues to their NAPI instances
Date: Sun, 15 Nov 2026 19:35:28 +0000
Message-ID: <20261115193531.57679-3-tianyi@cloudflare.com>
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
index 3cbedb8bad53..470c4f95e4a1 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1064,6 +1064,8 @@ static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 
 		rcu_assign_pointer(rq->xdp_prog, priv->_xdp_prog);
 		napi_enable(&rq->xdp_napi);
+		netif_queue_set_napi(dev, i, NETDEV_QUEUE_TYPE_RX,
+				     &rq->xdp_napi);
 		rcu_assign_pointer(priv->rq[i].napi, &priv->rq[i].xdp_napi);
 	}
 
@@ -1096,6 +1098,7 @@ static void veth_napi_del_range(struct net_device *dev, int start, int end)
 		struct veth_rq *rq = &priv->rq[i];
 
 		rcu_assign_pointer(priv->rq[i].napi, NULL);
+		netif_queue_set_napi(dev, i, NETDEV_QUEUE_TYPE_RX, NULL);
 		napi_disable(&rq->xdp_napi);
 		rcu_assign_pointer(rq->xdp_prog, NULL);
 		__netif_napi_del(&rq->xdp_napi);
-- 
2.56.0

