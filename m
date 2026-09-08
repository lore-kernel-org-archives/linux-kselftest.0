Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EC45803B3;
	Tue,  8 Sep 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885847; cv=fail; b=iIBkIsVNv4cPosrxc0W8QY0+Qt3ev/MdCp/QBWjMdCDIcQ/TyCwp6Xf3/F6e6gq/rY7GB/pHXtbwuCedEdlFp+94Fkht0JhydFPdbMHLc1o1P3+hi3A4P1B1tXLdMl/axhf10t9GJ9Nzk9S7h9BXvYR1aRjceSvOEYG+hfFq1u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885847; c=relaxed/simple;
	bh=ylXYyGFl1LTRzsBzz+hrNzFxqq+epmw/QYT5qytw/F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZKXvdX2s6cbp9tCBYdugblFoekTIjyLixOWcitOY+1iW6cRzQfQ2ueOXCufDAINTSPs2X9phaPDw/GVEK3/GrpnqJL70pYj8kES1ldCPK3wRCnvql2olya6HlB97WL0+CH7iseQGNk3NZv/F9x/K5wxCZMkc87qqtEhu15mOMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Jqjw+6LU; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Jqjw+6LU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzbrfZFeaVUBM7T4ogCeuEcx3Uky3CageHKv9DJWVDvO9jbVGJXiJu65fqOs29i8QiTB/ssdv9oyyJcAwZo5DDzi1aXwxMH0ZujaSqT8QBYfpx9tettqDMklnF/ZC7mM8Z3h/ExYf0ji22SuWMeUz3dr1zTdZHR+pmy21BknaKHxhRnortunzrncAbXGza3BsCQrxiEGqtDb3ASxWu48IoUa47k1WR5B1qtKSTIZqLUMxYCZGBim/WzJ7aIU62xWP8O8W4tWfia89iMZm5yBjLNN52ZHZNR95lhhKB62ktMDsGH09zXzJi5k7Ue0m1wberblO4JWoT3xunOy6t83dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKOcdk4qfPRMVDojHfBBJvOqIpO6BscH97bq+M+iybg=;
 b=mA/6B2wW3dYxZfBWx4MkFtbq5E4O5sjk9/ilXTvEM/m0GWgeW3/3rAjnREjnkC1lI3IQGPEIFVzZ03faPCb6awyoPZBrH77w6S+4FF7lC910U3p0gsyhf3ZgZgb016kU72IOlhzbtV4lpZO02kxtOzDAhiLXLMJrtQF/DtnzXnWD3MfjLcHvvIqbF+28oZ2k3fWA07VGQjqrpWfQIEw1woyjvGPgpuQwn3BY38HpeE6heFvMDMhZOk2JUnj3sLDSyNRkZbpQppinss1HyHn6zGqHmb8Nn6vjdEnYg2gL0xMXi8NqcJ0v4pyqBoOIPFsa/qhz8XBQ2s/L+7abhP6Qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKOcdk4qfPRMVDojHfBBJvOqIpO6BscH97bq+M+iybg=;
 b=Jqjw+6LUwLwX8Mp4+DuM/OKAheXWdZaOIG/PMegC1GDenRcfeXm0TXqcOhrbl25irae0ZP6uXE+wK1MlzL6AGkIAtY/SqBJr48qTYMG2EJwhdhJjXL2cQAz/pEYEzJP2tfGtJ+RnhG77MdoTP+tdnij00Twmj9gPBYWFZzgtBhA=
