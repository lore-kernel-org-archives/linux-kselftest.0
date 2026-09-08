Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED56576EB9;
	Tue,  8 Sep 2026 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885826; cv=fail; b=bl+Nxa0eOut8e9XJuu1nOcd8DRY5hhEz/s9gDlQb/dvSns8LN5qcAz0un9+jc9/0hxx1PGKLCmv3oyfIdrzw9drXP75rqJD1MTdi9AgbGfR8RJKJcjL5k6/vPZPcontikdyXoy2AXJfftLEPY0MMaPaNHOS3wOnaI+dvOlnK1Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885826; c=relaxed/simple;
	bh=rPdpTlGpylmlR1EGd+zxixXU86rsilbdd2RIia2gHE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GvTMdTEHt8v0TmdJB/E6q78EGm59+a/mkQddGO4ecBJYFkhMu2NSGgGfFuZOt5n5/ai2SRkOmdpwbxq1j010lySn4H8gtZdP7DYCk1cFhOHfHLOAaUF5Db5aSVTu1g7Mdjqmq66PzpxOH1LU8OBJ09OCosqgAQEkQ2XS9q7LBuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VIUIgd0L; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VIUIgd0L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1sv+RCGLhqUpvwaqXDFffVLN+NCAa3KQ1edD2QGiYbcZS/fFHxRpei8QY8DxJMVlYreSKzAKaW4g8j/JZzb3jecDy4jmvxG+cHzxE8Fewpl022B62Ai5DYtaJtMz0elB8K9unq8UQ8daZN6UiuxylChH/hzjS0r11L2yDhHRZvnTij1Vf2CteVoPcsGs1QVCbLJ/F7GDpfXvbwIzYUrBERz6S4DAJBBC6yMNiC9DZlITkGnEzdZxKFUkmLVUwNqgmURJvSpo12L0JZxrKUF+pzC97uDsTB0CX7fyvVnEBT506DO/7xBXI3By4TFrTrmqvwhYpoCF70nzu1NoOsCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o2MUtWXjVaKxG0YmmheS8FdVOAetrwEYeMs9mMZMlI=;
 b=uybLRrswUZ2CARz/fP1J14nOowUzOxorDPOfn7yAh6IpBhOlryVxsJ1zecmRTA+ecPMl9m4EM6NoR7X5uL7BXeKPEZqymlqEVG82GBB0uXAm06KYhQz0k9W8SpESZjHe5YlAfgOjjjczK6g+xYsAj3D9xGMWZGWge/LEziZqGmAgObEFpxaFoVI5HlGT0Ayai3KK65sKnEPaSKvQQQViaMbWKhxJ7uLJ+J11ICvp/Tq9kuNJ7alSkZA1a7ClwU7ftmAP5KNKLV+fP/z0qXMHxqB58Evkz8NkNpwtUANa6tPUVo4Teep+p4aZawkBVA9vAgzsynokomxsRJ2R9UoQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o2MUtWXjVaKxG0YmmheS8FdVOAetrwEYeMs9mMZMlI=;
 b=VIUIgd0LyLElRuiV7c7f6aE3jV8BO6PUM2pupPYmUprA0j6zww6Svw9vz89YP0hjvVOu27NYKS5Oa99VMYDfPG2hOUGLstdwen5kArPWr4MkyLGBH5sitDxfymCxh21CaFSD8QsE/DXDjTUb8g6y41YhViGZAU5RRe4gU3Pd1nM=
