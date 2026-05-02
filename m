Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DD6253B58
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727992; cv=none; b=DK2S4wE31FkFI8NA6/pgjdHSGf44rhdwbsPt7iKj0NQUJyHiq9JXZ3HqVvaksEQhOQsool5H63iEL3+8+DoxaxRdOFERquTNhwFFAWFRf/aYEQGb1hzbfNn7ZIqrOpGLUNh6OOKoQAuE2P57F398eH0xGYYQHOhSqEa6SOqSj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727992; c=relaxed/simple;
	bh=jJnc0mGZNzy4u3y501gtICX3ws5YMm+lbxgjciB6cvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9M8BcD3YgV3wvh9oIdyQMrFrUe9myiqmVnKaBjUZzXjxx8hzFv3pbEyyxofmoHPgKVoIbQMFrMPon3g17z2kWOOhu02Ruvsb1XnYdpeM6RRSk828ugI3RgGclRgek5x9x3JqYyUl517HK8sKAwAmG2wQ7+iZsuqNcBTfiSSbPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz83j5o/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz83j5o/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83537a80ab6so128174b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 02 May 2026 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777727989; x=1778332789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl++HpBCtAW5kzSiDlCg+WmmabaPSzgG75Hq/zfZ4gA=;
        b=Pz83j5o/Rj23bPD3Mo2VxZr6BPglH8+gBOrNUFH0S0v4H/Z4SnxMRpf9aDR3cW2ivj
         YVa2lzkcQkZuh7dC/G2pOrV44T60amTulNKDH4CqUkIZJD7SqayMMs18ucuz+lazFIEd
         w6yWJVT0CnrpqzmUwFxxc8Jhqb7zdDXyKfRirKpEvUXLrsqwmFr2WwFMhASiBt+0H4F2
         ezi7XDSVxfihHeMObcml0DSUMSZS7D+GPiSD2G1xYw3hAuJzc0I4IAhIc+NJ4RBEqk5/
         teSGmEirsNACAVvtc038PReswyYfCrSOj2KwTK+R/Ry/3mixR0L2bsy/7pb4PoITe6OL
         rKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777727989; x=1778332789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zl++HpBCtAW5kzSiDlCg+WmmabaPSzgG75Hq/zfZ4gA=;
        b=W8HYBqUbehUYUtoaMcqnei8sx6z9ikRdRRAp4LpaC/A9MBsPICPF3FXHBVedJ71wt0
         GKuFy7eVZuMb9qo/UpRNNoeV76tldEEmSoeH4i516FYFg+5HrXckqysKfwB/ySNRxgdv
         5ls+zr1NbjdcqfIs6fCsHsD1mtDyuFduApSOY8CQOXsuk+HI44Msz+p86twis+KQIC5/
         ZsvolQq+je8PYbm/1Rvd+vfcYHMU2QPk5bY9jOmncZTyv3K7P6DwQHHzhNQgaWFqma+J
         aO3ZEBJ4dk/MX2ci4Hl6qVFN3cX2BoG/aqcSFb9bT+ueDWULo7Y/moRYqFCuyMNUbbBX
         pRIA==
X-Forwarded-Encrypted: i=1; AFNElJ+v6thDZhQECzjCFW9WVHuNb5YKvD04g+PN5rhvXroX1A/YVXT8pw0vLR+OAbNt44+eLcU9h5b9+23HgUGXVjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYozUcEq09ixiTT3tJLz4QooTugGBox4+XbvymoAWZo2uN95n
	PqYcbcA1h7ICr6tdsntxhnbl0+3+9o65pNDUbw9Oxu5X0MjO14QP2czf
X-Gm-Gg: AeBDieugP09oiwGVVUz21q/W/MfFSbQJ3p/4Jzgn12knpaIKPWtoef0iuKOkkWHBIYU
	cN1g9exApGgU65VA5+/l9Hm6UYa6IciTf4SW1yQqu1zvepav0P6ILe+mfTRH5/L937q47ipBE1S
	69K5ZM8G272KJmxGEeNbZESO0TIiMGoxM95/eCs5b/5jccHO91Rt2g6geafzOr5qn7z+z+hgLf3
	1cmCmnBekQUkvczZqYZCNw6khxK/4I0Dwddb1YhHd7xtTdlMEKkDsuVnJQxaDsVkZpXqy4frszZ
	8Wp7OJOUJ8QXZOErhseK4gaURFtKwGxid4fIggzKgcKvknr8UuB4TJPMVCha2iMH6X2yv8AM3k/
	MOc+tT6FzoCxoVZX0st6KU5gQTNN9QCFSmEJ4NkE+pnhnhlu+auYKSmkVxSPEMSl3CFyxneJ5mV
	blpnyAA8o+5sze4dzvU/CAUOkw0j0cVH0Xlntn4eqHv0Hko+AHgw==
X-Received: by 2002:a05:6a00:13a0:b0:82f:4628:4186 with SMTP id d2e1a72fcca58-8352d2cf7aamr3023049b3a.42.1777727989546;
        Sat, 02 May 2026 06:19:49 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0176sm5553791b3a.39.2026.05.02.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:19:47 -0700 (PDT)
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
Subject: [PATCH net-next v6 4/5] ipv6: mld: encode multicast exponential fields
Date: Sat,  2 May 2026 13:19:05 +0000
Message-ID: <20260502131907.987-5-royujjal@gmail.com>
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

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
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

