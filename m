Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206073ACA43
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213130; cv=none; b=O8l27oJ+PByiXK2GHuR8xxUBwJGC2THMMCuh0pRCJr2F0kY/Ri/2sFuKOT24w+AoTtt0UjMRge182+wTkDoeHufmdR/a/XIzG//c4bxkhk+0guLf30WYZbgEc73KGW+ONox4Y/Qg2ihmG3cujzAKQGvTCTSvGGA31lCOFogjxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213130; c=relaxed/simple;
	bh=4ETydHIUMxlDO4oDu5fa8XhnlEwNHQHuV9lq4CMLD3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KATnQvvB1tYovUJrp6lD289WiRV9VoW/Ame7QEpdAzAFNdteRlh15oWoCyfXHTZGN+F7qflizxa67P2AtclZZ7urrlAGzmcc4y3HvAx/uEMOpX9fKRNhwg3wtZ/JYn0pRyp1WpGqkcUSJP55uaCXx0mjPPwjblkRyu3Cqxbc14I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHZbwL0H; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHZbwL0H"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a20367cf82so1303981fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213117; x=1788817917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtPySr7ef4Qsy5GLhJjPitHTdTOLF4vFl+f9aSnO9SE=;
        b=jHZbwL0HvVuHibw4GAJpS7PIwdU0a/wzpswxGqhhvz/Y4jf4jjxf6fmWD/Anccdx/b
         h+QUqMYwynjtF2merul3uK3XtfoL/ZpUCcMWyWOeWccW88jrWUHmNTa6xMzA9brpsjiu
         sCGVfcG0XkBHf5yFBun0HV5ubPErr8C43a+R1iIs5wKnsIpnYX//YPkdf1td8DNgPqYJ
         Ep/f6uSWcJ8Ps25Olyyeqo3alJ4heDQE59Mu4BsCJMrDaEXQWIPA+tdlGgxiJf3N5ew3
         BXyGJHQiw9PnJrFpdX5EQxLZZr4sn5k4kkJvoRlPhLPX/hflqFabgzSsiMPtA2gSUuwR
         vnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213117; x=1788817917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtPySr7ef4Qsy5GLhJjPitHTdTOLF4vFl+f9aSnO9SE=;
        b=Dbc0mMaH+iGtPruQKAl3RuEBHZ9yt1CoscoF6KIOK3NUOs5OjTsV13quTJyKOgmJsB
         gwR3dh4tiVlMTmIHLXnI3qJ3LtWZrztPJqw2vMWxwPE2DLUUlpnu6hLyv08BYu6qt7Db
         TBnu8yEblreq2pt04jo0NYr3zJ87jRPL7KKSljSaXy2y/UZZY3r4eACo4kbJp5C4VUvN
         89E1ZhCumkK6D7Rc/t/uXl5Y/Wy5Jdzkk3jbfKxP+4kyZPw6026HXGg0GphKnJkDnSjJ
         mVGJ6jkzhAXHThwOolTUt2I98m8HLBZavL6qS3K0OnHLmJCODQivuDDYPUKTYrGpI9Qa
         5wNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzipuoMS33HnNfZX94uVth1qq5mk+XJKi9ERGqyP3GsTECiOoJpN0iB5sJVAKl2NR03zcH+hUWttZGFOmFrDWE=@vger.kernel.org
X-Gm-Message-State: AFuF++lTNCCnsukdrYUlbbgIAOExMiPnF5AsOyjI2qa7ULAP8U5jhnya
	geRrC5i1JV6JSs1YeyRq+dro8yF68U5wvLtJdcZRRbXSxU8QqOmSdSFb
X-Gm-Gg: AYBFou0z6vv7V7gMpOeBHUSb/oFqD1dNRTl7bcmAr3cOLBSQy8V/DxGEFgpy6qwpUBl
	rdM1o5XzYyai6wILJ3IpBJUFIqLU1yohiVfzt+uG3JT/3R69KCqNtmi1K5rbCJ6DAxk5YYkq9uh
	Wl9ZNQLV3fXlENrMM2VSZW+7JxRcqoZlIX4MTxyUtu4k2BcH0NdKQFgY48tLBURTPAlzAbX9I8k
	JCPjgkesL06SMeFDVNfR8mMI61olpLOkIjyiXxKDE+bczFiwMjdpWYKuSmmF4vJcnN1BpIuvgfs
	oLs3OBuilzPMRKVZGyprRwKKllusi6hIpWuCkS0MguuMu0D1W/RZkFiWNzrWi+PsLNpEh6uYT8z
	EVtq8cVJ7q7gKQy0e0pUcPtBMEEGotceJa8hjYNBHUlNt62L7khcL/ox0UFNsqzpMbP4O7Lvl8Z
	fZFzSfARhvBLGSgOEdf+wJmMUJ3tJV9ge8pkSusD4vUECYGyJWFQ/uZBL69sZEKWegPa76Unv9Z
	yjJHsoOTbZhNi9xLxv+vGQCmS6QqhtH7Q==
