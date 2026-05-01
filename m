Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94094314D16
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777656735; cv=none; b=Qw01I2XNEKjKu3pHs9IIZKzrhko7bhC1r0sCs/1UB2p38bw6TlRROLBgMfEOyBG5BGXOhRl9vm2NeKv8mw+cagU8lAecXoJ6xJr1vqyUeZMAW31NIzBbGprCivwQUjuexRuaXwWhN0t+ufS3pKHpFVfP4c+RubzmaX5oTuvea7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777656735; c=relaxed/simple;
	bh=xFftMd+sCP370S5N0WB8Cg5hFZYfV5pMqZcYKx1TRck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0QPLPficPsxAqZNKgU7tjQtOK8+nFa8ivTJjQ/G0N8MqRMTG0d4DW+J1CQBCxbK16fvqF5DAZsBqScIHodeEeqxc4/LCrfB3kp3nsmL9/wwEFWMs4UEyHOE3W9TjPQltMyM3SlsJTwtfJKpIhQt+RZ4RafVuPLCEzkQLqlQ9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8FGMb9f; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8FGMb9f"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so1711475a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 10:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777656732; x=1778261532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rb8PB47x5+EDLuCHmAsj4WHvgIwWlEboX+xOyLy788o=;
        b=U8FGMb9fyO4IOseItb1MjVgrUYk5PYqZ40EMpRSk0mEZh5BJVEBj0GmuRuEyxAuftn
         D0LYRpzAleKL8DU/4eGoA/F0xPIWodAY/Gl5F64Osjey1b6SzdE3Q3tPFkjDk85PGKPa
         0hI4gArigU1k6eq4fV0bNF+hWMk6FIUvLfTLe//0XBW+SwJnXY0fj6yxSLRDZb0IIxOc
         bNn1damNztcJFYbBoxAnknj2p0z+ewwkWNEvOCCv4VWnfbpV0ga8HLJIk3CEXHfxvNz2
         lObZ2rPOeonmF/WZveSUqdeKAEmI8ATkwiGKd6zC3aYGmclyTsPHUh6y1SQvztEYQBET
         QeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777656732; x=1778261532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rb8PB47x5+EDLuCHmAsj4WHvgIwWlEboX+xOyLy788o=;
        b=pX5epGeXC1k5A3Vm7/PdSA/BS6mjGIaqetEoVt4WWPOZqptR6bdh5Z1U4AFgKrFgix
         5rawp4F6W5Sy+MRPmVUK9ulIwbr25YLE+VpNsvIleq5Jsqwe0f+/qwcyZyAHg9wpjjaN
         wJsnqD0cMAHpx3+BlvEBh4phBn4HGQx8C3y/tNC87+ckbs8GaKTEkAnRPEvpaCEg11HQ
         te+26BfrukCIN+ojnMzIGLXW41itJhtOO3AL6XFiA/LAkfpguxbH548hu4J7dFQV9x4U
         uPd5VJQaco5+hoegTIa43QgYOtkW9bUp3n9SO35WDN5W7gtmI/gm7Rvb8jj3vKl4M5Cn
         TfNg==
X-Forwarded-Encrypted: i=1; AFNElJ83O1nwu5/DPUMz17uI8AvFS/tEG714wLEWMY+ZC3ZtQtonS8qGaEVBuEG7ZkWoPssXVi9XMBTBtdrQg34hJmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxIV2JNPzlqi0IPgy4iLRaGgXqe0y+6i8jOuM8ZbTBpv6OAD8r
	6ARQy0E8lrSwqBZNGa8fFabrNknCc6DecmgFyzo3+lC5luijTTNfMtqf
X-Gm-Gg: AeBDieuCHw6eDkdSf79kwAYPwcVYwV/iN7gF9FEt99Wudea7PY4USBiHJBulqiiTF0s
	zk0SLrPiwHjQJvuruNA0KVbNdNhOds72Lv/O023gLaoMCJhHuQyf83OG7f9gkvodIhgLz1sTjSu
	Llp8pH2p+MFN9TUjJSTw5yuDEqxQsadHRosHNGOI5L9S+hoxv89romWJBsRXaCkS6MvYcxgHVhI
	79DPveUPklmGuJX36KCI/OssvayYMgZX2a9Uh37tIvQtaq13Lfw/oBWumttu1LMTAYgH1F2gVqQ
	a3x6DA9y8PPqpcjV70QW9PjFzy6NVZzEB+/0DyFUkVuXAUiN094zuo0pa/P2vCN0YyB0PR9KQt8
	Lw0FYh3MV7R+BqDTwp5eJf6I2i5oXx6SLQeaBK0zb9m8h0bId5UuDbhXAujaQRP7OW+f4hU92/m
	C+YwyfxYJEdDvf6p6g9e4+4hvVBYPnv5PAN786uSuA3LIh3AUWeg==
