Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33936B912
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845201; cv=none; b=ZXUC+52klqj+tv3BJlJLuN6QpbgI64Zq8aptxoYblajtgi/3yY1If3YnbVI+8I2hs7R/CC/gByGqczRwClt99RrRqERjoFuLAmThKqhwxDqatA+kdps0GiM3iRZXWSFkK1KtEnGp/35S/7MKFg8aDWjCiKD9t1R+19YNDxAwDEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845201; c=relaxed/simple;
	bh=pDGvcZ8NxQ2xkIRiNP7AaxgvMDQxUDGZm2sRo/NEo0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAY5Pqn+gMo9lSXb+3ntTl4kxnXROeCXpp7xEramlYACQak6HjBuvzsTGQLvZUNJbGBwxr1eKGHTJW2+uqbtkfWW+JCMabQUMhcmjqDpODSb/EtBvbMKMgsYTKl1InYHHnrJAUEtxwamVfIJjJ0VSHApblS/J1AqASqkoorn28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDwGCTXK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDwGCTXK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so5491037a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845199; x=1789449999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MWj0OBQIEnblZoVl/R41EfExd3TKpD5r96O+gtR9hU=;
        b=TDwGCTXKNTbJw+nHCaU3riDHrW3DkiC8s0BEGf2IV7rnal2lFJj6BSBYYH53WtFX+C
         NDCagqwXGungp5DrncYhaw0T3AAeleMkXUxbTBai3+T/k9XqJ6O6U4ROIGI6C2aplZCA
         omht+8zGTMS0GcfCTN6sFl+MhqGe3eUBlNQsAJV/wPRtvOYFoSRPGs0pFqzzkbel2JNE
         5juJwzEpvueyXJ/5krYONb2rN56DLkhrz5tGHGo6LuxG5Rd4FknXlaGU12SRNF1d/teM
         LLpMeMvg+NSfC9Ti2DKno7kvZxzbifhsZQsjar42VdwfE1NN9cNM8Atmd8l6i6qhAme1
         Ao6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845199; x=1789449999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MWj0OBQIEnblZoVl/R41EfExd3TKpD5r96O+gtR9hU=;
        b=GX55jHSqxb8UUWYSnnCfP7D6VSEDIXze99BXkbtMevPA3zL7lFBhM0ulSU1OwYkC/7
         V5wjXJMaS14hb+UF3vOHqBqh/R9NM3mW705lBi/AqEYOE0ygIYvnOmOTT9Aclk3apkyb
         2aZekhw3Ssm+mT6ELVI99fu+aBEzre0QQ9JimvEeMakHl4qOjg9yKzL9qT3QJ6YNWuAc
         tomjdK8LgKAJze2jQrQ0ZxkQotEHVm3Wi9tvxZ6W1QZPcvuCqyawjszwD7/2VzaLMeVx
         PNpqUIi+PPESgpCCpIYariK5a0f0llhqRWzJwsXzdNgiaYTEjo4O8KyxE9XWTrwi8Var
         Demw==
X-Forwarded-Encrypted: i=1; AKwUvBzIDF6HYd/CmbvBhArrdo1f5Y3dUSIvu4bUkebSSO/Yn5io1vTxo4APgau+hy+I2d6BkFPH+UtjXF9FTBUVEOY=@vger.kernel.org
X-Gm-Message-State: AFuF++lNqvZ9WC2pscdLmZD4rcRuS7UgenjIGYY7YkfoTkC/SsjF+Ei6
	bw+qaOlM2zKm+hJYgkn3wcYyESvysSb6cJT2xy+a7F3Bb5Vfdfhhf7pV
X-Gm-Gg: AYBFou2jBwcTufQ5GwGh3biL5j/bb8pCT5Drdx1EyaVED4ZrIrCSNZVaYZIMq3Yw7uC
	YdpBLwtlWxeCVi2jOh6gyclESam+Ztdj0g0eRKQWZofQ8Om9ttkOocTEhtZI/0+KSrrN/tTx+ud
	6h1T/ia6CMVbrcgeLmDM799jB3JoP5mrDSEdaTWyluilXM/aCi3zL+kFn0EcyXVYWc8I/MDLFxD
	vuqXBGtKUislTAFcywPkdR6439lmfMXSPtyCgl2+8AyiLfxgIFSgV54Z5qk/X/P5k2KkFLFDlPD
	Oqt4DBXoKwBdu80h76gcxC4l7HUiEpvh39sdGpW+uT6O4G8aWYD0IfLcbWXflF59iYwQKieuvkJ
	jUK/u2/nMPrcAqPsh5E0DJZRY1yJOYtj69JmKuO/+REthwGJ7iu4SbrPeQ8wyxSfgFBu9jMxVZi
	EcAH+vx0FgUzTS8U6bksgEgyfS7Gq8mECyvo12gyXTPkIOPTTRLLGLMTguk5iNTDTORvRLCZMKL
	QccPzsqyjSXPTG2qSbSxP0K
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39b2609f363mr47292487a91.2.1788845198985;
        Mon, 07 Sep 2026 22:26:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 03/10] net: broadcom: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:55 +0530
