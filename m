Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634100;
	b=qFwpEnZ5rkrnCen2+DyK6ORYpnbQ7TXzswkiTzehxuf3mxz38UL2IEJ6jmWf5/xKNXSb
	 KR9/WfbXMARnY/KxfwXD08exrujYmdslnhu4X6YKdxXJPHcmnZOmnIZTUyCIjK1lBLgnm
	 uf30xnIwo677FSpkgByu7TmYsi13pHFpx38NfocDJYU49QP1MFkxB3H9o8nZ6AXlvZsDp
	 S24nzsO9MiuQNLzvpcp0QtXT4rKFg3lDwS3VA+oLbjRASsfzn9yUSx2YqH7GWPZ9iUgTi
	 jrGgudzFmgAAK2VrfLfYnMEzLeRvW/lByZ2Pt4mlbSr1tQjHeUtPv1fWiUgrQJJ7fhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VXAZ8Kr8JXgDmkXxStkx6xLqLFftpXmGJY9tWvIpUSg=;
	b=LkU6XQsRmB708/XO4pVtJxzY3fYoPXA9+LPmZjK8f5xaIRe+KGOXK+/Pu+ZgxLJmUZtt
	 rtnXC0815jj2Jj+qcLJyYDwQdYl+n6mQ7LskWfxIqRxMGdEmnQ9colISycSXXKtpu8+RC
	 TwpUfFV9WPexzM86GO2NDZjyo8dBdL5E58WZwg0iV4J61Zy+5aco93hiksKZcQu082usi
	 tgAunA6+WKBO/g3I4ZXQcax+RtaGCn8BKEs1yh+nC60j2woclFPFLDPuotYXNXft9DJaN
	 T2t0yruK445/FYXVRsI7bB3qKUp7JUsX3kzfsmHDMvxwjV9mrjYUN3zbELgl8vspUuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=I1L3kDCh;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9560A2607
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB9560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=I1L3kDCh
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f07a960666so41054475ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634099; x=1796238899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXAZ8Kr8JXgDmkXxStkx6xLqLFftpXmGJY9tWvIpUSg=;
        b=I1L3kDChQj82UIPOyRZDxTzUME45aFpYjNUMisXCMVqfQem2OtYrPwZdBZtgRf6zNz
         xn11OVsrrASx97OT/akVIuPIsPeqrxhq9ZFK/KCyjhWuybxMQ80q4VruVsYmi71KiMis
         7aM3hGVwxtRIIJKJGG8y+grsbPzGmItD62WCl4omrKcz+AlQscbAhlTOFi/evaYOq29j
         m3D9tgw+tHjkowJbSA/yfuL2qTDmDuBA76oSKxRHu6mxZSgyvtpBjz5p/Ydhtg60scOa
         whbjvc61+kAyKv0DUqr5pc9xeQ3+pHVnaT+JdzfqpodpZPrPtpW32b96PPHXEm/zWIb/
         8PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634099; x=1796238899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXAZ8Kr8JXgDmkXxStkx6xLqLFftpXmGJY9tWvIpUSg=;
        b=NC59xgXT2eBI8sE1aoL+Z/L9R9kQkBBzRc3EA24OL87Fahjow240iKvjnoaH/IF+px
         Y7CgrPI9+PCEtkrP3nrgolkB6lGMhPFoANaK5S6V+MjPae1cMZQZm/Z1SivhkIDeYPdw
         nzwT6r8wWuJsrTuo8ymNh+opwXErfYzjI3t6zL5ek8K27dRnnfJDna41rsJdv2vx/o7v
         aIIcd1gVNxyeG50lHgqEED+3M0EV/w8yL5WqPZeIYE8j06ySRdnGsHqxDAeEqWQQ8p70
         X064kE8OUXcaUg7AxytVL8PVHENUXTO1qTj63+NKOMJdyEmXe6mCEKNAUenC6B2GHRhn
         8iBQ==
