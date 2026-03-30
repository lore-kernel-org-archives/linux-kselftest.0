Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305212E7F39
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898217; cv=none; b=aqcTBApj9rJFh0HdrWK0mgcRTp5FtAu2T4MriGi0La7o4xr1Ah2IdrAdgW417jGJovk9tAHooYnQQAaZHIk9n8aMj2lE98uOh2ffGe5saGql8/ERARYYCZBR3swGck2TXcd1AN8oHRAlBi11B/e4RZk0wxurCCzIB/M295XhDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898217; c=relaxed/simple;
	bh=/s+EgbT4cwqyAVP8otaVBOlL/dCCRmkYjYM+V8pat60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3lvVTQFChXgD7QiTDKk/N6u9vzvvhrGKOw6uIFiQH0U5QbCVZ1h0kn7R2NwzRGv3Sa0u54Hs+2zL4Ys0sM5A31SFhXWFWIU4VSUHHaJw/28l1nDsG7chfobppFK+KMVNtxkUezlW8Val+ZFRxcuQOJZvuHonC4eKZwUu3m72Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4z5YJbU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4z5YJbU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2946997a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 12:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774898215; x=1775503015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WISAf0QjUXrCjlDt5u3fdpEKEmBPI+ZNLLd/DIJAm8=;
        b=W4z5YJbUeGIvrIt7mUCfKAMbBSjHW8Jzu9d89cyue6et/DAqLmNIB1nP3MMctHUpwc
         3ivEr19Oq5qbgFomy+6YipxT9PE4GV2A3y3DXlONhpNptd/u+A7LnxMntTP0u8N2F2FD
         kOmAAdeO2HzQwhaXC08VcqVOkLHtkWxvYstUOtVGLFr/eMTKtT91qjw1uoASLQHf/7CA
         aO4chdyV+Ar+wXdoezpgj1axZBNrIRnSjdbn9KM8jpXF/0fKlOrm2Ixstz7EyeXSxKkX
         1tSlLITWRKt6bHnlYSEZOLJ8q6zSGrNTv3EZ99ju1yrzXxhswwZqFHgN+SjjMtpWK957
         Dblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774898215; x=1775503015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5WISAf0QjUXrCjlDt5u3fdpEKEmBPI+ZNLLd/DIJAm8=;
        b=YSb9kWk0nOE2yF4JohrwdrHybv+CTxoIw3Hg2om9s0gwzRMXW/WbacM9PI4TI5BjHI
         wNyX/p9lEtcNx/1YZg+nQ0OJhnQTdOPicj4ySbGd6iz0bsqP2UOLk5yyDsygBJoxvWlh
         u2lg+t9MeqaN7F1QiyWLIcx+lYp/Pllz3a7y9fKUx+caAu9Ua7rcTac1nDoHghtWWHH/
         6tdIG3/dnoAlKC+cg/9RqpTF8aq9N3/yv6xeWt7464i7rTNFeu79s35HqRBzcxbWitw2
         tRh4M75JIjHhB+auYqm5nYW9DkD9rX4BMHme4DNRkFBXjBrxEX/RWTkrsDHmbvcl5vtR
         kLKA==
X-Forwarded-Encrypted: i=1; AJvYcCXJDQtmXkwPlUevAUKucJEHILOaKryYWZby2X/bY7l0UegLT8uOrEc6fqESyNj0KulFx7Y/mldjyA/NT7ThrrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNH2U0eH0E5Cm324e6OR46E5XfKWTyKcP9nlBUGDzEvBdI5o9z
	xMccwoDIVp1eFpACzTeFqPX3hHpFRyOS2E43wVaTed6WMAD2++yFuO7E
