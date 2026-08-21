Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ACE37E2ED;
	Fri, 21 Aug 2026 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332228; cv=fail; b=NOKYJ8umh/lLu+DsITqO+RPsplqWMait1Pxa0dqcxuiHKNvHYU2XUjoR0IfGFmh7jrYgYRDM5zChlUa+PSS6g4aw8V98fKSUHtsT63I8wipvhKJ1o8Slq55qWLlhcqPlj8mc8+be6PMe3RmOnInD1lrLiAUUfS91gzYkErYkAKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332228; c=relaxed/simple;
	bh=Hg4qnFTHK9c3FimcsHm+ggp1BuAsUjpvVSL0OX9TkN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uX06/oydFG8y4ieTIRofVsL+CvWIy5b8LAaoaivu3WaFNNzWrYBblwUX1KzLdnPo1isBtGnFy5/XMgMat8qZZ4FOoAYqYWPOA0SKXt0m2uZa+csqmPn+7bOVrTuozfBcsqA8x0+P00V0W4c977GyPDH/ZdzJcmZJoJsYEp1ROkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FzYGAdk+; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FzYGAdk+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDwXUsyKc3YmCT6pKSakL4bQFPDRNqrCH6F789fP1eXqboC2QFsppg9Xi5DWvtS1Wee0/4gy8R6NyXKxWoDb3FZv54GooIQrzGYgsAbq6IwzrQG3LqyPE8bNsYVf+h3YLLr7jUi27ob/czLB/Wdplmd6U8IVatXnNBmc9bv/GzwtAdRQuddX0yAXLa+GtRu3eZsNsH/3YRir8Eq5PbA+DEZWEsP8rcHMXxqfqkRidrWbJHkQpG8qNpHEvEcTTCTFJt6LCvtjoNx9sWkJ3QtpG0QOMtFtubY4na8VaQmL5Vq+mSFFVqHqodkhyhqQr1w2uwXzYEq46DWzKbn+qGKTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KqBjQAidHmiDJ87jWuhNMIDKoC/A6M8dQ922yheld4=;
 b=E89boLcBCZ+uMMe5Ku/2jPaWz2UBs72sGFgCDCKFqszrSbPFCimkPCMGkIsrCVC7OVreczSdfZDqFNbmfr/IQ6P4saqh0ViBz22u6QU0PrE9p6BapYu9wCaZ/RGAJBVb9r8vt3n0jWE2VNThehGAlaxOIEjt1eNzKwvUSpkoktrZFoq5sUWWdxRrd3iVc5roAfTBMKnqQMgfIRhpptvRrapyqBKv1V7GM1Erd6gEopV1W8BXSyx+j29F5XzRgnqgmIympSoF/B0t1T29vt7BzyCe5SzERreZhHoWWqGMWbCwClN16oTjA2VulTCIH9GqDJgqATE90WdocTo5zdgERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KqBjQAidHmiDJ87jWuhNMIDKoC/A6M8dQ922yheld4=;
 b=FzYGAdk+HJZRi4x23o6zudr52ONyUNhBVG7bZ8Kq1+HObmLDJDOLGrl36whMvrYtOBEjBxrMjphRq07vkOkLBZBEOk4tHPkDFPi2hBCF/EFZ22ACSB0t+l8sWKS5Ni2ORuGKs0AAZexwXz6Z9mI75mT8T9+/axeZ9BGakm5NMcs=
