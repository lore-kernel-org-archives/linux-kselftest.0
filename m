Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0553CAE96
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228491; cv=none; b=UuyoqRs7UNpNCIGuMw7c+D2Xp2NMdhZMLckeO17mgpYJPLYK7HePYBnFsjM2yWrR+U9u3kx5qjneAYkJmX34C922qULfAi4MHnWwtbmvxeyDETXkgAY11fbBwbMaYRBPN+4h7wQiNsCCOT4DXJwRMA2g+VivdCbX52AguVh9J8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228491; c=relaxed/simple;
	bh=EKpTwE4ZfpPM1Z81RyM2aK+iglf5OV67iJmGTsG62ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLFdE57mVBbGi/LXrBo8/x4lNAWn4zwcPRkpPxdfi/8oMYQ8ampaS1yzZs0bvrxZ+DuzhBHKaF2zZmTZFCHjEmKy2s2NPqd+4bDM1YonEXcXLudR+QCADJTLea1W2amtHUoMP1Fws+IgRM9YGZytAo9VzhkTf4kbaaLZAarW25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VljK/N1H; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VljK/N1H"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso1448677b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228489; x=1775833289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kA8wWqgtt+a655+1MvtrE0v6BL6IMopBXGlXnFLxq48=;
        b=VljK/N1HcWQHhTT/EUp+8siMDgazeIjpCh96QGkXbusS7fb407O0fsxbCS0xaIpV1v
         9zwu9xR9jQX/5Hj2aOUMygDMEKt6JSqr+IrmqFxMRjD1pUAwUwgW7csA1HbXPx8uoojJ
         RMrHqD2iZK9thANcjv63/RtzVuC4+Y6kuzCkpSQderI4137PGU86bUtgxR5oHP5qwTEp
         Af1f+saZZqGDB89qwpkWrxc9Rr+ygF87dCLJAiYFK4DbOjBm+yGqExEZwMDDMuvii3ug
         g1FPIEctUTSPvUv15AYGQFfeBzkyv7S5RKnKyaML1Gz5A4sc1WS9LFl2/mF2hIc5+/pZ
         20ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228489; x=1775833289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kA8wWqgtt+a655+1MvtrE0v6BL6IMopBXGlXnFLxq48=;
        b=DgRxWN3P5YYSoy6lhggeB1MRVFKiGyf1BSpifYWxtp9SH9l1kaVX52ZTjbUCnQfEI2
         Clu2rKC3QO5JYV7GduyZGsC5XFa8QdnErreqQ8NA6WnjEVo7lj6i+u4FW4JHMN7Xj2RE
         2FyGRC898ZZHyeHWfkxaGDcQqSrDIHsbWOZXV31mRkIc/lkOATmYlM3EDqGD8qavAhbf
         4/HZIh11/nw1z+/KGHqF5ul/fpDVj3B9doZKvAcQdpZ7u5SVUVzfegCUj4niODu1eENC
         0z9Cu6rC1/GtZ7QiqZRrQU6V2KuLIyAvXoTNPhf2J5d6fpXIQkNMnNm4dgsiIa+konhG
         twyg==
X-Forwarded-Encrypted: i=1; AJvYcCWPKQdi66K10j2A/8AGaao41C7wM5nKF7x0zgc2Q/VdJuk2IXZlEBBWE466TxR+WWAwOoZ93Q9qW2tnhyNMQhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPTftTy2ttjkUFwV3L7r7/wRFXKMApt1JDEI8XM1GHyfe2Vhwv
	v44cQ04ZS89619CL3JmE+WzLtWTAhOwisyJm7NmJ0pQtaSGzLQ+fwDJe
