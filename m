Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297293B3C14
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213132; cv=none; b=CkN17IjpXrlXitG07ViNRnX8o/Y/9Jv3yPjGN+muSJ/u2r1mgGNc76Z7KQQ4pqVZFSK9OdJ/eTPaEGA78SxEhn/MKTuZtr2WoooM1pJ30xup0NY0zD88Frk7kZEGzf8qIkdmN6uTDzU54ttxMDxdThRdo7XkyeotFqFEwOH1ZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213132; c=relaxed/simple;
	bh=lpJgQ1G09SONipa/G1j+gTjEknOSH8YBnE789jf3q3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgdT2XyQpcqZTKJr3Y8MX0zcnw4ieJ8Ip7B5leCCZ9ElbHiMWOnKiooJ2CuJZGU/O2lffW8H3B0nIA+1s64DjWyUw39P0wyiiRS05B0VWR2B3pgWT3JSLrAyfmYbTodtHDULTl2lIrCPFrVKvs9nMzCvrKdk0DkQYlAS+pppOf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIq6X7k6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIq6X7k6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so1315733e87.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213123; x=1788817923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+May2nMd320JoAXM5csJn+yzs/ebduDyHmgff6M1UME=;
        b=tIq6X7k6GL7+Q3374RVmksZbXoMIGlJ4bybiTp/E4WUlMTFkrMKD5axXD6hY3zn5zU
         1lnIqi/I1KIUw+cDBubUOb1B6nNkMpzxwBWUY9fgGnJy65d523OkQr157+uVpAYWUnKl
         N5oMOHvde4X24EWSuIdNP/hi8ewMQ6SlQFqZKFo0+vxKomwmPqhCCICkGTJO6B0mcPpo
         1SU3EhgskLvMfAp0zjrP9luOt17tLaSWayTXHSrYM3bgFx+LKnT+8U3fif/cpjhk8r7E
         lWS6HbCxTQkAqhWv/K5psPJOLiUCFhjw4aXaAqAkKeK5I7jHzWoxMOkRFGEo+JymrPE/
         ixXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213123; x=1788817923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+May2nMd320JoAXM5csJn+yzs/ebduDyHmgff6M1UME=;
        b=bk2Rc2EFhEO0yhbMUsypiSEKc1jJZBlF7pkMdxcrwAXgufEkRfdETe/fYK5tceHU1S
         ljibP4EUBE88hWTgSNhfdiAqoNcoDq1t8M7k0ZEf6/vA7aNahXvdpj/oTKJOL176O+r0
         nDhE11hL2LWfNeMJcBE2KdkGWmQm8ChSWrucita1j6FKh2vs+Yps7SuP4FaGpRyo7w7s
         fUanF5H0p1CwybEAgRWVMxgUwbJ6BhBRxQdLr3Pf/L+pqkbyacy3mqCEM6zJ2n74GMcn
         KD0VuOQYkNgE3kxiDi/pIAIcvAFymIB1US/0R7xIDd2GXxqzU865voT1VnUZgrGC1RRt
         tjaw==
X-Forwarded-Encrypted: i=1; AKwUvBy2aDDvY74SDLH0WQsiV3vGwR27pABq4CrPEUeSYS6CMvZ9wJttv5BtYDIgbZ5DJIYuEUPhq6Pd5tK4uCLqtJE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVk6yrqEb5AYmwqKi2GWFGqle6PtwAefoZYywwBDSXjXXvEBa1
	QW8+tV2sMqcrcqdH8D5suCpZoY93eP0aZl/kDXLE0H4vep1lVkCSoEUa
X-Gm-Gg: AYBFou3Jl34c0onw8uPtStetJ5GCcJPOkrkKvS5OA4TlBUSTHh4tu0j+bexw0EaDPEl
	btIhEkYDU+yiGtqyy3/uYxSmJNo1Ayc1TXaK2hYVi/Ym0mqyCsfTnQMQmvBnybkw0zato0fpOhY
	1p/WG2sU2kKJQej83lVy0I6v73U36D9Th6+OF/E1smqfM92wiM5fYi5S+L79tHz0zRw8BbHbt6b
	nnSZpHuwgGRAyC2V/qA1OBqljbXsLP7FVVv4LXMYnZ+puju9pvlfU1Dg/xRUrgkfDZwghch0qKQ
	wNf/tkIu2srrn53NU42dKumnFkx2hjIe8Hx8GZBDRbJcqYkAbHTFTsOVpkFs5rvNHCmNJCoFUcn
	PCd2wqH0afteh2BTmt4heizrW4bzXky8eKm3ebXSIBTOTyTWNra2k47izl7SZGamKiq0h4RWzoz
	GhHV/PXyzYJqSgS+tkyyeJLkHU4stMGa/okE/9L4l1l9hOUe61U9BVIlSA0k4yqWkMvM7aSfgti
	4Jm70uYbYlqISrBihO17mR2hs8hhbK4lA==
X-Received: by 2002:a05:6512:3baa:b0:5b0:197b:9827 with SMTP id 2adb3069b0e04-5b5fe058e29mr1315878e87.3.1788213122457;
        Mon, 31 Aug 2026 14:52:02 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:52:01 -0700 (PDT)
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
Subject: [PATCH net-next 08/11] ip_tunnel: add drop reasons to the transmit path
Date: Tue,  1 Sep 2026 00:51:34 +0300
Message-ID: <20260831215137.549324-9-littlesmilingcloud@gmail.com>
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

