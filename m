Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634096;
	b=onzPbFqRYUr/19e3FCA0yuhWMpAJqIi1Gyl+B9G9RO6ea2IRNx+Mj59sK6yag6VwlDmL
	 wX6lyXnAK7gJqXUshDBKNvWM0DjjEF+NKWssF44QWRp0GdRg97PC3S24TtvPqz8nvyOKV
	 Fi6lA0rG4fmw5+NGShFNZQ6hDvXOceXlG+lItnqUfUkvvUgthsZ6GhoXGP5xnGfjJMegm
	 dfyiT9/5hiJX4Ba52htYX7Q6kXWJXR5vngtztb/9YLnDtreYhhm7QoTk1hVwEM57iUDDB
	 Fw1Eseh8zas1Vk57x8ShwHmxNXo5urxVyg7/rbBGA3R0NiFcZJxWtS7EgPqfjRUv+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uNiEM0a9JgSnsYXacVte54ZlA3LkxpeOlPiFkCIz/sQ=;
	b=KcyaA0ZV3s7YzyavblWmV+wFjEdwJi0R1Km9nRAkDj+CxFYU0jmq6U62nZukFZIQW/wX
	 +ARGlJnQYky75ZsNgnukrkaMA0ir66mI9iCs42u1I0JxZd08mnVKlKkYjwOEvJEjoAXHA
	 xtK1WFIKJLdD+CLBPWvWFMFCU4bSlL1uc5tcQqRuV/32QSmC0do/+J3VjoqMiPT4Z/r7P
	 f5T+OvwF3xmczFuxWr4xoMb5ufp78a90sRj89d7CK1JFHK3Fwm3/0vbNWjWiW7ku3elKW
	 vnZMk/eDYsHQVPp1D5YIyRqT0kvgnFZgsjbkIAjjixgPQbBn/Z6Ok98Zr9oLoCzbPqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=o9sMEdqF;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A610B606A33D
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A610B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=o9sMEdqF
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efddf749e5so28997175ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634095; x=1796238895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNiEM0a9JgSnsYXacVte54ZlA3LkxpeOlPiFkCIz/sQ=;
        b=o9sMEdqFLq/R0U50sRebgVWmVCXqKMeXe2bVI6GTFYixDfE9vgXodxcHl+0vSszaJx
         NSKTrtEHXdTpXDWLV6WyYYOJhVz8f6NVcL5lLEn26K9AoxlSKeKVzBjrce7M8I3kiujB
         KREbaMU9/uqWoV0+yetWM37CfVtShqARLIBLn0OA0L++RVNFu2LInbwhMQyqtSt5sOSR
         7PMCmqjOK3UspGtSy4OWpdEZ6esj729gOE7jmZodtfO9Uc+JMGCTGQa51nxZus5vbtFP
         J5csef/c87mpOy8222qZiLooaWaiBUThkcQ9V9xIZ5bAw2pwWm716+P4NVdpg+ZdHppH
         8rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634095; x=1796238895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNiEM0a9JgSnsYXacVte54ZlA3LkxpeOlPiFkCIz/sQ=;
        b=itMeK1BkheHkurqUztzVED3mxqfT1nsvQHTJT5pt9QRmapXnzeavcy98FJ9YemhzzS
         f9BEMa7Tot3oHY/XdXK95NgmWy62zHM+W6G4KrvOSJT02vZp7EeFdclA37MLT5uzkprx
         abNlggEYzEXKHO/Ap1ktJJYJWAyzAWfmy0PAVYHxizNWCd0ArGS0S3DDZPnj/puaMB+b
         KO7D2WrS3H5leZlAhQPgtWmtc9xfd488aAPtqQLBCkRdx0fI+zpSzLxpN8xMMAGviFA+
         1g10BqZwWqJK+YbpdPqZ3giadRVIdFrc/IOS6T7wbt3BKY0XOY/FzUKRO0VniwOUUoTn
         oefA==
