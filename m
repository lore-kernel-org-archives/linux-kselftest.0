Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DDB1A9FAB
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727968; cv=none; b=Oifzri1vbgt16GXA3HhgmTUUFWqcUdFefazAizQ7h3oT4OAwzhuWD6RZobFl9DFZx1xYy0fScwyTEh4ySJoNdGru/msFdjYz/Ixuq1DnDrhVPpzH3tFRmZS3WwFI7elCp1F4oPX3SvFgLv3ncI+u24ZwHeu0J6L/EhrTh1Z3FkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727968; c=relaxed/simple;
	bh=PH9zdGszS2v4ltP/Vm27MJNnYZX6pbBgq07/H3IXfok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EDRG67Wc7XCAmhGIa1jAi4dA2onC4FhN+DGtzHD7vAO9RsLMO1oabNRkBJDFI9r0WLpQHU8xTbZKvLUhwyFRtzjmICUTnTLaWn7Ae1GyoDYdaGpapKIwpVdMUO2cu35puOrfabSpjHCE/E0ji0ACzf2e/xWJKhuH+EouXzXroH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfMnZV22; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfMnZV22"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8296d553142so1724146b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 02 May 2026 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777727966; x=1778332766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SBkUEIvhzDL4buR9DLMar8que8lJAciCkjc6oYU6Uo=;
        b=UfMnZV22qNIpgn8pCuTMoDoZgglP77k9+lmvq4VdheTpJX4iVXUaHFFPyFoy2ewMJC
         QeDT/mpThi66RfgX2CSaycMvcHmRZX0FAeVz1V720Xpw8TM3Wp268DDgEJIeRGKAh8NU
         nY4SmmvIl9vqwzYqs8zjg8aifn7UE4EIzdu8Tu9z762HNNpevi9Fgwo1dTN4+2wCC3MO
         RDW4mvZhwTmk6HMaSw3dx2adJFc3LRPl4mxAjqlaDlKfesVhBloSpGcRX4dTuoJUq8eP
         fYzIGKA+P0shAeL6DIKyGSS+WNdljMclG71CrXjWt23lhl7thtyBmLu/DuXX6p+y81SB
         vBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777727966; x=1778332766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SBkUEIvhzDL4buR9DLMar8que8lJAciCkjc6oYU6Uo=;
        b=hUTRL9dTyAl2hJJVhAghlk9dxoHXJimOYZUKfdSkNtXCqxkHzytQaKF5WNbVlvcF40
         Gc25GRAdPbCPPKi5ksyY+5NZJujw4imPedQxjRmZJbMLiInIJQx32IlJNFIQEwx7aO3F
         gZ2Q6fYMKOTQKC1D2GG4LFjoHGyS9L3pbrF7OcJc8utPxB2t+8n8XP8NvCU0VI5WfnjF
         EHfDx53M3uAROFZa2xZQusX6VzlViVafKQxy8l02qR/BkwZZcaurhUb2gVL77dO00JzN
         QTZBVo30m0kojW9nrIWNvtpmSLSlrNggJGEtPS6vA3UPkQlBIughofE2t4OdKVFEW84J
         kqCA==
X-Forwarded-Encrypted: i=1; AFNElJ98MO5+yY2JUfz4qQLowKyLJChiyeZuizXKT66ICvvjwUXyOGmLq+xa8sJKTibGRp+sKK1nMFoImEg1ud5AKGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAmpeZZm+zMeb4B3IMPqKe/xjUlwnvUunTmQhVqNk5iTkhg05
	tg36G2aNzILTs5ms0+LHR1MEYZKK2+MTlqWn9Mwb913EWpaVipndbkcB
