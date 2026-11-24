Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554293;
	b=BSlOX03q/IgPSNFBKaBSH6unu19wEO2aJg8rc/IRqtYfQGMjmbN9sPKvEWOj6cXjl6LX
	 oBB1pU45CTg4TnpID69uhubR59Ral6zkMKx7GUcmJPLJ784GgLkB5CAyFD9aczKuC92gx
	 AtSGoy1ySFSORB0+OX8mDBkcTCsh3cj2OhK4UBzgYMzY8hpDhiF8IU6aEoj48TwY/7nUO
	 CX72sw/rWJlOePE8cWeQEtjn1Y7G+UUfnZYJJ3TNtbXSGUxWMqN4Lc+4A5bAE+aNXCeGQ
	 lM3riwTSvW3bSetE3zBpb5SsK/W3cTrWHN7HsetdK6spffpFoVENYKXlkGvOj8NwDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=ZF0ZEZpoHEm8FUy6RriCEdgOQWszqmxkXH9zAhTRnuM=;
	b=OL9Ha49r5TKVoyOYITDnJqI1c/KlkbnKQlk41w0jmzgHfavHRLGjrKgSj2SvCrn8iUrg
	 C9AS81yvjAOBn1F4L7LOGM10u7qE3W+RsmBgcsbhjUHdXLOS0xDVy7khKQQYwoRyU7E/h
	 TDfyf6NJTTU6Fh/j524RYdfeHoSBWr/xzyp3UXTsKle7jz4+/H6s2sha/SyglJ2L5rJ6f
	 7q2soS6bQkEQmpZ9Tf40oXmrrhaRrcCOn3bT2frb2xLFy7vH1NRQZyMoX7yxLdpMeC3bf
	 Yix+ztUUcYHBzRpXObja/GchRPJKwxNm+sso5EPyIfxeKFjLSpkr8WxZQbyShtaxBuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g28aLKz1;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9BF606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g28aLKz1
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2645496a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554292; x=1796159092; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZF0ZEZpoHEm8FUy6RriCEdgOQWszqmxkXH9zAhTRnuM=;
        b=g28aLKz1/vk1teVjbcIPkNcd+jviH35OTnSBF4Aur2p/SgxXayaDiC3/qrqEP+QOzW
         fruQkmxUBLokFnvIFLbz9oO4LVNt6Ep0DE7iSFPn//1QvfIoqRvRwEJ+HyE6jFt7njYg
         BJ6xQdHpiE/rQ9WA4Kn0BLemn3L0Cd7YGiyIA3YatPo2y5a82nWPdN6ku28bU5++AnGe
         H0yVPn7P3MRaxiSafIjCFPNpxz1+UF9MjBGBBPpQQAhNLwdlSyONyn19Vizm3lEeLCQO
         K08v8jDFUyHfvOq16BkK7K7Rk2eIFXpJ0ecLYayPCW36+Zhmo7lJnl1TZ/cjXp3/f2uU
         uomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554292; x=1796159092;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZF0ZEZpoHEm8FUy6RriCEdgOQWszqmxkXH9zAhTRnuM=;
        b=nPwznah7hYBMGc77vi6L3B8mf6FX0UmwMDIEZarRIgWyq480N+QWD+RQTiqxW+iQzg
         EOKdGHaEcjMy6KyEvR2s3fxKbugkbJC/ZaS/FDfFYYC4ITNPXFQGPy4tMBemQd/bICUS
         mhEbewUi3UaU/MEvQdr7Au7HMdRRVCbNOJ0s/v8nFpV6L3HukLDo06IkQP0zgAUb+lx1
         fVfbgJfPFhTW9V4HnDRi+1b/eJgx3QaIFFpiKdKuXxiyWxLsNHET0yyNbgLvvtT4rjqZ
         URBDqjrCdrX3JQbsnSDkgt2+hRehwm/S6Zw6hs2V4lLT2h7c2YQ6Xne2aXnPxAsDmhF9
         9+Hg==
X-Forwarded-Encrypted: i=1; AL+hErHacYqUPQwsNDkBxeiis9o9W5rsX9nNUTyPP8B2fp27CvQTftnqI/MEBAVcsWtXirhfYqOY+kBTri2XZHh97TY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qqZV7wjrMotK95mSrtViSgTHdX1+/O6ok9umqkWRgy2w8lmcD
	elI8T6vBzb2MQ5pqk44fQo8DXHvuymhgRez0DYyo95vgw25QQUCVjDG0
