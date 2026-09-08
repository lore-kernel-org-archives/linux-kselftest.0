Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF57583AC5;
	Tue,  8 Sep 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885857; cv=fail; b=enjZUCtba2SuIFLKn1qOj7d/qPe/ODeirwC8cIl+coL8+Lz4CPWQN1QAZ6RvruPb8l+aa17MEcHcV5HzV6PsKjJOM7pCGJoDNQofltwzMjcaQx8LU9pyjgt+0ZI08KxnQ/w9ezHz47gyDHXvcOq/oKp2yZ0IBbYNE0g6NkwZRSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885857; c=relaxed/simple;
	bh=WVrisA8ldkCcq1wkHsc4UG9LaL89lQGqJCkwus+UdSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oS+XOm09rrgU0cmD+HOSg4F8SOK2Lx3SjzTNWpyVxPcm3Ma3dcUPEH9fAHWmhDlOCTj2AgWAMVt/zoK3z6sXfBqcyi/+/DQYz5rQzgg/ZJcjTZE/h/K2lEcMVITl4Tt3BylmjsEj+FuwxQEI0L9otrB193SsBl8qParYujgYz1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DIMnjo+F; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DIMnjo+F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOdGgx1Fmb5qfUDzYzgfba1ei5AIlNW/4TCzadC+D/NoXoDpJvR4kllGSHe2i+p5XKfsLCcfMidYvmgm+vObue+eg5IAE7+rEoiZg6d572lAOQv3NtTF0pmmJkLhkX49V8Ye1yWMksmjoB+8OgeiCzVnZmchV1lj5Ky+mztfXAbxHPV3IS97YgzCudqprHGaikYlHo+324dnkcowys+rVsQ1TC4BeYQTlEL442fDYLvTknwc/pNRAtQA1yYVlIqBagWw4/ieohTUIpKjDgnMvn/7IpFks8MiUEeiJVzTGghA9cE2KcFt73b/eXet4p9JYWaiPl5OF3hU0kA/PvP7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M8TLynPB5paPt1Rc97LWiuVcY02hlRWqntN84IBe7c=;
 b=LZxakMAFjZMWa/RDTKux3xzvNFDg9/Ln4ByF4QNj4CXS/cYTfYGpBfPrXVMxJQ5YBBirqHXcBEe0QIemjpa/1NQ4zSgrf7MQ1sdaiQY5/ShdhPNOXKTZGkcndnLtCLKQhJZUNTN0uvIFa3chAyrhyq5zrANSZ2cApNBsxZWiz94VV/zuD7ImLURtSVhC+R8dd0Cp+xZuWqTcNGRYVMPvOCRiBXcKIieuJW5iVKIA41conAStFv5+Gy96x5V4qgmHoWMAqD6T1pDtcACBbyP8g35GTz6KfZ756lKaodM2tkg84iw+iZIT9Qr+G5Vmszxi7mwoXgDQREnLTiHxsYkBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6M8TLynPB5paPt1Rc97LWiuVcY02hlRWqntN84IBe7c=;
 b=DIMnjo+Fw3g57fagygEU3hb1EtS00bvimweLAqrPsxwTyj0cqGWG8/xnjReRk9ZP15LbIseouAPwQOkO3bxBxr/lfdtnvZnvV5wo6dfy6YtXbPfxZxK9RobLkYMtrKA2OuxZoISEsNjGWcAV3MpDHt/98HdBAq4wTZT7ERrjls4=
