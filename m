Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466913B2FFF
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213126; cv=none; b=I/ZDpjn2AHB/f70T1AiNUc/Xj0AJpMYNDkjI97QpFEGZXVKRs6n/0Cj+Y0izMaDqwk3HhCXZaoj8gTUGUMoNgTZFEFIhdvL9j708OA9Jho6rNXQYv9rdUcmUA/TVvU48plAqHJAJi+NzIqocALpNoCc7O3WVnso3XZyxrJtvFFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213126; c=relaxed/simple;
	bh=GImSaBburXI+fSPmhv1GLTsPcvIOT1rc2hIuZWzMLxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LE4WW8wu2LNIcn1+yH2uwCN/28rmEbFWJWQx/JJCesDzmxh/+LrHqTHt7Ad3y7ftQ5oyIUoJQqYPsq5TvzRk2e18G/IH1Y5t0QQ63diPJa63SCz2q0Ptl9tMoS5Fqi7Il2Ej33T51Kvfkl2WHF9zwBZfnfmAd21sseF2VNj5GCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrX7zYjd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrX7zYjd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so3646213e87.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213119; x=1788817919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLqppsKFYm25VyfvfGmhK0W3JzFpvK1MwZIK8QKSzOQ=;
        b=KrX7zYjd+cs0rzJwjfdWX2eaZTMX65rltXU4f7PSDBTrEMYONt6QZK/rXvvHBtWiM3
         cezxu6pEBm7dja/cbQoaJ+uBARVDh32bXnyg7mFU/79pD6I+XDIJTN0mTLirkznr0e5D
         WPFSBfTlyVS3mDUbV3AUDwdDilE3ZCt6mPqe2Jfthj7ygndFmxR/qLJIJK4hRcd+Gpw/
         VfUBREJC2CFs1SA2EozpQorxNtSkqOMNn/Jx0VZHZi1ttB3PFt7YcQWEgEAbzdC5U3w9
         XE/yB4+Gv1XNFYED7v8wwb6XdoiDXi5D45PKm49JRjx0LYU/EFLD01+hCyj/h1yYo7f7
         HPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213119; x=1788817919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLqppsKFYm25VyfvfGmhK0W3JzFpvK1MwZIK8QKSzOQ=;
        b=nHdptdJ+Jc2/MsdVbQW90txnKm9/HxZAS6JRnFk6NJra8xRfgFXN2UVkCBZDo8mr7X
         VAkxWW/RBo6HuCkCYfwyfhKZJ92BgqITluTh01/aaGgd+ZjyEOMVi6HhfUc2zEiWDERr
         itYYnNWjKE81K2Qy8576Jc20T5mU3Ynop1mS7iThSVImNC4GvDuyocI8LFG6Ks+Zg8SM
         /bmjbGaZestMEDUk0/Vk8FXQI3d1PxnwkQobHOl6BMkDTyIpp5cZBILgQBs/0Eda1x3u
         /v+OgttiIEb84GB2C3OzEIrLMliCRCJQVV5+iqMg3mDYVP5X7Cd6iT+F5TVpagYX4WK2
         Y6EA==
X-Forwarded-Encrypted: i=1; AKwUvBxP1WbxLUSGpZS2jtL7dB5wIEKhqCwMyh+nyR77bPpQAEc9Ln4w08KW6Lfv45oDJrj5SIDAJZjC+NwkkE2NjZE=@vger.kernel.org
X-Gm-Message-State: AFuF++kyYhFKXNlxUd2CgzD9QRxTAufrDaOQPr6rxlEJJpa/ogR8fpZR
	a64U91Kd2jVKjcU2UQ4+MAPDlFpGxo+qrlchQNpD+Qs6bNiOlSJT2o3J
X-Gm-Gg: AYBFou0GiMX6Ox78IoW9USL+wX2OxUU1f+b6MSJ4IxrM24C+mkleT76mshUr9h1DNdh
	ii677vNJk8RsUCRl9VWzqwXmZP2Qf3yA1vDi3DzhD6YYbvAtDp04+8/ySlJ+ui5Lf0HSy9V57xc
	N5Qzf0v2h9kxWO8iOtiwQEJR7EjVOv0OK0qEVa+ONk8Fi37MpZo6oVf5uwD7W0wwE3mtnFrpfP0
	PiDw7vgfE4J0WpNlKXLlnxrigJrCmxR/fTdcY47BMJQUz0TGOIW9Lx/rcT2BdhUE18pv+5g2tmD
	2gx/6wf2E3vwoJwZB9hwi9B6RWdzvTcv3fA1NMWPiXlBSQhi7WdUidP7E2+VsLrSR0GQBPz3yk+
	GU491whTFoB+4Qpt32Gd5fShJ3n1tE2UN0Sc71AGS2zRrNKBBH5HZagUYz4mqAuqM+4N2Ez5ekN
	3aZYr+uy7LGyx+jUqCupmfPIVntP2Ck41yUSKRmZ97HXF9+SpmXdONfbzRGgRIGg3XCAPqXz/vn
	jKPMHy0j2xrI6Eo48KvrjcfY+VogmB1lg==
