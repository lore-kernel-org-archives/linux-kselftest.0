Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40B1C3BEB
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727975; cv=none; b=Mh/bhbsmeyqopNn7aTxpvxylKzYsXr5W3+HNhIA2ISJTPt5DaDaWZ4ESun4Js6F++Jo10dLytV54ERh3lIrI4PvgaKLRxSkisoIwbwQFqlrFdWb7N3LOved5XKIM4+q2cfQLryMxqHPa/a0vU9tqjPNom6lGk4qVP4zXebUYPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727975; c=relaxed/simple;
	bh=UCaDphay8R5jghlpOgQZQGSq8SNelf7mPTIxi7JVkS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hon6nA5IKq2Ngq4VpWup/whrVnuspQ4mTehOVudvZRzTZJQXAkA5cpctdU5uCFQQoCRrL1HH3rdLzo8xeyxC+Ws4ZHxk+NwljqdsFwWFTz1/B35kHPspfc63/YjqXF+R6cC6IXg58jvgbYXiu9fxxnFP0JIcc4XST/qMKP/BPyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0gs6ZE6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0gs6ZE6"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-83537a80ab6so128070b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 02 May 2026 06:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777727973; x=1778332773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfXFwhGtvtECoZmhLyPyGGfKAV5tvDJY8uqDk21sk4s=;
        b=O0gs6ZE6ojtpRGIyfbEb8+3OXu2PzdgP4+HyoONlj6BWcE/JBfAkZ/uxwPP5cJR1s6
         21pEGfy6J/uXHcJDfnfIDESC+/cE71r416/a4PMhxFo9n9JwBcbhPzk2+T1qsHdbJVtW
         D3iw9QCKg++NwMwzdx1GoJqky4vKeLGXkjttKnQBNp8Ab4W5ZsNo48G1o7R8nZLdYSoW
         ffvX3hI7Zw7S2v4QsTzc+bDKZfa3EoG647Dm96Tr0c/vepzsDzWMNFdRE0f0vBibNi5d
         B3NLF2t0PAka0LTczGNX7lxiiA4GSOLnQEOq/IU16Ok/5j39ubtrWYag+kj3QCt28ULs
         5Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777727973; x=1778332773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CfXFwhGtvtECoZmhLyPyGGfKAV5tvDJY8uqDk21sk4s=;
        b=f4SlbJxyv/ZFRYWW9Pi8KAAKB94CyRsLRylIvPE4cpovqUp3AmlCPuozfbyZqByMye
         ZmvKBO2nHPCFYYhnZUUIPBYQseaRGhiDouswDGb+B1EN1TwQMF7QUtFWEL51Uzh3Bbuj
         LxAQeYajlxyM9Fj9x7eOGzYI2XVdH/jy1kfVNsESxRBMmiNBK6kxm9LuNQfOZNUZXsU6
         rI9TBPlSjGzk24Nvf1cCYyGoeFyemJ+Z+ZfloCRoycYX4irJbIP4L89PPlUOirB+rHQ6
         +UNxBEOK6IfoVJHJOwPCEi7YRC5pIyLaKWIiUk80ehDJphqhMi0hdig/qF1pDy0ffvMx
         GP4w==
X-Forwarded-Encrypted: i=1; AFNElJ+xmkYp6PyN5xpe3sZuoAzyVan9a8Y8qN6wVZ7mUFlLjr0AmRXSiEQtxqDCNvibJvBW0EQUYdka1QwtNc38UKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVqyiALXz7uchuvBrqlgl30ZzTItskcP9R7Y/z+iAdHxgL0wv
	XC3LDntkqPvFZ8Bp4DyQekXUakIGSSmD5fJpNM2GShddYYmCJnYBpolc
