Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B473655F0;
	Fri, 21 Aug 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332216; cv=fail; b=AwLocvsO0BQrtPiwK2thrAM0o5GlG4gg0AfZttLsg41MHiVkZ7WW8uckEil+Bu6Jefp9boU1zcZ9bqiRIR6asKlzfza+AgkdZ3Lbq1nJRw+MG7Qv7rv6gfcOQDCqs9CYFgFBwRlqMH+IyYlm4pDY6CidA8XPRGUkEZNXeTbzaBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332216; c=relaxed/simple;
	bh=HGwLgyROj4IIuvVeznQGTJlP4LeY7GrcB0VgMZgcA0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bZjhk7gso+03WpGMsPHxx+prESAPUlhMMqedeq3IfUssWUz73ZVEPk2Yx5c1soHyLwUWGJCiHe4XqEc/o3F57lR//HTxaWcvciW/7PmuW+lliHQTpFOAWuRRcrSfhRlMhcm62cHNM9czDxtrV9OVBG89dyR8mWYedRH/FoeroVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JiWT4p1W; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JiWT4p1W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pR/1WQ8GfHpzMrMJb4SshnWjNPtwMBCKOVCgzAoCg3QYEr6stkGB27BhkGWvNQlKhKbQn9lYsV/+Zdf4HI3PNlETH434fPLMyYTDnO8SGAMdgGG2am1YFhsqw4rn+Fy9kSqsm4Fd9Gpwy+lYdzuPjVMAQtoUtMLYjqbrBnXN7jZd0xxQeleMgbBn/3SuwCw9kkgCa8lqUPfV2ZsHjpTXFu/+X/UeCKrDyBf7f3Tt/2seeWb2RPyCvrSmNSt5eXs/vd8EW5wsrPxcdEzhzrnVN/6tx3b2aI+VrK4xsFqsT2gN7jWP3piYaaE35cQH3auLN4Ig5cjmdQoRvPkqgLssbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHSRWsscYBh6DADQezBJi0UgxfccW/WSPKNSjijUU+g=;
 b=MXe+GmFQQEf2HjBM07SmOya7TnhdaEiqN0WVBBbSR5ZsC8xsGaEqKTj4aLUKsTqtD/5lEdjqoWLNFYIxiiW8mNOT+KxqkPw6y8vQJENWT/TP4J8IUlDaywUcGM/JYo6MEyXPQkzApx5sOaq1ohd1d3BWKvDwrhN/ZY9cbsZiNyPNTab0qdLd0vysvXASuxDjWvJqBz3sWPyny3MigjerOl/43HX2nYHe/K41FjPQVcEfYGExmUGmGmTzZplH3EydPI559zG4GUUHEJ1q8AUVmc3cU1naf81/BdjD8XsMIwd7xaD3rxW2IcbZ02TbM0kouwL6qWqXFWprpk71AAtixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHSRWsscYBh6DADQezBJi0UgxfccW/WSPKNSjijUU+g=;
 b=JiWT4p1W926ceLZ9a0vfWDubmQEh+WDAWdNXXXpF8AKHO2wD4HefywvHFAwqWz6nq1d14+WqpKTjcfLUMAvE2atL+WTvrhdbI/A6u6Yrw8/ODaFPB7FBFwBTM5qTElFdeYMqxHm79YEhNw9p5pGQPMfg/BD7RMlg27Pbq1ljHuo=
