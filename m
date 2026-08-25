Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31538F654;
	Tue, 25 Aug 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676390; cv=fail; b=PiLuGuL9xQ3PnmP/aKgalpsuELe7j0DYrDANSU9pjL5JLofJW4yN719AcPlCi4SNPcix+ZbL73SN+U+caKDD8pb7aClaHCloHX5O8QE9ernXUvvIMAb51qnDQ20FfJNtjWmTe9padw0jAAf64NF81bx8qWIvqd+e9so9F2aW2tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676390; c=relaxed/simple;
	bh=kSVHRJLBBZRqCDXW7q7iay5fjsC/vrRHi61LOfeioRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jt02f0KeyfYAr2a7Eexr7umvde4/mGdsfRuhmL722aHzKYwXnGx4LN/wESW61DAoABj6cmYvlNbJgIJo5tdWA2N5WWEcGyIxCvqIGm7Y6v37or/hypLHej1P+mWZWOF6AhX01Xs0ko5vpfsdbptNcR7HZY1TSR2bV9LLUjPdtLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bGze9fNg; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bGze9fNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbYSzgnIS3X7zXYoJUWo6WrRf1iH8Xs/EIiViskuLNh0QbrKoEu1O2cfIiZy2dLEYfR8k1ijYGXQE2ZxdBFxwVNfuOwdW3umZtNT2gRRtUA+0yX65QNEG1fbkwtKYTig76cOXvQO2LxOcTHD0MlD1JsUPxTD7Kh+/YS6YpkPzGVgB6trBt+NVz3HKuQc41MjvadV3MZEOYTE2vxfYMHKcNA/VY1q+8DXv1Tztu6j00bNWCEkrnXWXNXs32sXGEd9wtno1HS67dsLiAcu1wxN2gMbeETND/mZggjWOrunLXqwYOWX7xxZnTIZgBvIw/DaW8Sp54SAsFFzLXKUsWo0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05mJRjY1JUUjSpegvBbOPfDw/0kw/pGkSEaFy07e+yU=;
 b=ApzEuo2CPRywj1GUSXmhE8mbloFwfY/G0TdfNnBVGHU/SbdcSrEKGnmIXWkGIakzQjlPDLaUFBQUsDZ3WnZqQRtISZ+ODVH/lS1XXJcoODtWtHi68Toypuo7V6NBh4+NRIhr0jmlKiYFDbrdguOtAWVAyJ9CmrWvt+rkyChgTrDfqyzkuJu1N75n04V5o1yTzZE9pqoXxUWXVTqXlBYYIUNCfGOyF+y5SwwgvFPcYjz4V7hH0eSJS92b1uiM5zAPIWtxaqdhdtJn7kNYGbkPfDSJNZZOWMfSBNuWf7cV/X0iRuT5NagPx1YUrx2kylwe4E7k2Esmb4gJrXdebsNycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05mJRjY1JUUjSpegvBbOPfDw/0kw/pGkSEaFy07e+yU=;
 b=bGze9fNgtVUOFhkzSh1IoYx2oq1ONqBs94k3Xh3wpmBnB94fEjqWJLwOWJgubNAORHjrpHfgMInOsx9h4S/CmNEWEaTOuL7/jvUS1twvzsPyEgJJ2dwxQr+mfaMjbbJBPfVPdCghN1G5Vq68XCPdre+v4req7jl+nkrEp30UcI8=
Received: from TY4P286CA0007.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:26d::16)
 by TY4PR01MB14667.jpnprd01.prod.outlook.com (2603:1096:405:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 16:46:25 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d:cafe::72) by TY4P286CA0007.outlook.office365.com
 (2603:1096:405:26d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 16:46:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 16:46:24 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.185])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 97F1030001CA;
	Wed, 26 Aug 2026 01:46:18 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shuah@kernel.org,
	joabreu@synopsys.com,
	jun.ann.lai@intel.com,
	yi.fang.gan@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v3 3/5] net: stmmac: Disable double VLAN handling on dwmac4
