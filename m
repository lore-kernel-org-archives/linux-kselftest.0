Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2315365A1B
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775992270; cv=none; b=lmwUafjR+ZktQNTxEbex486nzcmdGxdgnZWTXy70nFuCJZX9zCfnOz9DRfQaZBOR6LQZ3b/pxmc1XNf8fknh+Xm3DAOmNs9zo250Yn6iCwOvF6+0wsY7Mx9ERjrDM6SPkk8G+os0QM2bhKwyFB+GzGeNhSLFb5I2fmys1eGBXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775992270; c=relaxed/simple;
	bh=QBIfIvmBuIoYpMtoyqBsB8dAeiNlwvpVdnfKO8oA6aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuQC43CEis85z5RyZfaYfcPW8rANYYf+3lsxI+YZ9kbI8/WrPiSu0Y1WrVW5PeIlZH3NUnCR+M+yfp9jiAugXO/2ihf7rwJnP5eWm11yNJnmTWv3uv4SW/a2ur3IqWcchUE3LPNjNRfrYLl4WmryGyuanEQrtHwD+iOTkRQkVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h01sREwr; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h01sREwr"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1217451a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775992269; x=1776597069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRagAfwxZRIpF0jJI41tPh4aZoJ+uueGkyeIJ7BFIUA=;
        b=h01sREwrw001DzcqXbu0jFHrnH9sgsH4r0gGSMfKnQIVPtouSqT+DsPCXdv5Il5YOq
         BGeyp4zf0NEHMNS1eIYCn0/o5oPBNGOMaleQWutO+eD8Q1yLjMWakgwy8YN12aZJuJ1M
         9aGimuozHlAlpnmL63VDdFQdZ2LC4auxRI6h1FOJTwj2DmEr1T5Cwaq8bRn6VwPCqNwN
         ke1Ili8vbHKpBsNa5byT/HtQYpN77L2sl9CpZ07noDLMDozW+UiTPSXnYWGCnkEQBuZV
         qbSZ7tyN+CO6VOhbBccvxflnUrAOJp18orpR1dwWM46FfGJO7Dp4GG6dBJmnCgMR6NzL
         UNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775992269; x=1776597069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRagAfwxZRIpF0jJI41tPh4aZoJ+uueGkyeIJ7BFIUA=;
        b=TzObCVC+hn317SYlNqfkjT6JQVDZDKZtPSIAuejqfloKWHgFKZjuq2h8J9sjb0QJ1T
         1OUEr+uBue46rF0LdbUPPMt5qcqS9pmyq2pN2zNKJtse4Tjl0FVKwIRRClSg0yi1vnS2
         5I08KPlG0hyV7eBXwEKGUYws1PtOucqmUrMhF27IKbdvuOp8zbPrqBq/ntkVAPaRIoqF
         eRBZIduWzatKkxhsbuCR+shMBNaRm5+bX32XEnMjWSjxUgk09gimIiUFqYWJD9BH2rnn
         /JiUv/sm9Ez+AkWMQinLuCg3uKIGRdkGpZfRvmEpWjQtR6QXkYzPgGcCSjy5DvRaaKHz
         v1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUSg2c3rrxEaDa/f86nUf8UThHqLVnYBze0ryxrgGa/Pk5jzGn20rEr1QJvVwjg8hjPA6GcR3cKuL34TKdMnVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOX42XjqojgoaheaBE64RzIgXdx/zSrpcT6QB2qvI45fSh6QJw
	59/3idypshd5nQnDPFr0pNwcCMBGfB4s6gEol7QG0YEmj84erOGcOycY
X-Gm-Gg: AeBDietkTZJa4IxD+QWprTULDtQQKuTeNlft5m+9H2Cm9tFJpLsT7U0UuVsP7cZ88/B
	upHMNj9+Bxk7PKGIj8P7LkTAhpbGUhr+qwYRWcnh7/p8MqrWyHDrqnVYfag9uMALz6JW0dNRVR8
	HWotzBi9G90BwFnKPNU/8jopDy07k2fexbX1aszfW6JWH0fcigBZz3BTsgoaFg6xwYV60D6AHCK
	rsW+VkyyoRj7YN4mxmpH30wXyDDL6HOXgPfvMhxL0t1oEANBkeLplWfLpmbJHpY2fScMh4Nqh8W
	HIO3srIxxUHhVnNmuuH71Ae+Pg67U/YOXz2d6iIsrICo/3M5fizmrOv9ufpJJmxvT6Jbizi/qLq
	XeSOUzHx6bOS6tMs2bgwhbsXcgTzzhRZeavAf3dIwFc28vjCXJrSF8YvAQJ6vf2suDCmtJsCKrn
	8dh3Q2V+mMz5TGoZMsS++i0DWIwSTNpYsfOz0yc7f7WqypxgXWpnM=
X-Received: by 2002:a05:6300:6a02:b0:39b:f9f5:7a74 with SMTP id adf61e73a8af0-39fe400f754mr7736909637.45.1775992269002;
        Sun, 12 Apr 2026 04:11:09 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7934c9ef38sm2522981a12.12.2026.04.12.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 04:11:08 -0700 (PDT)
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
Subject: [PATCH net-next v4 1/5] ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
Date: Sun, 12 Apr 2026 11:10:43 +0000
Message-ID: <20260412111047.1326-2-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412111047.1326-1-royujjal@gmail.com>
References: <20260412111047.1326-1-royujjal@gmail.com>
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

Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 include/linux/igmp.h      | 80 +++++++++++++++++++++++++++++++++++----
 net/bridge/br_multicast.c |  2 +-
 net/ipv4/igmp.c           |  6 +--
 3 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/include/linux/igmp.h b/include/linux/igmp.h
index 073b30a9b850..4443c914b3c8 100644
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
+/* IGMPV3 floating-point exponential field threshold */
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

