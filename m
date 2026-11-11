Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362372;
	b=CbixfqdoBqXMMUGnB3+vWGbwLtIMNNmplR35EbJOgv3O2K+vBopfrKkYFsxqaluB7xDl
	 jVMuwo8WH6P/7mgwN5MiOslY2A8X0/kNhF1Bun2tWfkp0wY18Uq7HATlmjnkpPbcn47mC
	 D62qeiIM/fBRnUvs3bYkbvjtRR3RCEccZw50KU0/YtA12IwTvOVdEsv0wAoT49DCE2XpE
	 /3QKhxWNs+CZIhDBu/6RGabkJeR6k9K4BtLaWnU544UZQXvSBDvVaxOuTXFBkyYt7P5Ib
	 xcit9Am1k0Orj6y4eH2Vs7rBc/jrLG5gJ5+RhhnQF4Hz576kJniZJw6p1ZNbE3hQobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HhUr6++cEdzdu7aXmazmu5lx8Sa5k32R+7mO7JewGbg=;
	b=UHnZ+y6HtHu0FAJtzrYYuc+sbBoV2kqD31gaJpemwRtuuIO4KOkdg3pm6LJMHXJ5uGSn
	 n5t8bOQUCiq5HoWi//DnPnOmn/xO1VZvl4r+XLcvnQKqLuxKRFdZN/0nZ9mSAd8VSvOy5
	 pV16t190+WlKNhr/Nh5guLBuMk1XrkzEa3rXUVy88Z0gyZ0q3OoKbwqPQNNVvROzzTVng
	 HpKRd41tBxycn3b7jfUXRI2aoLKq/GDl2obcJPyzDzdMxmgJjbsDcIQoi7SXoeoIAT9iW
	 pOkM13VBqP8TBrx2uucxrMW69l7GBzk5gYXnlCw2/PQfwsYoFiYKhGieb4TrwZRHiAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=aOdGraAv;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36BC606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36BC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=aOdGraAv
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3294033a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794362370; x=1794967170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhUr6++cEdzdu7aXmazmu5lx8Sa5k32R+7mO7JewGbg=;
        b=aOdGraAvbilQamH/nwGdpN9DOpt0IvJwwUYwfP2vG0lFw2A4pCCfPdRRBIhH888i/6
         VknDBNGoqF5+zY+BDQfEY7HjWvblNOzeCZaqjaGF71YSNZKbWC1afWOCBL/pSzObD7/A
         EK8ll88LQwHE4597BFtvLckQs1U42IrRMvrSBupC6A96xw2MCBn9X5kjVOq6odZ0EvlH
         3jx1jIOx76ktQcvZO3fccMWavFXKW6BmOe5Zo07JSo1hwbHjtqrcES7GflQvFuL9vS9g
         /AB6OTtlyO5J0Via92/g2/KBs5VFRb7D5mF60eYRt9YL1NKuCi0Nksf0F59kAOMpHNEH
         TmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362370; x=1794967170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhUr6++cEdzdu7aXmazmu5lx8Sa5k32R+7mO7JewGbg=;
        b=H8ev3uyW6s7vgj8+XFI50YB0n3SPDunEUQTe5zXwudeASxvE05aLeb4ajuTCpicNfo
         MmvOg/pdxt+XbPyk2Bp6Tfp3LzYI16RJxG5ty492wAWf3lEx6xqhqvuZ1gLLbT7REwc6
         4KHqgmSfbTkTFa15lZkYrCM8s+gkYeSP3bkUvA6RGkMTz2nYFg4UZ4gSoaBxerrwnF84
         ZhmRxGMkyUinssSJhUAgMYcloBy0oL4tUl2CzFa1AUwkHIbs6rHjReT929qACg3RMGtP
         C0Wd3kEzl3l48b91V8Ba1YU5Ca6Dgu/fmcnwq/hF9lWrHiX44zsLa9Sohe0R6nKB+r6L
         m54Q==
X-Forwarded-Encrypted: i=1; AL+hErEAH9Y3QPPDyoUTSMNpKiLjKo6cSM4bLAr5siNNx3CkiqFQWux5uGkNPgrnQODFhkl6UXsBa0vv6KjPdky0Qzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WKlBPgYWoeMBUcsxjLtKGIGX0bOSDoAMB7+WZbciU0NG9ktLz
	4xRlVca4bQKMfoF225tTrOBCmlYLCfhex3MdfbUe5QKJzQAZbhb2dJZOBLwKEf6Qwcw=