X-Gm-Gg: AeBDieuFgA8mU0xtExwfUZs+doAUCT/RmFrRgN01ojU3yP91gN/ZPvvyADwASqRxjBh
	i7QTKvdtj76NFxvxchMcxsEwaUA2kEuBMOmgaQb88ktKU0z1K89J2tr99sW64UgnyPwxiV/2agQ
	/2gevxgN+7xrYUESZ/rkb0dS9CsFL0eMH4WKt40ug+zwpNWxSh+cPE+n88uFWPwTfJNagrgV5NR
	GF9Z4KcwIIzjojfHTb1L89bXkRyYm8JgqmWUoSoBBECTaKVytTQFVIoM1l+vl+Fl4HKYoLk1LjM
	H75JpMbQI4c565dCo/6bPxS2JUToK9Cz0csJOXvumnSvvUCzz+2bGfe8G8a+SVdRQdcVeFyOSRC
	XXS3vmgrt1uWKQD5piXD2k2fOLpkjmzU0Ebg+ZHle7GJV425ALWxNkk+VIA7c0QbiL4UnZNf1UN
	H1Ewu86mtHnigkZGPC8ufCA4PDsiA+zzv1syGe9PygHreIokiYJZE=
X-Received: by 2002:a05:6a00:1d9e:b0:82c:68f6:a18 with SMTP id d2e1a72fcca58-82d0db5b47amr3435171b3a.34.1775228489031;
        Fri, 03 Apr 2026 08:01:29 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca79basm7789483b3a.58.2026.04.03.08.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:01:28 -0700 (PDT)
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
Subject: [PATCH net-next v3 4/5] ipv6: mld: encode multicast exponential fields
Date: Fri,  3 Apr 2026 15:00:49 +0000
Message-ID: <20260403150050.1235-5-royujjal@gmail.com>
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

In MLD, QQIC and MRC fields are not correctly encoded when
generating query packets. Since the receiver of the query
interprets these fields using the MLDv2 floating-point
decoding logic, any value that exceeds the linear threshold
is incorrectly parsed as an exponential value, leading to
an incorrect interval calculation.

Encode and assign the corresponding protocol fields during
query generation. Introduce the logic to dynamically
calculate the exponent and mantissa using bit-scan (fls).
This ensures QQIC (8-bit) and MRC (16-bit) fields are
properly encoded when transmitting query packets with
intervals that exceed their respective linear thresholds
(128 for QQI; 32768 for MRD).

RFC3810: If QQIC >= 128, the QQIC field represents a
floating-point value as follows:
     0 1 2 3 4 5 6 7
    +-+-+-+-+-+-+-+-+
    |1| exp | mant  |
    +-+-+-+-+-+-+-+-+

RFC3810: If Maximum Response Code >= 32768, the Maximum
Response Code field represents a floating-point value as
follows:
     0 1 2 3 4 5 6 7 8 9 A B C D E F
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |1| exp |          mant         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 include/net/mld.h         | 122 ++++++++++++++++++++++++++++++++++++++
 net/bridge/br_multicast.c |   4 +-
 2 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/include/net/mld.h b/include/net/mld.h
