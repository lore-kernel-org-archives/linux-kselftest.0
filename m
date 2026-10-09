Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F7C4D98EF
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548693; cv=none; b=LHB7yBeYcJyT43uUxTJp7IpuJlxgkuxdSH6tL8eIw5hdNJqFCWk8zqMHkheWSGDsv7dxcqBXaBnk3ij3qCIEA8gl5VmY8EWUGAFas+Jp3AJjC5GkZ79hqRtRQ8OUCQ0pcL37Mh+qXT3w54VbCKUgt0yrLmFv15T3FdIxlRUJK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548693; c=relaxed/simple;
	bh=bPo26BWgpeGecn/xpiCWcYEPGVf1jGt7lxveVzizA6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O61hk19VuXoFtzecsfiKRDGvOBLCV0q+vLuRH0hBBrIYn6IF5URy6usvr94cwly4lAp37F69h7lGEt8b6F8kd0v6LxNIJ7uyWIcWhA/EDx/r2cHmw6KRSfE6KSjpLIfVSw1YoiHaYRurGDGGCU/szgj6vadDue8HlrjoQoLukr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=dS8ni+Cs; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="dS8ni+Cs"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1111497a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548683; x=1792153483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUulpqgrYy1ZhoinA55dDiOu/64I1RIsGEG7iWjf3JU=;
        b=dS8ni+Csf8b/WKTtdVUgXBroHk5nPPreki7sC8XgfavZ318W4GCp1Ti6jvmZyh4MRl
         7IKWKIglQodm1Qv/2L8jzYDXfogqiL1tB9hxe1zzmrDflrEfXr1PknAg/2RsxYUerJh5
         dmk0HsnJG1o5OuJHJXHsUdJMLu9FfOW+bXCyiTcJyvoeq3YgEA/pgI1A/Cqs19m4Zajg
         MdBtYFd7Jcsc9pSt08gyU3ol20J+5ZukJiBzmAnfprJSqWoJdTjobVzv+kqRU8ZF3wiE
         865ZcHSaS4ajhGfDZODkSyIgaqIYpH2bGf10uh+sNqG6N6ctxN2khfMsiw0rl6LUnrv4
         OMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548683; x=1792153483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUulpqgrYy1ZhoinA55dDiOu/64I1RIsGEG7iWjf3JU=;
        b=AqTWqHdnQgGwQ9cVPkTlZSU6m2gNKc6thEOryiqb1Whh+v0CJX0bF8KEDjzaC0W48i
         KtRaSzud+JpZi0WIp0+R28udVng0DZe7FSV5j5J9MmyKFK8WuaZyKc0AfKnHg2uM8lM/
         yoF5k/zPAKbPrYCsvfRaFPOnr99xbhoZ0GX6LkfF/TLvDcNfphwdGLE439D1wvjunf4a
         jbwEYcHj/zKVz+rrCFXsml4C13CNgw7JgzZN9bZHNyW9fAg4naXz0+jr+9pQUujI0jJl
         zG7CDYgoXEACgh/4x0mIFTydeR9lH4Od1M7+sHrCJt1daBYWC5cxJ6lftoDaE69na5nj
         CbOg==
X-Forwarded-Encrypted: i=1; AKwUvBya48c/hF1r3VwrRo/EMvMLMtUSUMjISdfEDfPQmyWMk6jFy7Bm0ZEB4rxUgr25+MwU3MSpgWG4lGoHmCrwM5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5v0rD9fAfSjK0F3MG4r1AhPcMHtLhkwseYh86dxpF76j5rLA2
	shYa4/R5mydat5XwqkQInXOosDG8Qt7OV+PcpCqR13LclcuTVQPPosfVu8jYE5EU4F0jet72b3i
	cOJoT0sZx3BhQbNE=
X-Gm-Gg: AYBFou0OgIb0jypk99bN6XIigodiVAquGRoOIxiBM7i54PtQ12sahPgHQvj+YFbaS5b
	vzD/Am2sZGL9Hep5vRYF+D2phDhePdRih06Yyl8tOF1TYW7vEJImNlYzxu3xdQFW5qPBbescTjf
	OWaKDS0IRhGPKBmtmHFXqRGYHPReDqHguhQYw2Hr9eQiqhFdmJLdqV7MW+WIJZkyZbz45E7iIkS
	q/ca3yVMQ2P2oVIdw1RFH9fq6FKn8+E+qHbasEAYMH/wzEVmZ2+Cy7ZM3mJVUICstKukeILhiFs
	RNhAuIpAucD0wvZxdnOIfE8BelThSUD3qynLvvPuL4R+d82bRAIND2GG+wzys+1yldcmNzIYKJP
	Z2xj6fxAf21Y0sUhMyyqB9h9ATSQMxln+GePEJsMvW73OLlpGt8zK0uF0vnhSGKprzpk6wucTVi
	XlVBA4H3H23PG5oQE6OBzRCZkhcpOzfMaU2EjXiTRKGQb3VDwsZVeurGYkje1V1ToN/un/Owinw
	regxe+mA3WXvkNxjJIFMkkQMrkni+vRHEf669eP
