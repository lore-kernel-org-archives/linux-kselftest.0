Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947A5867D0;
	Tue,  8 Sep 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885850; cv=fail; b=inpi4JVupyGL/+h5ue4Dic6kq4gzI7HG8mqOCjogL7i2osfWysOBPTNuJgR6o7a2hYHxwA5uOD2gCRANRis43mO7a/2cNJ/E0dTww0/pWWj0l52pG4elcf+C/0D3UVdTMRGj7FjiPfMGgHAl0eIYQzp8xqx/5gfVofnV3NRgaC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885850; c=relaxed/simple;
	bh=1Qy8+0JI7IJR37teFERD8Zqmwlz7UYbx8E9tLG5QvuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEyQdV1I2qWFM4bjsf8K7XBiMuHnFatlLokEPvzY/FBJod0cp0LRBQ/zlS/DM+KiKXy1zMXHbPM/bjVqbtUzgwQhcwfe7r9MK9eucvO3Tb4hLnyK3wl3CnaXrC07Nw/uxz7HAzXJzkVh9RvEL6Q5rByPSBiZcYArL6csmftmUEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RTsiHcis; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RTsiHcis"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwVqrWCJvRn7cuNyw2Mmhc7nolT7EhfgC/PZTYm23Vms9xlSXdd07yS/a8mNo3ioNioqXcHOkVJKpY6Lwqz85q8Ll59i/XDucYb+8IWjnLJ8oQ5f0iSCgt8ktjFWfKdTrG4e/YxmlncF7W/TBfeqkVmrlIoySygFi94c9sobVmvEBzRuOHmkvuVml73rMCWZq/TVukQDBXKBwcxMUsGmHZZpsxGoNVplL3DqnPLGu0wktRDhJT2GVtRtqae2QJuEnBWk3ah47Pa2YeQ5RwomS0rxNDcOiImBQLlBBGukozTpqvcmKc/ekFpkhHwD1USuEvigU8gZkfiYsqLVX3ttiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov6fQnvfOis0YFvqGAJx3mfAjOeOZHNcRy0Qvmw9kgc=;
 b=IFEBMQvIF0UNwnjyzfS09qtZGoVKkmQDE+1Ko8o+HhgQ0j3Y39roaoF1oCpsi14hCCEXoyr0KHAu9MLyu4QaOjN7wY2lugSB/zE4HBjgjaAauIosTgSDCXQU3FpXAwJSY+sfQbcdlFrbyTtfpAcZfhG2WcZi8oJAEsSFujDWTWnIQrHyIgr/IYvWX64InYKliYnDj3umNIrpTAYrzD/dMQPDICuHHkiidO6Gi7NKVpARh/pOhR+CUwvA1QikbpUcjykti1I0yoUmOA+TTWD2NHyJc8RjaOsxxSBqX4IVsI0jbbzuz1NxZ/CwIbeXc2e4Sx2Ix2OxVXxCPtwaUouYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov6fQnvfOis0YFvqGAJx3mfAjOeOZHNcRy0Qvmw9kgc=;
 b=RTsiHcismwh208N+KYgcnWQVNsImbUUs0N38oJYj5ch6/ZtzLiWXMBZNWmvcOzcWhYPcWJZVEl7PL727in5z2NwdwkttW2xMx2LmWjXIV9jt8E+3kDKJhcnMUZTgKMXTwfXRpg1OAVIlgaq3LJZ5aHljQqcZp48g2TXidRQDmqM=