X-Forwarded-Encrypted: i=1; AL+hErE+MPnZh+RtfZmB9PWSbvkuNgoF7/FVsKkOaTgrfFLMwRhgneCBaMKBdM3rBkhwmB+jyywMY77LBk2MwPXEdKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QIm5ogNvO9MxWjE+liDpyiOU05Lko1opJfdfn+haVv2jS7FrT
	DOsaHwyP4dUS96Iv5p7dLJ2V7KHKYbnrgoGTkUwUMR52AXQHqju+yJo1N19wEY/Lt7c=
X-Gm-Gg: AZFdTZferWUvGfChO3unT+P603Vm/BU1PUqF6VvEgFB4kiQD7PYlQfd3xOXrPqJk3Pw
	zEC6HRLyCPmy7WZ63FnQL0huECk6E8APGGAXTcBome1snLl2Q9TR/Rx0aRWDt7zakPPUyPfPmA7
	fwX+6tV2UoHFJFBgp/VspwB+YfyEgObTfqx6V39o/7hNF24HSjCkKceGWTbonkJKBknsL0UeexC
	YC1QFgVU5bCb1nXTusjEKA3xYcOxJm/XAqzK2Mb8A0RuUpO6TwWWaaE6q0hx/lpGSi0m6sEhV6W
	IK6iIeRTGX4JrDOUPKb6qpOGUNfxqUCZRhG1mFkZvWy2r4I7MqzwxHJTnfjJlaX7MnObzfez9qL
	OfXpr8uoKMwGeeVu3IhywBq07uNSF0BDHZ/trVjyazvmaJviC5ILqgYN9hFyyVDIYNUpk6gOMuA
	LXep5Z6pqwzEolDfNXS5oHxD57KjFZK8pe3kqMhMR3sbv3XnqZIRNr25j4ntZ3KspF33t9EZye2
	4LMo739+IF2zkR/5nQgGN70jsIWznEQ+fF87Qz1BHVYfUe+Q1FXu54VtxE30CqlmCRCXdaohB21
	46TENTy55cwyzhYnoTBthiAoxCSOkSKjtanJFeQC0YEP6SMs4776xBAoUvUnUqYeSe+e+DxHjrr
	LwS8Mk3m/yuKZK61imqaaCKMwRc0xzDAKf5G2nQwGDxsGzPwWhbY=
X-Received: by 2002:a17:902:d489:b0:2f0:8799:415c with SMTP id d9443c01a7336-2f087995526mr93640865ad.39.1795634094950;
        Wed, 25 Nov 2026 11:14:54 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:54 -0800 (PST)
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
Subject: [PATCH net-next v2 02/12] amt: send the Relay Advertisement over IPv6
Date: Wed, 25 Nov 2026 19:14:40 +0000
Message-ID: <20261125191450.2497936-3-omar@blockcast.net>
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

A gateway finds its relay with a Relay Discovery, and the relay answers
with a Relay Advertisement carrying the address the gateway should use
from then on. RFC 7450 s5.1.2 defines two forms of the Advertisement:
the same fixed header and nonce followed by either a 4-byte IPv4 or a
16-byte IPv6 relay address, and s5.2 selects the form from the IP
version of the outer header rather than from a field in the message.
An amt relay on an IPv6 outer transport therefore has to answer with
the 24-byte IPv6 form.

Add struct amt_header_advertisement_v6 for that form and
amt_send_advertisement_v6(), which fills it on the stack and sends it
with a new amt_send_ctrl_v6() helper. The helper routes with
ip6_dst_lookup_flow() through amt_route6(), which the later IPv6
senders share, and sends with udp_tunnel6_xmit_skb(), which builds the
UDP and IPv6 headers and fills in the UDP checksum that RFC 8200 s8.1
makes mandatory over IPv6. Like the IPv4 control messages, it marks the
skb TC_PRIO_CONTROL, uses AMT_TOS as the traffic class and passes no
netdev, so control traffic stays out of the amt device's tunnel stats.

