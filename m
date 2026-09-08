Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD858495C;
	Tue,  8 Sep 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885833; cv=fail; b=SaooXBoObGNAx1BdG7YKtNQM69OLiA2AokeEKxvjVyUcxm/kG0UL9wZvDOmuq+Y8VNg01RXJWpngVV/IWCDIIyO6OYkXwfzg2AoR6dd5p5VZ1WEE00PdVal6QVLwUmi3JBgWqDEehSc8HtFkTVLGbFCd6eKKgK4By6OZPfDZtTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885833; c=relaxed/simple;
	bh=2DUR8jEJOa0J9Y0sP3MP9mucpDsOQMeNYOenPUD74Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIEZD/MVO0bP11FuLNgMU2bVGAfuKURzbhN9NKGLY6UYvhIaAwi861P/YMZUX4nq28/KYAkGYhRTPxnJNADTMG7u6JEp5cf4QcmS9ExuqOuOQy+RSozMfh+VAMiHH46Of/KkSrx2F9nhFrp+wc9MLTfwDSXE6MqeTTWTAhOpTKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FHGPD+gX; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FHGPD+gX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxZEwUXgLNXrQEdqsgj+1RtR56U6dKND7Lf9tl45sc/Rlh9xtvPSWNg6IRh9c7YvJWJULnNjQ0R/S62XwA8KyyC7FL78vv3BCle7RAKUK+BkjjK3m35n++XLWU9UXLKSeaO3hh+4WNfdV/btKh/syj2t1vfbq+WmRNLfsC2a+3GDDePDlOJN2/KTcV4kwhtAQaKekGT34ryZ4gf9ebRcQagH3TTZ3geRc0n/OPYCbbyUX0BJmHbKtwwGPxF9G93zSUiymDs4LBdsgIm5PGBSy+Pbw+ZsfBR9B8PqB5h+1zxCmPzOa9/SWVbDahIldJEnV3WEn9U3zy4Y1HT0r2ZXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aSXtDt9EoSHV9oqRxmAEQ6s/2hllLlhJ9iHM9G143k=;
 b=AuW12w6I44TD/JNUX5UQ/hYR4l4pVSPg8NRnMWnW/NEcbi7tvtpB+Xea5Lfma+5++cRPwt6F0Onjj6/vHeyIA2zyZThp6S+igt1p1AEmNls1pVPts6c9MdwJa4ofxEUZLeQfi7ZtB4XMOm8PJ33jiO41sWlnLhknuI6cFWeqSAtFrV1PCJm1FWhVViMRuKc/+qDIef/VI+wETl4fGEyHdnnSpFPIN/FXsE6wv3xo0IW5JP9DEG2vPhkdWzIFA5gPvYoiZ+GTnK+ny3YslrToFhBIOhB4zxXfthul9d4lQs/NJoric4dmBWcJMO7BGCU3Zjl7rdbwHsEYYhKz5NRJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aSXtDt9EoSHV9oqRxmAEQ6s/2hllLlhJ9iHM9G143k=;
 b=FHGPD+gXZvKo/bI9Ixct/WbPKXOdwQ8kaj/KwsHQoCHQ55OZWVM4gf1y8PXJAaOwS88aEUHo3IAsq1XOvEK4ZmNZWjUmYJ5M601kH/D3+dNZaOC+HSnF3Ki0sJbgMIPOHXF8T+efI5s35NB6b009s4zow5xjqhEGNsiaq+lUTVo=
Received: from TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7d::6) by
 TYWPR01MB9308.jpnprd01.prod.outlook.com (2603:1096:400:1a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 16:43:45 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7d:cafe::9) by TYCP301CA0061.outlook.office365.com
 (2603:1096:405:7d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 16:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:43:44 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id C2FBB300044D;
	Wed,  9 Sep 2026 01:43:38 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	recv.jo@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v4 1/7] net: stmmac: Remove VLAN perfect matching dead code