X-Forwarded-Encrypted: i=1; AL+hErFYGfLOJHU0Iqa3W9Bh33mYPD17FVrvnBviO6h4UmFr8ZtVODuHCfJQnWfrK8cCt+oxv5KyGEg7iZe5v4+FjFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rgaPaZ/PGs910A1FkskfYxvAw3XmfahjyhG332MX5tJVdl0kV
	jqeP+nkaNV4sUTqgOukL7U+/v9wqXKX6ONLd6hRRH3rYn2j4eeN5ti6ZJI8IfscCffk=
X-Gm-Gg: AZFdTZemFmnE4LnoThxCi7Lk/q+m3ZoNwpDvHaQFLwgVcW2AyAHJSZWDxIJXGcb0F7g
	Z7dlBv0hl1t3bN76e06WKLVrJRmlZnXxXXon0tTWia8EvkG0xrAZpYe4N3R0M7DfREfBTdCo2oR
	CKubBwEwhLq7GLZUbCyiBj4MrqPEdT2BcmLHVVgEdK3LYT+dHIXb5td3Gx8wqGgaFUEvoTPfJPa
	bZ9gAilkZnKQB+9nMAeDX1dsWKpYcYi0zaPEmM4AkKG5nM6McTrsV70Fso3TEu346vcmpDXY7yd
	39/dGA1phVdVW2neYevJiAtX0hOjeSdi4mOcI7wbVnV1klBXpfPkbswxRd2hXajTBX7xLX++M3b
	VcHBbeNn/4HL2iau286kedEbLJO/3p4FluonedLe5BYrPZz4/B6B/Z1kWnfz15mPdzPwU1EbNpo
	IKju45JJhYYyyejLu5Rnv9rq3u/4xRYyjs0ljyxw8S4wu8M9l9ZibvfYlpU+htJuBBAwCjvFhBR
	wYI13X69f47z7NWuUQO8Jh13aGcsDm+f6ymofXOrp2rkQX1EwZu7LuHK19+J/NdQRyi6clG4KQI
	gUr326p5Aps05KTD+5XGmtnLmSwEnaXQjriqHZVnIHxnzqHrO9tX+qDeZmcfJGbjjkzHEhzhaiR
	epg7E5QwVMPTvwlti8JCDe1F2cKDbHAfAiLLpKFgGsV/elTgH9mBf
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr177773115ad.35.1795634099295;
        Wed, 25 Nov 2026 11:14:59 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:58 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 05/12] amt: forward multicast data over IPv6
Date: Wed, 25 Nov 2026 19:14:43 +0000
Message-ID: <20261125191450.2497936-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

amt_send_multicast_data() routes and transmits the relay's copy of a
multicast packet only over IPv4, so an IPv6 relay could establish
tunnels but not deliver traffic through them.

Size the copy's headroom for the outer family and send it through
amt_udp_xmit(), which already carries the Membership Query over either
family. The IPv4 route lookup still sets no DSCP. A copy that cannot be
sent is still freed, but it is now counted in tx_dropped and freed with
a drop reason; before, nothing recorded the drop, as amt_dev_xmit()
returns NETDEV_TX_OK for the packet. The inner protocol stays
independent of the outer family, so an IPv6 tunnel carries both IPv4 and
IPv6 multicast.

RFC 7450 s5.3.3.6.3.2 forbids a Fragment header on a Multicast Data
message sent over IPv6, and s5.3.3.6.2.2 wants an IPv6 payload that
exceeds the tunnel MTU dropped with a Packet Too Big to its source.
The device MTU is derived from the link MTU only, so a smaller path MTU
to a gateway is found at the route. The scrub in amt_udp_xmit() clears
ignore_df, so ip6_fragment() never adds a Fragment header, but on its
own it drops such a packet and sends the Packet Too Big to the relay
itself. amt_send_multicast_data() therefore routes first and compares
the inner packet with the route's MTU less the outer headers and the
AMT header. The device offers software GSO, so a GSO skb is checked
per segment with skb_gso_validate_network_len(), before the tunnel
offloads are set up. A payload that does not fit is dropped.