X-Gm-Gg: AYBFou1JlnwRMjM6HpDpoWexaof1nQd2UmTr4WEFqOPuueuwpaptBgQGb90c6w0s+Sp
	BJj3buJFQ2QTEaYFBfkim75Zvr8hxmC72bJCh0oy+hDGnx4PIM3VXJw/IUgOp81ntCtjITzYBa+
	87nrCklpBgIo1GN7/zE+PNWcfkgbuOpnD4H3ITOTpuDjMQNS/BWZNQIvyo0DbmukNDIRt2hXBVw
	UehUFzx/M+2/qWlni50IjWQ3OJWyygtIsTrpSMhcHDDZdBb4r+nPULl0r8cP7xmngtYWUqQw6Og
	fhk66PmfC0LcC9eKGVvb3/2fb+iGTBHgttIonPvcMtw2eI5UhUx5CP9NphijQ1OwJFUmdI334yz
	A/8POqpFtYXquCj+13+YXpUJsz58UQnExQNolES10N0fqgSxE36HZzESMsva9ghOd4GTn+Br9Ce
	gEVcFuO2a4xdGPagS3mRZl9XwXo4Ga9BqnlYNPgrFFbrAMfP/pBrN7R4y0oJrUC+G90nMrQCPNP
	9S++OwwsKmnb2ibzQT/mnHSgr07His8YsWswXcTl2dJrqL4ma5qqTv9AJSrIFVNjQdCzPFG4GSU
	j8LleUK6tGQaZ4yD1gRTG33eqBg/7Ja4aDiqV6MxwwU0oLSl92SQLUsigg==
X-Received: by 2002:a17:906:9c86:b0:c50:5996:5b89 with SMTP id a640c23a62f3a-c5066b3aa67mr65463266b.23.1794362370268;
        Tue, 10 Nov 2026 17:59:30 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm147498a12.12.2026.11.10.17.59.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 17:59:28 -0800 (PST)
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
Subject: [PATCH net-next v2 1/3] veth: refactor NAPI enable paths
Date: Wed, 11 Nov 2026 01:59:20 +0000
Message-ID: <20261111015922.67745-2-tianyi@cloudflare.com>
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

veth_enable_xdp_range() adds the NAPI instances itself, only to pass
rq->xdp_napi.napi_id as the napi_id argument of xdp_rxq_info_reg(). That
argument is unused in __xdp_rxq_info_reg() since commit 5ef44b3cb43b
("xsk: Bring back busy polling support"). Pass 0 instead, as ena, bnxt
and fec already do.

veth_enable_xdp_range() then no longer needs the NAPI instances. Move
netif_napi_add() from it and from veth_napi_enable_range() into
__veth_napi_enable_range(). Add each instance in the loop that enables
it, after the allocations that can fail. Drop the napi_already_on and
delete_napi arguments.

veth_napi_enable_range() and veth_napi_enable() are then trivial
wrappers. Remove them, and rename __veth_napi_enable_range() and
__veth_napi_enable() to veth_napi_enable_range() and veth_napi_enable().

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/veth.c | 80 +++++++++++-----------------------------------
 1 file changed, 18 insertions(+), 62 deletions(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 0539b3661793..f5097696df15 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1037,7 +1037,7 @@ static int veth_create_page_pool(struct veth_rq *rq)
 	return 0;
 }
 
-static int __veth_napi_enable_range(struct net_device *dev, int start, int end)
+static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 {
 	struct veth_priv *priv = netdev_priv(dev);
 	int err, i;
@@ -1059,6 +1059,7 @@ static int __veth_napi_enable_range(struct net_device *dev, int start, int end)
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
 
+		netif_napi_add(dev, &rq->xdp_napi, veth_poll);
 		rcu_assign_pointer(rq->xdp_prog, priv->_xdp_prog);
 		napi_enable(&rq->xdp_napi);
 		rcu_assign_pointer(priv->rq[i].napi, &priv->rq[i].xdp_napi);
@@ -1079,9 +1080,9 @@ static int __veth_napi_enable_range(struct net_device *dev, int start, int end)
 	return err;
 }
 
-static int __veth_napi_enable(struct net_device *dev)
+static int veth_napi_enable(struct net_device *dev)
 {
-	return __veth_napi_enable_range(dev, 0, dev->real_num_rx_queues);
+	return veth_napi_enable_range(dev, 0, dev->real_num_rx_queues);
 }
 
 static void veth_napi_del_range(struct net_device *dev, int start, int end)
@@ -1122,8 +1123,7 @@ static bool veth_gro_requested(const struct net_device *dev)
 	return !!(dev->wanted_features & NETIF_F_GRO);
 }
 