X-Gm-Gg: AeBDieuZfrBv8bi3gtTEjGaMqYeXtc/damwSfMIC6vaPZ9/RN0JWE3t6AQkkjAiBQ9u
	rXObAox02H45x7Mfk0u00UH3t42Nz1gJE4a4g4e0C+ENEsshPPUqkEIseBOTc+rfFWtMAVUMurp
	X8v15CxRyl30K/U5OB19Bcmd4wXbycjOyFtZ0WVE6GL+CGIkfMFa7pvxigMvwcewVO/4l4JO5vK
	05+z/kRBnTHuDghiQKlpPo+10L1t2Z8ts/nsbNGNDbGtC/pPPwYUDIhb9MKtIZQ3ZOmlgeIa2ks
	KUpaD46hEbCInJJLFKM+MOeR0oYP5MWPvQ85F46rq750W3XCu2z+P6kmtDNnjS9iSZrwUm41vyy
	LfdTRBIgaH8ub2hkn9LileTe7iZMvPBe7G50LndlDswf4XOLMsaxVkO/8Q90nb4yrqbTVq2YsGb
	Yom06qWy/H2sZOdBkxPLfZWbU9drHNo7wOYWRen+TgzurgKR8DDg==
X-Received: by 2002:a05:6a00:369b:b0:834:df57:9d6b with SMTP id d2e1a72fcca58-8352d28bc1fmr3081700b3a.24.1777727972918;
        Sat, 02 May 2026 06:19:32 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0176sm5553791b3a.39.2026.05.02.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:19:32 -0700 (PDT)
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
Subject: [PATCH net-next v6 2/5] ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()
Date: Sat,  2 May 2026 13:19:03 +0000
Message-ID: <20260502131907.987-3-royujjal@gmail.com>
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

Rename mldv2_mrc() to mldv2_mrd() as it is used to calculate
the Maximum Response Delay from the Maximum Response Code.