X-Received: by 2002:a05:6512:3b8f:b0:5b5:e2f1:e6f9 with SMTP id 2adb3069b0e04-5b5e68bc823mr9495560e87.11.1788213117123;
        Mon, 31 Aug 2026 14:51:57 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:56 -0700 (PDT)
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
Subject: [PATCH net-next 04/11] gre: make gre_parse_header() report a drop reason
Date: Tue,  1 Sep 2026 00:51:30 +0300
Message-ID: <20260831215137.549324-5-littlesmilingcloud@gmail.com>
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

gre_parse_header() returns -EINVAL for six different reasons and its
callers turn that into a plain kfree_skb().  The only detail they could
get so far was the csum_err flag, which none of them actually reads:
both ip_gre and ip6_gre declare it, pass it in and then ignore it.

Replace that dead output parameter with an enum skb_drop_reason one and
let the two receive paths report what happened.  Two reasons are added:

 - SKB_DROP_REASON_GRE_INVALID_HDR, for a header carrying an unsupported
   version or the routing bit,

 - SKB_DROP_REASON_GRE_CSUM, for a checksum error, next to the existing
   TCP_CSUM, UDP_CSUM, ICMP_CSUM and IP_CSUM.

The header pull failures reuse SKB_DROP_REASON_HDR_TRUNC, which
documents exactly this case, and gre_rcv() in the demux reuses
pskb_may_pull_reason() and SKB_DROP_REASON_UNHANDLED_PROTO.

A NULL reason keeps the meaning a NULL csum_err had: the caller is not
interested in it and the checksum must not be verified.  This matters
for the ICMP error handlers, which only get a part of the original
packet and must not drop it when the checksum does not validate.

Tunnel lookup failures still report SKB_DROP_REASON_NOT_SPECIFIED here;
they are addressed in the following patches.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  9 +++++++
 include/net/gre.h             |  2 +-
 net/ipv4/gre_demux.c          | 51 ++++++++++++++++++++++++++---------
 net/ipv4/ip_gre.c             |  6 ++---
 net/ipv6/ip6_gre.c            |  6 ++---
 5 files changed, 55 insertions(+), 19 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 40f94ecb912a..8efa682601f0 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -130,6 +130,8 @@
 	FN(RECURSION_LIMIT)		\
 	FN(IP_TUNNEL_CFG_OPTS_MISMATCH)	\
 	FN(IP_TUNNEL_OLD_SEQ)		\
+	FN(GRE_INVALID_HDR)		\
+	FN(GRE_CSUM)			\
 	FNe(MAX)
 
 /**
@@ -622,6 +624,13 @@ enum skb_drop_reason {
 	 * numbering.
 	 */
 	SKB_DROP_REASON_IP_TUNNEL_OLD_SEQ,
+	/**
+	 * @SKB_DROP_REASON_GRE_INVALID_HDR: the GRE header is invalid, e.g.
+	 * an unsupported version or the routing bit is set.
+	 */
+	SKB_DROP_REASON_GRE_INVALID_HDR,
+	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
+	SKB_DROP_REASON_GRE_CSUM,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/include/net/gre.h b/include/net/gre.h
index b55f67ecd2fc..a63f26c3f78e 100644
--- a/include/net/gre.h
+++ b/include/net/gre.h
@@ -33,7 +33,7 @@ int gre_add_protocol(const struct gre_protocol *proto, u8 version);
 int gre_del_protocol(const struct gre_protocol *proto, u8 version);
 
 int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs);
+		     enum skb_drop_reason *reason, __be16 proto, int nhs);
 
 static inline bool netif_is_gretap(const struct net_device *dev)
 {
diff --git a/net/ipv4/gre_demux.c b/net/ipv4/gre_demux.c
index 96fd7dc6d82d..598678f42ef5 100644
--- a/net/ipv4/gre_demux.c
+++ b/net/ipv4/gre_demux.c
@@ -58,26 +58,43 @@ EXPORT_SYMBOL_GPL(gre_del_protocol);
 
 /* Fills in tpi and returns header length to be pulled.
  * Note that caller must use pskb_may_pull() before pulling GRE header.
+ *
+ * @reason is only written when the header is rejected, so the caller has
+ * to initialise it before the call.
+ *
+ * A NULL @reason means that the caller is not interested in the drop
+ * reason, and also that the checksum must not be verified.  This is what
+ * the ICMP error handlers need, as they only get a part of the original
+ * packet.
  */
 int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs)