Received: from TY4P286CA0108.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:380::14)
 by TYCPR01MB18482.jpnprd01.prod.outlook.com (2603:1096:405:390::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:22 +0000
Received: from TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380:cafe::a1) by TY4P286CA0108.outlook.office365.com
 (2603:1096:405:380::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005025.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:20 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 4248830001F5;
	Sat, 22 Aug 2026 02:10:14 +0900 (JST)
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
	yi.fang.gan@intel.com,
	jun.ann.lai@intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing only when supported
Date: Fri, 21 Aug 2026 17:09:55 +0000
Message-ID: <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005025:EE_|TYCPR01MB18482:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d60c18cd-d881-4742-9b6e-08deffa714e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|23010399003|376014|22082099003|18002099003|11063799006|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	rkHJ5p7BJ6jzhg75w3cDbQQCJvR5a3ZBBJz4JoThBx+/V4FyWwhZ8Jv1sCjmyMz5mN5jIiHPg9yrcFRfTf9rYeBwPi/AgF7VBjF7lzGsD/OrQwqZB8qxD5MC4x1i+Scb/J03hPExn/aIQQiER2PvgYcVDZ5VjqTNst29moWqbKVRqAyobcR337BfGubg8lVhhURfTkVD9e0jDv3HUCzk9ijUXmk3si5b1kgK0r94zeIFU5CQ7i99VGSHoaBBdgUl+xq+YoW8iSnMpPd/AhvivWuarf/bqpPREowP3lc0YPtJQe5lV7SaBGRCNEoyYjtHGOm9epbbLG6YnSipeARNfvcHZHi3FsszQ84IqVgO/E4K2dgqrEkDz0uaB7lu/HQRZ788+Ewu4YUgq7JNp5X1KK8x6oKO7gt9YwkNp2VAXAaTaziXEWn7/NrBmNNXjRIuu/zPReyQXeKpiDuMe9I9utWoqtljrbY5CsOvyj/1CDzW5pz6HnjYZ/T6nBLdvRv97MJN8TqO/yt+sT38aAXFXcRciV1vM5OqgZjMZ65uBmF9TuymtnGLyBa42zlQqnBfGaymtGvn3Gw/pbSPNS2SPYcJeiXIlr/xjIL3QK4ACQ9COQiq/QrkB86T2JnQJDGB2GiTHKgyf1viBSvMut86jD0o/HUGIXOk/nzEp/rcs2yM/czPyj3UP2mKMCMxnoImts6txFIeyxNvmGFtepoj/NUmGlO2MghKE+2G481leptn3gaLF68hX6f5Pkjnivig
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zWvFYW95u5UxNebtyy367hLrjMgl+B5KafOl5QYHl6rxSDrCLlDfY0ne6ajwdXP9nhzV1JctcOfVLs3vjpZ8yCCNBM2BMbHQbKuue7nWTFXWTtldELSYg6qlNY3dmmwoGr7H+StfD9UC5iBk5wcoJeWpQHasNZMF+qHhTcXu8KibLcX7z9ote6uRVfTrS57lw3ZtHwjsXKUkBzisJTgK1DX951pU950iAQZXeAISa6sqmkcZ/jLQNkvbRbTWiV5Cj/Jw595smbD518XasU+qBlO7IAYuC4gs7yDtbhYePih0IdbO7eMMlzbqClUXxRolfqwqkkXU0MKcRmQ0LKM9kweQqAtFqXKwSPdDc95lb3BPA5uJjURv6crSdAVjEBgjUpCY73QSpfDtpkiEGD/ubd2gxbvb+l/AbJPA3cCieQOTBJ/lUeLonxfFrnlp1oSh
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:20.7833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60c18cd-d881-4742-9b6e-08deffa714e4
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18482

stmmac_vlan_update() turns on double/S-VLAN processing whenever an
802.1ad VLAN is registered, without checking whether the MAC actually
supports double VLAN processing. That capability is reported in
dma_cap.dvlan.

This was found while investigating a separate bug in the double VLAN RX
stripping path. The outer 802.1ad tags were unexpectedly stripped by the
MAC (because the ESVL bit was set).

Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that double
VLAN processing is enabled only on supported hardware. Also, advertise
NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only when
dma_cap.dvlan is set.

Fixes: 3cd1cfcba26e ("net: stmmac: Implement VLAN Hash Filtering in XGMAC")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes:
- Advertised NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only
  when dma_cap.dvlan is set (reported by Sashiko).

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16fe56a1f617..880cf3fab913 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6820,6 +6820,9 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 	if (!netif_running(priv->dev))
 		return 0;
 
+	if (!priv->dma_cap.dvlan)
+		is_double = false;
+
 	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
 }
 
@@ -7954,14 +7957,18 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
-	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX;
+	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
+	if (priv->dma_cap.dvlan)
+		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
+
 	if (dwmac_is_xmac(priv->plat->core_type)) {
 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
 		priv->hw->hw_vlan_en = true;
 	}
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
-		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
+		if (priv->dma_cap.dvlan)
+			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
 	}
 	if (priv->dma_cap.vlins)
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_TX;
-- 
2.34.1

