Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF938F624
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213125; cv=none; b=KR/W7EGyKpRrqr8SJkVnyMIEBSVMqcsQtfpktogEVg0uRHJgqJ3W8ZpzDaDjMnwQApBGYIso7VKLY9Ek6K7jXbVqpPqm6zJsH7DoPos4BTO7HzaqUHzVKeDy8w4TkcFBBPNCkt0lryNlKC5ewA5LyL2CbPThYKy6cmqBJwrdfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213125; c=relaxed/simple;
	bh=Vqr2T+pAGvS4B2S/igN6uZz1bzPoPaAuFk3laQUpdbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doAZ9/Lm0e4CzYZjxwrW8WvweL7/Hq9s6c4N4pVAMKCm5S4sA68/P7d7gTU+hhiH4sKkwQ+sXiiGHUsvzGQt/HChUFBEFkM9TdVeJkXX6+6f13CiR0oZqOQVC3mDumfq173B3WHJ8a5gyxiXrN46b7NkcNhkmhRD7+M0ELOLtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8ymK2Kr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8ymK2Kr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso371700e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213118; x=1788817918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rk6J7+EqI01O7WAeHSssesqmqhnxRq/0S1+yQRl3tCs=;
        b=o8ymK2Kr09jIfBw8ePUnWIAe79SHtvHP65N9uvN4hXX/zwtUuPWshh1k729y48QUod
         8RdCV/eNabxQ6JrVTYMoij+aNRRG5gTgtwO7rpvyYJNaeip98TMH9L1snEzVE+PkSKIk
         ARu/JPTgnqbXcCTdw7Z++YQv4M5YBfPoziZZ58cGyp/a3UVQocX7xtUJ6LsyVdSbvLzE
         09zJM3bo8Pa+sglARW/APU0wQdEyi6U/lSoK7IYe4RI+ERstUP7YFBgwmLCUoAubT5dz
         75bNrixlIV2HWLp81bPFbvYdo8Wx8ogGB1wdZTGf6xQIU6gvYvS7FMIjK0w67uw/efJI
         fGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213118; x=1788817918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rk6J7+EqI01O7WAeHSssesqmqhnxRq/0S1+yQRl3tCs=;
        b=Lrq0PvWwuu6aELotQSgn/RH1l1yF4Immd8p+5m9fonUj3IeEPrRbtXm4LYPZZQ//2L
         1jr+5LD5DXPfOdrf2t0O9icjjdc5cxHQCIyfBQWnarJS8gg/fzWnul38xyKhpXStBvo+
         HkV9vk7c4w/9Ua9Ru5AYO6htMiv+KQ6EaWsIzAIOp3eGcjLDKs+R9hw7KXXYF3Ft2qpo
         C7IJ6jnF8lZdbgFpmQRBM+nya880wAO/NqQrwGU+zaY4OkA0uVQ4t8Jf262sAdCZ3laT
         9Ez/fBKp4Sz9cnkaeJvoCoXyRW9r8+lTseVl9Sb2U1RCD3NhFaQoEwfFkHC+DHEEv70c
         P6GA==
X-Forwarded-Encrypted: i=1; AKwUvBzzhq97y5nIspIeR4wFscEWqSrZYBy2Fo00Kf4L+XAUb4rgUhKSgK/jQeCXNbVb1WdN49o3zExQ8gmvtUM84hA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwjRkAPcrQNwt8GbvMNy/PZ+LLyylVadbK0DvhNXJd1dXO4XYB
	XXrdL5r/kZKh7Gc5sruQasFGvaZ82nCpGDWm0OlS3ldLwJXehgabMwig
X-Gm-Gg: AYBFou1LEzu5V5PAjZxAk/a39uVMSawALJLnPz+qDUnaHmxSJAVOye3CSGcbZU1PrW7
	OAvy/WEhg/1nQrfSIGFeC0unIvvlM1K65i2v1A8LG+6eaxAxa/0lSi3l8iFJJjO0xw7nXlNu4aN
	uSy8+ExMuCQgD+8URgtDRFwDjOeagqfs6H8/RPfouZTboO8rKJ0GO+sPIM7hZrjT81TA73pX2aa
	7PhxnlR8CfLeiVKBiNJ8atpBaAwkUjPXSy5pCNhlz4s+yqYzmbctcJTHEQrIqzdWTg7Cy7GWINp
	w6IGZV2p8XmKTvugsewPOo2aUYwWst0KSv8dbvmUgUFHhnyQ3FH6EYtvanJYfoqXfl8U4DVvGeU
	E1v1wDEioGBTgpBHNXLNftrk+ZT04gCmy3mCQwr0vCRBWnky8eFo8RwTSy0HLEEmIta48EyhB4q
	fcWjTIF3YYXxHXqOESoNQGnshNANfTi1YEZSlg6Id2VS3KwNYRYmuyJKxGhuoXV8gKNP4erzMRo
	/1VhzS6R4Q2ElthN0sfhWcAdKhmza4TrQ==
X-Received: by 2002:a05:6512:3b0d:b0:5b4:74c4:4723 with SMTP id 2adb3069b0e04-5b5ff425e99mr293164e87.9.1788213118262;
        Mon, 31 Aug 2026 14:51:58 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:57 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 05/11] ip_gre: add drop reasons to the RX path
