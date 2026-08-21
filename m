Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FAC381B15;
	Fri, 21 Aug 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332240; cv=fail; b=na1kDl2LHSr6h9bCuHspmQx1L8JZue8sFEPq+BJuWW6citopsGn0s0d5ZJ93hSG3iIipRpd1ub4XSkpWNp1tZFUe7BrPTG02/pWfyDIqM2kwVZEtoW0ny5eA8367clXmHOVEoFx14npfaNKq2gZMgQLX5jCdqXnbOsfN7k3iyYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332240; c=relaxed/simple;
	bh=/DhvZMMRsOg0m3MBjyJOLXnal5gW8pL48XhNxCG0fzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SZVGEGd4fkPzYQjmxWfi5lyjEBqrB2KTHFmuGl3cqm51FbTzgr0laQVu1Euxcnv0kXzil6R541jq68uuGeva3krBhLDGkQSWRawLbEhlL8o3jMis+AFfUcFyHIw02+pgYiTpByDD+42vcnqbJ8pOKRkWT69rhd22amhVgmbMOrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RPNsysRO; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RPNsysRO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVcP2zGPCnm4vcnPvFLCpl+K4ANxHs2AidYbd8gbvjyxRypS/98uOgHUTkkgOVblPg7Dcefo25Ce+28pbODXNQfhUkk7g82f8rEsU+r/S2AyQQdD6N4FN880l1lm+jRNKrX2JT8nTYOJRd/jPixVL78oGD9PNvPnLcuNmXISm3gNmElm4YJ0RyJKXxJG3CtjaSqeiagLbERXY0vDQZY2x7QuU5bDpfbfr2nHcOO9gq5WDDn92OHWHUedt4bZrEXlodFgLJpmhhVyKObzYEuTJDT6p7JMkv1ravzkEIfoOPiRtFVVqhsNJ3U4roilWNHFQBFzyUCrbyOpU3MaK8krDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jas4TyojczodV7pJshoLSCFJZSnDKs3YfqNAEDpETl4=;
 b=HzFrjXdF/RsTOMYXsBUhiR5LvpD98CiHtc2WIDtULUiZMfcDyPFd8f2/YDjzjhd/aeEAAHUIXqvC9sghOiwLebspB/ynOz+8rZEcw9U+wp2QHNZkB7l/9pCJghDVbX4Y1lo+xnnXqTO84YD6D7PcR60a9UABHG+EEMdIH5J8YyYL5pxuwiwJf29opFmFqd58CPu6Yfo49K7l6svymLf0fPNCOzQF3jhFgDIXmp9I6VbHqTeZlgBWkzdv+DeY1VWZSTGw3WyFT0q3UqF5AWf6zmgy2L3h5c9/qYhGpUe2BwUIZyIMaGCNPcS9mKKFO0xorxn9dDuzhYXOk2cHEHKI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jas4TyojczodV7pJshoLSCFJZSnDKs3YfqNAEDpETl4=;
 b=RPNsysROHlr8a+OsD+fbppwKPwLsk86Bj3cbLy91+7/JzsIR8pQEBLKx6SOGfLEj8zOHr6+ZWLKyTOxrg8A7Y0bUmOuLtqpMUs8ymJRZXhibIFJcl8ajsnw8Yg/0SjYGP5fGIkTUvg7Cu0Ut/pnP0R1R07rr3ufPx9wnT8m0NWw=