ip_tunnel_xmit() and ip_md_tunnel_xmit() encapsulate packets that the
tunnel forwards, and every failure on that path ends in the same plain
kfree_skb().  The device counters separate them a little, but they are
too coarse to act on: tx_errors alone covers an encapsulation failure, a
routing failure, a lookup loop and a packet that is simply too big.

The last one deserves attention.  tnl_update_pmtu() returns -E2BIG for a
packet larger than the path MTU that has the DF bit set, after it has
already sent an ICMP fragmentation needed back to the sender.  That is
path MTU discovery working as intended, yet it lands in tx_errors next
to genuine failures, so a MTU black hole cannot be told from a broken
route by looking at the counters.

No new reason is needed for most of it:

 - SKB_DROP_REASON_PKT_TOO_BIG for the case above,
 - SKB_DROP_REASON_IP_OUTNOROUTES when no route is found,
 - SKB_DROP_REASON_RECURSION_LIMIT when the route points back at the
   tunnel device itself, which is the "dead loop on virtual device" that
   reason describes,
 - SKB_DROP_REASON_NOMEM when the headroom cannot be expanded,
 - SKB_DROP_REASON_NEIGH_CREATEFAIL when the NBMA neighbour lookup
   fails, SKB_DROP_REASON_NO_TX_TARGET when no destination can be
   derived at all, and SKB_DROP_REASON_UNHANDLED_PROTO for a payload
   that is neither IPv4 nor IPv6,
 - SKB_DROP_REASON_TUNNEL_TXINFO, which already documents a packet
   reaching an external mode device without metadata, for the
   collect_md path.

Only the encapsulation failure has no fitting reason, so add
SKB_DROP_REASON_IP_TUNNEL_ENCAP for it.

Drop reasons on transmit are not new: vxlan already reports several of
them from its xmit path, and ip_tunnel_core.c reports
SKB_DROP_REASON_RECURSION_LIMIT.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  7 ++++++
 net/ipv4/ip_tunnel.c          | 41 ++++++++++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index d1fb52c1b0cb..2a2ac8767d68 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -133,6 +133,7 @@
 	FN(GRE_INVALID_HDR)		\
 	FN(GRE_CSUM)			\
 	FN(GRE_TUNNEL_NOT_FOUND)	\
+	FN(IP_TUNNEL_ENCAP)		\
 	FNe(MAX)
 
 /**
@@ -637,6 +638,12 @@ enum skb_drop_reason {
 	 * endpoints and the key the packet carries.
 	 */
 	SKB_DROP_REASON_GRE_TUNNEL_NOT_FOUND,
+	/**
+	 * @SKB_DROP_REASON_IP_TUNNEL_ENCAP: failed to build the
+	 * encapsulation header of a tunnel, e.g. an unknown or
+	 * unregistered encapsulation type.
+	 */
+	SKB_DROP_REASON_IP_TUNNEL_ENCAP,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index ab8bae8ba781..12d45f69c4d8 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -582,6 +582,7 @@ static int tnl_update_pmtu(struct net_device *dev, struct sk_buff *skb,
 void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		       u8 proto, int tunnel_hlen)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	u32 headroom = sizeof(struct iphdr);
 	struct ip_tunnel_info *tun_info;
@@ -595,8 +596,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto tx_error;
+	}
 	key = &tun_info->key;
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
@@ -615,8 +618,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0) {
+		reason = SKB_DROP_REASON_IP_TUNNEL_ENCAP;
 		goto tx_error;
+	}
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
 	if (use_cache)
@@ -625,6 +630,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -634,6 +640,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -642,6 +649,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -659,6 +667,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -673,13 +682,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 tx_dropped:
 	DEV_STATS_INC(dev, tx_dropped);
 kfree:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_md_tunnel_xmit);
 
 void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		    const struct iphdr *tnl_params, u8 protocol)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	struct ip_tunnel_info *tun_info = NULL;
 	const struct iphdr *inner_iph;
@@ -707,9 +717,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (!skb_dst(skb)) {
 			DEV_STATS_INC(dev, tx_fifo_errors);
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
 		}
 
+		/* Only the branches below can derive a destination.  If
+		 * none of them matches, the payload protocol is not one
+		 * this tunnel can carry.
+		 */
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		tun_info = skb_tunnel_info(skb);
 		if (tun_info && (tun_info->mode & IP_TUNNEL_INFO_TX) &&
 		    ip_tunnel_info_af(tun_info) == AF_INET &&
@@ -730,8 +746,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -748,8 +766,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 				dst = addr6->s6_addr32[3];
 			}
 			neigh_release(neigh);
-			if (do_tx_error_icmp)
+			if (do_tx_error_icmp) {
+				reason = SKB_DROP_REASON_NO_TX_TARGET;
 				goto tx_error_icmp;
+			}
 		}
 #endif
 		else
@@ -776,8 +796,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
+	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0) {
+		reason = SKB_DROP_REASON_IP_TUNNEL_ENCAP;
 		goto tx_error;
+	}
 
 	if (connected && md) {
 		use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -794,6 +816,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -807,6 +830,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -816,6 +840,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -850,7 +875,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -866,7 +891,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3