X-Received: by 2002:a17:90a:d444:b0:364:6558:99be with SMTP id 98e67ed59e1d1-3650ceaab7fmr129493a91.22.1777656731861;
        Fri, 01 May 2026 10:32:11 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm2908906a91.2.2026.05.01.10.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:32:11 -0700 (PDT)
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
Subject: [PATCH net-next v5 4/5] ipv6: mld: encode multicast exponential fields
Date: Fri,  1 May 2026 17:31:28 +0000
Message-ID: <20260501173130.3486-5-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501173130.3486-1-royujjal@gmail.com>
References: <20260501173130.3486-1-royujjal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MLD, MRC and QQIC fields are not correctly encoded when
generating query packets. Since the receiver of the query
interprets these fields using the MLDv2 floating-point
decoding logic, any value that exceeds the linear threshold
is incorrectly parsed as an exponential value, leading to
an incorrect interval calculation.

Encode and assign the corresponding protocol fields during
query generation. Introduce the logic to dynamically
calculate the exponent and mantissa using bit-scan (fls).
This ensures MRC (16-bit) and QQIC (8-bit) fields are
properly encoded when transmitting query packets with
intervals that exceed their respective linear thresholds
(32768 for MRD; 128 for QQI).

RFC3810: If Maximum Response Code >= 32768, the Maximum
Response Code field represents a floating-point value as
follows:
     0 1 2 3 4 5 6 7 8 9 A B C D E F
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
    |1| exp |          mant         |
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

RFC3810: If QQIC >= 128, the QQIC field represents a
floating-point value as follows:
     0 1 2 3 4 5 6 7
    +-+-+-+-+-+-+-+-+
    |1| exp | mant  |
    +-+-+-+-+-+-+-+-+

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 include/net/mld.h         | 119 ++++++++++++++++++++++++++++++++++++++
 net/bridge/br_multicast.c |   4 +-
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/include/net/mld.h b/include/net/mld.h
index 10e402e0fe08..23255cc47ced 100644
--- a/include/net/mld.h
+++ b/include/net/mld.h
@@ -91,13 +91,132 @@ struct mld2_query {
 
 /* MLDv2 QQIC floating-point exponential field min threshold */
 #define MLD_QQIC_MIN_THRESHOLD	128
+/* MLDv2 QQIC FP max threshold (mant = 0xF, exp = 7) -> 31744 */
+#define MLD_QQIC_MAX_THRESHOLD	31744
 /* MLDv2 MRC floating-point exponential field min threshold */
 #define MLD_MRC_MIN_THRESHOLD	32768UL
+/* MLDv2 MRC FP max threshold (mant = 0xFFF, exp = 7) -> 8387584 */
+#define MLD_MRC_MAX_THRESHOLD	8387584
 #define MLDV1_MRD_MAX_COMPAT	(MLD_MRC_MIN_THRESHOLD - 1)
 
 #define MLD_MAX_QUEUE		8
 #define MLD_MAX_SKBS		32
 
+/* V2 exponential field encoding */
+
+/*
+ * Calculate Maximum Response Code from Maximum Response Delay
+ *
+ * MRC represents the 16-bit encoded form of Maximum Response Delay (MRD);
+ * once decoded, the resulting value is in milliseconds.
+ *
+ * RFC3810, 5.1.3. defines only the decoding formula:
+ *     Maximum Response Delay = (mant | 0x1000) << (exp + 3)
+ *
+ * but does NOT define the encoding procedure. To derive exponent:
+ *
+ * For the 16-bit MRC, the "hidden bit" (0x1000) is left shifted by 12 to
+ * sit above the 12-bit mantissa. The RFC then shifts this entire block
+ * left by (exp + 3) to reconstruct the value. So, 'hidden bit' is the
+ * MSB which is shifted by (12 + exp + 3).
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
+	/* MRC < 32768 is literal */
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
+ * Calculate Querier's Query Interval Code from Querier's Query Interval
+ *
+ * QQIC represents the 8-bit encoded form of Querier's Query Interval (QQI);
+ * once decoded, the resulting value is in seconds.
+ *
+ * RFC3810, 5.1.9. defines only the decoding formula:
+ *     QQI = (mant | 0x10) << (exp + 3)
+ *
+ * but does NOT define the encoding procedure. To derive exponent:
+ *
+ * For any value of mantissa and exponent, the decoding formula indicates
+ * that the "hidden bit" (0x10) is shifted 4 bits left to sit above the
+ * 4-bit mantissa. The RFC again shifts this entire block left by (exp + 3)
+ * to reconstruct the value. So, 'hidden bit' is the MSB which is shifted
+ * by (4 + exp + 3).
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
+	/* QQIC < 128 is literal */
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
index 27010744d7ae..49ceea3ff974 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -1181,7 +1181,7 @@ static struct sk_buff *br_ip6_multicast_alloc_query(struct net_bridge_mcast *brm
 		break;
 	case 2:
 		mld2q = (struct mld2_query *)icmp6_hdr(skb);
-		mld2q->mld2q_mrc = htons((u16)jiffies_to_msecs(interval));
+		mld2q->mld2q_mrc = htons(mldv2_mrc(jiffies_to_msecs(interval)));
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