X-Gm-Gg: ATEYQzyoVGWAsPsZVRlZqNABBUFa9kL0bs+ReXRNhaUa9G8IeAz6lMZ12ORIGtVRChm
	Cs3xGmXF0546f6b9p1dFWFfFx//FxsVpfg6j5e0fRoCYY1xl5A+ffDUranv6d/AICPtApsGRR76
	dms2wICiBlJDsH+C5LfpOi8ua3RrPYTzztXv9pIbhLgvhTkwFi7oIqe3SGNPghm+zyA0OqDeuZr
	C8q6v7RYjYD02vqRICs8jc+HoFtFX9EVAxstu5ntbRRnL/uc1fKwX6Ija5TBQxs0LkoDI2zuhzD
	pMz6isCYiAF1583VGiQGH4HEYK9s8YHKZfSGSUbRxtuHP2KXy/MAJeNJIqnxUq63wGkab/Jm9PU
	XWahyXHXb6ojKYCq7pwKkl8qQnpzpU9R4gnewMzn9rqt/1I2InemYkRdCJjozBDt4yLjQj8Lwxy
	ySvr7ZNcXar2dchGFV/EI8Jr3pd7zY2jMxPwXtfVPK
X-Received: by 2002:a17:90a:e7c1:b0:35d:a276:a87d with SMTP id 98e67ed59e1d1-35da276afa0mr6030327a91.27.1774898215457;
        Mon, 30 Mar 2026 12:16:55 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm9627178a91.17.2026.03.30.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:16:54 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/5] ipv6: mld: encode multicast exponential fields
Date: Mon, 30 Mar 2026 19:16:10 +0000
Message-ID: <20260330191611.16929-5-royujjal@gmail.com>
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

In MLD, QQIC and MRC fields are not currently encoded when
generating query packets. Since the receiver of the query
interprets these fields using the MLDv2 floating-point
decoding logic, any raw interval value that exceeds the
linear threshold is currently parsed incorrectly as an
exponential value, leading to an incorrect interval
calculation.

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
 include/net/mld.h         | 117 ++++++++++++++++++++++++++++++++++++++
 net/bridge/br_multicast.c |   4 +-
 2 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/include/net/mld.h b/include/net/mld.h
index 5e093f9c75d9..1ee7d3f68a33 100644
--- a/include/net/mld.h
+++ b/include/net/mld.h
@@ -90,12 +90,129 @@ struct mld2_query {
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
+ * MLDv2 Maximum Response Code 16-bit encoding (RFC3810).
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
+ * - Total left shift of the hidden bit = 12 + (exp + 3) = exp + 15.
+ * - This is the MSB at the 0-based bit position: (exp + 15).
+ * - Since fls() is 1-based, fls(value) - 1 = exp + 15.
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
+		return (u16)mrd;
+
+	/* Saturate at max representable (mant = 0xFFF, exp = 7) -> 8387584 */
+	if (mrd >= MLD_MRC_MAX_THRESHOLD)
+		return 0xFFFF;
+
+	mc_exp = (u16)(fls(mrd) - 16);
+	mc_man = (u16)((mrd >> (mc_exp + 3)) & 0x0FFF);
+
+	return (0x8000 | (mc_exp << 12) | mc_man);
+}
+
+/*
+ * Calculate Querier's Query Interval Code from Query Interval
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
+		return (u8)value;
+
+	/* Saturate at max representable (mant = 0xF, exp = 7) -> 31744 */
+	if (value >= MLD_QQIC_MAX_THRESHOLD)
+		return 0xFF;
+
+	mc_exp  = (u8)(fls(value) - 8);
+	mc_man = (u8)((value >> (mc_exp + 3)) & 0x0F);
+
+	return (0x80 | (mc_exp << 4) | mc_man);
+}
+
 /* V2 exponential field decoding */
 
 /* Calculate Maximum Response Delay from Maximum Response Code
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 27010744d7ae..c2d144f6a86e 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -1181,7 +1181,7 @@ static struct sk_buff *br_ip6_multicast_alloc_query(struct net_bridge_mcast *brm
 		break;
 	case 2:
 		mld2q = (struct mld2_query *)icmp6_hdr(skb);
-		mld2q->mld2q_mrc = htons((u16)jiffies_to_msecs(interval));
+		mld2q->mld2q_mrc = htons((u16)jiffies_to_msecs(mldv2_mrc(interval)));
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