Received: from OS7PR01CA0069.jpnprd01.prod.outlook.com (2603:1096:604:253::15)
 by TY7PR01MB14778.jpnprd01.prod.outlook.com (2603:1096:405:256::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 16:44:11 +0000
Received: from OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:253:cafe::ae) by OS7PR01CA0069.outlook.office365.com
 (2603:1096:604:253::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 16:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D213.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:44:09 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 806EF300044D;
	Wed,  9 Sep 2026 01:44:03 +0900 (JST)
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
Subject: [PATCH net v4 5/7] net: stmmac: Disable S-Tag processing on dwmac4
Date: Tue,  8 Sep 2026 16:43:07 +0000
Message-ID: <20260908164309.59282-6-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D213:EE_|TY7PR01MB14778:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 84e77392-f440-40e3-3d68-08df0dc867a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|7416014|1800799024|921020|18002099003|22082099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/1VtCMF37G2QaMlwOuMhUo4RT1obft2C2fh7lsrNATCPnSJNgsFma8iCtDXB3eUxnQVBO0BekISmAqtaE+9lK+OoZiFSs1vZIYrFCFtplhNdOkTHOhkt7kXAIdCwuHHI9LtrKbF1D5RNz4zzGFyEsQcUh3dnBaOJ54ywklx0MtYIDcdFxMkSnkZc8mIa0IP2kr1oxowjM5rtfg1l6D467RzuxnJ+lo6cqjKfQM9hV1ecd/+//AfV055UZE/5225sYPfuLGecJzZOlhMNMk6cHePxTqHXRlGql7RnPDN7ywpg1VEY0vRpUTxc+0av1M6/9lF1nKfVWM2SNjgsWvDuVfiLhZGjAH6SJ31WG4iXh2nFYm9qAgfhnRU3IePBqvdq7MFRYiiqwwtFFfu8C9R0iJxyAT70CjiLRXuEhP15uzBhswwZjtA07gfQLsREobJLrgi+KNSlgzVsNJPVBxRg5WzIjuB2aXk1nRfSmA6XuA3uhfCfKQ8gsBmsoDiNS+hLwiTxd7vG72xD6Dxv0Ktbo1IRI6+1plfsaHOEOptKdcvypHnOSzEky75qtf0Xb0ZCSh/g59rk9RSaeDPuCRtQYm8T3lKQk/fWWC67UNY8TtJBQTEhaWALb96pYrWvkbu6SaGUr0kQ3RNjvj5vcMrnqmV4EDTLCxX+uzRS0wC5RHNNj6CDiyAwG+hDV1Wt3S7g5OglMn0oKpw1bRO54WdIxDVY7R1EHrQRTGZnSL0ABwPRynQiZvsOYVrYkwMqElax
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(7416014)(1800799024)(921020)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1aSsMjnwYA1qZDhEbsPrjKVeE2Ka41RFg/CzDHUdwNQd9p5aSPukNbY4bZaMHz86VwJyD9Ur8lPZLaZooysMzutXiht58SwfGNY2xB3swSYd8xGz3QC7SfhtecgTQ9xAJ57pdC5LkjedWkgbc2TmhjRYcrwGPAXoscauiss6e54WXZI/aynqz9uzZiFkeyn3peuF8KGo5gHyIQztPu6BvCmnjCA253riW++FQWQPPllncPdWawb/Sqj6B6+4i50usOzJQyzHUFnGWyZPokaoybEPHEjz+q+8bPYUH8Y60gVhexFMyVyJQ6xrPOsp5Q0x5v5zSNljnMeMIxxp5ZuNimdz3YSHqkdiDA9FC9J0WlSOgLV+du5r54/vFrDFDAnUgeuhw/Y4FmVn7mj9Vc6u74w/T596/QUzCrvoL0pHQzIGDxvdADs5DflSbPV1EaME
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:44:09.2828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e77392-f440-40e3-3d68-08df0dc867a6
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D213.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14778

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
hardware S-Tag stripping correctly. Therefore, restrict the
NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER advertisement
to dwxgmac2 only.

With this, 802.1ad tags are left in place and handled by the software
VLAN path.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- Dropped all "double VLAN" references from the commit title/message.
- Rebased on top of the S-VLAN rework.

v3 changes:
- Rebased after dropping the dma_cap.dvlan patch.

v2 changes:
- Advertised NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only
  for XGMAC (reported by Sashiko).

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c81c5bb5b075..eab2903a66e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7952,15 +7952,20 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
-	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
-	priv->hw->hw_svlan_en = true;
+	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
+		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
+		priv->hw->hw_svlan_en = true;
+	}
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
-- 
2.34.1