X-Received: by 2002:a05:6512:6288:b0:5b0:15b1:3d5d with SMTP id 2adb3069b0e04-5b5e6902f5fmr9592721e87.22.1788213119500;
        Mon, 31 Aug 2026 14:51:59 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:58 -0700 (PDT)
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
Subject: [PATCH net-next 06/11] ip6_gre: add drop reasons to the RX path
Date: Tue,  1 Sep 2026 00:51:32 +0300
Message-ID: <20260831215137.549324-7-littlesmilingcloud@gmail.com>
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

Mirror the previous patch on the IPv6 side: report
SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND when no tunnel matches the packet,
and tell that apart from a header that cannot be pulled
(SKB_DROP_REASON_HDR_TRUNC) or a metadata allocation failure
(SKB_DROP_REASON_NOMEM), which so far all ended up in the same plain
kfree_skb() in gre_rcv().

ip6gre_rcv() and ip6erspan_rcv() get the same output parameter as their
IPv4 counterparts.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_gre.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 736eefdb528f..27fbe175beec 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -454,7 +454,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	return 0;
 }
 
-static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
+static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
+		      enum skb_drop_reason *reason)
 {
 	const struct ipv6hdr *ipv6h;
 	struct ip6_tnl *tunnel;
@@ -473,8 +474,10 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 			tun_id = key32_to_tunnel_id(tpi->key);
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id, 0);
-			if (!tun_dst)
+			if (!tun_dst) {
+				*reason = SKB_DROP_REASON_NOMEM;
 				return PACKET_REJECT;
+			}
 
 			ip6_tnl_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		} else {
@@ -484,12 +487,14 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 		return PACKET_RCVD;
 	}
 
+	*reason = SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND;
 	return PACKET_REJECT;
 }
 
 static int ip6erspan_rcv(struct sk_buff *skb,
 			 struct tnl_ptk_info *tpi,
-			 int gre_hdr_len)
+			 int gre_hdr_len,
+			 enum skb_drop_reason *reason)
 {
 	struct erspan_base_hdr *ershdr;
 	const struct ipv6hdr *ipv6h;
@@ -497,8 +502,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	struct ip6_tnl *tunnel;
 	u8 ver;
 
-	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr))))
+	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr)))) {
+		*reason = SKB_DROP_REASON_HDR_TRUNC;
 		return PACKET_REJECT;
+	}
 
 	ipv6h = ipv6_hdr(skb);
 	ershdr = (struct erspan_base_hdr *)skb->data;
@@ -510,13 +517,17 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	if (tunnel) {
 		int len = erspan_hdr_len(ver);
 
-		if (unlikely(!pskb_may_pull(skb, len)))
+		if (unlikely(!pskb_may_pull(skb, len))) {
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return PACKET_REJECT;
+		}
 
 		if (__iptunnel_pull_header(skb, len,
 					   htons(ETH_P_TEB),
-					   false, false) < 0)
+					   false, false) < 0) {
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return PACKET_REJECT;
+		}
 
 		if (tunnel->parms.collect_md) {
 			struct erspan_metadata *pkt_md, *md;
@@ -532,8 +543,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id,
 						  sizeof(*md));
-			if (!tun_dst)
+			if (!tun_dst) {
+				*reason = SKB_DROP_REASON_NOMEM;
 				return PACKET_REJECT;
+			}
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -564,6 +577,7 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 		return PACKET_RCVD;
 	}
 
+	*reason = SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND;
 	return PACKET_REJECT;
 }
 
@@ -577,17 +591,19 @@ static int gre_rcv(struct sk_buff *skb)
 	if (hdr_len < 0)
 		goto drop;
 
-	if (iptunnel_pull_header(skb, hdr_len, tpi.proto, false))
+	if (iptunnel_pull_header(skb, hdr_len, tpi.proto, false)) {
+		reason = SKB_DROP_REASON_HDR_TRUNC;
 		goto drop;
+	}
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (ip6erspan_rcv(skb, &tpi, hdr_len, &reason) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
 
-	if (ip6gre_rcv(skb, &tpi) == PACKET_RCVD)
+	if (ip6gre_rcv(skb, &tpi, &reason) == PACKET_RCVD)
 		return 0;
 
 out:
-- 
2.47.3

