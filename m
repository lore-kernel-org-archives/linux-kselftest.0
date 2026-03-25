Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDFA366542
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469514; cv=none; b=UM4m4ejDvft2tjKV4xnPjUJhbBWWJtlhsiPJzlrVCTEMC7E9EGebRYHBT47Lg35LGDYdFnOJZAF1bv7vrx1/ysQb9T4quREdwbYMIHWYA9hKB++CdMiWGrX8KuD/O4IyCPGqqCLZZPUwV8+GEE7OLsI5h5lRWLIG7WMGcA5sZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469514; c=relaxed/simple;
	bh=tE1y7Xf3gKLbeuPRxTJlE3b5uyBorC0b4mjSJ11WKYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqFKXz2JovWQrLpHPKP2AC4YNbgku8zRMbKez/PvezRrBE97fp4uKV0Hjqgjh4yRI9ewfyjj+yJQKS5TehRBOQyXGV/UyrRF0yXqT6cHd5DT6W8LMdcROipVggP0/Sq91TCh7VXEjl5NvDTBOPe46y8JMFViB3wbx4MV6Ffl5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=CJsXrEPi; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="CJsXrEPi"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67c250805ccso150638eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1774469511; x=1775074311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSfd7mFw0xsUikzIqT2q80GcNCSLpTJTf+iIVU2PLVI=;
        b=CJsXrEPiPLY4Hn+IgJE2SC/ybvWO1Wj7pTct1A4IQUVRyviGrMmys78dsotZSlcN4u
         y0e17u97Uc9l9pU05xihcYiaKtjoFud0J0Jp1VfNy/JXaG3VYEWvApQeKDtEIpgrj/1n
         EEhxJ+YqkkiTSQUSUmHR+BuS0W2rAy/YGoXv3mgEHVlSEpd7OHX4xcJ3zDS9TKRQEGgB
         pdSejnOfBiWbcsSjvbuOY3jXiqae5tlx1TFLhmjxi9TrwKkCGmxPP3moikT+j/dNeZSn
         oxuS4b3fUiIIeLeOGaE0O58NptOvAALymVPgITRBZMhmRZIZaLT7Ba3U8bzdLaEvUQzJ
         SIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469511; x=1775074311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSfd7mFw0xsUikzIqT2q80GcNCSLpTJTf+iIVU2PLVI=;
        b=GJG54fKbecOxltjWX+oVKdUnz/R/Mig/iuATTl4NjWDFj0QOcmnrJTj2sAuLy5Aq9f
         V3Y8irl+3/tUNKEcnD4pvD6ohuc3fmQBvZ0sfHaefpl2H6/L/7P8kZADSC3OuRFCuu4D
         3l0H0LOcFu9X6nqa3BQ8rs8p0/98YMCl/VWuKfslop5mfCoGfvRXCo1kQYoQqI1FN4tn
         /1pBks+MNtV2eiocRYpwM+yTHMj0HoE4Pe3zqQGCNJecBT9ZUxpwP/DfW6YIROcWR85G
         pxsn8CEwCNKeR+fjSGTZ7pUE027zE/IAJCexrNrDT0GwsvDhFaDG0x+D30zZrBn52zUF
         47jg==
X-Forwarded-Encrypted: i=1; AJvYcCWH5vHes3WjIMsXUQUfV1UP7PqSVdS1SMX4rHe+QIoI2fk709c4+PbDQtEe7uv4wbNp0NYY9yJnNE3b/ytFfEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlR4RociqmK6axZKcVl054iIO/EIexwTSIUrU7acK4ZLvoCUd4
	nmF58J5abSdYqOgc6LtmVaPJZnVQ0nqpyR9tIUwHKInYjOqAXuDa3PH8CLNNXgQ9ONs=
X-Gm-Gg: ATEYQzzNj+HyeZsC5Lxx+v26Jn0BcmC1ctg5TZpC+ElgGiCiUSjCF899j6EyEwbR3X9
	J0+3CR7nYpALRCpU7AznNBSXlJfuhdAnupr403oa9TAYKQP/Hcm+SCaEhN0I5jV/ZZIY6SCBPYD
	IXTa5YOAOkTvs0YbzCKKgCCYWxKMGuheLpr5i6M+VmQpkMx6BK1e4CaXKhBQjek1M2MjQALy0Oj
	6prYLprEW2qAjGTkNP9Usg1raTifMENjyqzO3Q7hc1AeTNuNb4QdTSpOODchV81QOZ/zs1fBUwD
	t8UGbAHz0OHg7mQLgM2DG6Cc//S5jTSOHcndybHTeWQk6TZLYe90b/pYpPEDlCtg2lF8H+5SNFD
	d7lPNISLpgCK825g9ma3sRtS2gRI86JLGgTaGOvgQCWXXBlywFJzycbIWNz8MJSKLPlRvoIPxPw
	BufvcZyEbEtE7tvzcNkJ9sVOg=
X-Received: by 2002:a05:6820:3092:b0:67d:e140:345f with SMTP id 006d021491bc7-67dff51b7c0mr2429038eaf.34.1774469510989;
        Wed, 25 Mar 2026 13:11:50 -0700 (PDT)