A multicast packet can match every tunnel, and an attacker can create
tunnels, so the Packet Too Big is not sent per tunnel. Each failing
tunnel only lowers a value, and amt_dev_xmit() sends one Packet Too Big
through icmpv6_ndo_send(), as ip6_tunnel does, after it has walked all
tunnels, reporting the smallest failing tunnel MTU. A tunnel MTU below
IPV6_MIN_MTU is left out, as a source ignores a smaller Packet Too Big,
so such a tunnel only drops the payload. The inner version is the v6
flag the caller already computed, not skb->protocol.

The tunnel MTU follows the route's path MTU, which ICMPv6 Packet Too
Big messages lower, as it does on every IPv6 UDP tunnel in the tree.
RFC 7450 s5.3.3.6.1 and s6.1 ask a relay that adjusts the tunnel MTU
dynamically to offer a way to turn that off. The IPv6 stack gives a
tunnel no such way: udpv6_err() records the lowered MTU in a route
exception before it looks up a socket, "mtu lock" does not stop it
(IPv6 path MTU discovery is not optional, see __ip6_rt_update_pmtu()),
and ip6_skb_dst_mtu() ignores the socket's pmtudisc inside a tunnel's
transmit. This series does not add one. The route MTU never drops
below IPV6_MIN_MTU, as a smaller Packet Too Big is ignored, so a forged
Packet Too Big can at most lower the tunnel MTU to 1280 bytes less the
outer headers; an IPv6 payload between that and 1280 bytes is then
undeliverable.

skb_tunnel_check_pmtu() is not used: with reply false it only updates
the route's PMTU and sends nothing. An IPv4 payload is dropped without
an ICMP error, since icmp_send() does not answer multicast datagrams,
and it is not fragmented before encapsulation as s5.3.3.6.2.1 asks for
DF=0. The IPv4 tunnel does not do that either; it clears DF on the
outer header instead.

With this, every relay message has an IPv6 path: Discovery and
Advertisement, Request and Membership Query, Membership Update and
Multicast Data.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 126 +++++++++++++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 41 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 7e8219a0c..823367e82 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1237,26 +1237,51 @@ static void amt_req_work(struct work_struct *work)
 				 msecs_to_jiffies(100));
 }
 
+/* RFC 7450 s5.3.3.6: a Multicast Data message sent over IPv6 must not
+ * carry a Fragment header, so a payload larger than the tunnel MTU is
+ * dropped, and an IPv6 source is sent a Packet Too Big. An IPv4 source is
+ * not told, as icmp_send() never answers a multicast datagram. The tunnel
+ * MTU follows the route's path MTU, as on every IPv6 UDP tunnel.
+ */
+static u32 amt_tmtu(const struct dst_entry *dst)
+{
+	return dst_mtu(dst) - sizeof(struct ipv6hdr) - sizeof(struct udphdr) -
+	       sizeof(struct amt_header_mcast_data);
+}
+
+/* True if @skb, the inner packet before encapsulation, or any segment of
+ * it, is larger than @tmtu.
+ */
+static bool amt_tmtu_exceeded(const struct sk_buff *skb, u32 tmtu)
+{
+	if (skb_is_gso(skb))
+		return !skb_gso_validate_network_len(skb, tmtu);
+	return skb->len > tmtu;
+}
+
 /* Route an AMT-encapsulated skb to @daddr and send it over the device's
  * outer family. The caller has already pushed the AMT header; @dscp only
- * steers the IPv4 route lookup.
+ * steers the IPv4 route lookup. Over IPv6 the caller may pass the route it
+ * already looked up in @dst, which is consumed; otherwise it is looked up
+ * here.
  */
 static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
 			struct sk_buff *skb, const union amt_addr *daddr,