X-Gm-Gg: AeBDiesvMDW7qh9yWpJb4gmNkaU5UessKVh/Dgf9Y5C/27dnM4mKyWxt/RVcMNyTwfD
	0IUfZZGABrOW7HHeLHnjHYQsfIS8PXnsCFGLExJAUPvct4Hk/rVc55fE2dPBnkn/OXj8qSLwH9h
	D6qp3p77hvWnHvoJ3Me+jZyqAnhlm8YhMEo24dX/z0xrVPL/ZEXOPm7MOfTJyEKJ2rlbTsDDaCw
	B6wgrz5qriOCL5iNBjXpcNt8pqta2FQb3vI2I8KnAshqSBrxEqkVzK7xVLJdDF6h+MFkZkg2KAG
	d0FmpffGh/+KH3UTbv2GG7VnX6JMdSv1z8CJczf7/ZTV7Tnjap65fX6+jwMHVkTUCoq81KXY7bD
	46uz0aWmkPuWfAaUPBfVAIh5cM7b3WHa6xyeYDvzBBIWUvDuU2h8ift7ayC+lRofoaRvcFNPjrh
	ksRBUhD7zIz1i0MIz3yju0qtB7d3uXKQfYU+HUZxFa+J1vPiYcZ+9T6CK0ThEn
X-Received: by 2002:a05:6a00:448b:b0:82c:d7c4:4c5c with SMTP id d2e1a72fcca58-8352d178e85mr3057979b3a.20.1777727966440;
        Sat, 02 May 2026 06:19:26 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0176sm5553791b3a.39.2026.05.02.06.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:19:25 -0700 (PDT)
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
Subject: [PATCH net-next v6 1/5] ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
Date: Sat,  2 May 2026 13:19:02 +0000
Message-ID: <20260502131907.987-2-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502131907.987-1-royujjal@gmail.com>
References: <20260502131907.987-1-royujjal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of the IGMPV3_MRC macro and use the igmpv3_mrt() API to
calculate the Max Resp Time from the Maximum Response Code.

Similarly, for IGMPV3_QQIC, use the igmpv3_qqi() API to calculate
the Querier's Query Interval from the QQIC field.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 include/linux/igmp.h      | 80 +++++++++++++++++++++++++++++++++++----
 net/bridge/br_multicast.c |  2 +-
 net/ipv4/igmp.c           |  6 +--
 3 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/include/linux/igmp.h b/include/linux/igmp.h
index 073b30a9b850..0e095c9f234e 100644
--- a/include/linux/igmp.h
+++ b/include/linux/igmp.h
@@ -92,15 +92,79 @@ struct ip_mc_list {
 	struct rcu_head		rcu;
 };
 
+/* RFC3376, relevant sections:
+ *  - 4.1.1. Maximum Response Code
+ *  - 4.1.7. QQIC (Querier's Query Interval Code)
+ *
+ * For both MRC and QQIC, values >= 128 use the same floating-point
+ * encoding as follows:
+ *
+ *  0 1 2 3 4 5 6 7
+ * +-+-+-+-+-+-+-+-+
+ * |1| exp | mant  |
+ * +-+-+-+-+-+-+-+-+
+ */
+#define IGMPV3_FP_EXP(value)		(((value) >> 4) & 0x07)
+#define IGMPV3_FP_MAN(value)		((value) & 0x0f)
+
+/* IGMPv3 floating-point exponential field min threshold */
+#define IGMPV3_EXP_MIN_THRESHOLD	128
+
 /* V3 exponential field decoding */