Received: from TY6PR01CA0021.jpnprd01.prod.outlook.com (2603:1096:405:3bb::9)
 by TYCPR01MB7220.jpnprd01.prod.outlook.com (2603:1096:400:f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:33 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3bb:cafe::35) by TY6PR01CA0021.outlook.office365.com
 (2603:1096:405:3bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:32 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 494BD30001F7;
	Sat, 22 Aug 2026 02:10:27 +0900 (JST)
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
Subject: [PATCH net v2 4/6] net: stmmac: Disable double VLAN handling on dwmac4
Date: Fri, 21 Aug 2026 17:09:57 +0000
Message-ID: <20260821170959.79708-5-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TYCPR01MB7220:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bcbb054a-c2c4-43b1-0d21-08deffa71c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|921020|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3A7r+KdbOQYetU7ksipEIDu50IBU+JW6mF3WbajGppe/MD75Y0+U0oHGsABbqFDMDxeqB9LukeFi3T9hgYpvB5ujsJ/+bXws/S44Dfh+aBuHwI12flzRmZwnMrrsXt8Bg71h7Gtx2Fd6KiVInMap59iXfh1sizFId4eMfZP2Ci7nmy8Vn7+vBcdeac1h6RLn6M4zKseNtToiFvBY67ogxCv6x2FA3d847dTkqQKGDngYG8YtNSr0FHB9pYBf42FSRumAxUQVNbGPTnzAT8gRVFNS7wLy1evCGc1uZ229BV+dwGij/ZQRoqIoz2I1WCrFuo1gyu+DF741b6a4IcNqlBtRWPEschTive/gTKxfYt1ej81KtqmFY7F5kTWpmAHQKgVl0s7XNf7CstbIoUy3cxWCswHVhMDiEQ8EY4T+w4uQNAJkXDoZrT4zJ+GV3Uiq+vbbx3Mse3ljKkb8l/D4TEfU5MxvwswDZCrfrVyS2X7uLJ1+fMQ8ygGpXaG2wqHBbohco0EMfEXHPPn0C88OWk+mdY0694aYFBZ7RSWLaCyzJfyIsSfdROG97z9JsRIgvxnCkN7LGtLjsSUgW8P0Ab6ub/TOLlyX7EzbvZ8OWO/rYomIRqR9CleB4PmAj4Tw0h6Ii1QvPn70UUBzenoJQFOxBj8Z/nikPLAY4loewPUcXTQpN/SsJm07oRXnioSFbTNVKKwFNNwyhF0a6oaN4kWxs0C0feN2YXwGqC9PL88uM14svppXjZiCBb6Q7oxp
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(921020)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7afduiXfMZCdgStMvBCoB2f7HZzVLjioQhlpGLJtMlZqL8n9rrjDMrPYm3g3aZP4fi0HSBTpgavuDWoEajpKb0k4EMnouZe9LIvrz/rd6/FHQGQsy514u9tWGNpbboiGKWy5zaBpownuBeo3FCp0HsT4Q6T0Z9SsRsCGSDbO3SW2GcKFVbVCh+uPMpJV6wR7bjt81XDwUBBKC37JOFEppDyqRL/EQlADYMSx8y6I5gFEjwzoUvqE6N1f7JxPNaC3kYJmbkpwaJVQqA3z9BQIbe7FNxG7IjaBCnOEIp2nGMURNIqOwHuw/Z/eHAlYr+3mzs2CgZi7umY9SbvUmkab4P4jclEW93yJWV2kpAaGme/6K8ddD+fAVYFbHe1ocwwG10cEoZJuImjqo4rnIKOZo6HXpLWd7c37ic7QhujETbsZkfu+nXd7HfpXieSt88VC
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:32.8315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbb054a-c2c4-43b1-0d21-08deffa71c13
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7220

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
v2 changes:
- Advertised NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only
  for XGMAC (reported by Sashiko).

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c | 1 -
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 802f9e67a4bc..7cfd14007d60 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7958,7 +7958,8 @@ static int __stmmac_dvr_probe(struct device *device,
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */
 	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
-	if (priv->dma_cap.dvlan)
+	if (priv->dma_cap.dvlan &&
+	    priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
 
 	if (dwmac_is_xmac(priv->plat->core_type)) {
@@ -7967,7 +7968,8 @@ static int __stmmac_dvr_probe(struct device *device,
 	}
 	if (priv->dma_cap.vlhash) {
 		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
-		if (priv->dma_cap.dvlan)
+		if (priv->dma_cap.dvlan &&
+		    priv->plat->core_type == DWMAC_CORE_XGMAC)
 			ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER;
 	}
 	if (priv->dma_cap.vlins)
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