amt_discovery_handler() answers an IPv6 device's Discovery with the
IPv6 form, sent back to the outer source of the Discovery. RFC 7450
s5.1.2 makes the source of the Advertisement the destination of the
Discovery, the Relay Discovery Address, so amt_send_ctrl_v6() and
amt_route6() take the source address from their caller. The socket is
bound to ::, so a Discovery sent to an anycast or secondary address
reaches the relay, and a gateway accepts only an Advertisement whose
source is the address it sent the Discovery to; answering from
local_ipv6 would leave such a gateway stuck in discovery. The relay
address carried in the message stays local_ipv6. The same socket also
receives a Discovery sent to a multicast group the host has joined,
such as ff02::1, and a multicast address may not be a source (RFC 4291
s2.7), so a Discovery with a multicast destination is dropped rather
than answered by every relay on the link with an invalid packet. The
handler copies both outer addresses by value after its last
pskb_may_pull(), and sending does not pull the received skb.

The IPv4 Advertisement has always been sent from local_ip, so an IPv4
gateway that discovers the relay through another of its addresses drops
the reply. That is left as it is: changing the source of an existing
IPv4 relay's replies is a fix of its own for net, and nothing in this
series depends on it.

amt_v6() is still false for every device, so there is no functional
change yet.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++
 include/net/amt.h |  21 +++++++++
 2 files changed, 136 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 3f3205d2d..52ccaca08 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -708,6 +708,80 @@ static void __amt_update_relay_status(struct amt_tunnel_list *tunnel,
 	tunnel->status = status;
 }
 
+static struct dst_entry *amt_route6(struct amt_dev *amt, struct sock *sk,
+				    const struct in6_addr *saddr,
+				    const struct in6_addr *daddr,
+				    __be16 sport, __be16 dport)
+{
+	struct flowi6 fl6;
+
+	memset(&fl6, 0, sizeof(fl6));
+	fl6.flowi6_oif		= amt->stream_dev->ifindex;
+	fl6.flowi6_proto	= IPPROTO_UDP;
+	fl6.daddr		= *daddr;
+	fl6.saddr		= *saddr;
+	fl6.fl6_dport		= dport;
+	fl6.fl6_sport		= sport;
+	/* The packet carries AMT_TOS, so route on it too: a policy rule
+	 * that matches the DSCP must see the same value.
+	 */
+	fl6.flowlabel		= ip6_make_flowinfo(AMT_TOS, 0);
+
+	return ip6_dst_lookup_flow(amt->net, sk, &fl6, NULL);
+}
+
+/* Send an AMT control message over the IPv6 outer transport from @saddr.
+ * udp_tunnel6_xmit_skb() adds the UDP and IPv6 headers, including the UDP
+ * checksum that IPv6 requires. Returns 0 once the message is handed to the
+ * IPv6 stack.
+ */
+static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
+			    const struct in6_addr *daddr,
+			    __be16 sport, __be16 dport,
+			    const void *msg, unsigned int len)
+{
+	struct dst_entry *dst;
+	struct sk_buff *skb;
+	struct sock *sk;
+	int hlen, err;
+
+	rcu_read_lock();
+	sk = rcu_dereference(amt->sk);
+	if (!sk || !netif_running(amt->stream_dev) ||
+	    !netif_running(amt->dev)) {
+		err = -ENETDOWN;
+		goto out;
+	}
+
+	dst = amt_route6(amt, sk, saddr, daddr, sport, dport);
+	if (IS_ERR(dst)) {
+		DEV_STATS_INC(amt->dev, tx_errors);
+		err = PTR_ERR(dst);
+		goto out;
+	}
+
+	hlen = LL_RESERVED_SPACE(amt->dev) + sizeof(struct ipv6hdr) +
+	       sizeof(struct udphdr);
+	skb = netdev_alloc_skb_ip_align(amt->dev, hlen + len +
+					amt->dev->needed_tailroom);
+	if (!skb) {
+		dst_release(dst);
+		DEV_STATS_INC(amt->dev, tx_errors);
+		err = -ENOMEM;
+		goto out;
+	}
+
+	skb_reserve(skb, hlen);
+	skb_put_data(skb, msg, len);
+	skb->priority = TC_PRIO_CONTROL;
+	udp_tunnel6_xmit_skb(dst, sk, skb, NULL, saddr, daddr, AMT_TOS,
+			     ip6_dst_hoplimit(dst), 0, sport, dport, false, 0);
+	err = 0;
+out:
+	rcu_read_unlock();
+	return err;
+}
+
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -3010,6 +3084,24 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	rcu_read_unlock();
 }
 