X-Received: by 2002:a17:90a:d006:b0:3a8:63da:44b5 with SMTP id 98e67ed59e1d1-3ab3ab20a20mr996960a91.24.1791548682795;
        Fri, 09 Oct 2026 05:24:42 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:41 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 06/13] amt: forward multicast data over IPv6
Date: Fri,  9 Oct 2026 12:24:19 +0000
Message-ID: <20261009122426.551178-7-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() routes and transmits the relay's copy of a
multicast packet only over IPv4, so an IPv6 relay could establish
tunnels but not deliver traffic through them.

Size the copy's headroom for the outer family and send it through
amt_udp_xmit(), whose new @data argument marks Multicast Data, still
routed without a DSCP. A copy that cannot be sent is now counted in
tx_dropped and freed with a specific drop reason; before, it was freed
with SKB_DROP_REASON_NOT_SPECIFIED and not counted, as amt_dev_xmit()
returns NETDEV_TX_OK for the packet.

RFC 7450 forbids a Fragment header on Multicast Data sent over IPv6
(s5.3.3.6.3.2) and wants an IPv6 payload above the tunnel MTU dropped,
with a Packet Too Big to its source (s5.3.3.6.2.2). ip6_fragment() would
drop it, but send the Packet Too Big to the relay itself. Instead,
amt_tmtu_exceeded() compares the payload with the route's MTU less the
outer headers, per tunnel since each gateway has its own route, and
sends the Packet Too Big through icmpv6_ndo_send(), as ip6_tunnel does,
with at least IPV6_MIN_MTU, as a source ignores less. Packet Too Big is
exempt from the ICMPv6 rate limit unless the icmpv6_ratemask sysctl
includes it, so a packet draws one for each gateway with a smaller path
MTU. skb_tunnel_check_pmtu() is not used: with reply false it sends
nothing. A GSO skb, which a UDP_SEGMENT source sends once transmit
checksum offload is on, is judged by its segments, and marking it as a
UDP tunnel packet would leave the inner UDP header out of them, so the
marking moves here from the caller, after the check.

The tunnel MTU follows the route's path MTU, as on every IPv6 UDP
tunnel. RFC 7450 s5.3.3.6.1 asks for a way to turn that off, but IPv6
has none: udpv6_err() lowers the route MTU before it looks up a socket,
and "mtu lock" does not stop it. A forged Packet Too Big can lower the
route MTU to IPV6_MIN_MTU at most. An IPv4 payload that does not fit an
IPv6 tunnel is dropped without an ICMP error, as icmp_send() does not
answer multicast, and it is not fragmented before encapsulation as
s5.3.3.6.2.1 asks for DF=0; the IPv4 tunnel does not do that either.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 93 +++++++++++++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 35 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b977b00..412d23c 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1103,15 +1103,43 @@ static void amt_req_work(struct work_struct *work)
 				 msecs_to_jiffies(100));
 }
 
+/* RFC 7450 s5.3.3.6: Multicast Data must not be fragmented over IPv6, so
+ * a payload above the tunnel MTU is dropped, and an IPv6 source is sent a
+ * Packet Too Big of at least IPV6_MIN_MTU, as it ignores less. icmp_send()
+ * never answers an IPv4 multicast datagram. A GSO skb is judged by its
+ * segments, so @skb must not be marked as a tunnel packet yet:
+ * skb->encapsulation would leave the inner UDP header out of their size.
+ */
+static bool amt_tmtu_exceeded(struct sk_buff *skb,
+			      const struct dst_entry *dst)
+{
+	int off = skb_network_offset(skb);
+	u32 mtu;
+
+	mtu = dst_mtu(dst) - sizeof(struct ipv6hdr) - sizeof(struct udphdr) -
+	      off;
+	if (skb_is_gso(skb) ? skb_gso_validate_network_len(skb, mtu) :
+			      skb->len - off <= mtu)
+		return false;
+
+	if (skb->protocol == htons(ETH_P_IPV6))
+		icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0,
+				max_t(u32, mtu, IPV6_MIN_MTU));
+	return true;
+}
+
 /* Route an AMT-encapsulated skb to @daddr and send it over the device's
- * outer family. The caller has already pushed the AMT header.
+ * outer family. The caller has already pushed the AMT header. @data marks
+ * Multicast Data, which may be a GSO skb: it gets the IPv6 tunnel MTU
+ * check, then the UDP tunnel offload marking.
  */
 static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
 			struct sk_buff *skb, const union amt_addr *daddr,