Received: from 20HS2G4.aus01.local ([2a09:bac6:bf21:2632::3ce:1a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0ab274c7sm549764eaf.13.2026.03.25.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:11:50 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
To: netdev@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	davem@davemloft.net,
	joe@dama.to,
	gospo@broadcom.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com
Cc: andrew+netdev@lunn.ch,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	Chris J Arges <carges@cloudflare.com>
Subject: [PATCH net-next v5 1/6] bnxt_en: use bnxt_xdp_buff for xdp context
Date: Wed, 25 Mar 2026 15:09:47 -0500
Message-ID: <20260325201139.2501937-2-carges@cloudflare.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325201139.2501937-1-carges@cloudflare.com>
References: <20260325201139.2501937-1-carges@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds bnxt_xdp_buff which embeds the xdp_buff struct and stores
pointers to hardware RX completion descriptors (rx_cmp and rx_cmp_ext)
along with the completion type.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
v4: moved bnxt_xdp declaration to follow RCT style
v5: moved bnxt_xdp again to follow RCT, try better at 80-col wrapping
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 29 ++++++++++++-------
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h |  7 +++++
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 84eb53b4172b..e70fd04fe5f3 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -2112,13 +2112,13 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 	u32 tmp_raw_cons = *raw_cons;
 	u16 cons, prod, cp_cons = RING_CMP(tmp_raw_cons);
 	struct skb_shared_info *sinfo;
+	struct bnxt_xdp_buff bnxt_xdp;
 	struct bnxt_sw_rx_bd *rx_buf;
 	unsigned int len;
 	u8 *data_ptr, agg_bufs, cmp_type;
 	bool xdp_active = false;
 	dma_addr_t dma_addr;
 	struct sk_buff *skb;
-	struct xdp_buff xdp;
 	u32 flags, misc;
 	u32 cmpl_ts;
 	void *data;
@@ -2231,9 +2231,14 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 	dma_addr = rx_buf->mapping;
 
 	if (bnxt_xdp_attached(bp, rxr)) {
-		bnxt_xdp_buff_init(bp, rxr, cons, data_ptr, len, &xdp);
+		bnxt_xdp.rxcmp = rxcmp;
+		bnxt_xdp.rxcmp1 = rxcmp1;
+		bnxt_xdp.cmp_type = cmp_type;
+
+		bnxt_xdp_buff_init(bp, rxr, cons, data_ptr, len, &bnxt_xdp.xdp);
 		if (agg_bufs) {
-			u32 frag_len = bnxt_rx_agg_netmems_xdp(bp, cpr, &xdp,
+			u32 frag_len = bnxt_rx_agg_netmems_xdp(bp, cpr,
+							       &bnxt_xdp.xdp,
 							       cp_cons,
 							       agg_bufs,
 							       false);
@@ -2245,12 +2250,13 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 	}
 
 	if (xdp_active) {
-		if (bnxt_rx_xdp(bp, rxr, cons, &xdp, data, &data_ptr, &len, event)) {
+		if (bnxt_rx_xdp(bp, rxr, cons, &bnxt_xdp.xdp, data, &data_ptr,
+				&len, event)) {
 			rc = 1;
 			goto next_rx;
 		}
-		if (xdp_buff_has_frags(&xdp)) {
-			sinfo = xdp_get_shared_info_from_buff(&xdp);
+		if (xdp_buff_has_frags(&bnxt_xdp.xdp)) {
+			sinfo = xdp_get_shared_info_from_buff(&bnxt_xdp.xdp);
 			agg_bufs = sinfo->nr_frags;
 		} else {
 			agg_bufs = 0;
@@ -2261,7 +2267,8 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 		if (!xdp_active)
 			skb = bnxt_copy_skb(bnapi, data_ptr, len, dma_addr);
 		else
-			skb = bnxt_copy_xdp(bnapi, &xdp, len, dma_addr);
+			skb = bnxt_copy_xdp(bnapi, &bnxt_xdp.xdp, len,
+					    dma_addr);
 		bnxt_reuse_rx_data(rxr, cons, data);
 		if (!skb) {
 			if (agg_bufs) {
@@ -2269,7 +2276,8 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 					bnxt_reuse_rx_agg_bufs(cpr, cp_cons, 0,
 							       agg_bufs, false);
 				else
-					bnxt_xdp_buff_frags_free(rxr, &xdp);
+					bnxt_xdp_buff_frags_free(rxr,
+								 &bnxt_xdp.xdp);
 			}
 			goto oom_next_rx;
 		}
@@ -2293,10 +2301,11 @@ static int bnxt_rx_pkt(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 			if (!skb)
 				goto oom_next_rx;
 		} else {
-			skb = bnxt_xdp_build_skb(bp, skb, agg_bufs, rxr, &xdp);
+			skb = bnxt_xdp_build_skb(bp, skb, agg_bufs,
+						 rxr, &bnxt_xdp.xdp);
 			if (!skb) {
 				/* we should be able to free the old skb here */
-				bnxt_xdp_buff_frags_free(rxr, &xdp);
+				bnxt_xdp_buff_frags_free(rxr, &bnxt_xdp.xdp);
 				goto oom_next_rx;
 			}
 		}
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h
index 8933a0dec09a..8c66698bde11 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h
@@ -12,6 +12,13 @@
 
 DECLARE_STATIC_KEY_FALSE(bnxt_xdp_locking_key);
 
+struct bnxt_xdp_buff {
+	struct xdp_buff xdp;
+	struct rx_cmp *rxcmp;
+	struct rx_cmp_ext *rxcmp1;
+	u8 cmp_type;
+};
+
 struct bnxt_sw_tx_bd *bnxt_xmit_bd(struct bnxt *bp,
 				   struct bnxt_tx_ring_info *txr,
 				   dma_addr_t mapping, u32 len,
-- 
2.43.0