Introduce a new API mldv2_qqi() to define the existing
calculation logic of QQI from QQIC. This also organizes
the existing mld_update_qi() API.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Ujjal Roy <royujjal@gmail.com>
---
 include/net/mld.h         | 66 +++++++++++++++++++++++++++++++++------
 net/bridge/br_multicast.c |  2 +-
 net/ipv6/mcast.c          | 19 ++---------
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/include/net/mld.h b/include/net/mld.h
index c07359808493..10e402e0fe08 100644
--- a/include/net/mld.h
+++ b/include/net/mld.h
@@ -89,29 +89,77 @@ struct mld2_query {
 #define MLDV2_QQIC_EXP(value)	(((value) >> 4) & 0x07)
 #define MLDV2_QQIC_MAN(value)	((value) & 0x0f)
 
-#define MLD_EXP_MIN_LIMIT	32768UL
-#define MLDV1_MRD_MAX_COMPAT	(MLD_EXP_MIN_LIMIT - 1)
+/* MLDv2 QQIC floating-point exponential field min threshold */
+#define MLD_QQIC_MIN_THRESHOLD	128
+/* MLDv2 MRC floating-point exponential field min threshold */
+#define MLD_MRC_MIN_THRESHOLD	32768UL
+#define MLDV1_MRD_MAX_COMPAT	(MLD_MRC_MIN_THRESHOLD - 1)
 
 #define MLD_MAX_QUEUE		8
 #define MLD_MAX_SKBS		32
 
-static inline unsigned long mldv2_mrc(const struct mld2_query *mlh2)
+/* V2 exponential field decoding */
+
+/* Calculate Maximum Response Delay from Maximum Response Code
+ *
+ * RFC3810, relevant sections:
+ *  - 5.1.3. Maximum Response Code defines the decoding formula:
+ *      0 1 2 3 4 5 6 7 8 9 A B C D E F
+ *     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ *     |1| exp |          mant         |
+ *     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ *    Maximum Response Delay = (mant | 0x1000) << (exp+3)
+ *  - 9.3. Query Response Interval
+ *
+ * After decode, MRC represents the Maximum Response Delay (MRD) in
+ * units of milliseconds.
+ */
+static inline unsigned long mldv2_mrd(const struct mld2_query *mlh2)
 {
-	/* RFC3810, 5.1.3. Maximum Response Code */
-	unsigned long ret, mc_mrc = ntohs(mlh2->mld2q_mrc);
+	unsigned long mc_mrc = ntohs(mlh2->mld2q_mrc);
 
-	if (mc_mrc < MLD_EXP_MIN_LIMIT) {
-		ret = mc_mrc;
+	if (mc_mrc < MLD_MRC_MIN_THRESHOLD) {
+		return mc_mrc;
 	} else {
 		unsigned long mc_man, mc_exp;
 
 		mc_exp = MLDV2_MRC_EXP(mc_mrc);
 		mc_man = MLDV2_MRC_MAN(mc_mrc);
 
-		ret = (mc_man | 0x1000) << (mc_exp + 3);
+		return (mc_man | 0x1000) << (mc_exp + 3);
 	}
+}
 
-	return ret;
+/* Calculate Querier's Query Interval from Querier's Query Interval Code
+ *
+ * RFC3810, relevant sections:
+ *  - 5.1.9. QQIC (Querier's Query Interval Code) defines the decoding formula:
+ *      0 1 2 3 4 5 6 7
+ *     +-+-+-+-+-+-+-+-+
+ *     |1| exp | mant  |
+ *     +-+-+-+-+-+-+-+-+
+ *    QQI = (mant | 0x10) << (exp + 3)
+ *  - 9.2. Query Interval
+ *  - 9.12. Older Version Querier Present Timeout
+ *    (the [Query Interval] in the last Query received)
+ *
+ * After decode, QQIC represents the Querier's Query Interval in units
+ * of seconds.
+ */
+static inline unsigned long mldv2_qqi(const struct mld2_query *mlh2)
+{
+	unsigned long qqic = mlh2->mld2q_qqic;
+
+	if (qqic < MLD_QQIC_MIN_THRESHOLD) {
+		return qqic;
+	} else {
+		unsigned long mc_man, mc_exp;
+
+		mc_exp = MLDV2_QQIC_EXP(qqic);
+		mc_man = MLDV2_QQIC_MAN(qqic);
+
+		return (mc_man | 0x10) << (mc_exp + 3);
+	}
 }
 
 #endif
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 9fec76e887bc..1438c023db62 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -3606,7 +3606,7 @@ static int br_ip6_multicast_query(struct net_bridge_mcast *brmctx,
 		    mld2q->mld2q_suppress)
 			goto out;
 
-		max_delay = max(msecs_to_jiffies(mldv2_mrc(mld2q)), 1UL);
+		max_delay = max(msecs_to_jiffies(mldv2_mrd(mld2q)), 1UL);
 	}
 
 	is_general_query = group && ipv6_addr_any(group);
diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index 3330adcf26db..6ddc18ac59b9 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -1315,20 +1315,7 @@ static void mld_update_qi(struct inet6_dev *idev,
 	 *  - 9.12. Older Version Querier Present Timeout
 	 *    (the [Query Interval] in the last Query received)
 	 */
-	unsigned long mc_qqi;
-
-	if (mlh2->mld2q_qqic < 128) {
-		mc_qqi = mlh2->mld2q_qqic;
-	} else {
-		unsigned long mc_man, mc_exp;
-
-		mc_exp = MLDV2_QQIC_EXP(mlh2->mld2q_qqic);
-		mc_man = MLDV2_QQIC_MAN(mlh2->mld2q_qqic);
-
-		mc_qqi = (mc_man | 0x10) << (mc_exp + 3);
-	}
-
-	idev->mc_qi = mc_qqi * HZ;
+	idev->mc_qi = mldv2_qqi(mlh2) * HZ;
 }
 
 static void mld_update_qri(struct inet6_dev *idev,
@@ -1338,7 +1325,7 @@ static void mld_update_qri(struct inet6_dev *idev,
 	 *  - 5.1.3. Maximum Response Code
 	 *  - 9.3. Query Response Interval
 	 */
-	idev->mc_qri = msecs_to_jiffies(mldv2_mrc(mlh2));
+	idev->mc_qri = msecs_to_jiffies(mldv2_mrd(mlh2));
 }
 
 static int mld_process_v1(struct inet6_dev *idev, struct mld_msg *mld,
@@ -1390,7 +1377,7 @@ static int mld_process_v1(struct inet6_dev *idev, struct mld_msg *mld,
 static void mld_process_v2(struct inet6_dev *idev, struct mld2_query *mld,
 			   unsigned long *max_delay)
 {
-	*max_delay = max(msecs_to_jiffies(mldv2_mrc(mld)), 1UL);
+	*max_delay = max(msecs_to_jiffies(mldv2_mrd(mld)), 1UL);
 
 	mld_update_qrv(idev, mld);
 	mld_update_qi(idev, mld);
-- 
2.43.0