Date: Tue,  8 Sep 2026 16:43:03 +0000
Message-ID: <20260908164309.59282-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|TYWPR01MB9308:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6d5dc80c-cd37-4225-c245-08df0dc858dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|82310400026|1800799024|36860700016|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5PUiuMIwCRA5qjqurf4YmfD8Qvy7aRMt3kXhgqk4Xpj7zCl2MYFuXoJlyDi9mZ+7Bv9+VzYCgfN1KVUA/R9c10u3KVHk4EZnrrBAV0Xv2PJ9EI7hZGQ+gwrr957RviyVOoQi0yuEDRlIM6hVZveOHhiCNqRXb+FkRmnkiuBmzUn0LYACbpR95KxrOxjx3bbBMvdzlwnJzwaLkocTRF19uyuhsXb5i3VAbpV21yAuku5FpSc7QPh7ycMxvzhKrr913JLDaSFGIoy5rW1JNR+1FFf2TvQxGZXDqnaTyZ43nrHHTIelo9ZCvAGpUAfy/1XXcp1U0cdgFDNuqeMnXXpJ7TjwNpYnet5KrA3iJKO9AwVrlWqGMCHNbJK5bod+HtNGwJYBRW3wsMHjF8eudeYf6KAsLVCLhz5koL6nJ3tnNgPAVQfGzZEq7jm545lET8/K8fU9RNmacBgdVU2cCQ9sXsQ3aPnCcKsQMtH+HfQg+0x2fo6h01iHg6K4sz/ljEiPYTX+df3V0iK5uOF/gOXmC+4YYOXjWFYXjstelE7Pe9gzfTYLfGcHfoJTp6l6tQctiulb9binGSTwGcbJGKEp0sg8WaeCrWul3teInjfevo5+dNaDPm/FemNVJ50XhrucD+b8ntUgwS5bJuTvaq56EOkqAkactoz/vMMhwxDG5vpWX8DuNKL6x6CezyNWt9wQGWH0OOWcxKFyJTliHbGEmAtUn1snADhm93lYv2Nu6Wsg9u/po7jQnEDgjc/FAy/K
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cgtqEOKBJwMku86xiT+OPv1uUhj4k+6WZzBRLjzMcSTcFVIBTMt6HhS9+VTftxRq0WcX/sVlm8epxniIzNZO/bbQ/AoIdx53UK/bB1kcCrhdEQe22iluz38dy0KaHCIkLkW7PI0WPO4hsM7lsRRLTGPUVvWLa2+OoWO6NQgPU4uzsm90k/arjYyhwUdJaVm94IKqy66vtgtmNpy6Qacfr2xgNQPyFZdsxlARTrvUiRRYK9h8miVJztQIlXlHVWclcFzcId7hp9Aw9COYHfl3qL4U4uEbRnwQigLLkRsuENeAEy6jbWOI1QIY5bGqbY+5tdQ0dYnlSWgD6QdqNttiZXIF866Hm3NtpVOTNhmc7HZflYwrFTHMBGUHizKcuUIXoP/37evGB74QTH01fqaSI/z6N+CQiS0B2vmD4wAS1EM6pumWMA7MHUTo+hpw2mtc
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:43:44.4890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5dc80c-cd37-4225-c245-08df0dc858dc
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9308

stmmac_vlan_update() falls back to "perfect matching" when the VLAN hash
filter is unavailable (!priv->dma_cap.vlhash). This fallback has been
unreachable in normal operation since its introduction in
commit c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if
HASH is not available") because the NETIF_F_HW_VLAN_{CTAG,STAG}_FILTER
features are advertised only when priv->dma_cap.vlhash is true.

The fallback is also duplicating the code in vlan_add_hw_rx_fltr(), which
is always available since stmmac_get_num_vlan() returns at least 1.

Therefore, remove it.

Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v4 changes: None.

v3 changes:
- Added "Reviewed-by" tag from Maxime.

v2 changes: None.

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 41 +------------------
 3 files changed, 4 insertions(+), 52 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 04dafec021b4..6f26dbf95ce1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -633,7 +633,7 @@ struct stmmac_est_ops {
 struct stmmac_vlan_ops {
 	/* VLAN */
 	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
-				 u16 perfect_match, bool is_double);
+				 bool is_double);
 	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
 	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
 			   struct sk_buff *skb);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24656b35350b..24d64cce1d87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6816,29 +6816,18 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 {
 	u32 crc, hash = 0;
-	u16 pmatch = 0;
-	int count = 0;
 	u16 vid = 0;
 
 	for_each_set_bit(vid, priv->active_vlans, VLAN_N_VID) {
 		__le16 vid_le = cpu_to_le16(vid);
 		crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
 		hash |= (1 << crc);
-		count++;
-	}
-
-	if (!priv->dma_cap.vlhash) {
-		if (count > 2) /* VID = 0 always passes filter */
-			return -EOPNOTSUPP;
-
-		pmatch = vid;
-		hash = 0;
 	}
 
 	if (!netif_running(priv->dev))
 		return 0;
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, pmatch, is_double);
+	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
 }
 
 /* FIXME: This may need RXC to be running, but it may be called with BH
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index e24efe3bfedb..983a90cb9767 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -162,7 +162,7 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 }
 
 static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
-			     u16 perfect_match, bool is_double)
+			     bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
@@ -184,20 +184,6 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 		}
 
 		writel(value, ioaddr + VLAN_TAG);
-	} else if (perfect_match) {
-		u32 value = VLAN_ETV;
-
-		if (is_double) {
-			value |= VLAN_EDVLP;
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_EDVLP;
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
-
-		writel(value | perfect_match, ioaddr + VLAN_TAG);
 	} else {
 		value &= ~(VLAN_VTHM | VLAN_ETV);
 		value &= ~(VLAN_EDVLP | VLAN_ESVL);
@@ -251,7 +237,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 }
 
 static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
-				      u16 perfect_match, bool is_double)
+				      bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
 
@@ -279,29 +265,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value &= ~VLAN_VID;
 		writel(value, ioaddr + VLAN_TAG);
-	} else if (perfect_match) {
-		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
-
-		value |= XGMAC_FILTER_VTFE;
-
-		writel(value, ioaddr + XGMAC_PACKET_FILTER);
-
-		value = readl(ioaddr + VLAN_TAG);
-
-		value &= ~VLAN_VTHM;
-		value |= VLAN_ETV;
-		if (is_double) {
-			value |= VLAN_EDVLP;
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_EDVLP;
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
-
-		value &= ~VLAN_VID;
-		writel(value | perfect_match, ioaddr + VLAN_TAG);
 	} else {
 		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
 
-- 
2.34.1