X-Gm-Gg: AZFdTZeKMoQMpa4Zzwq0wBuX6dPKoXZZrVLqB3SEwbk9wv7XcnnnPzciS3H1WqMAFly
	YQuMhe9WB0GwhqUlIsNYqQpO+Gsgpp0Mvt4BLql5kj9jXXPchSJUKESXwo/nI7L0yaZkeg/CTiR
	pzpPb3lCCXAO6wn9cPDsAaEXpVqt+Ejp2iW8ruPYBe2kIZgL4yBfmVDR8zoB4b6CTvuWh7FdOQ8
	/v6hkHonNJ0u5fYwG3ua+xcd8JkrIItf/WGK5x3YrBvB3WBsZN6zatR8K4Dk9rw/wDP0PnvuJkg
	tBsuDIogaVzAe8VzmgoSJm7R4YS3BUHB+Qs5RW4/PG8rptST6q9yWtF8NfKKAsbQ7gb7u50a6mt
	j8eEbaID4Y+GBM8EBJr24jLzaCzcgA/ysmzucpORr/jZYB6OsG+hdlN7Z2ujz5rOgNjhogWpUZ/
	WKJiYmPXxivTk/2bdURABVcmDCLGbUD+RAx3bp3dsnlKDRiKIhfQ3Bj0JmYWQ4JWLKcCH+LrImc
	SBjyQMmzsOdJ1z+u9mEuagvZi4ahKg3lLzXF4BszL3wbuL9Y+z7QB4jaxQUAHcns4+z+XFbIM47
	QIxks7kNZu+D1OeP3CCc5LflAiIFB1agjErEmeMsxYFVmru9gnc92h9ixFZEH0y7hZQPXfMa20G
	R6qPAdIfNQgQ+hTC6LPLhmsZ1KurpA1Ly3w==
X-Received: by 2002:a17:90b:3e81:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b41c92a389mr12844093a91.40.1795554292022;
        Tue, 24 Nov 2026 13:04:52 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm25947628a91.16.2026.11.24.13.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 13:04:51 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 21:04:50 +0000
Message-Id: <DN3QVHST3PUQ.3NINFUW0FL9IW@gmail.com>
Cc: <bpf@vger.kernel.org>, <netdev@vger.kernel.org>, "Maciej Fijalkowski"
 <maciej.fijalkowski@intel.com>, "Tianyi Gao" <tianyi@cloudflare.com>,
 "Octavian Purdila" <tavip@google.com>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Alexander
 Lobakin" <aleksander.lobakin@intel.com>, "Ilias Apalodimas"
 <ilias.apalodimas@linaro.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "Lorenzo Bianconi" <lorenzo.bianconi@oss.qualcomm.com>, "Magnus Karlsson"
 <magnus.karlsson@intel.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "Simon Horman" <horms@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v8 bpf 0/7] xdp: fix page_pool leaks
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Slawomir Stepien" <sst@poczta.fm>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "David S . Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Stanislav Fomichev"
 <sdf@fomichev.me>
In-Reply-To: <20261124104016.532341-1-sst@poczta.fm>
References: <20261124104016.532341-1-sst@poczta.fm>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 02:40 AM Slawomir Stepien <sst@poczta.fm> wrote:
> Patch 1 prepares bpf_prog_test_run_xdp() for patch 3. Generic XDP runs
> on the rxq info of the device queue, which is shared with test_run; with
> patch 3 alone, any packet through generic XDP on lo makes later
> multi-buffer test runs free their frags as page_pool pages. Restoring

The store into the shared rxq is the problem.
Patch 3 does it for every packet on every CPU, for linear skbs too.
The comment in include/net/xdp.h says that rxq must not be updated
during NAPI poll.
On Dudu's patch I proposed to put rxq on stack:
https://lore.kernel.org/bpf/DMAP8LNBJRPN.2THUHLKURP25G@gmail.com/
It works for veth too.
An skb leaves veth as a MEM_TYPE_PAGE_SHARED frame, like today.
No need for xdp_convert_skb_to_buff(), veth_xdp_get_pp(), pp_cow,
rq->xdp_mem and patch 6.

Patches 6 and 7 never free a page_pool frag. Jiayuan's test does:
https://lore.kernel.org/bpf/20260911135711.109338-3-jiayuan.chen@linux.dev/

