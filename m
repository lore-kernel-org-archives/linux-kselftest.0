Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CEC369224
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469515; cv=none; b=ongbKRyvG75lfmZ7+J2wsvEb9IGvgeOXdtaZaNl+z4FlGUjBNK5QhOK1VEJhOqL6AZiQpAUhN2G5id5voN7sLQg2UK/aNId43O4LaYG/dj4ivXRoiISxZ/HbjhckP1pfMiUuV6fiPwiI9+JN9hhpnEVe/CpXt20k5qk3lwaBUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469515; c=relaxed/simple;
	bh=jIxC9Xt7KvY7NNn0gWbjTmqKfFhpD9LFvV6uzbCPOvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilY6YTT74V0oBBi3FscblIEnwYbRsO7z8QjyvoWd8F3PozbHeW/dvRzfwLOYtasQPe8FSc89iSKlM/RwFWWPowKRTdgjR7d6a3wZidDcwrNjghCIE2x1u/C+rtA6SoxNTKy2IKOO9iQC4ebbiYh17vMixcyPXluPLiTxghaDdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=CS7ncloX; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="CS7ncloX"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67c20ed3076so179914eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1774469513; x=1775074313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5EAW/dU3xcgcEergLpQb05bDeYWfWPBoj8NevQL9y0=;
        b=CS7ncloX5zdvFIq11FCjDx3lP/9gUs9CP++KTSWymmZxQGj0UOBhhjY0B+cazHNeTR
         YlnAzJjRHWiHYvsi49lTzBsFipuqFVj50O45LqYDP2lwVgBMvtl7hUWh7/yh+F+/7aQw
         0fxNeCsHu3mJXpb4gYjwa47XX1+fKsHLwKqS7e5b9V040gliv2CqN+6/ZUvASDxbAmqR
         CF/UrGxlxctZxYQnIgktkoso7W5/qTlkkOatVB54nQwQQGioLq9fjU0Aw0Q17sViWtjZ
         esaFA4YVTThmhx+jpCe04JWEhrgms5Tpu5947q9h/ejywTmPgGDulPtAZaOYkt1nP6bA
         mTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469513; x=1775074313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5EAW/dU3xcgcEergLpQb05bDeYWfWPBoj8NevQL9y0=;
        b=gGkoS3O4ZYTUXTtBxrIFNVbflOwD+sGDlHaFbQ9OQ0kluHnbNV0SNS4NCJt6K46Zzr
         U+uovQ9+9gSYyluKcfbDa2kPk9M0sICUOgAkK9sn8u1dBFnoT1qRXE6eM6Q+A8MHdHe+
         ZgAjXq7noFLaIhBxSu6cGpHHON9sota0yBPmK5VZbnsF31nnbOzui2Iq0KpAHT4JZ9YU
         b4wEun17IIVvX16SOKV+nrKCiO7oAN8PMwMxbi97OV+6KuOTYvaniLc9+oF1DDyet6Rp
         CzCcV2LeJbjrh0MVOTR6+tdgLdjxX0hfa2uvw1VwkDemcuri36BMYn9Bl4LGubnZ+kU3
         v+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU56ISZQgqeneOa5BfrXgYhYC37S/pgB7ixe5BzvRq9peKb6Yo93h5K9rmezJj7s2RwZQklpZIH7GGqE3a2eSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcj21mnBVAhiFNNu4+iN3kzJPKgTk9J+Wjs3yHu53rlkY6D16p
	gLiEkgQSki7LV+g8gbghQixk+Pw0cEb5ONpWNHYec+sSuMePvNUIU2PWo0H+l/kosDc=
X-Gm-Gg: ATEYQzz55I7fE/dXhbENTXsJOIfJ2oGNOZy0mV++QweFoi3EL6E5HDafYxfp/ci9+hc
	miV/Ac30c+F+g+XSWRsBHtXRhjJ5aCXaBxSnm5nWE7V8E6I8W4f5s7btHU2/Usf8Z0ADo1W8iQo
	/fYsQUxrW6NqJ119F9gq51iKTl2SFi9UgbzWVDXAmvhAkQpvhrQ5yrtgqqrahBkfQ24mzHle7lj
	bmk/um3J1Abj794rZ+iPllF5vYSFTc/GXz1Iblp275MGtYJokXnu/GqCpEBtDVr9/T9FjWFvDvV
	+mgu3G/NaWtdpFSli+jxVTajg6j4TgSPcC/y749fXOS3PI9PrsLWMvMaUvFH97En5wUrLPtA+Ya
	wdr6awb25NQ2KBwK7qKyR0cgXEKdr5qa+FOVfHGgb1I5EuwPYLwuixCZ8BFzvQJ27RCRLZhGaFd
	u7aUW7tg1SXS7XznjD9Ms9XzY=
X-Received: by 2002:a05:6820:1614:b0:67c:2857:e0e9 with SMTP id 006d021491bc7-67dff51458bmr2535712eaf.44.1774469512955;
        Wed, 25 Mar 2026 13:11:52 -0700 (PDT)