Received: from OSTPR01CA0067.jpnprd01.prod.outlook.com (2603:1096:604:21a::14)
 by OS9PR01MB14024.jpnprd01.prod.outlook.com (2603:1096:604:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 16:43:39 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:21a:cafe::37) by OSTPR01CA0067.outlook.office365.com
 (2603:1096:604:21a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 16:43:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:43:38 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.55])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 95B1030001C0;
	Wed,  9 Sep 2026 01:43:32 +0900 (JST)
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
Subject: [PATCH net v4 0/7] net: stmmac: Fix double VLAN 802.1ad tag handling
Date: Tue,  8 Sep 2026 16:43:02 +0000
Message-ID: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|OS9PR01MB14024:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7b612921-0200-4a0a-9d3e-08df0dc85536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|13003099007|921020|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xD1ExY00AKQAlWMZwRj1IhJMxqBLyivz1Z+ASTEhMqpSk2o6UG0IZgllB0ARclhCaKFB/6GagfIIanNSCT2bQVv7JU+XMbo7gr+7vjGaDCOW4Um+qlTEkOEkALqVRjAsXxOolOu/Zb6kicx2vflax8m+EZ3iXEEKF3nn0G00gDbd3s8Qx+sdPmUG3/q0PZ90U+qAko0ss0G4EUsd11BHZWmZDw0af5IDV/7xj8+SGACfvo9fUMdEvRgDhwrXTh0jZWqlkY/Zh4JS2DiJL8ge5xbpzIhhxjfi06SvUnOUU6DlcLnN0eXDCSZUMH7t4H41Dtt3yDXyT1piY+aAYpnRFAKIWLJTFHNZeffzQ81NSQN9sl6Me+Hd6yxVuQlva+NuBXZeRAqo2ov1+7f0ex85ZeUXToZS+AaIB9LYZ1F6ij6RLclRbIDc4yGVS8LAFtFMxS4rSArhH4rFP5pOev2fkzu7T4cOotqrmcgiIGTZiLpQpV7MeHpTohLTqXAk/pGqedpGv9TukrxVDPGGapQM+376juHxk6b4JIFJElJrSsHicN74W6WDHacrdViWtNktB/glMQTCmqnXAgvbdez+IBDn2wAYUFKs+dwCFnl8zTZ73Eaw1hCc9TrQv5XNFbQTH54t00cpvJrjMKVffWOPBgLWUuDdtgB+8tA533nag+8dukH7PGeV+RlMGGucSTJgdJ0faSh2iUBHhbzFcfshbslQqjWwlik4+GBwL6IeKDYSGpOyS2Hn5KS2lWKfIGYl
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(13003099007)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e1j8711pgiQL7rkIByXBkAASbLUwGFYmKk2HNi/He/vyaWr/p3ZmaRdKZKvEvUSLIGclaFgUXEIqIBK1lbf2x8TjwKH5ASO3j0Nfykce7zUlPR0uMzgpi/P3fEz+t0FnV9O+A+nuOoHhnHnev6BcAq5D6N2O/htjjfkcAEw4MD1iytE8AV6RrDD/OIG/7iROaFIvw6iW7hnOWKmdcnGVXBVlYLKB7hwsPErw50XX7DEVb+vxMD6l8oRQqPgBzBOC1sje/DQSG/Z+m2JjpdUrLIckn9/PGQqz32Xbj+TT5swDKUumm4cWJRpBssLcy6ZJM7eJYWCICbboaNVwJvIckLV+YmpQyrO6DBi90eg25auBQe76/BwXTNbxTbo4D2nl0YZx8vjCkwSfhGvnW5M7Ytj04mYlDqgUyVMuNXbRYVLytN/60uZaNW4p9N4b8TYY
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:43:38.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b612921-0200-4a0a-9d3e-08df0dc85536
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14024

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
cannot support hardware S-Tag stripping correctly. This series
disables S-tag stripping for it, so the 802.1ad tags are left in
place and are handled by the software VLAN path.

v4:
- Reworked the S-VLAN patches based on Joseph's feedback: EDVLP is no
  longer toggled, the "double VLAN" naming was dropped from everywhere
  along with the is_double implementation, and ESVL/DOVLTC now
  follow the advertised NETIF_F_HW_VLAN_STAG_* features.
- Added a patch to stop advertising S-VLAN stripping when
  rx-vlan-offload is disabled.
- The VLAN selftest now also toggles rx-vlan-stag-hw-parse for the
  802.1ad variants.

v3: https://lore.kernel.org/all/20260825164522.4244-1-ovidiu.panait.rb@renesas.com/
- Dropped patch "net: stmmac: Enable double VLAN processing only when
  supported" from this series, as Joseph reported that double VLAN and
  S-Tag are separate features, so it would not be correct to gate
  everything behind dma_cap.dvlan.
- Moved the selftest to drivers/net/hw, as the _hw test variants couldn't
  be run with netdevsim.
- Fixed "ruff check" and "pylint --disable=R" for the VLAN selftest.
- Picked up "Reviewed-by" tags from Maxime.

v2: https://lore.kernel.org/all/20260821170959.79708-1-ovidiu.panait.rb@renesas.com/
- Added a net selftest for VLAN.
- Dropped patch "net: stmmac: Fix double VLAN stripping on dwxgmac2" from
  this series, as it was compile tested only and Nazim reported that it
  doesn't actually fix the issue on his board. More investigation is
  needed on dwxgmac2, but it should not block this series.
- Addressed some issues reported by Sashiko, to fix the advertised STAG
  offload features mismatch.

v1: https://lore.kernel.org/all/20260729095110.164157-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (7):
  net: stmmac: Remove VLAN perfect matching dead code
  net: stmmac: Stop toggling the EDVLP bit
  net: stmmac: Rework S-VLAN handling
  net: stmmac: Do not advertise S-VLAN stripping when it is disabled
  net: stmmac: Disable S-Tag processing on dwmac4
  selftests: drv-net: Move _set_ethtool_feat() into lib
  selftests: drv-net: Add VLAN test

 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  58 ++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c |  89 ++++----------
 tools/testing/selftests/drivers/net/gro.py    |  65 ++++------
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../drivers/net/hw/lib/py/__init__.py         |   3 +-
 .../testing/selftests/drivers/net/hw/vlan.py  | 112 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/__init__.py  |   3 +-
 .../selftests/drivers/net/lib/py/feat.py      |  35 ++++++
 12 files changed, 222 insertions(+), 150 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

-- 
2.34.1