Received: from TYCP286CA0015.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:26c::19)
 by OS7PR01MB14821.jpnprd01.prod.outlook.com (2603:1096:604:39b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 16:43:59 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c:cafe::5) by TYCP286CA0015.outlook.office365.com
 (2603:1096:400:26c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 16:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:43:56 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 2802B300044D;
	Wed,  9 Sep 2026 01:43:50 +0900 (JST)
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
Subject: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Date: Tue,  8 Sep 2026 16:43:05 +0000
Message-ID: <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|OS7PR01MB14821:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4928c1dd-4af5-4495-7300-08df0dc8603d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|56012099006|11063799006|5023799004|10067099003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XtQdkqDh+Kopc8/o//2ig7LuiXu3RCS6qHllgT9FEZIxSsxVPx7MZFSNUDiaLPR7Lh2LWb5uneMc0PQ68w6hV0LpSkIViqQgOUg6HhPBO5DBarH45kTQwUygN/oFILJgG3TONLlRdnotWPqiWiJEobkMHc3SSC4JMSpC37xiEq6EOse6z0+G4MCWRsJvvWkh7Mae/dgUJwMjKLyyXNcL0jFNy1LprfYrl00tcu6hue4UHDcUTVrRWExU/Z9uUgeHSc+gOsm3IEAkBqlv8PA0vWDXCyHJQ1XopaDHluZHsHKty3CZPjhSIxZQBhCg6bA6CN+alrGgiDUygvq3DVel/ie3FyL9x68d+TUTFvutU3brOeKqFJV2AjZW46bdJnIAPpl3o22MXmIGKZk1pmNayVT78B5TCksjNHo5uv3GMHSkC3+P+L9wPrit78JU8ONDQiW+Oi61hXsIstg7yxvfG7m5LZwt+qyFngcOiHiKfiH5QI1omQrfT3N1+1OAau7BVdHH1Zy7mM0MWwbJMZx66cvWSDABFx3srMCxFxOyzdb5NJrxFgeUi/iFu7EYYs+VlC+3d/rfLtWQADpOKEI8MC3OOL+SXTm6R5HomFjTrfQyX/kmfSHHFtxY+LANyrZo2w16lWJ7qu+3ipl8u4TDkliryqNhKtpi+kmtBXMQXWNQp5Re9GmBC5n6FnCTCkg7oC8B6Kxx0IGjqBdpEPeDFLrs+i1m7tsH4/vkfDssOKh2mV5uxHoHnDzQkdkW4mPq
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(56012099006)(11063799006)(5023799004)(10067099003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4jPyQXQgyKrZlJzZV4OEoZ+EZOqa6LTSbb+/pHfhL66Jrsp70omZeKm/i8G/xgtBru1S7zPEjuAuldfoySvfkgLbLSxLWNpZDzZE82Nd/YMsEgl3RBH3sol2VBS3YpkgTbZQ2iplG917dD+6qlHlyu/8ctYrazkFSCImlgefl1JzQRcqkG+/1Ead68gHvXPAOI09HGr7GG9PzEOyMZ4POT3TFF3v8fZHc80zOGITRK7jayj3ELD1QPmdI65fjdVjEVhgzy0M0jgcOpBxh1l3aEcWsqhIbfF4JzuhrW571TVGASXeFbCtK5To5pjbzBk4VcPcaFGt8sVGqqjZkpjPPMFAjkxSufQWE6hjE7lCfi2Bi+XJLDPDwmhmmZD7wrKoccjQgXt6zjG0xlfKIEeaN/PT8hlKLL0T48RrDaj1SoOAA5BuaIxHXje/MhRA43/u
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:43:56.8664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4928c1dd-4af5-4495-7300-08df0dc8603d
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14821

The ESVL and DOVLTC bits control S-VLAN tag processing and have
nothing to do with the double VLAN feature, which only provides a way
to process an additional inner VLAN tag. However, the driver code
that handles them always refers to "double VLAN", which is unrelated
and makes the implementation confusing. The driver does not use any
of the inner VLAN tag features, and the networking core does not
support offloads for the inner tag anyway.

To simplify the logic and to reduce the confusion regarding S-Tag vs
double VLAN handling, drop the is_double logic and add a hw_svlan_en
flag that is set when S-Tag hardware handling is enabled.

Suggested-by: Joseph Steel <recv.jo@gmail.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- New patch.

 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 31 ++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c | 42 ++++++++-----------
 5 files changed, 28 insertions(+), 50 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 927ea6230073..1dd4fc7e7a96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -634,6 +634,7 @@ struct mac_device_info {
 	bool vlan_fail_q_en;
 	u8 vlan_fail_q;
 	bool hw_vlan_en;
+	bool hw_svlan_en;
 	bool reverse_sgmii_enable;
 
 	/* This spinlock protects read-modify-write of the interrupt
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 6f26dbf95ce1..bfd68f8460c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -632,8 +632,7 @@ struct stmmac_est_ops {
 
 struct stmmac_vlan_ops {
 	/* VLAN */
-	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
-				 bool is_double);
+	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash);
 	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
 	void (*rx_hw_vlan)(struct mac_device_info *hw, struct dma_desc *rx_desc,
 			   struct sk_buff *skb);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..7520bdcb7c6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -344,7 +344,6 @@ struct stmmac_priv {
 	void __iomem *ptpaddr;
 	void __iomem *estaddr;
 	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
-	unsigned int num_double_vlans;
 	int sfty_irq;
 	struct stmmac_msi *msi;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24d64cce1d87..cd9671493b41 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6813,7 +6813,7 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 	return crc;
 }
 
-static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
+static int stmmac_vlan_update(struct stmmac_priv *priv)
 {
 	u32 crc, hash = 0;
 	u16 vid = 0;
@@ -6827,7 +6827,7 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 	if (!netif_running(priv->dev))
 		return 0;
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
+	return stmmac_update_vlan_hash(priv, priv->hw, hash);
 }
 
 /* FIXME: This may need RXC to be running, but it may be called with BH
@@ -6836,20 +6836,14 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	unsigned int num_double_vlans;
-	bool is_double = false;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	if (be16_to_cpu(proto) == ETH_P_8021AD)
-		is_double = true;
-
 	set_bit(vid, priv->active_vlans);
-	num_double_vlans = priv->num_double_vlans + is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans);
+	ret = stmmac_vlan_update(priv);
 	if (ret) {
 		clear_bit(vid, priv->active_vlans);
 		goto err_pm_put;
@@ -6859,13 +6853,11 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 		ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret) {
 			clear_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans);
+			stmmac_vlan_update(priv);
 			goto err_pm_put;
 		}
 	}
 
-	priv->num_double_vlans = num_double_vlans;
-
 err_pm_put:
 	pm_runtime_put(priv->device);
 
@@ -6878,20 +6870,14 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vid)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	unsigned int num_double_vlans;
-	bool is_double = false;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	if (be16_to_cpu(proto) == ETH_P_8021AD)
-		is_double = true;
-
 	clear_bit(vid, priv->active_vlans);
-	num_double_vlans = priv->num_double_vlans - is_double;
-	ret = stmmac_vlan_update(priv, num_double_vlans);
+	ret = stmmac_vlan_update(priv);
 	if (ret) {
 		set_bit(vid, priv->active_vlans);
 		goto del_vlan_error;
@@ -6901,13 +6887,11 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 		ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
 		if (ret) {
 			set_bit(vid, priv->active_vlans);
-			stmmac_vlan_update(priv, priv->num_double_vlans);
+			stmmac_vlan_update(priv);
 			goto del_vlan_error;
 		}
 	}
 
-	priv->num_double_vlans = num_double_vlans;
-
 del_vlan_error:
 	pm_runtime_put(priv->device);
 
@@ -6922,7 +6906,7 @@ static void stmmac_vlan_restore(struct stmmac_priv *priv)
 	if (priv->hw->num_vlan)
 		stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
 
-	stmmac_vlan_update(priv, priv->num_double_vlans);
+	stmmac_vlan_update(priv);
 }
 
 static int stmmac_bpf(struct net_device *dev, struct netdev_bpf *bpf)
@@ -7962,6 +7946,7 @@ static int __stmmac_dvr_probe(struct device *device,
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
 	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
+	priv->hw->hw_svlan_en = true;
 	if (dwmac_is_xmac(priv->plat->core_type)) {
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 200b34588c7f..fbb99b70ac27 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -161,8 +161,7 @@ static void vlan_restore_hw_rx_fltr(struct net_device *dev,
 		vlan_write_filter(dev, hw, i, hw->vlan_filter[i]);
 }
 
-static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
-			     bool is_double)
+static void vlan_update_hash(struct mac_device_info *hw, u32 hash)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
@@ -173,18 +172,9 @@ static void vlan_update_hash(struct mac_device_info *hw, u32 hash,
 
 	if (hash) {
 		value |= VLAN_VTHM | VLAN_ETV;
-		if (is_double) {
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
-
 		writel(value, ioaddr + VLAN_TAG);
 	} else {
-		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
-		value &= ~VLAN_DOVLTC;
+		value &= ~(VLAN_VTHM | VLAN_ETV);
 		value &= ~VLAN_VID;
 
 		writel(value, ioaddr + VLAN_TAG);
@@ -220,6 +210,12 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 	u32 value = readl(ioaddr + VLAN_TAG);
 
 	value |= VLAN_EDVLP;
+
+	if (hw->hw_svlan_en)
+		value |= VLAN_ESVL | VLAN_DOVLTC;
+	else
+		value &= ~(VLAN_ESVL | VLAN_DOVLTC);
+
 	value &= ~VLAN_TAG_CTRL_EVLS_MASK;
 
 	if (hw->hw_vlan_en)
@@ -234,8 +230,7 @@ static void vlan_set_hw_mode(struct mac_device_info *hw)
 	writel(value, ioaddr + VLAN_TAG);
 }
 
-static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
-				      bool is_double)
+static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash)
 {
 	void __iomem *ioaddr = hw->pcsr;
 
@@ -251,13 +246,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 		value = readl(ioaddr + VLAN_TAG);
 
 		value |= VLAN_VTHM | VLAN_ETV;
-		if (is_double) {
-			value |= VLAN_ESVL;
-			value |= VLAN_DOVLTC;
-		} else {
-			value &= ~VLAN_ESVL;
-			value &= ~VLAN_DOVLTC;
-		}
 
 		value &= ~VLAN_VID;
 		writel(value, ioaddr + VLAN_TAG);
@@ -270,8 +258,7 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value = readl(ioaddr + VLAN_TAG);
 
-		value &= ~(VLAN_VTHM | VLAN_ETV | VLAN_ESVL);
-		value &= ~VLAN_DOVLTC;
+		value &= ~(VLAN_VTHM | VLAN_ETV);
 		value &= ~VLAN_VID;
 
 		writel(value, ioaddr + VLAN_TAG);
@@ -283,7 +270,14 @@ static void dwxlgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + VLAN_TAG);
 
-	writel(value | VLAN_EDVLP, ioaddr + VLAN_TAG);
+	value |= VLAN_EDVLP;
+
+	if (hw->hw_svlan_en)
+		value |= VLAN_ESVL | VLAN_DOVLTC;
+	else
+		value &= ~(VLAN_ESVL | VLAN_DOVLTC);
+
+	writel(value, ioaddr + VLAN_TAG);
 }
 
 const struct stmmac_vlan_ops dwmac_vlan_ops = {
-- 
2.34.1

