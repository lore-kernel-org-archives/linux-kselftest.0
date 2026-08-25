Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A830A2931F5;
	Tue, 25 Aug 2026 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676371; cv=fail; b=vDNzzb//VyfKGRTZrsEJhpfxkYJJlCFhDAKP1xDyq1hXHh3GLbkBSjolZWRoxcG9qGHDVByLwmeWNgGzlOZuGElBTMVR4JftYe/3LbkdDYeWBKvBJRXczA8Dn83JwHune6r/4AyeDWVDtyQ/IVGyc9nbJDoR2pyj8dWveVDJRhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676371; c=relaxed/simple;
	bh=vLPU1FiX1J+qMpzzz4RiIL51lMmH3BuAkFxHYh+2du8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zg0tQlL7fjQ58SdnKkPV/npVrAMC4GtV2O7sYoDTkxkm3j/avXQQzBzwcaMJFFTPZ2Gj/hR04w1B7FIeXOgBEl9OiNi7HGftKBvpWHGXFkbIbtaoESFKkat5OJXXgFU3WbicfD/yUAIG9TnJQaoGIHUqypJuAKs9gEabmx/DV8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Fbmqjdxx; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Fbmqjdxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeRppCJba9q2yAHaAtntxZMoqO3WpDHgSlIHFTWtosut+VbEo22LZJ3h2oK+sgTzwYc19c3QJ2hBihMRK1Ef9/05ptf28fv8zvX4Fawy7AAFnWkgrlFxl3c8o9EpH5hedivsbcWPjNyF5ueteTZJWRvanW16hY0qhMdnnk4bDUXryGHRTiAkmiH5UonP72Q0I/Ur/yYG/PoV3Av1xRLGu0DYxQmD5GBmnZGOHX80Y8ZItsgOUqQ8CLf7cAPhHz6B8NrMN8mDA13U99MQb70k6VOV7z1I1q2Oc9k+4VsdMhYHi1tyJ/u3FcogZCLPRb8CZTyvD4bW5cxY7+iuNFexCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8dPIM4A/v95p+QMQCVEpCH7GAGaiR7HlheeCmMpr1c=;
 b=Lo66nocPLVNq9n12rxr1muCApQTos21JlRdMF0YrreEl9k5sFZK+xx5kKTinv0DEKPebn9stUb8goCnJoSI288VbHXYsk5y+DW5hUQjjPb1CvR0dLDCoizmwlSELICYeKR95C234VoidzFuSIgoO3n6MzFQbwwhNkiefvZ5tjsJ5JQJ9JSSDE2TVGpcQB8QWVlpP252Mur0BoKzu+YznMfPiXebwlnJaGwIQO53q+mw8nJ6hirIAVBoBqkyetd/oVX+doJpjoOIpO2wesUkKi9eBClLBmZlYsQ7w5pz3SfMn4p+bgNTyrarsYlXE6vm7GlQHmc0+msoEue2DCMm3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8dPIM4A/v95p+QMQCVEpCH7GAGaiR7HlheeCmMpr1c=;
 b=FbmqjdxxGg+srizMz4GnkWQwdFN/oWH2ZsiTE6u1T/nNeAM8QzVDoApttYBDil/w+s+PZpo5urLeDitJMObuvQyFIMA6Amr+VLTMXOrM9Y1cBUTiR8pAGtMzHQyPIkE0I37jV6NAbHuSo6JlN634XSSxkyoeKOFTD5ThOuLbq/4=