-			__be16 sport, __be16 dport)
+			__be16 sport, __be16 dport, bool data)
 {
 	struct rtable *rt;
 	struct flowi4 fl4;
+	int err;
 
 	if (amt_v6(amt)) {
 		struct dst_entry *dst;
@@ -1123,6 +1151,14 @@ static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
 				   &daddr->ip6);
 			return PTR_ERR(dst);
 		}
+		if (data) {
+			err = amt_tmtu_exceeded(skb, dst) ? -EMSGSIZE :
+			      udp_tunnel_handle_offloads(skb, true);
+			if (err) {
+				dst_release(dst);
+				return err;
+			}
+		}
 		/* iptunnel_xmit() scrubs the IPv4 tunnel skb, but
 		 * udp_tunnel6_xmit_skb() does not, so drop the inner
 		 * packet's conntrack and extensions here. Links cannot
@@ -1136,11 +1172,17 @@ static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
 		return 0;
 	}
 
+	if (data) {
+		err = udp_tunnel_handle_offloads(skb, true);
+		if (err)
+			return err;
+	}
+
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
 	fl4.daddr              = daddr->ip4;
 	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
+	fl4.flowi4_dscp        = data ? 0 : inet_dsfield_to_dscp(AMT_TOS);
 	fl4.flowi4_proto       = IPPROTO_UDP;
 	rt = ip_route_output_key(amt->net, &fl4);
 	if (IS_ERR(rt)) {
@@ -1229,16 +1271,14 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 {
 	struct amt_header_mcast_data *amtmd;
 	struct sk_buff *skb;
-	struct iphdr *iph;
-	struct flowi4 fl4;
-	struct rtable *rt;
 	struct sock *sk;
+	int err;
 
 	sk = rcu_dereference_bh(amt->sk);
 	if (!sk)
 		return;
 
-	skb = skb_copy_expand(oskb, sizeof(*amtmd) + sizeof(*iph) +
+	skb = skb_copy_expand(oskb, sizeof(*amtmd) + amt_ip_hlen(amt) +
 			      sizeof(struct udphdr), 0, GFP_ATOMIC);
 	if (!skb)
 		return;
@@ -1249,22 +1289,6 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	 */
 	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
-	if (udp_tunnel_handle_offloads(skb, true)) {
-		kfree_skb(skb);
-		return;
-	}
-
-	memset(&fl4, 0, sizeof(struct flowi4));
-	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = tunnel->addr.ip4;
-	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_proto       = IPPROTO_UDP;
-	rt = ip_route_output_key(amt->net, &fl4);
-	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->addr.ip4);
-		kfree_skb(skb);
-		return;
-	}
 
 	amtmd = skb_push(skb, sizeof(*amtmd));
 	amtmd->version = 0;
@@ -1275,17 +1299,16 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 		skb_set_inner_protocol(skb, htons(ETH_P_IP));
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
-	udp_tunnel_xmit_skb(rt, sk, skb,
-			    fl4.saddr,
-			    fl4.daddr,
-			    AMT_TOS,
-			    ip4_dst_hoplimit(&rt->dst),
-			    0,
-			    amt->relay_port,
-			    tunnel->source_port,
-			    false,
-			    false,
-			    0);
+	err = amt_udp_xmit(amt, sk, skb, &tunnel->addr, amt->relay_port,
+			   tunnel->source_port, true);
+	if (err) {
+		DEV_STATS_INC(amt->dev, tx_dropped);
+		kfree_skb_reason(skb, err == -EMSGSIZE ?
+				      SKB_DROP_REASON_PKT_TOO_BIG :
+				      err == -ENOMEM ?
+				      SKB_DROP_REASON_NOMEM :
+				      SKB_DROP_REASON_IP_OUTNOROUTES);
+	}
 }
 
 static bool amt_send_membership_query(struct amt_dev *amt,
@@ -1321,7 +1344,7 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
 	if (amt_udp_xmit(amt, sk, skb, &tunnel->addr, amt->relay_port,
-			 tunnel->source_port))
+			 tunnel->source_port, false))
 		return true;
 	amt_update_relay_status(tunnel, AMT_STATUS_SENT_QUERY, true);
 	return false;
-- 
2.43.0

