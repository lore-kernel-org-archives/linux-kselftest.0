Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BB2D0C82
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777656718; cv=none; b=P6NHdTqRNJJ08UY22EMbsr+FTcfnGpxiJaRNhGNj2DL3DR/G3PV+93fNoJnQj1J4Gv00HsF5Adbh8Dndhly607uWQOoDJHPK/8TGFRZvjGyV4PLG+qRZozFmpJ3dgsApTNUg6kWDdTQxI+2URnmNisKHdpNAhwhSlX8mX5K6GbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777656718; c=relaxed/simple;
	bh=PDn8j0lrnxkTWFi/Ss5XFw7DFZtI8b/CvWn3vrzRAiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWaw3dGLD3ghC3DLzztlXl/jO1/t/U4DVoQswBd4YNXpaBgtzt7uzNiQdWx4SyEaI6CptfwJ05hF3cHC8N6iUKxW8Iun/3kkbZ0PGlIkYe+EmL3BqJmT980CiOifIZSok6pERDFVciKv7hqJlseYxFCIXbIoB2mUSzMVUWrsPek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSs2Ssgi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSs2Ssgi"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35fbca04006so1074781a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777656717; x=1778261517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LslMTLSTH+cOBfpp7e2vjMYbfCy9riwOyI9tt0Uj2os=;
        b=lSs2SsgiY6CRUk4lGbfl4fvv4ydmkW8XFXq+pkbh0NZVYuU6TblA4n1gZbtZmSdXHt
         TnPJbiLm9vn3TugoMk60MXccE9GbYX3exAxfIQBVnaMazWUSkxkj6GETfjHM95n6PhWA
         9sroLoqcvBeFkutTCbE4QfCpKCUCOg/2Y1565NcKnL1Ev05PiOb3MPCK6w+t73QJrsvc
         uhJw9Akxgsw9etCXCBG5tdSNLKITnHG/asNQudqCNCnri1CMgkAiza7nIyZo7E2Nw0T/
         UaJNuSADswhxeZq7fw0UGXxtqmLOTxjILoupzGLVvSZkr2hO0VpX26YPrmbAmWfd2cUX
         +zZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777656717; x=1778261517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LslMTLSTH+cOBfpp7e2vjMYbfCy9riwOyI9tt0Uj2os=;
        b=O/UaxZsi+kTLoJf49I93ezrOGK1YWzRA0WUt92w6Xx9Esr4w/jVZl8w5dMIkrD1oZT
         TQAbHWx4osAegwX1abR/HSUad2vHpK/Neg0/Jim+4kcrKyHc/Ydu9Th0Vty0ZUrG3icw
         3rt2aV2VwlADhmTdTYg2fBqhVUEZudxnAXF0OE60LgXa7X4GkiTsT6rL2nhcgtq0Ymhx
         Lbc4+76X59BmnCXY3baoctPCGzNAJ4EGLGnEC/P0jK7kdVUq8Y7T+l16/8HxWO0hTELG
         RmzChCY0vW5tzi/OBoMAruFUgAdNE7yRXumA9o4808X0h3ZFLjAu7Fmy5rDSp6ppr/Es
         ObQw==
X-Forwarded-Encrypted: i=1; AFNElJ+xLfwU5m+FJ/6FhPGqgni3KYS4WtHYJWkoR94vBDAfY7FMereXiYKs4IZW87JnS2zS9sMH0B8NTlNRemoNrAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8dGTdIGlEIgbRQl54SOOxE5fELRBNxTMNg707OwbQZs4zAxF
	CuQ6LkzJ+RVxLAkojxSvqmXc89B9n+ErJ+X9FEesCtYBWvQ7Cf/WQ/Un
X-Gm-Gg: AeBDieuMXFC6jrwjf30xcIiRDihJFiJFgd+wLNriYJUcTDWwtJxMwJn3jpG1JkGNoGB
	n9x7LmDFa+zEd1j5PBwmdEsgK9yaqlLiXy4jN5JhEazLlPvBC/KKs6alMW8Kj2Qbk7q1Z0/lj3X
	kGW1DOY04iPdTMnSaK3k8Mmc3Hw3/GRc5XmmhOIN4V/nQjhsHN77SazcqpB3/aUQqy8QVx9Yr7y
	xC3Ba4LD03O5IMoG1eSfJ28ZPp1C4CjQbBvvLcjBC4wloozAi6gy+WwKNaD0PQ9+xjy4wT0H3r3
	2/jxITvywFOyOu2o9rjyLIGFsitaFwi/RbpA+lD0FQk2XurjepjPsgsytO3R0on7yYQUMoYGqrD
	gt+w/hWEJUq/O3F2036vNikZ8Akaq3eVnu0HZiImVizDKdPPTaJaLonxrigQHRdLdwj6PgeBDyY
	MPLB4T/xFBNcM5os72HMBRW/JsUYYI5a0LnhcYy9ImFenU1slIIA==
X-Received: by 2002:a17:90b:5707:b0:364:a173:2d61 with SMTP id 98e67ed59e1d1-3650cd70c41mr143017a91.11.1777656716795;
        Fri, 01 May 2026 10:31:56 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm2908906a91.2.2026.05.01.10.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:31:56 -0700 (PDT)
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
Subject: [PATCH net-next v5 2/5] ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()
Date: Fri,  1 May 2026 17:31:26 +0000
Message-ID: <20260501173130.3486-3-royujjal@gmail.com>
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

Rename mldv2_mrc() to mldv2_mrd() as it is used to calculate
the Maximum Response Delay from the Maximum Response Code.

Introduce a new API mldv2_qqi() to define the existing
calculation logic of QQI from QQIC. This also organizes
the existing mld_update_qi() API.

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