Received: from 20HS2G4.aus01.local ([2a09:bac6:bf21:2632::3ce:1a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0ab274c7sm549764eaf.13.2026.03.25.13.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:11:52 -0700 (PDT)
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
Subject: [PATCH net-next v5 2/6] bnxt_en: Implement XDP RSS hash metadata extraction
Date: Wed, 25 Mar 2026 15:09:48 -0500
Message-ID: <20260325201139.2501937-3-carges@cloudflare.com>
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

Add support for extracting RSS hash values and hash types from hardware
completion descriptors in XDP programs for bnxt_en.

Add IP_TYPE definition for determining if completion is ipv4 or ipv6. In
addition add ITYPE_ICMP flag for identifying ICMP completions.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
Reviewed-by: Joe Damato <joe@dama.to>
Reviewed-by: Andy Gospodarek <gospo@broadcom.com>
---
v4: no changes
v5: no changes
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  5 ++
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |  2 +
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c | 47 +++++++++++++++++++
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h |  3 ++
 4 files changed, 57 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e70fd04fe5f3..d15548dfd4a3 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -15911,6 +15911,10 @@ static const struct net_device_ops bnxt_netdev_ops = {
 	.ndo_hwtstamp_set	= bnxt_hwtstamp_set,
 };
 
+static const struct xdp_metadata_ops bnxt_xdp_metadata_ops = {
+	.xmo_rx_hash		= bnxt_xdp_rx_hash,
+};
+
 static void bnxt_get_queue_stats_rx(struct net_device *dev, int i,
 				    struct netdev_queue_stats_rx *stats)
 {
@@ -16795,6 +16799,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto init_err_free;
 
 	dev->netdev_ops = &bnxt_netdev_ops;
+	dev->xdp_metadata_ops = &bnxt_xdp_metadata_ops;
 	dev->stat_ops = &bnxt_stat_ops;
 	dev->watchdog_timeo = BNXT_TX_TIMEOUT;
 	dev->ethtool_ops = &bnxt_ethtool_ops;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index dd0f6743acf5..99f45686ed09 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -232,6 +232,7 @@ struct rx_cmp {
 	 #define RX_CMP_FLAGS_ITYPE_UDP				 (3 << 12)
 	 #define RX_CMP_FLAGS_ITYPE_FCOE			 (4 << 12)
 	 #define RX_CMP_FLAGS_ITYPE_ROCE			 (5 << 12)
+	 #define RX_CMP_FLAGS_ITYPE_ICMP			 (7 << 12)
 	 #define RX_CMP_FLAGS_ITYPE_PTP_WO_TS			 (8 << 12)
 	 #define RX_CMP_FLAGS_ITYPE_PTP_W_TS			 (9 << 12)
 	#define RX_CMP_LEN					(0xffff << 16)
@@ -311,6 +312,7 @@ struct rx_cmp_ext {
 	#define RX_CMP_FLAGS2_T_IP_CS_CALC			(0x1 << 2)
 	#define RX_CMP_FLAGS2_T_L4_CS_CALC			(0x1 << 3)
 	#define RX_CMP_FLAGS2_META_FORMAT_VLAN			(0x1 << 4)
+	#define RX_CMP_FLAGS2_IP_TYPE				(0x1 << 8)
 	__le32 rx_cmp_meta_data;
 	#define RX_CMP_FLAGS2_METADATA_TCI_MASK			0xffff
 	#define RX_CMP_FLAGS2_METADATA_VID_MASK			0xfff
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
index 85cbeb35681c..1f920464b426 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c
@@ -472,3 +472,50 @@ bnxt_xdp_build_skb(struct bnxt *bp, struct sk_buff *skb, u8 num_frags,
 				  xdp_buff_get_skb_flags(xdp));
 	return skb;
 }
+
+int bnxt_xdp_rx_hash(const struct xdp_md *ctx, u32 *hash,
+		     enum xdp_rss_hash_type *rss_type)
+{
+	const struct bnxt_xdp_buff *xdp = (void *)ctx;
+	const struct rx_cmp_ext *rxcmp1 = xdp->rxcmp1;
+	const struct rx_cmp *rxcmp = xdp->rxcmp;
+	enum xdp_rss_hash_type hash_type = 0;
+	u32 itypes;
+
+	if (!rxcmp || !RX_CMP_HASH_VALID(rxcmp))
+		return -ENODATA;
+
+	*hash = le32_to_cpu(rxcmp->rx_cmp_rss_hash);
+
+	if (!rxcmp1) {
+		*rss_type = XDP_RSS_TYPE_L2;
+		return 0;
+	}
+
+	if (xdp->cmp_type == CMP_TYPE_RX_L2_CMP) {
+		itypes = RX_CMP_ITYPES(rxcmp);
+		if (rxcmp1->rx_cmp_flags2 &
+		    cpu_to_le32(RX_CMP_FLAGS2_IP_TYPE)) {
+			hash_type |= XDP_RSS_TYPE_L3_IPV6;
+		} else {
+			hash_type |= XDP_RSS_TYPE_L3_IPV4;
+		}
+
+		switch (itypes) {
+		case RX_CMP_FLAGS_ITYPE_TCP:
+			hash_type |= XDP_RSS_L4 | XDP_RSS_L4_TCP;
+			break;
+		case RX_CMP_FLAGS_ITYPE_UDP:
+			hash_type |= XDP_RSS_L4 | XDP_RSS_L4_UDP;
+			break;
+		case RX_CMP_FLAGS_ITYPE_ICMP:
+			hash_type |= XDP_RSS_L4 | XDP_RSS_L4_ICMP;
+			break;
+		default:
+			break;
+		}
+	}
+
+	*rss_type = hash_type;
+	return 0;
+}
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h
index 8c66698bde11..fb4f9143929f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.h
@@ -41,4 +41,7 @@ void bnxt_xdp_buff_frags_free(struct bnxt_rx_ring_info *rxr,
 struct sk_buff *bnxt_xdp_build_skb(struct bnxt *bp, struct sk_buff *skb,
 				   u8 num_frags, struct bnxt_rx_ring_info *rxr,
 				   struct xdp_buff *xdp);
+int bnxt_xdp_rx_hash(const struct xdp_md *ctx, u32 *hash,
+		     enum xdp_rss_hash_type *rss_type);
+
 #endif
-- 
2.43.0

