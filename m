Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6B1465B4
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898210; cv=none; b=FqWTpkLQOe3Gfe0lWN5nGYCQXHo9WEslh22KvWRQQcdOZpoeoxt9gAF5jkacYhW2qBhIhK5ibeGtxFk2+hlT52ekRKka9r0bT8RLOeh5IgmmbQtiXr7gyv70Ja2srjdR44rbAVAUrrPZq8fsZANt//OXehMEERiQvUp7zjm/SQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898210; c=relaxed/simple;
	bh=kZVwnXWURA3X/G1DyhA5FWIIj06eTQFconwOEGeohEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZQsTSTJXAXRvkh/ymO3jpubPpvdZ1O3nFO8Ur8Qk1s3qf6bV3wy40NLVA9Jdjeoxm++2MCZ0/FOQMcTO7Bm0fWoPErMQfAXZjmC3VtHDXALOW2qPHSPlqb3F/jZZjngHYDFC330WqUqkfsl1mLFcGrHPOIEnzBVmZd1WsArgUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Apqs8Kk+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Apqs8Kk+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so1218991a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774898209; x=1775503009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6LmQvHoJMIuzVDw1ku5rpZrRgMMk/C43OeFB++Ma9c=;
        b=Apqs8Kk+ZNtORdgXpYS1lfaNjMHX6xkpPQMEA+CzFfqrUvzwMVIwmgmNEGZZO5ZPDH
         oix7BXbUZ1nYWMPuyvgZM+AkE0RQMDxeuXnjkE0M6tBV9v9ac7dTAefdxlzGmbPZsLSd
         C9/G804HBYTSV1xzTxbrmHA24DhywzZtR+QjLq7EcXfVmnDoX6NUL+62xILM9fODmoRS
         e0RTvB33gLAGKPDytyoXmLr+U7dMmXzbEozmEsnXF+BBamVLyv5DqZvvT6gdvXX+1013
         vyCpblDJo2ob3vKUSBj3drqOZ9+X7mpcCrbt6/sU0b2wer+OT5XZdasiDm22ggZAW6ny
         dj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774898209; x=1775503009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6LmQvHoJMIuzVDw1ku5rpZrRgMMk/C43OeFB++Ma9c=;
        b=RisazkD2rEX4b8738eMg1B2NXfdtBaYmNfz6VyYro58coKT58D4KGXZEbwH1j28LfC
         zNKQvmMopOFq0+ZoJ4ix0gtMaIcj/s8N3Z0HTjLZtDjvUW1b7jHXfAmthpwHXmhJ8Fxu
         gjfb9dyxSjvOzDdalt7pUhVkGPu0wppI5tocr5DIYAYTmJjGD54ukjUHKld+HdmnqVbd
         YCrHZLcF4FgudPsYj6G0cYE2HlkjRQGnu5vTx2zyBF5BF4AkgeG9R9WL7sC3cQvihagV
         WiCfT6rtWJP32RqO7QkrwVBSwrhFAyJtWammhk0dKG1Scp06+f41VD8YOVQTTjnxdOM7
         uMkw==
X-Forwarded-Encrypted: i=1; AJvYcCUfm6UB76osNOeGey//uZxwfLcRjaW0Ahb+1+FYmxRb5q7Ih66AI/UMnuXgB1OEBd0C6KNx7myqgytSbDC4ghM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF9Zrc3cgBtjbfq02yjxuVD4uUhJc7rAU1WhxfO0s/jWT0Cs+w
	SpnmbJEFhxond/YR0dt92QXzKq2YEYcr4QutzGlIKFiZE7hUBzRgO74+
X-Gm-Gg: ATEYQzwg0ihbD9ScQG8tBWmauX24na47jxytfnx/Xhi2vnujecoXp1g25uP2qmen7UT
	vLS1QOaSKAEP4HT5vLCQV4JjVCvTNki+uqvfsbWxLHuZbe8yMefqUtdY3u3/RIzU1f53hPtbXYW
	BTJVOzoF3GF+KLIRHZQZSJDmDAqf1BHMtn2KxgA2pehAZGOOwrLmgFGH4bGkuGPtkD6ARlFP0Iq
	X7HqFHMCDS/MYrl22tAAKaJeQMgycYsg8mwkmUCu+eZzzFSJ2SZ6EszZEqJxufQsPiUoyp6RLJy
	xYOExZTrPf0C9ENBqaRIw2HUgTATLpNKamQiHGzOUxloUO2QOqftdm3qgNLwmxGYkM6whcWTShJ
	/0OplJ2kKEJpuUfNL31F0/2JYEm3nX3GHgwJeW6JANLTGA1MaVOmGZtPMiKyUqmO3XM4PQ2qwoS
	NQy0YHODWP4rdBYh9MBpUwfXoa+pJBsTPVBiqnlFjy