Below replaces patches 1-5.

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index faa837a..8bb015c 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -63,7 +63,6 @@ struct veth_rq {
 	struct napi_struct __rcu *napi; /* points to xdp_napi when the latter is initialized */
 	struct net_device	*dev;
 	struct bpf_prog __rcu	*xdp_prog;
-	struct xdp_mem_info	xdp_mem;
 	struct veth_rq_stats	stats;
 	bool			rx_notify_masked;
 	struct ptr_ring		xdp_ring;
@@ -642,6 +641,7 @@ static int veth_xdp_tx(struct veth_rq *rq, struct xdp_buff *xdp,
 }
 
 static struct xdp_frame *veth_xdp_rcv_one(struct veth_rq *rq,
+					  struct xdp_rxq_info *rxq,
 					  struct xdp_frame *frame,
 					  struct veth_xdp_tx_bq *bq,
 					  struct veth_stats *stats)
@@ -657,7 +657,8 @@ static struct xdp_frame *veth_xdp_rcv_one(struct veth_rq *rq,
 		u32 act;
 
 		xdp_convert_frame_to_buff(frame, xdp);
-		xdp->rxq = &rq->xdp_rxq;
+		rxq->mem.type = frame->mem_type;
+		xdp->rxq = rxq;
 		vxbuf.skb = NULL;
 
 		act = bpf_prog_run_xdp(xdp_prog, xdp);
@@ -669,7 +670,6 @@ static struct xdp_frame *veth_xdp_rcv_one(struct veth_rq *rq,
 			break;
 		case XDP_TX:
 			orig_frame = *frame;
-			xdp->rxq->mem.type = frame->mem_type;
 			if (unlikely(veth_xdp_tx(rq, xdp, bq) < 0)) {
 				trace_xdp_exception(rq->dev, xdp_prog, act);
 				frame = &orig_frame;
@@ -681,7 +681,6 @@ static struct xdp_frame *veth_xdp_rcv_one(struct veth_rq *rq,
 			goto xdp_xmit;
 		case XDP_REDIRECT:
 			orig_frame = *frame;
-			xdp->rxq->mem.type = frame->mem_type;
 			if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
 				frame = &orig_frame;
 				stats->rx_drops++;
@@ -746,6 +745,9 @@ static void veth_xdp_get(struct xdp_buff *xdp)
 	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
 	int i;
 
+	/* the buff holds plain page references from here on */
+	xdp->rxq->mem.type = MEM_TYPE_PAGE_SHARED;
+
 	get_page(virt_to_page(xdp->data));
 	if (likely(!xdp_buff_has_frags(xdp)))
 		return;
@@ -755,6 +757,7 @@ static void veth_xdp_get(struct xdp_buff *xdp)
 }
 
 static int veth_convert_skb_to_xdp_buff(struct veth_rq *rq,
+					struct xdp_rxq_info *rxq,
 					struct xdp_buff *xdp,
 					struct sk_buff **pskb)
 {
@@ -773,7 +776,9 @@ static int veth_convert_skb_to_xdp_buff(struct veth_rq *rq,
 	/* SKB "head" area always have tailroom for skb_shared_info */
 	frame_sz = skb_end_pointer(skb) - skb->head;
 	frame_sz += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
-	xdp_init_buff(xdp, frame_sz, &rq->xdp_rxq);
+	/* the prog can free only frags and they came from skb_pp_cow_data() */
+	rxq->mem.type = MEM_TYPE_PAGE_POOL;
+	xdp_init_buff(xdp, frame_sz, rxq);
 	xdp_prepare_buff(xdp, skb->head, skb_headroom(skb),
 			 skb_headlen(skb), true);
 
@@ -794,6 +799,7 @@ drop:
 }
 
 static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
+					struct xdp_rxq_info *rxq,
 					struct sk_buff *skb,
 					struct veth_xdp_tx_bq *bq,
 					struct veth_stats *stats)
@@ -815,7 +821,7 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
 	}
 
 	__skb_push(skb, skb->data - skb_mac_header(skb));
-	if (veth_convert_skb_to_xdp_buff(rq, xdp, &skb))
+	if (veth_convert_skb_to_xdp_buff(rq, rxq, xdp, &skb))
 		goto drop;
 	vxbuf.skb = skb;
 
@@ -830,7 +836,6 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
 	case XDP_TX:
 		veth_xdp_get(xdp);
 		consume_skb(skb);
-		xdp->rxq->mem = rq->xdp_mem;
 		if (unlikely(veth_xdp_tx(rq, xdp, bq) < 0)) {
 			trace_xdp_exception(rq->dev, xdp_prog, act);
 			stats->rx_drops++;
@@ -842,7 +847,6 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq *rq,
 	case XDP_REDIRECT:
 		veth_xdp_get(xdp);
 		consume_skb(skb);
-		xdp->rxq->mem = rq->xdp_mem;
 		if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
 			stats->rx_drops++;
 			goto err_xdp;
@@ -914,6 +918,11 @@ static int veth_xdp_rcv(struct veth_rq *rq, int budget,
 			struct veth_xdp_tx_bq *bq,
 			struct veth_stats *stats)
 {
+	struct veth_priv *priv = netdev_priv(rq->dev);
+	struct xdp_rxq_info rxq = {
+		.dev = rq->dev,
+		.queue_index = rq - priv->rq,
+	};
 	int i, done = 0, n_xdpf = 0;
 	void *xdpf[VETH_XDP_BATCH];
 
@@ -928,7 +937,7 @@ static int veth_xdp_rcv(struct veth_rq *rq, int budget,
 			struct xdp_frame *frame = veth_ptr_to_xdp(ptr);
 
 			stats->xdp_bytes += xdp_get_frame_len(frame);
-			frame = veth_xdp_rcv_one(rq, frame, bq, stats);
+			frame = veth_xdp_rcv_one(rq, &rxq, frame, bq, stats);
 			if (frame) {
 				/* XDP_PASS */
 				xdpf[n_xdpf++] = frame;
@@ -943,7 +952,7 @@ static int veth_xdp_rcv(struct veth_rq *rq, int budget,
 			struct sk_buff *skb = ptr;
 
 			stats->xdp_bytes += skb->len;
-			skb = veth_xdp_rcv_skb(rq, skb, bq, stats);
+			skb = veth_xdp_rcv_skb(rq, &rxq, skb, bq, stats);
 			if (skb) {
 				if (skb_shared(skb) || skb_unclone(skb, GFP_ATOMIC))
 					netif_receive_skb(skb);
@@ -1149,9 +1158,6 @@ static int veth_enable_xdp_range(struct net_device *dev, int start, int end,
 						 NULL);
 		if (err < 0)
 			goto err_reg_mem;
-
-		/* Save original mem info as it can be overwritten */
-		rq->xdp_mem = rq->xdp_rxq.mem;
 	}
 	return 0;
 
@@ -1180,7 +1186,6 @@ static void veth_disable_xdp_range(struct net_device *dev, int start, int end,
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
 
-		rq->xdp_rxq.mem = rq->xdp_mem;
 		xdp_rxq_info_unreg(&rq->xdp_rxq);
 
 		if (delete_napi)
diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d6c9dc6..1d89b6f 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -1349,6 +1349,7 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	struct netdev_rx_queue *rxqueue;
 	struct skb_shared_info *sinfo;
 	struct xdp_buff xdp = {};
+	struct xdp_rxq_info rxq;
 	int i, ret = -EINVAL;
 	struct xdp_md *ctx;
 	void *data;
@@ -1417,8 +1418,7 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	}
 
 	rxqueue = __netif_get_rx_queue(current->nsproxy->net_ns->loopback_dev, 0);
-	rxqueue->xdp_rxq.frag_size = PAGE_SIZE;
-	xdp_init_buff(&xdp, rxqueue->xdp_rxq.frag_size, &rxqueue->xdp_rxq);
+	xdp_init_buff(&xdp, PAGE_SIZE, &rxqueue->xdp_rxq);
 	xdp_prepare_buff(&xdp, data, headroom, linear_sz, true);
 	sinfo = xdp_get_shared_info_from_buff(&xdp);
 
@@ -1426,6 +1426,11 @@ int bpf_prog_test_run_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
 	if (ret)
 		goto free_data;
 
+	/* generic XDP uses the same rxq and its frags can be smaller */
+	rxq = *xdp.rxq;
+	rxq.frag_size = PAGE_SIZE;
+	xdp.rxq = &rxq;
+
 	size = linear_sz;
 	if (unlikely(kattr->test.data_size_in > size)) {
 		void __user *data_in = u64_to_user_ptr(kattr->test.data_in);
diff --git a/net/core/dev.c b/net/core/dev.c
index 6140fd9..fe9f222 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5684,6 +5684,7 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, struct xdp_buff *xdp,
 	void *orig_data, *orig_data_end, *hard_start;
 	struct netdev_rx_queue *rxqueue;
 	bool orig_bcast, orig_host;
+	struct xdp_rxq_info rxq;
 	u32 mac_len, frame_sz;
 	__be16 orig_eth_type;
 	struct ethhdr *eth;
@@ -5707,6 +5708,13 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, struct xdp_buff *xdp,
 	if (skb_is_nonlinear(skb)) {
 		skb_shinfo(skb)->xdp_frags_size = skb->data_len;
 		xdp_buff_set_frags_flag(xdp);
+		/*
+		 * The frags came from skb_pp_cow_data(). xdp_rxq is shared
+		 * with other CPUs and with BPF_PROG_TEST_RUN, so use a copy.
+		 */
+		rxq = rxqueue->xdp_rxq;
+		rxq.mem.type = MEM_TYPE_PAGE_POOL;
+		xdp->rxq = &rxq;
 	} else {
 		xdp_buff_clear_frags_flag(xdp);
 	}
@@ -5719,6 +5727,7 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, struct xdp_buff *xdp,
 	orig_eth_type = eth->h_proto;
 
 	act = bpf_prog_run_xdp(xdp_prog, xdp);
+	xdp->rxq = &rxqueue->xdp_rxq;
 
 	/* check if bpf_xdp_adjust_head was used */
 	off = xdp->data - orig_data;

pw-bot: cr