Received: from TY6P301CA0006.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:3be::7)
 by OSZPR01MB8687.jpnprd01.prod.outlook.com (2603:1096:604:15e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 17:10:10 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3be:cafe::70) by TY6P301CA0006.outlook.office365.com
 (2603:1096:405:3be::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 17:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 17:10:08 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.76])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 1CBEA30001F5;
	Sat, 22 Aug 2026 02:10:02 +0900 (JST)
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
Subject: [PATCH net v2 0/6] net: stmmac: Fix double VLAN 802.1ad tag handling
Date: Fri, 21 Aug 2026 17:09:53 +0000
Message-ID: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|OSZPR01MB8687:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9243364c-35fa-46e2-0793-08deffa70db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|1800799024|82310400026|3023799007|11063799006|56012099006|6133799003|10067099003|13003099007|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	8Cg7Tvly9u462sU/kQIdEzoFNcnXfY9kG74Fu9pvhRGQ4oV4AR93ty4N8tdDOZmH4fqk+Z2yGD8tsBoZHpFZbiCZuFbvMibLrjZQQkUjOEWm90Q9HJpAwsqcWa8Dhf+Uvpx+iC9wK8gR8wqnuX2XITSAD10kixCVEKZw7BA5KKlwl575u6yzrrwFgb+qHuMYql6BLxoObvJWLTwFIM9oTzmOo4naySssN5ilU2tdYvffFKzusOT/+TBgyiplT4ijo5m3fzDyzc1vCdETVz9g7Clf+xcD/9H3FPDD4Q+mz+m+ff5doFq10/FkdmTFBg3tNDYcrBYh9E6KjTe6TXL3GNmfu1v6wSXuVH6m+yCSn6gIht47CkIFvlyttgPZgoM04kuOf/SSAUuUbAq9+9keYg/iK/xsrwfkm03vDGzQ0n8lARK/zWy4PxQoLI6W1Mgixr+cDbj5x2soYw8wtHVHZb6syE8guL4KSPaukkPve5+mnIXRWeb2dWlDjS3anGcjrexbSlzp93iHjY7ksx0WnjDP8xYjEUGyPqA1RYX6HhCEeid5VNWUm7/UI1JxdzxAlOqK32eLFMMr7QeNVeF4KJyG1tPYDkMWZ+TfmfkUfS8jkj4Qg+w8Ol56vuas6uwByStwOP44Ez+lCtUFCZ7xCYUIZIWhg8kVQlNJYYuUM1n6oK9GH5xEC3sv/BqILTOpNGxi+GGGXFW6+oAyay40IHn1DdVamg3mr1mbSITtkDdYEO7kmB7L+bVqeWf1Rqii
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(3023799007)(11063799006)(56012099006)(6133799003)(10067099003)(13003099007)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fDIJ/9iIJ1fsw8YNXmCauwxTHstx7DrK79mj4PgCWtBeuSRpJ0ZdTTjYfM4DLRlrNXsTHXSiPquWoMvU8zTGlnAUlbawqn22T9ebcAE5Tsou5VnMvjq4a/STm/b4gLk2pkZ2069M82VeYWylmUpImL9xwEIQJBcCm0XrEaxxUPeium9wg21aP7B1WLmQb3bgvQpoQRn0UG4LFP+0uIBzkIoQgwj+53MXPCt03TkhkSzp6LUCJ7B5v+nBueLku3UpFNe+U9bEPPgArb/p3Kk/3tNDMjHdYhLWrsPwInTv6UqLkmfcbEw5VjarhV1ttytjXHbxxhSMSjvgBCvtno3QE/fFdxhuTHAv0bcXEnv3NNTaATGfrg1EbkPvmGP6G0xwerp9xpwBlNJWpw1HUy8AceAD1En54WZMi2Hvc7YDn9HaCB5FS72H7nft2lWhy92F
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 17:10:08.7395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9243364c-35fa-46e2-0793-08deffa70db7
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8687

Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
than using the actual protocol from the packet. Because of this, packets
that contain an 802.1ad outer tag are incorrectly passed up the stack as
having an 802.1Q tag.

This issue was observed on the Renesas RZ/V2H platform (which has a dwmac4
IP), when testing QinQ ping:

  # DUT
  ip link add link end0 name end0.100 type vlan proto 802.1ad id 100
  ip link add link end0.100 name end0.100.200 type vlan proto 802.1q id 200
  ip addr add 172.16.3.2/24 dev end0.100.200
  ip link set end0 up
  ip link set end0.100 up
  ip link set end0.100.200 up

  # Peer
  ip link add link eth0 name eth0.100 type vlan proto 802.1ad id 100
  ip link add link eth0.100 name eth0.100.200 type vlan proto 802.1q id 200
  ip addr add 172.16.3.1/24 dev eth0.100.200
  ip link set eth0 up
  ip link set eth0.100 up
  ip link set eth0.100.200 up
  ping 172.16.3.2
    -- FAIL --

Note that this series only fixes the issue on dwmac4. dwxgmac2 has the same
issue but I do not have access to hw to test on.

Since dwmac4 does not expose the tag type in the RDES3 descriptor, it
cannot support hardware double VLAN stripping correctly. This series
disables double VLAN stripping for it, so the 802.1ad tags are left in
place and are handled by the software VLAN path.

v2 changes:
- Added a net selftest for VLAN.
- Dropped patch "net: stmmac: Fix double VLAN stripping on dwxgmac2" from
  this series, as it was compile tested only and Nazim reported that it
  doesn't actually fix the issue on his board. More investigation is
  needed on dwxgmac2, but it should not block this series.
- Addressed some issues reported by Sashiko, to fix the advertised STAG
  offload features mismatch.

v1: https://lore.kernel.org/all/20260729095110.164157-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (6):
  net: stmmac: Remove VLAN perfect matching dead code
  net: stmmac: Enable double VLAN processing only when supported
  net: stmmac: Move double VLAN handling to a dedicated op
  net: stmmac: Disable double VLAN handling on dwmac4
  selftests: drv-net: Move _set_ethtool_feat() into lib
  selftests: drv-net: Add VLAN test

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  26 +++--
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c |  81 +++-----------
 tools/testing/selftests/drivers/net/Makefile  |   1 +
 tools/testing/selftests/drivers/net/gro.py    |  65 ++++--------
 .../selftests/drivers/net/lib/py/__init__.py  |   3 +-
 .../selftests/drivers/net/lib/py/feat.py      |  37 +++++++
 tools/testing/selftests/drivers/net/vlan.py   | 100 ++++++++++++++++++
 8 files changed, 193 insertions(+), 126 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py
 create mode 100755 tools/testing/selftests/drivers/net/vlan.py

-- 
2.34.1