X-Received: by 2002:a17:90b:4b0e:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35c300c19d2mr12577177a91.22.1774898208327;
        Mon, 30 Mar 2026 12:16:48 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm9627178a91.17.2026.03.30.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:16:47 -0700 (PDT)
From: Ujjal Roy <royujjal@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Yong Wang <yongwang@nvidia.com>,
	Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 3/5] ipv4: igmp: encode multicast exponential fields
Date: Mon, 30 Mar 2026 19:16:09 +0000
Message-ID: <20260330191611.16929-4-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330191611.16929-1-royujjal@gmail.com>
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
 <20260330191611.16929-1-royujjal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In IGMP, QQIC and MRC fields are not currently encoded
when generating query packets. Since the receiver of the
query interprets these fields using the IGMPv3 floating-
point decoding logic, any raw interval value that exceeds
the linear threshold is currently parsed incorrectly as
an exponential value, leading to an incorrect interval
calculation.

Encode and assign the corresponding protocol fields during
query generation. Introduce the logic to dynamically
calculate the exponent and mantissa using bit-scan (fls).
This ensures QQIC and MRC fields (8-bit) are properly
encoded when transmitting query packets with intervals
that exceed their respective linear threshold value of
128 (for QQI/MRT).

RFC 3376: if QQIC/MRC >= 128, the QQIC/MRC field represents
a floating-point value as follows:
     0 1 2 3 4 5 6 7
    +-+-+-+-+-+-+-+-+
    |1| exp | mant  |
    +-+-+-+-+-+-+-+-+

Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 include/linux/igmp.h      | 80 +++++++++++++++++++++++++++++++++++++++
 net/bridge/br_multicast.c | 14 +++----
 2 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/include/linux/igmp.h b/include/linux/igmp.h