index da3299545ebd..147e8c44eb28 100644
--- a/include/net/mld.h
+++ b/include/net/mld.h
@@ -90,12 +90,134 @@ struct mld2_query {
 #define MLDV2_QQIC_MAN(value)	((value) & 0x0f)
 
 #define MLD_QQIC_MIN_THRESHOLD	128
+/* Max representable (mant = 0xF, exp = 7) -> 31744 */
+#define MLD_QQIC_MAX_THRESHOLD	31744
 #define MLD_MRC_MIN_THRESHOLD	32768UL
+/* Max representable (mant = 0xFFF, exp = 7) -> 8387584 */
+#define MLD_MRC_MAX_THRESHOLD	8387584
 #define MLDV1_MRD_MAX_COMPAT	(MLD_MRC_MIN_THRESHOLD - 1)
 
 #define MLD_MAX_QUEUE		8
 #define MLD_MAX_SKBS		32
 
+/* V2 exponential field encoding */
+
+/*
+ * Calculate Maximum Response Code from Maximum Response Delay
+ *
+ * MRC represents the 16-bit encoded form of Maximum Response
+ * Delay (MRD); once decoded, the resulting value is in
+ * milliseconds.
+ *
+ * RFC3810 defines only the decoding formula:
+ * Maximum Response Delay = (mant | 0x1000) << (exp + 3)
+ *
+ * but does NOT define the encoding procedure. To derive exponent:
+ *
+ * For the 16-bit MRC, the "hidden bit" (0x1000) is left shifted by 12
+ * to sit above the 12-bit mantissa. The RFC then shifts this entire
+ * block left by (exp + 3) to reconstruct the value.
+ * So, 'hidden bit' is the MSB which is shifted by (12 + exp + 3).
+ *
+ * Total left shift of the hidden bit = 12 + (exp + 3) = exp + 15.
+ * This is the MSB at the 0-based bit position: (exp + 15).
+ * Since fls() is 1-based, fls(value) - 1 = exp + 15.
+ *
+ * Therefore:
+ *     exp  = fls(value) - 16
+ *     mant = (value >> (exp + 3)) & 0x0FFF
+ *
+ * Final encoding formula:
+ *     0x8000 | (exp << 12) | mant
+ *
+ * Example (value = 1311744):
+ *  0               1               2               3
+ *  0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7 0 1 2 3 4 5 6 7
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ * |0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0| 1311744
+ * |                      ^-^--------mant---------^ ^...(exp+3)...^| exp=5
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ *
+ * Encoded:
+ *   0x8000 | (5 << 12) | 0x404 = 0xD404
+ */
+static inline u16 mldv2_mrc(unsigned long mrd)
+{
+	u16 mc_man, mc_exp;
+
+	/* RFC3810: MRC < 32768 is literal */
+	if (mrd < MLD_MRC_MIN_THRESHOLD)
+		return mrd;
+
+	/* Saturate at max representable (mant = 0xFFF, exp = 7) -> 8387584 */
+	if (mrd >= MLD_MRC_MAX_THRESHOLD)
+		return 0xFFFF;
+
+	mc_exp = fls(mrd) - 16;
+	mc_man = (mrd >> (mc_exp + 3)) & 0x0FFF;
+
+	return 0x8000 | (mc_exp << 12) | mc_man;
+}
+
+/*
+ * Calculate Querier's Query Interval Code from Query Interval
+ *
+ * QQIC represents the 8-bit encoded form of Query Interval (QQI);
+ * once decoded, the resulting value is in seconds.
+ *
+ * MLDv2 QQIC 8-bit floating-point encoding (RFC3810).
+ *
+ * RFC3810 defines only the decoding formula:
+ * QQI = (mant | 0x10) << (exp + 3)
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
+static inline u8 mldv2_qqic(unsigned long value)
+{
+	u8 mc_man, mc_exp;
+
+	/* RFC3810: QQIC < 128 is literal */
+	if (value < MLD_QQIC_MIN_THRESHOLD)
+		return value;
+
+	/* Saturate at max representable (mant = 0xF, exp = 7) -> 31744 */
+	if (value >= MLD_QQIC_MAX_THRESHOLD)
+		return 0xFF;
+
+	mc_exp  = fls(value) - 8;
+	mc_man = (value >> (mc_exp + 3)) & 0x0F;
+
+	return 0x80 | (mc_exp << 4) | mc_man;
+}
+
 /* V2 exponential field decoding */
 
 /* Calculate Maximum Response Delay from Maximum Response Code
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 27010744d7ae..a22e44c4fa48 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -1181,7 +1181,7 @@ static struct sk_buff *br_ip6_multicast_alloc_query(struct net_bridge_mcast *brm
 		break;
 	case 2:
 		mld2q = (struct mld2_query *)icmp6_hdr(skb);
-		mld2q->mld2q_mrc = htons((u16)jiffies_to_msecs(interval));
+		mld2q->mld2q_mrc = htons((u16)mldv2_mrc(jiffies_to_msecs(interval)));
 		mld2q->mld2q_type = ICMPV6_MGM_QUERY;
 		mld2q->mld2q_code = 0;
 		mld2q->mld2q_cksum = 0;
@@ -1190,7 +1190,7 @@ static struct sk_buff *br_ip6_multicast_alloc_query(struct net_bridge_mcast *brm
 		mld2q->mld2q_suppress = sflag;
 		mld2q->mld2q_qrv = 2;
 		mld2q->mld2q_nsrcs = htons(llqt_srcs);
-		mld2q->mld2q_qqic = brmctx->multicast_query_interval / HZ;
+		mld2q->mld2q_qqic = mldv2_qqic(brmctx->multicast_query_interval / HZ);
 		mld2q->mld2q_mca = *group;
 		csum = &mld2q->mld2q_cksum;
 		csum_start = (void *)mld2q;
-- 
2.43.0