+		     enum skb_drop_reason *reason, __be16 proto, int nhs)
 {
 	const struct gre_base_hdr *greh;
 	__be32 *options;
 	int hdr_len;
 
-	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr))))
+	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr)))) {
+		if (reason)
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 		return -EINVAL;
+	}
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
-	if (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING)))
+	if (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING))) {
+		if (reason)
+			*reason = SKB_DROP_REASON_GRE_INVALID_HDR;
 		return -EINVAL;
+	}
 
 	gre_flags_to_tnl_flags(tpi->flags, greh->flags);
 	hdr_len = gre_calc_hlen(tpi->flags);
 
-	if (!pskb_may_pull(skb, nhs + hdr_len))
+	if (!pskb_may_pull(skb, nhs + hdr_len)) {
+		if (reason)
+			*reason = SKB_DROP_REASON_HDR_TRUNC;
 		return -EINVAL;
+	}
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
 	tpi->proto = greh->protocol;
@@ -87,8 +104,8 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		if (!skb_checksum_simple_validate(skb)) {
 			skb_checksum_try_convert(skb, IPPROTO_GRE,
 						 null_compute_pseudo);
-		} else if (csum_err) {
-			*csum_err = true;
+		} else if (reason) {
+			*reason = SKB_DROP_REASON_GRE_CSUM;
 			return -EINVAL;
 		}
 
@@ -116,8 +133,11 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 
 		val = skb_header_pointer(skb, nhs + hdr_len,
 					 sizeof(_val), &_val);
-		if (!val)
+		if (!val) {
+			if (reason)
+				*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return -EINVAL;
+		}
 		tpi->proto = proto;
 		if ((*val & 0xF0) != 0x40)
 			hdr_len += 4;
@@ -132,8 +152,11 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 	    greh->protocol == htons(ETH_P_ERSPAN2)) {
 		struct erspan_base_hdr *ershdr;
 
-		if (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr)))
+		if (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr))) {
+			if (reason)
+				*reason = SKB_DROP_REASON_HDR_TRUNC;
 			return -EINVAL;
+		}
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + nhs + hdr_len);
 		tpi->key = cpu_to_be32(get_session_id(ershdr));
@@ -146,15 +169,19 @@ EXPORT_SYMBOL(gre_parse_header);
 static int gre_rcv(struct sk_buff *skb)
 {
 	const struct gre_protocol *proto;
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	u8 ver;
 	int ret;
 
-	if (!pskb_may_pull(skb, 12))
+	reason = pskb_may_pull_reason(skb, 12);
+	if (reason)
 		goto drop;
 
 	ver = skb->data[1]&0x7f;
-	if (ver >= GREPROTO_MAX)
+	if (ver >= GREPROTO_MAX) {
+		reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 		goto drop;
+	}
 
 	rcu_read_lock();
 	proto = rcu_dereference(gre_proto[ver]);
@@ -167,11 +194,11 @@ static int gre_rcv(struct sk_buff *skb)
 drop_nohandler:
 	rcu_read_unlock();
 	dev_core_stats_rx_nohandler_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, SKB_DROP_REASON_UNHANDLED_PROTO);
 	return NET_RX_DROP;
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return NET_RX_DROP;
 }
 
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 82309efd417e..1894c5746a73 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -439,8 +439,8 @@ static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
 	int hdr_len;
 
 #ifdef CONFIG_NET_IPGRE_BROADCAST
@@ -451,7 +451,7 @@ static int gre_rcv(struct sk_buff *skb)
 	}
 #endif
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IP), 0);
+	hdr_len = gre_parse_header(skb, &tpi, &reason, htons(ETH_P_IP), 0);
 	if (hdr_len < 0)
 		goto drop;
 
@@ -469,7 +469,7 @@ static int gre_rcv(struct sk_buff *skb)
 	icmp_send(skb, ICMP_DEST_UNREACH, ICMP_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 69c51f1a5bf0..736eefdb528f 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -569,11 +569,11 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
 	int hdr_len;
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IPV6), 0);
+	hdr_len = gre_parse_header(skb, &tpi, &reason, htons(ETH_P_IPV6), 0);
 	if (hdr_len < 0)
 		goto drop;
 
@@ -594,7 +594,7 @@ static int gre_rcv(struct sk_buff *skb)
 	icmpv6_send(skb, ICMPV6_DEST_UNREACH, ICMPV6_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3