-static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
-				 bool napi_already_on)
+static int veth_enable_xdp_range(struct net_device *dev, int start, int end)
 {
 	struct veth_priv *priv = netdev_priv(dev);
 	int err, i;
@@ -1131,9 +1131,7 @@ static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
 
-		if (!napi_already_on)
-			netif_napi_add(dev, &rq->xdp_napi, veth_poll);
-		err = xdp_rxq_info_reg(&rq->xdp_rxq, dev, i, rq->xdp_napi.napi_id);
+		err = xdp_rxq_info_reg(&rq->xdp_rxq, dev, i, 0);
 		if (err < 0)
 			goto err_rxq_reg;
 
@@ -1151,21 +1149,13 @@ static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
 err_reg_mem:
 	xdp_rxq_info_unreg(&priv->rq[i].xdp_rxq);
 err_rxq_reg:
-	if (!napi_already_on)
-		netif_napi_del(&priv->rq[i].xdp_napi);
-	for (i--; i >= start; i--) {
-		struct veth_rq *rq = &priv->rq[i];
-
-		xdp_rxq_info_unreg(&rq->xdp_rxq);
-		if (!napi_already_on)
-			netif_napi_del(&rq->xdp_napi);
-	}
+	for (i--; i >= start; i--)
+		xdp_rxq_info_unreg(&priv->rq[i].xdp_rxq);
 
 	return err;
 }
 
-static void veth_disable_xdp_range(struct net_device *dev, int start, int end,
-				   bool delete_napi)
+static void veth_disable_xdp_range(struct net_device *dev, int start, int end)
 {
 	struct veth_priv *priv = netdev_priv(dev);
 	int i;
@@ -1175,9 +1165,6 @@ static void veth_disable_xdp_range(struct net_device *dev, int start, int end,
 
 		rq->xdp_rxq.mem = rq->xdp_mem;
 		xdp_rxq_info_unreg(&rq->xdp_rxq);
-
-		if (delete_napi)
-			netif_napi_del(&rq->xdp_napi);
 	}
 }
 
@@ -1188,14 +1175,15 @@ static int veth_enable_xdp(struct net_device *dev)
 	int err, i;
 
 	if (!xdp_rxq_info_is_reg(&priv->rq[0].xdp_rxq)) {
-		err = veth_enable_xdp_range(dev, 0, dev->real_num_rx_queues, napi_already_on);
+		err = veth_enable_xdp_range(dev, 0, dev->real_num_rx_queues);
 		if (err)
 			return err;
 
 		if (!napi_already_on) {
-			err = __veth_napi_enable(dev);
+			err = veth_napi_enable(dev);
 			if (err) {
-				veth_disable_xdp_range(dev, 0, dev->real_num_rx_queues, true);
+				veth_disable_xdp_range(dev, 0,
+						       dev->real_num_rx_queues);
 				return err;
 			}
 		}
@@ -1220,35 +1208,7 @@ static void veth_disable_xdp(struct net_device *dev)
 	if (!netif_running(dev) || !veth_gro_requested(dev))
 		veth_napi_del(dev);
 
-	veth_disable_xdp_range(dev, 0, dev->real_num_rx_queues, false);
-}
-
-static int veth_napi_enable_range(struct net_device *dev, int start, int end)
-{
-	struct veth_priv *priv = netdev_priv(dev);
-	int err, i;
-
-	for (i = start; i < end; i++) {
-		struct veth_rq *rq = &priv->rq[i];
-
-		netif_napi_add(dev, &rq->xdp_napi, veth_poll);
-	}
-
-	err = __veth_napi_enable_range(dev, start, end);
-	if (err) {
-		for (i = start; i < end; i++) {
-			struct veth_rq *rq = &priv->rq[i];
-
-			netif_napi_del(&rq->xdp_napi);
-		}
-		return err;
-	}
-	return err;
-}
-
-static int veth_napi_enable(struct net_device *dev)
-{
-	return veth_napi_enable_range(dev, 0, dev->real_num_rx_queues);
+	veth_disable_xdp_range(dev, 0, dev->real_num_rx_queues);
 }
 
 static void veth_disable_range_safe(struct net_device *dev, int start, int end)
@@ -1260,7 +1220,7 @@ static void veth_disable_range_safe(struct net_device *dev, int start, int end)
 
 	if (priv->_xdp_prog) {
 		veth_napi_del_range(dev, start, end);
-		veth_disable_xdp_range(dev, start, end, false);
+		veth_disable_xdp_range(dev, start, end);
 	} else if (veth_gro_requested(dev)) {
 		veth_napi_del_range(dev, start, end);
 	}
@@ -1275,17 +1235,13 @@ static int veth_enable_range_safe(struct net_device *dev, int start, int end)
 		return 0;
 
 	if (priv->_xdp_prog) {
-		/* these channels are freshly initialized, napi is not on there even
-		 * when GRO is requeste
-		 */
-		err = veth_enable_xdp_range(dev, start, end, false);
+		err = veth_enable_xdp_range(dev, start, end);
 		if (err)
 			return err;
 
-		err = __veth_napi_enable_range(dev, start, end);
+		err = veth_napi_enable_range(dev, start, end);
 		if (err) {
-			/* on error always delete the newly added napis */
-			veth_disable_xdp_range(dev, start, end, true);
+			veth_disable_xdp_range(dev, start, end);
 			return err;
 		}
 	} else if (veth_gro_requested(dev)) {
-- 
2.56.0

