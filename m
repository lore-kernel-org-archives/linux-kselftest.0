Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8D3C73CD
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228470; cv=none; b=aXmtWcQHik+1FHA/3auZ6IHKF8dFCfDM8EoYyZc1D9I51HX3AUM5JarBf7vhiaIkWxc/NBlIxwqMgRL7r2TEsk6XQYLVj+roST7TnE5+o1Uv30wHRLG320BnDOFM4lqbjycp0WemHotEJ8eyQr8w8n5BOWQiHirEDi7bADAtj24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228470; c=relaxed/simple;
	bh=J0qBZOFYr25CwqolwkVoKoYOv65Rm2yGyYDO9qaRe6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyhVBeH0YKU9iqF39JsNWdt2n2SV5PHoCuPJi+b7Kt9paCyXlM9aoh+U/Meml9K8a8voPOhw/aBOOpdSumDEyZLMYmF/7z+0o3w1LfuaLchcm7MEFJHKMPCoM/JDN/rao487qwPpmPlQN1AAUwVQEopYf4hb/kaVVDwRYbOdT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtPcVAQw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtPcVAQw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82cd6614a90so869097b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228467; x=1775833267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cej7nCKLEwnUD6W7mDHvwY/cOSNtwOIhgAuZzAFc2ac=;
        b=rtPcVAQwC/sZRlIb3dEPBgx5/WeETNEZqotbWkfNVJQJlWr2gb+683OTMtohMlxkiv
         oncaa/34HknqphnVY6jfAC8LSZUTp9fvZEj44duUAErBi/lvQEC5mSTzaWwAiDS67XF3
         BZQkdX2gG22Xu0T/gQOcyZSWCmHzJCOPyVC+3ZNNdJNo9TQj/u6OkvTgHw1Owbnno9ME
         dLY5In3cwslpwb7DC/yysUeaqD7K6hQ1VvqHNfhEOJg0c7IsLqNNT0EPxmiUuhcqrFua
         th7+rgNOcJ/dGx7hBSzYGbsZvUdJjRdoNQeR9HcrJAqxtqzPlVCDle5LVxW4h2Md56FE
         HDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228467; x=1775833267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cej7nCKLEwnUD6W7mDHvwY/cOSNtwOIhgAuZzAFc2ac=;
        b=TF95pH47fyQe663DJVW/G408C8wpWJIpDAOPbuNRJhrQGeVSa7htx4yd+xLNbr5ugc
         +oigo5XH7Ff6GwodlYA48qdVMRLxIQLc+o7TYZOZG+NG4dZOxEBfQ/shJcIK8BB/u1Y9
         2I1icoMY2vHCH6/y/7ucA9L4+34+b7bCmAFrvFUL4DyZ7ol/h/A3sjW3Sh+5NuafmTa5
         Hj6Z0Zjae5c4fHIZJACVub301zDlGuhFGQl2ni5MJewhcSgJySBJeBlDO11fqlPN9OZX
         J4WxohsizF0jd0m09jXLg+T+Y2SZpl8bYhHfaDphbznbSvAm6UwpE4J13xCSFkT82IxC
         ksKg==
X-Forwarded-Encrypted: i=1; AJvYcCV/0gU4eGvm4CnmyNn/kcf15sqZ41FGSxkApDquc/77r2qNmLwjNb++YwABkGb7AVMJP5e4JOiMpcFrCUoxXvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdmwGx9YAOIXg8dA5YdHz3gYsuueQKuGiqwgGrMCF7SdFElXkO
	qH/RxClHvHbGYVFWs6EaHUN0TwWLBUwJvo9UqrebWcQzmhCIsTTc9XpY
X-Gm-Gg: ATEYQzzo71WK7OrRn6rTnwZjvxe9HmL7NINUtp0LzzWh9tcvDNJsj0JWkWfVRz7n3pS
	jbCbPq5uSYNFaDcja6eyXao4xgY4ZQX70+kvn4UFV/be6Cj3KDaotyZQlCGfbP0ZMdKV8iZZkNb
	RmcqvG68M+eQLM3Q06JMX7xnIE9vGNlD0IEvRzNTGGOlQMnMgz4h6Zp4b7SmNugrfLT7Oqm7b9D
	9HjBrEJs3CZborW2sAHtQdEwJsjB7M15gRugbBSG/YC7v7t48xgUOPeZaRX9IVCaZol34j2IMOs
	G3kEBLtBTXqu24f046aUcFXj5BXcG7PoLNS68U4utNIg4gZp/4hXToiO4bY5B0Wgayt7e9MaL8i
	aA6dzdBKJF/gfm+HN/FJgdXhbPYgz4yq1fm3YlOXJi2tqPW9VzpCGSomeeGODubKMEiG8XpdLIA
	iNHc+cX/VXdU6tQg+WlG4tSjfK+lOEChVOT+F8uvZQ
X-Received: by 2002:a05:6a00:8018:b0:82c:215d:5e9d with SMTP id d2e1a72fcca58-82d0db6bfc5mr3316415b3a.32.1775228467048;
        Fri, 03 Apr 2026 08:01:07 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca79basm7789483b3a.58.2026.04.03.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:01:05 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/5] ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
Date: Fri,  3 Apr 2026 15:00:46 +0000
Message-ID: <20260403150050.1235-2-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403150050.1235-1-royujjal@gmail.com>
References: <20260403150050.1235-1-royujjal@gmail.com>
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
 include/linux/igmp.h      | 84 +++++++++++++++++++++++++++++++++++----
 net/bridge/br_multicast.c |  2 +-
 net/ipv4/igmp.c           |  6 +--
 3 files changed, 80 insertions(+), 12 deletions(-)

diff --git a/include/linux/igmp.h b/include/linux/igmp.h
index 073b30a9b850..0624410e75c6 100644
--- a/include/linux/igmp.h
+++ b/include/linux/igmp.h
@@ -92,15 +92,83 @@ struct ip_mc_list {
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
+/* IGMPv3 QQIC/MRC 8-bit exponential field decode.
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
+	/* RFC3376, relevant sections:
+	 *  - 4.1.1. Maximum Response Code
+	 *  - 4.1.7. QQIC (Querier's Query Interval Code)
+	 */
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
+ * After decode, MRC represents the Maximum Response Time (MRT) in units
+ * of 0.1 seconds (100 ms).
+ */
+static inline unsigned long igmpv3_mrt(const struct igmpv3_query *ih3)
+{
+	/* RFC3376, relevant sections:
+	 *  - 4.1.1. Maximum Response Code
+	 *  - 8.3. Query Response Interval
+	 */
+	return igmpv3_exp_field_decode(ih3->code);
+}
+
+/* Calculate Querier's Query Interval from Querier's Query Interval Code
+ *
+ * After decode, QQIC represents the Querier's Query Interval in units
+ * of seconds.
+ */
+static inline unsigned long igmpv3_qqi(const struct igmpv3_query *ih3)
+{
+	/* RFC3376, relevant sections:
+	 *  - 4.1.7. QQIC (Querier's Query Interval Code)
+	 *  - 8.2. Query Interval
+	 *  - 8.12. Older Version Querier Present Timeout
+	 *    (the [Query Interval] in the last Query received)
+	 */
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