Received: from OSTPR01CA0056.jpnprd01.prod.outlook.com (2603:1096:604:222::20)
 by TYCPR01MB18448.jpnprd01.prod.outlook.com (2603:1096:405:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 16:46:06 +0000
Received: from OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:222:cafe::27) by OSTPR01CA0056.outlook.office365.com
 (2603:1096:604:222::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 16:46:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20E.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 16:46:05 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.185])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 2F3F130001CA;
	Wed, 26 Aug 2026 01:45:59 +0900 (JST)
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
Subject: [PATCH net v3 0/5] net: stmmac: Fix double VLAN 802.1ad tag handling
Date: Tue, 25 Aug 2026 16:45:17 +0000
Message-ID: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20E:EE_|TYCPR01MB18448:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc75787f-e49d-4152-f4fa-08df02c85b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|36860700016|1800799024|921020|6133799003|10067099003|56012099006|11063799006|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	zRWmB2PX0DLMc2S1JoR3rELfarcVJMb3B6aZBB2GffjDQp9I6LSWuDkw2IGOb93qYyDSz5S9TGXaOzSFGNKKHKCOw3JCaEqiDTTAV8N/+VqMtfTRPXSWBxi35c20/2FJfjr34vqCnkV06JwwxSkTB594pTmCjtG8NAVGZphc1SCyIkrH+3xsvgkYJTAL953nfsOCcDEo70CDuIcany/NGCatyTnPE/q1/HTYz7MW8KF2mamngSvT9IyNCPXsob8I3Hw2QS62IensYsiSmfYtoOq/LZk+H4EfSqedtYe/eY/0E5aVaQBafszeUc8DYT9NcbzU196qQNcbE2KORoSSFChy5Csa06OsW5tjIaPjBvNAO7W5RUpgCMsVfn0wvWAtTXrw92Ccco3RjrTPhyyARd+mt7XzVagR+8NF8V0RuCqTkt55WzgAyZo7LQ5jBM3+kGRJ2fKVbxdfUfSJ3qRF6oOEDCNRB2L34dVWIM7+g/2h5LvTyr7tUUxGU/rGjh+7qG5WLjiVhHI7PSGw+PmHKyQYRSecBod3fGr/r1SM1xg6uoiWDdFOiZ63MAYShhlb6oz2I3ceuPuGCaghxasqLKqXlaA0oKDV77hNJ60SpU3o/Idv+f8v9YHOT+LtDn7oiSUyZSVWQr7IIkAkrNcW0Snjo1BUl3lgrokT2tEt2OsrV3daznfnjXRtvPSCYGMcaGiT59vMS2+JvHAmihLQJPP+bDSaLscDZLBuC7znwbIzhYV9NIYyKnBxhR2XePTE
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(36860700016)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OgmnabQKhRHZ9aepcLXzcdIs4EmrJMZVVR/X9OJ7ZDja28WyZrnz8Ueb4L+h4VgTo4MAXme29kyxO0IXCAmBi8x3MXZxl/ziJD6ZfgZpEIyN4bxx/t+UdEBEx6ywtv3RseVADmQ7jnVmIAjLZOhueUPRMosafa5TnLk8CelIX2ZMCQ9BjRQmgilGb9HCQZ+xAkOuQHEB/qHlCUAOxRPBfhQyMRJL/kvJEDj1v07ZatgAmF4CaH6YepgTw5iSh8vUqcRqzMZDRMcVccRqXXDJcCcarOV85XLqh9IQaTqGVQXomTJ0cPha7FJXmFv7gN4KBSczJCmFRKpSQARM4eBWn3iS2KmRXWR644W5orDvKya1kXIc8QIjPhf064GMfh/wiVY/I/v37oN5agJ1DAFpzNx3yKyXOhsJiv8pgHDrut18Z9dcRUifOFY/OuGsd8zx
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 16:46:05.9082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc75787f-e49d-4152-f4fa-08df02c85b60
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18448

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

v3:
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

Ovidiu Panait (5):
  net: stmmac: Remove VLAN perfect matching dead code
  net: stmmac: Move double VLAN handling to a dedicated op
  net: stmmac: Disable double VLAN handling on dwmac4
  selftests: drv-net: Move _set_ethtool_feat() into lib
  selftests: drv-net: Add VLAN test

 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  23 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_vlan.c |  81 +++----------
 tools/testing/selftests/drivers/net/gro.py    |  65 ++++-------
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../drivers/net/hw/lib/py/__init__.py         |   3 +-
 .../testing/selftests/drivers/net/hw/vlan.py  | 109 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/__init__.py  |   3 +-
 .../selftests/drivers/net/lib/py/feat.py      |  35 ++++++
 10 files changed, 200 insertions(+), 127 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

-- 
2.34.1