Date: Tue,  1 Sep 2026 00:51:31 +0300
Message-ID: <20260831215137.549324-6-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A packet that reaches gre_rcv() and does not belong to any tunnel is
dropped, after an ICMP port unreachable is sent back, with a plain
kfree_skb().  This is the GRE counterpart of a UDP packet hitting no
socket, and by far the most common way a GRE packet is dropped on
receive, yet nothing tells it apart from a malformed one.

Add SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND for it, in the spirit of the
existing SKB_DROP_REASON_VXLAN_VNI_NOT_FOUND, and report it from
erspan_rcv() and __ipgre_rcv() through a new output parameter, so that a
failed lookup is not reported the same way as a header that could not be
pulled or as a metadata allocation failure.

The header pull failures reuse SKB_DROP_REASON_HDR_TRUNC and the
metadata allocation failures reuse SKB_DROP_REASON_NOMEM.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  6 ++++++
 net/ipv4/ip_gre.c             | 37 +++++++++++++++++++++++------------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 8efa682601f0..d1fb52c1b0cb 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -132,6 +132,7 @@
 	FN(IP_TUNNEL_OLD_SEQ)		\
 	FN(GRE_INVALID_HDR)		\
 	FN(GRE_CSUM)			\
+	FN(GRE_TUNNEL_NOT_FOUND)	\
 	FNe(MAX)
 
 /**
@@ -631,6 +632,11 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_GRE_INVALID_HDR,
 	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
 	SKB_DROP_REASON_GRE_CSUM,
+	/**
+	 * @SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND: no GRE tunnel found for the
+	 * endpoints and the key the packet carries.
+	 */
+	SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 1894c5746a73..4d9bb6d186ae 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -265,7 +265,7 @@ static bool is_erspan_type1(int gre_hdr_len)
 }
 
 static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		      int gre_hdr_len)
+		      int gre_hdr_len, enum skb_drop_reason *reason)
 {
 	struct net *net = dev_net(skb->dev);
 	struct metadata_dst *tun_dst = NULL;
@@ -289,8 +289,10 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 					  iph->saddr, iph->daddr, 0);
 	} else {
 		if (unlikely(!pskb_may_pull(skb,
-					    gre_hdr_len + sizeof(*ershdr))))
+					    gre_hdr_len + sizeof(*ershdr)))) {
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return PACKET_REJECT;
+		}
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + gre_hdr_len);
 		ver = ershdr->ver;
@@ -306,8 +308,10 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		else
 			len = gre_hdr_len + erspan_hdr_len(ver);
 
-		if (unlikely(!pskb_may_pull(skb, len)))
+		if (unlikely(!pskb_may_pull(skb, len))) {
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return PACKET_REJECT;
+		}
 
 		if (__iptunnel_pull_header(skb,
 					   len,
@@ -327,8 +331,10 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 
 			tun_dst = ip_tun_rx_dst(skb, flags,
 						tun_id, sizeof(*md));
-			if (!tun_dst)
+			if (!tun_dst) {
+				*reason = SKB_DROP_REASON_NOMEM;
 				return PACKET_REJECT;
+			}
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -356,15 +362,17 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		ip_tunnel_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		return PACKET_RCVD;
 	}
+	*reason = SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND;
 	return PACKET_REJECT;
 
 drop:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, SKB_DROP_REASON_HDR_TRUNC);
 	return PACKET_RCVD;
 }
 
 static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
-		       struct ip_tunnel_net *itn, int hdr_len, bool raw_proto)
+		       struct ip_tunnel_net *itn, int hdr_len, bool raw_proto,
+		       enum skb_drop_reason *reason)
 {
 	struct metadata_dst *tun_dst = NULL;
 	const struct iphdr *iph;
@@ -400,22 +408,25 @@ static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 
 			tun_id = key32_to_tunnel_id(tpi->key);
 			tun_dst = ip_tun_rx_dst(skb, flags, tun_id, 0);
-			if (!tun_dst)
+			if (!tun_dst) {
+				*reason = SKB_DROP_REASON_NOMEM;
 				return PACKET_REJECT;
+			}
 		}
 
 		ip_tunnel_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		return PACKET_RCVD;
 	}
+	*reason = SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND;
 	return PACKET_NEXT;
 
 drop:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, SKB_DROP_REASON_HDR_TRUNC);
 	return PACKET_RCVD;
 }
 
 static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
-		     int hdr_len)
+		     int hdr_len, enum skb_drop_reason *reason)
 {
 	struct net *net = dev_net(skb->dev);
 	struct ip_tunnel_net *itn;
@@ -426,13 +437,13 @@ static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 	else
 		itn = net_generic(net, ipgre_net_id);
 
-	res = __ipgre_rcv(skb, tpi, itn, hdr_len, false);
+	res = __ipgre_rcv(skb, tpi, itn, hdr_len, false, reason);
 	if (res == PACKET_NEXT && tpi->proto == htons(ETH_P_TEB)) {
 		/* ipgre tunnels in collect metadata mode should receive
 		 * also ETH_P_TEB traffic.
 		 */
 		itn = net_generic(net, ipgre_net_id);
-		res = __ipgre_rcv(skb, tpi, itn, hdr_len, true);
+		res = __ipgre_rcv(skb, tpi, itn, hdr_len, true, reason);
 	}
 	return res;
 }
@@ -457,12 +468,12 @@ static int gre_rcv(struct sk_buff *skb)
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (erspan_rcv(skb, &tpi, hdr_len, &reason) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
 
-	if (ipgre_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+	if (ipgre_rcv(skb, &tpi, hdr_len, &reason) == PACKET_RCVD)
 		return 0;
 
 out:
-- 
2.47.3