+/* The IPv6 form of amt_send_advertisement(), carrying the relay's IPv6
+ * address. It is sent from @saddr, the address the Discovery was sent to.
+ */
+static void amt_send_advertisement_v6(struct amt_dev *amt, __be32 nonce,
+				      const struct in6_addr *saddr,
+				      const struct in6_addr *daddr,
+				      __be16 dport)
+{
+	struct amt_header_advertisement_v6 amta = {
+		.type	= AMT_MSG_ADVERTISEMENT,
+		.nonce	= nonce,
+		.ip6	= amt->local_ipv6,
+	};
+
+	amt_send_ctrl_v6(amt, saddr, daddr, amt->relay_port, dport,
+			 &amta, sizeof(amta));
+}
+
 static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 {
 	struct amt_header_discovery *amtd;
@@ -3026,6 +3118,29 @@ static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (amtd->reserved || amtd->version)
 		return true;
 
+	/* The Advertisement takes the form of the outer IP version, and
+	 * RFC 7450 s5.1.2 sources it from the address the Discovery was
+	 * sent to, which may be an anycast Relay Discovery Address rather
+	 * than local_ipv6.
+	 */
+	if (amt_v6(amt)) {
+		struct in6_addr saddr = ipv6_hdr(skb)->saddr;
+		struct in6_addr daddr = ipv6_hdr(skb)->daddr;
+
+		/* The socket bound to :: also receives a Discovery sent to
+		 * a group, and a multicast address can never be a source
+		 * (RFC 4291 s2.7), so such a Discovery is not answered. Nor
+		 * is one from ::, which has nowhere to be sent.
+		 */
+		if (ipv6_addr_is_multicast(&daddr) ||
+		    ipv6_addr_any(&saddr))
+			return true;
+
+		amt_send_advertisement_v6(amt, amtd->nonce, &daddr, &saddr,
+					  udph->source);
+		return false;
+	}
+
 	amt_send_advertisement(amt, amtd->nonce, iph->saddr, udph->source);
 
 	return false;
diff --git a/include/net/amt.h b/include/net/amt.h
index ca35782f8..52d77bc6b 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -133,6 +133,27 @@ struct amt_header_advertisement {
 	__be32	ip4;
 } __packed;
 
+/* The IPv6 form of the Relay Advertisement (RFC 7450 s5.1.2): the same
+ * header and nonce, followed by a 16-byte relay address. s5.2 selects the
+ * form from the IP version of the outer header, not from a field in the
+ * message, so it is a type of its own.
+ */
+struct amt_header_advertisement_v6 {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	u32	type:4,
+		version:4,
+		reserved:24;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+	u32	version:4,
+		type:4,
+		reserved:24;
+#else
+#error  "Please fix <asm/byteorder.h>"
+#endif
+	__be32		nonce;
+	struct in6_addr	ip6;
+} __packed;
+
 struct amt_header_request {
 #if defined(__LITTLE_ENDIAN_BITFIELD)
 	u32	type:4,
-- 
2.47.3