Message-ID: <20260908052602.27497-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm63xx_enet.c         | 2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h         | 2 +-
 drivers/net/ethernet/broadcom/bcmsysport.h           | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h          | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c      | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h      | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c     | 8 ++++----
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c     | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h      | 4 ++--
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 7ef1babfeca6..f6595fdc888d 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1564,7 +1564,7 @@ static int bcm_enet_set_pauseparam(struct net_device *dev,
 
 	if (priv->has_phy) {
 		if (ecmd->autoneg && (ecmd->rx_pause != ecmd->tx_pause)) {
-			/* asymetric pause mode not supported,
+			/* asymmetric pause mode not supported,
 			 * actually possible but integrated PHY has RO
 			 * asym_pause bit */
 			return -EINVAL;
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 78f1830fb3cb..ba8f42cf5fb2 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -265,7 +265,7 @@ struct bcm_enet_priv {
 	/* number of available descriptor for tx */
 	int tx_desc_count;
 
-	/* next tx descriptor avaiable */
+	/* next tx descriptor available */
 	int tx_curr_desc;
 
 	/* next dirty tx descriptor to reclaim */
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.h b/drivers/net/ethernet/broadcom/bcmsysport.h
index a34296f989f1..6f807e96dbd8 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.h
+++ b/drivers/net/ethernet/broadcom/bcmsysport.h
@@ -402,7 +402,7 @@ struct bcm_rsb {
 #define TDMA_DESC_RING_BASE(i)		(TDMA_DESC_RING_00_BASE + \
 					((i) * TDMA_DESC_RING_SIZE))
 
-/* Ring indexed register addreses */
+/* Ring indexed register addresses */
 #define TDMA_DESC_RING_HEAD_TAIL_PTR(i)	(TDMA_DESC_RING_BASE(i) + \
 					RING_HEAD_TAIL_PTR)
 #define TDMA_DESC_RING_COUNT(i)		(TDMA_DESC_RING_BASE(i) + \
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
index 9580ab83d387..28ea4a33f245 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
@@ -280,7 +280,7 @@ enum {
  * (db_msg_sz 1 << 7 * cid + 0x40 DPM offset) it can come up with a valid number
  * We must avoid coming up with cid 8 for iscsi since according to this method
  * the designated UIO cid will come out 0 and it has a special handling for that
- * case which doesn't suit us. Therefore will will cieling to closes cid which
+ * case which doesn't suit us. Therefore will cieling to closes cid which
  * has least signigifcant nibble 8 and if it is 8 we will move forward to 0x18.
  */
 
@@ -666,7 +666,7 @@ struct bnx2x_fastpath {
 				 MAX_TX_DESC_CNT * NEXT_PAGE_TX_DESC_CNT)
 /* max BDs per tx packet w/o next_pages:
  * START_BD		- describes packed
- * START_BD(splitted)	- includes unpaged data segment for GSO
+ * START_BD(split)	- includes unpaged data segment for GSO
  * PARSING_BD		- for TSO and CSUM data
  * PARSING_BD2		- for encapsulation data
  * Frag BDs		- describes pages for frags
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
index 9af81630c8a4..3df8a5988521 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
@@ -1986,7 +1986,7 @@ static void bnx2x_dcbnl_set_pg_tccfg_tx(struct net_device *netdev, int prio,
 		return;
 
 	/**
-	 * bw_pct ignored -	band-width percentage devision between user
+	 * bw_pct ignored -	band-width percentage division between user
 	 *			priorities within the same group is not
 	 *			standard and hence not supported
 	 *
@@ -2038,7 +2038,7 @@ static void bnx2x_dcbnl_get_pg_tccfg_tx(struct net_device *netdev, int prio,
 	DP(BNX2X_MSG_DCB, "prio = %d\n", prio);
 
 	/**
-	 * bw_pct ignored -	band-width percentage devision between user
+	 * bw_pct ignored -	band-width percentage division between user
 	 *			priorities within the same group is not
 	 *			standard and hence not supported
 	 *
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
index 611efee75834..5297ab578a6f 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
@@ -2342,7 +2342,7 @@ struct shmem2_region {
 		u32 oem_i2c_data_addr;
 	};
 
-	/* 9 entires for the C2S PCP map for each inner VLAN PCP + 1 default */
+	/* 9 entries for the C2S PCP map for each inner VLAN PCP + 1 default */
 	/* For PCP values 0-3 use the map lower */
 	/* 0xFF000000 - PCP 0, 0x00FF0000 - PCP 1,
 	 * 0x0000FF00 - PCP 2, 0x000000FF PCP 3
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
index fc7fce642666..b5004aab124d 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
@@ -582,7 +582,7 @@ static void bnx2x_init_pxp_arb(struct bnx2x *bp, int r_order,
 		REG_WR(bp, PXP2_REG_WR_CDU_MPS, val);
 	}
 
-	/* Validate number of tags suppoted by device */
+	/* Validate number of tags supported by device */
 #define PCIE_REG_PCIER_TL_HDR_FC_ST		0x2980
 	val = REG_RD(bp, PCIE_REG_PCIER_TL_HDR_FC_ST);
 	val &= 0xFF;
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index ea310057fe3a..84d002b31920 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -2536,7 +2536,7 @@ static int bnx2x_pbf_update(struct link_params *params, u32 flow_ctrl,
 }
 
 /**
- * bnx2x_get_emac_base - retrive emac base address
+ * bnx2x_get_emac_base - retrieve emac base address
  *
  * @bp:			driver handle
  * @mdc_mdio_access:	access type
@@ -3593,7 +3593,7 @@ static u8 bnx2x_ext_phy_resolve_fc(struct bnx2x_phy *phy,
 	u8 ret = 0;
 	vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 	if (phy->req_flow_ctrl != BNX2X_FLOW_CTRL_AUTO) {
-		/* Update the advertised flow-controled of LD/LP in AN */
+		/* Update the advertised flow-controlled of LD/LP in AN */
 		if (phy->req_line_speed == SPEED_AUTO_NEG)
 			bnx2x_ext_phy_update_adv_fc(phy, params, vars);
 		/* But set the flow-control result as the requested one */
@@ -3743,7 +3743,7 @@ static void bnx2x_warpcore_enable_AN_KR(struct bnx2x_phy *phy,
 		{MDIO_WC_DEVAD, MDIO_WC_REG_CL72_USERB0_CL72_TX_FIR_TAP, 0},
 	};
 	DP(NETIF_MSG_LINK, "Enable Auto Negotiation for KR\n");
-	/* Set to default registers that may be overriden by 10G force */
+	/* Set to default registers that may be overridden by 10G force */
 	for (i = 0; i < ARRAY_SIZE(reg_set); i++)
 		bnx2x_cl45_write(bp, phy, reg_set[i].devad, reg_set[i].reg,
 				 reg_set[i].val);
@@ -5425,7 +5425,7 @@ static void bnx2x_flow_ctrl_resolve(struct bnx2x_phy *phy,
 
 	/* Resolve from gp_status in case of AN complete and not sgmii */
 	if (phy->req_flow_ctrl != BNX2X_FLOW_CTRL_AUTO) {
-		/* Update the advertised flow-controled of LD/LP in AN */
+		/* Update the advertised flow-controlled of LD/LP in AN */
 		if (phy->req_line_speed == SPEED_AUTO_NEG)
 			bnx2x_update_adv_fc(phy, params, vars, gp_status);
 		/* But set the flow-control result as the requested one */
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 39eb6ab5f805..277c7bd9c6e7 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -12669,7 +12669,7 @@ static int bnx2x_set_mc_list(struct bnx2x *bp)
 		if (rc)
 			return rc;
 
-		/* Override the curently configured set of mc filters */
+		/* Override the currently configured set of mc filters */
 		rc = bnx2x_config_mcast(bp, &rparam,
 					BNX2X_MCAST_CMD_SET);
 		if (rc < 0)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
index a018f251d198..30943f347164 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
@@ -2236,7 +2236,7 @@ extern const u32 dmae_reg_go_c[];
 /* [RW 1] Output enable for TX PAUSE signal to the MAC. */
 #define NIG_REG_P0_MAC_PAUSE_OUT_EN				 0x185b4
 /* [RW 32] Eight 4-bit configurations for specifying which COS (0-15 for
- * future expansion) each priorty is to be mapped to. Bits 3:0 specify the
+ * future expansion) each priority is to be mapped to. Bits 3:0 specify the
  * COS for priority 0. Bits 31:28 specify the COS for priority 7. The 3-bit
  * priority field is extracted from the outer-most VLAN in receive packet.
  * Only COS 0 and COS 1 are supported in E2. */
@@ -2434,7 +2434,7 @@ extern const u32 dmae_reg_go_c[];
 /* [RW 1] Output enable for TX PAUSE signal to the MAC. */
 #define NIG_REG_P1_MAC_PAUSE_OUT_EN				 0x185c8
 /* [RW 32] Eight 4-bit configurations for specifying which COS (0-15 for
- * future expansion) each priorty is to be mapped to. Bits 3:0 specify the
+ * future expansion) each priority is to be mapped to. Bits 3:0 specify the
  * COS for priority 0. Bits 31:28 specify the COS for priority 7. The 3-bit
  * priority field is extracted from the outer-most VLAN in receive packet.
  * Only COS 0 and COS 1 are supported in E2. */
-- 
2.48.1