index 3c12c0a63492..3a4e9cec3959 100644
--- a/include/linux/igmp.h
+++ b/include/linux/igmp.h
@@ -110,6 +110,86 @@ struct ip_mc_list {
 
 /* IGMPV3 floating-point exponential field threshold */
 #define IGMPV3_EXP_MIN_THRESHOLD	128
+/* Max representable (mant = 0xF, exp = 7) -> 31744 */
+#define IGMPV3_EXP_MAX_THRESHOLD	31744
+
+/* V3 exponential field encoding */
+
+/*
+ * IGMPv3 QQIC/MRC 8-bit exponential field encode.
+ *
+ * RFC3376 defines only the decoding formula:
+ * QQI/MRT = (mant | 0x10) << (exp + 3)
+ *
+ * but does NOT define the encoding procedure. To derive exponent:
+ *
+ * For any value of mantissa and exponent, the decoding formula
+ * indicates that the "hidden bit" (0x10) is shifted 4 bits left
+ * to sit above the 4-bit mantissa. The RFC again shifts this
+ * entire block left by (exp + 3) to reconstruct the value.
+ * So, 'hidden bit' is the MSB which is shifted by (4 + exp + 3).
+ *
+ * Total left shift of the 'hidden bit' = 4 + (exp + 3) = exp + 7.
+ * This is the MSB at the 0-based bit position: (exp + 7).
+ * Since fls() is 1-based, fls(value) - 1 = exp + 7.
+ *
+ * Therefore:
+ *     exp  = fls(value) - 8
+ *     mant = (value >> (exp + 3)) & 0x0F
+ *
+ * Final encoding formula:
+ *     0x80 | (exp << 4) | mant
+ *
+ * Example (value = 3200):
+ *  0               1
+ *  0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ * |0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0| (value = 3200)
+ * |        ^-^-mant^ ^..(exp+3)..^| exp = 4, mant = 9
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ *
+ * Encoded:
+ *   0x80 | (4 << 4) | 9 = 0xC9
+ */
+static inline u8 igmpv3_exp_field_encode(unsigned long value)
+{
+	u8 mc_exp, mc_man;
+
+	/* RFC3376: QQIC/MRC < 128 is literal */
+	if (value < IGMPV3_EXP_MIN_THRESHOLD)
+		return (u8)value;
+
+	/* Saturate at max representable (mant = 0xF, exp = 7) -> 31744 */
+	if (value >= IGMPV3_EXP_MAX_THRESHOLD)
+		return 0xFF;
+
+	mc_exp  = (u8)(fls(value) - 8);
+	mc_man = (u8)((value >> (mc_exp + 3)) & 0x0F);
+
+	return 0x80 | (mc_exp << 4) | mc_man;
+}
+
+/* Calculate Maximum Response Code from Max Resp Time */
+static inline u8 igmpv3_mrc(unsigned long mrt)
+{
+	/* RFC3376, relevant sections:
+	 *  - 4.1.1. Maximum Response Code
+	 *  - 8.3. Query Response Interval
+	 */
+	return igmpv3_exp_field_encode(mrt);
+}
+
+/* Calculate Querier's Query Interval Code from Query Interval */
+static inline u8 igmpv3_qqic(unsigned long qi)
+{
+	/* RFC3376, relevant sections:
+	 *  - 4.1.7. QQIC (Querier's Query Interval Code)
+	 *  - 8.2. Query Interval
+	 *  - 8.12. Older Version Querier Present Timeout
+	 *    (the [Query Interval] in the last Query received)
+	 */
+	return igmpv3_exp_field_encode(qi);
+}
 
 /* V3 exponential field decoding */
 
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 1438c023db62..27010744d7ae 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -934,12 +934,12 @@ static struct sk_buff *br_ip4_multicast_alloc_query(struct net_bridge_mcast *brm
 	size_t pkt_size, igmp_hdr_size;
 	unsigned long now = jiffies;
 	struct igmpv3_query *ihv3;
+	unsigned long lmqt, mrt;
 	void *csum_start = NULL;
 	__sum16 *csum = NULL;
 	struct sk_buff *skb;
 	struct igmphdr *ih;
 	struct ethhdr *eth;
-	unsigned long lmqt;
 	struct iphdr *iph;
 	u16 lmqt_srcs = 0;
 
@@ -1004,15 +1004,15 @@ static struct sk_buff *br_ip4_multicast_alloc_query(struct net_bridge_mcast *brm
 	skb_put(skb, 24);
 
 	skb_set_transport_header(skb, skb->len);
+	mrt = group ? brmctx->multicast_last_member_interval :
+		      brmctx->multicast_query_response_interval;
 	*igmp_type = IGMP_HOST_MEMBERSHIP_QUERY;
 
 	switch (brmctx->multicast_igmp_version) {
 	case 2:
 		ih = igmp_hdr(skb);
 		ih->type = IGMP_HOST_MEMBERSHIP_QUERY;
-		ih->code = (group ? brmctx->multicast_last_member_interval :
-				    brmctx->multicast_query_response_interval) /
-			   (HZ / IGMP_TIMER_SCALE);
+		ih->code = mrt / (HZ / IGMP_TIMER_SCALE);
 		ih->group = group;
 		ih->csum = 0;
 		csum = &ih->csum;
@@ -1021,11 +1021,9 @@ static struct sk_buff *br_ip4_multicast_alloc_query(struct net_bridge_mcast *brm
 	case 3:
 		ihv3 = igmpv3_query_hdr(skb);
 		ihv3->type = IGMP_HOST_MEMBERSHIP_QUERY;
-		ihv3->code = (group ? brmctx->multicast_last_member_interval :
-				      brmctx->multicast_query_response_interval) /
-			     (HZ / IGMP_TIMER_SCALE);
+		ihv3->code = igmpv3_mrc(mrt / (HZ / IGMP_TIMER_SCALE));
 		ihv3->group = group;
-		ihv3->qqic = brmctx->multicast_query_interval / HZ;
+		ihv3->qqic = igmpv3_qqic(brmctx->multicast_query_interval / HZ);
 		ihv3->nsrcs = htons(lmqt_srcs);
 		ihv3->resv = 0;
 		ihv3->suppress = sflag;
-- 
2.43.0