-			__be16 sport, __be16 dport, dscp_t dscp)
+			__be16 sport, __be16 dport, dscp_t dscp,
+			struct dst_entry *dst)
 {
 	struct rtable *rt;
 	struct flowi4 fl4;
 
 	if (amt_v6(amt)) {
-		struct dst_entry *dst;
-
-		dst = amt_route6(amt, sk, &amt->local_ipv6, &daddr->ip6,
-				 sport, dport);
-		if (IS_ERR(dst)) {
-			netdev_dbg(amt->dev, "no route to %pI6c\n",
-				   &daddr->ip6);
-			return PTR_ERR(dst);
+		if (!dst) {
+			dst = amt_route6(amt, sk, &amt->local_ipv6,
+					 &daddr->ip6, sport, dport);
+			if (IS_ERR(dst)) {
+				netdev_dbg(amt->dev, "no route to %pI6c\n",
+					   &daddr->ip6);
+				return PTR_ERR(dst);
+			}
 		}
 		/* iptunnel_xmit() scrubs the IPv4 tunnel skb, but
 		 * udp_tunnel6_xmit_skb() does not, so drop the inner
@@ -1357,26 +1382,58 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 	return false;
 }
 
+/* Send the relay's copy of a multicast packet to one gateway. Over IPv6 a
+ * payload that does not fit the tunnel MTU is dropped, and *@ptb is lowered
+ * to that MTU so that amt_dev_xmit() can send a single Packet Too Big to
+ * the source once it has walked every tunnel.
+ */
 static void amt_send_multicast_data(struct amt_dev *amt,
 				    const struct sk_buff *oskb,
 				    struct amt_tunnel_list *tunnel,
-				    bool v6)
+				    bool v6, u32 *ptb)
 {
 	struct amt_header_mcast_data *amtmd;
+	struct dst_entry *dst = NULL;
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
+	if (amt_v6(amt)) {
+		u32 tmtu;
+
+		dst = amt_route6(amt, sk, &amt->local_ipv6, &tunnel->addr.ip6,
+				 amt->relay_port, tunnel->source_port);
+		if (IS_ERR(dst)) {
+			netdev_dbg(amt->dev, "no route to %pI6c\n",
+				   &tunnel->addr.ip6);
+			DEV_STATS_INC(amt->dev, tx_dropped);
+			return;
+		}
+
+		tmtu = amt_tmtu(dst);
+		if (amt_tmtu_exceeded(oskb, tmtu)) {
+			dst_release(dst);
+			/* A source ignores a Packet Too Big below
+			 * IPV6_MIN_MTU, so a tunnel that small is only
+			 * dropped for.
+			 */
+			if (tmtu >= IPV6_MIN_MTU && (!*ptb || tmtu < *ptb))
+				*ptb = tmtu;
+			DEV_STATS_INC(amt->dev, tx_dropped);
+			return;
+		}
+	}
+
+	skb = skb_copy_expand(oskb, sizeof(*amtmd) + amt_ip_hlen(amt) +
 			      sizeof(struct udphdr), 0, GFP_ATOMIC);
-	if (!skb)
+	if (!skb) {
+		dst_release(dst);
 		return;
+	}
 
 	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
 	 * header. The tunnelled payload has no link-layer header, so the
@@ -1385,18 +1442,7 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
 	if (udp_tunnel_handle_offloads(skb, true)) {
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
+		dst_release(dst);
 		kfree_skb(skb);
 		return;
 	}
@@ -1410,17 +1456,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
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
+			   tunnel->source_port, 0, dst);
+	if (err) {
+		DEV_STATS_INC(amt->dev, tx_dropped);
+		kfree_skb_reason(skb, SKB_DROP_REASON_IP_OUTNOROUTES);
+	}
 }
 
 /* Send a Membership Query in reply to an unauthenticated Request.
@@ -1464,7 +1505,7 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
 	return amt_udp_xmit(amt, sk, skb, daddr, amt->relay_port, dport,
-			    inet_dsfield_to_dscp(AMT_TOS));
+			    inet_dsfield_to_dscp(AMT_TOS), NULL);
 }
 
 static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
@@ -1482,6 +1523,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct iphdr *iph;
 	bool data = false;
 	bool v6 = false;
+	u32 ptb = 0;
 	u32 hash;
 
 	iph = ip_hdr(skb);
@@ -1575,8 +1617,10 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 			}
 			continue;
 found:
-			amt_send_multicast_data(amt, skb, tunnel, v6);
+			amt_send_multicast_data(amt, skb, tunnel, v6, &ptb);
 		}
+		if (ptb && v6)
+			icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0, ptb);
 	}
 
 	dev_kfree_skb(skb);
-- 
2.47.3