-#define IGMPV3_MASK(value, nb) ((nb)>=32 ? (value) : ((1<<(nb))-1) & (value))
-#define IGMPV3_EXP(thresh, nbmant, nbexp, value) \
-	((value) < (thresh) ? (value) : \
-        ((IGMPV3_MASK(value, nbmant) | (1<<(nbmant))) << \
-         (IGMPV3_MASK((value) >> (nbmant), nbexp) + (nbexp))))
-
-#define IGMPV3_QQIC(value) IGMPV3_EXP(0x80, 4, 3, value)
-#define IGMPV3_MRC(value) IGMPV3_EXP(0x80, 4, 3, value)
+
+/* IGMPv3 MRC/QQIC 8-bit exponential field decode
+ *
+ * RFC3376, 4.1.1 & 4.1.7. defines the decoding formula:
+ *      0 1 2 3 4 5 6 7
+ *     +-+-+-+-+-+-+-+-+
+ *     |1| exp | mant  |
+ *     +-+-+-+-+-+-+-+-+
+ * Max Resp Time = (mant | 0x10) << (exp + 3)
+ * QQI = (mant | 0x10) << (exp + 3)
+ */
+static inline unsigned long igmpv3_exp_field_decode(const u8 code)
+{
+	if (code < IGMPV3_EXP_MIN_THRESHOLD) {
+		return code;
+	} else {
+		unsigned long mc_man, mc_exp;
+
+		mc_exp = IGMPV3_FP_EXP(code);
+		mc_man = IGMPV3_FP_MAN(code);
+
+		return (mc_man | 0x10) << (mc_exp + 3);
+	}
+}
+
+/* Calculate Max Resp Time from Maximum Response Code
+ *
+ * RFC3376, relevant sections:
+ *  - 4.1.1. Maximum Response Code
+ *  - 8.3. Query Response Interval
+ *
+ * After decode, MRC represents the Maximum Response Time (MRT) in
+ * units of 0.1 seconds (100 ms).
+ */
+static inline unsigned long igmpv3_mrt(const struct igmpv3_query *ih3)
+{
+	return igmpv3_exp_field_decode(ih3->code);
+}
+
+/* Calculate Querier's Query Interval from Querier's Query Interval Code
+ *
+ * RFC3376, relevant sections:
+ *  - 4.1.7. QQIC (Querier's Query Interval Code)
+ *  - 8.2. Query Interval
+ *  - 8.12. Older Version Querier Present Timeout
+ *    (the [Query Interval] in the last Query received)
+ *
+ * After decode, QQIC represents the Querier's Query Interval in units
+ * of seconds.
+ */
+static inline unsigned long igmpv3_qqi(const struct igmpv3_query *ih3)
+{
+	return igmpv3_exp_field_decode(ih3->qqic);
+}
 
 static inline int ip_mc_may_pull(struct sk_buff *skb, unsigned int len)
 {
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 881d866d687a..9fec76e887bc 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -3518,7 +3518,7 @@ static void br_ip4_multicast_query(struct net_bridge_mcast *brmctx,
 			goto out;
 
 		max_delay = ih3->code ?
-			    IGMPV3_MRC(ih3->code) * (HZ / IGMP_TIMER_SCALE) : 1;
+			    igmpv3_mrt(ih3) * (HZ / IGMP_TIMER_SCALE) : 1;
 	} else {
 		goto out;
 	}
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index a674fb44ec25..d7eff36d98c3 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -991,7 +991,7 @@ static bool igmp_heard_query(struct in_device *in_dev, struct sk_buff *skb,
 		 * different encoding. We use the v3 encoding as more likely
 		 * to be intended in a v3 query.
 		 */
-		max_delay = IGMPV3_MRC(ih3->code)*(HZ/IGMP_TIMER_SCALE);
+		max_delay = igmpv3_mrt(ih3) * (HZ / IGMP_TIMER_SCALE);
 		if (!max_delay)
 			max_delay = 1;	/* can't mod w/ 0 */
 	} else { /* v3 */
@@ -1006,7 +1006,7 @@ static bool igmp_heard_query(struct in_device *in_dev, struct sk_buff *skb,
 			ih3 = igmpv3_query_hdr(skb);
 		}
 
-		max_delay = IGMPV3_MRC(ih3->code)*(HZ/IGMP_TIMER_SCALE);
+		max_delay = igmpv3_mrt(ih3) * (HZ / IGMP_TIMER_SCALE);
 		if (!max_delay)
 			max_delay = 1;	/* can't mod w/ 0 */
 		WRITE_ONCE(in_dev->mr_maxdelay, max_delay);
@@ -1016,7 +1016,7 @@ static bool igmp_heard_query(struct in_device *in_dev, struct sk_buff *skb,
 		 * configured value.
 		 */
 		in_dev->mr_qrv = ih3->qrv ?: READ_ONCE(net->ipv4.sysctl_igmp_qrv);
-		in_dev->mr_qi = IGMPV3_QQIC(ih3->qqic)*HZ ?: IGMP_QUERY_INTERVAL;
+		in_dev->mr_qi = igmpv3_qqi(ih3) * HZ ? : IGMP_QUERY_INTERVAL;
 
 		/* RFC3376, 8.3. Query Response Interval:
 		 * The number of seconds represented by the [Query Response
-- 
2.43.0