Received: from TY4P301CA0078.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:36f::16)
 by OS9PR01MB16470.jpnprd01.prod.outlook.com (2603:1096:604:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 16:44:05 +0000
Received: from TYO1EPF0000501F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36f:cafe::30) by TY4P301CA0078.outlook.office365.com
 (2603:1096:405:36f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 16:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF0000501F.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:44:03 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 5A56C30001C0;
	Wed,  9 Sep 2026 01:43:57 +0900 (JST)
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
Subject: [PATCH net v4 4/7] net: stmmac: Do not advertise S-VLAN stripping when it is disabled
Date: Tue,  8 Sep 2026 16:43:06 +0000
Message-ID: <20260908164309.59282-5-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF0000501F:EE_|OS9PR01MB16470:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 441ae7c5-1d9b-470a-b401-08df0dc863e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y5if2dVJbgLL7OUpli4d45+m4j6PlFLJO0W/FPE+/SMg7xVl3tbsdlqUivoepFjHFFbE2uGLLErg1hzV4UzzEsHRUA2QymbppIIerWnDcxu93Uyb8ferSsNPueSqXeO/er5x1pZneCP7bH4w9ZWtzEpOokD0mtX7x+8bwKiRL/ZD1sDYqC7KEW0j/wHO81P5lDL3jRWOBql6enk3z96s2H4/ryigQYvY/Ia1T7NqLh1s43rhP6AOQdBOIW0SR2yHQWip9W36BfpB3nYbvH/xLZWcTaGS0ic2Jka3WaePnL5aIaZ3+XtLnGQEDZFnkuiIf7pE2e4RY7jatNw0E1aMJcS5RmtJCdkAhThfP2z5E5BsIqFugMd3TIpwHP8eFsYyfYPqBMa5BuAWYxLF1Hv5BX9KJLBrRsoLu80K4Ub4HYH2pbM4btiRCDjrjuT4guGgi0+WdlSePO1UWga4vmiYaiMX3/EC4fYjrl+ur+5zsYSkl0PbjkqGLMD5EtmG7tEAbauw0u9bUIIyjgLOeFunJ3E7QHyrFFywHWkZdDuu2WNIEHjaavxwhNrTeA6LOyzT0yvQnBz5MeTChoIXBNxOCoFO15wqUuCRAm0sJXtS1U2ZYgQVDjxQhiN8NbHdlcEwoiqtvV7YOB2cKk3PEd9cfpBe5YA4P6vMBcfnpdQIzHOI1E7fGr0zY3m3xu66xITEQa15wcgnacSUDI2nESTtvvE/vZxAvOnW+8Wd9FTzJpB4Tp8t6Rt5O4aSsADZdBuo
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aNYAY7BIs9hj1bqfPd/uU/guS3L87yiSKuoploKhw9EpyWUJZE9v0/LRgKFd/flSzf7dJ05Z2bdVY4C9wYpzq3z6Pv2t8KaHHquoFSXwqJtw+izbUzLWG8thCB0/ihTZbYOinB9z6K+PTolibpuvZ7196itIs7+A2T5VGARwazP6SobUYXJrC1GxbqmmbZYtQD1PF4Hd3bWP2N2zUHBNM+b3Stz2sYnKfcjIM9SdvyRvRt7Ur110D8V5+kOHPNRSNS298X7LV5KbSipYKPkY3WvlRwMkulxRm0EsLv4NwnnWmrau1LAJL1XzXuxgwyi5sRZfky3peYZ1bucvywD2frmSapSq254X+sbeMpoNzbyJH5cpc1MJQYsbiFvetGfUH2GuE+I99iTD3y0O2ybADyDasIFL0LdN9UmbRw8NySfp+RzkJI69twhqsQTgCcEt
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:44:03.0226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441ae7c5-1d9b-470a-b401-08df0dc863e8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF0000501F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16470

C-VLAN and S-VLAN tag stripping are both controlled by the EVLS bit,
so disabling rx-vlan-offload also disables S-VLAN tag stripping.
However, rx-vlan-stag-hw-parse keeps being advertised as enabled:

root@rzv2h-evk:~# ethtool -K end1 rx-vlan-offload off
root@rzv2h-evk:~# ethtool -k end1 | grep -i vlan
rx-vlan-offload: off
tx-vlan-offload: off [fixed]
rx-vlan-filter: on [fixed]
vlan-challenged: off [fixed]
tx-vlan-stag-hw-insert: off [fixed]
rx-vlan-stag-hw-parse: on [fixed]
rx-vlan-stag-filter: on [fixed]

Fix this inconsistency by making NETIF_F_HW_VLAN_STAG_RX follow
NETIF_F_HW_VLAN_CTAG_RX.

Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- New patch.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cd9671493b41..c81c5bb5b075 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6189,6 +6189,13 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
 		features &= ~NETIF_F_CSUM_MASK;
 
+	if (priv->hw->hw_svlan_en) {
+		if (features & NETIF_F_HW_VLAN_CTAG_RX)
+			features |= NETIF_F_HW_VLAN_STAG_RX;
+		else
+			features &= ~NETIF_F_HW_VLAN_STAG_RX;
+	}
+
 	return features;
 }
 
-- 
2.34.1