Date: Tue, 25 Aug 2026 16:45:20 +0000
Message-ID: <20260825164522.4244-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|TY4PR01MB14667:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3c21756-f51b-4cd2-3cfe-08df02c86661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|921020|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	pwIa+ib+lXTa74KvaouN8f0/VZpoPTjpA6Cea99+lBcd876FFHWBY/RW0qXXX1l8gaNmYw7kljYU9qCY0HQX8oPVLUqiRFy6zZG6lUOaWjuP9DmfIIBLRDvrphVxjRWuXE3npL6S2zpUS1gDMJ3aAo9zo9eiGa1eAj7tGFzSFMKajaFi8T60ymUQl/9ACrzdCQaoNdkZVHtYVEVy+yKdwFQkutq70vSuW2kQl0DUxcbS5YHxuIfXhfAE1DzBEEmQSa6XPzsf8GsB+CP/XMkmGV1ql8lyhAUFGx7d/E0d49huZk3r/OJiJUC4fgU8fi59UF/sqoOHZV4rFlBAJysOmx/wsJZIOR0THD6W8yrtTJEV3eAXwrZU5ryHES1Er6tKt8tGzMmRl/WQ7GQIGoCBmS/V8KGx/6muQNgSFi1rtTqJkqRj0pHZtkjLfQ7moP4vkUf3dl9dQik0tax8DMhqbxhZd4sLBDRn2aYmyIFpKwwE7O0ASb+zv0W/q8yY9IDAcSuKX3aFbREu5UEUp6zcW1EHkMas6Oc7ze1QKgUaui6nYbuwDiygvC3tG7KuZpWBJhFB9ps8XWscwMWPc5OGDaH/V8K/VsjhLtfNZlqhWsZF4N2g+NO9HoE5sFUkq51AhOx2DmsJ8gsJqOpCKLAaMAyXkg6R30/mCcXltnBUsnT73asvdF3g4vkSKkKBf2paMlQv4BHP0DccpjgsV5+lsuhwU7Oga4BVhsMDnZQyE1sR0/LvxIrmRuqlcFYLjxFf
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(921020)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fj64wJq4HJyTkH88s5jqwFYNgfXp5d2fSclxv3EsY86ejorOFIbJVHih8zye9VEQWRl8ZBecVdYRtzt37Wp2c5ZAuIIMBFTpP4FINMMc0Yza29tPo4XTmvIF1ZnZdqK4mQyN1jLavJUhXij3NC7T1vbnTn/4x0kpXD9zo4B1iDLuoqnXC1W8cO4Qn7da8nKA1r/udChGAKeOD21JcmfF8yrPeag5CI6S+P/m/EfA1RJhT61Ytj2YyrFU0szU+vsSjXBvkbYZkRREmZbtNNvYiPUqm7qqBFWqJLwGinDnJ8JCI/Ls8H/haS6evGknTMtq4xD1Yuy/ao72oLRHF6vHaI1lAAUaQipLrqx4KVsq8hNy8VKC/1/XsyjqcQ7aV7tIwJQaEoIObUVXVg3Rk7vT7fUz86nekyFBy1phTQpjhqMA5Dk51z/w8MtYMdv632Jp
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:46:24.3738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c21756-f51b-4cd2-3cfe-08df02c86661
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14667

Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
than using the actual protocol from the packet. Because of this, packets
that contain a 802.1ad outer tag are incorrectly passed up the stack as
having an 802.1Q tag. This causes QinQ ping between two hosts to fail.

vlan_rx_hw() is shared by dwxgmac2 and dwmac4: on dwxgmac2 the tag type
is available in the RDES3 write-back descriptor (the ET_LT field), so the
outer tag type can be determined based on that info. However, dwmac4
doesn't seem to provide the tag type. The Length/Type field in RDES3 only
indicates whether the packet is single or double-tagged, not which tag
type was stripped.

Since dwmac4 cannot report the stripped tag type, it cannot support
hardware double VLAN stripping correctly. Disable it by dropping
update_dvlan_state from dwmac_vlan_ops. With this, 802.1ad tags are
left in place and handled by the software VLAN path.

Also, restrict the NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER
advertisement to dwxgmac2.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes:
- Rebased after dropping the dma_cap.dvlan patch.

v2 changes:
- Advertised NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only
  for XGMAC (reported by Sashiko).

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c | 1 -
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e79b37fc716c..7b6a506ce4c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7956,14 +7956,18 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
-	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
+	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
+
 	if (dwmac_is_xmac(priv->plat->core_type)) {
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
 	}
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
-		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
+		if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
 	}
 	if (priv->dma_cap.vlins)
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index 1e47ae62093e..9b5b3f11f699 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -273,7 +273,6 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash)
 
 const struct stmmac_vlan_ops dwmac_vlan_ops = {
 	.update_vlan_hash = vlan_update_hash,
-	.update_dvlan_state = vlan_update_dvlan_state,
 	.enable_vlan = vlan_enable,
 	.add_hw_vlan_rx_fltr = vlan_add_hw_rx_fltr,
 	.del_hw_vlan_rx_fltr = vlan_del_hw_rx_fltr,
-- 
2.34.1

