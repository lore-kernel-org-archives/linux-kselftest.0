Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA7223817E;
	Sun, 13 Sep 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310411; cv=fail; b=V+6YROsIcaQjH6Es1LFtXW0sYtDMIPRKPoLQrKRGPJNA8vHlvPzg5sJXR2v5VIUIS28qbcOX1Mxb6nGct6MajkQDHtEjArrrqgFSyJbBVSsswHTcfKlR3eIy5wgpcAKdZjHemY6L0GzoR1EVGZf7bZkL4A3nGTJqd14B4FX5zAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310411; c=relaxed/simple;
	bh=7QFdJxeB9pEQI92bBwmVnL5rvRoEVeydfxNRZvX5Skk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RzQF2aJihQu2j7WowawNX+kMJNxh0rvER/Sp4sFPQ5pVSRatxxHnE1wvxSra72ESKFze1F2K/6Ylu7n8ElAuh23OUkhGUy9pbV6B1qeAt6rDca/2gX3MWc3PgD7Bx3P85wXW0oclENYgptiJlLVASTNaFlTAJ5T76tPutStSc0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I5BfUBXI; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I5BfUBXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3Ulxz4cC0cxNNNVyGFsJfBx8kQ09M4rG8RcMkjtziXpMESWck0QkoZYnP3u+TO1lUlcpwDCopBk/ejXuZu/rFCg8CnDIN5bsUKfWRn5Ld+Mo4F2sgqBDegz2iXpjHBpmGIrRySgLE2GScOKVsLHQFkqK7d9y5uTI7hm1K5xDK+xeYPwRT9sM7e99+ighzEaLWdHl/VXfBuM0/euiSZLeTouSM6XuPgIbiCcatfy576iRhfoPWzWo1GRkO80ML/yWL74+DJfJzT4Z6U5AIi+IH0wdXRo/eXXGXC3KoMs1f9iDkxxUBdEnRM/6rp6AgFVn3NwBCA0yO2n9qIX2cqcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jMNzVez+3kBsIPFvRog8VHOVRSI9kuPW3y8yoRqHtM=;
 b=nVyzlSZWCGY2bncgPGgewRmpj27Sn8X7AqSJICnyQ1Adc034G8dTWY9Wze/9l8Edg7yJ1Kdk4/75u8071SImnx4piUHxrCStwi5zNrWM+AsAm3ZNNOrzOpUrdDBdIXvPVUtLT62rtN20PqxAk99IXPc0lVWD7nLpSn4U6NuuoHBXTvz5S09oLKD4CpzCnAmcN6Nxmi8wUFwhjZc2GkcnMDC+wq39HeNea8fuP5G7O3xv39JmExiKR13ZdvOAUyAU1iE84uR6obvRQwS8hgtyiWlpxOVmfsuK19s4idaFO/mDzQ5LJiJ2L06kRrILH5uZJ5XbXfWFXeJihvQePWF+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jMNzVez+3kBsIPFvRog8VHOVRSI9kuPW3y8yoRqHtM=;
 b=I5BfUBXI+vzVcPIU9/lOaABTeul5oRl+t8oSraD8hoM7qX3dw79/zDyYBRLHP6QF1zrH1Ov7nWxfuU772qzBgvrxwlIsb9mCwAoQZCdIZvSTBlEkbrexebhg7NcbXnidlTB6l1T0e4Nr9U2+7xoZbdp4/q62Esott1ifcUjg9mc=
Received: from TYWPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:400:aa::7)
 by TYCPR01MB18414.jpnprd01.prod.outlook.com (2603:1096:405:3f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 14:40:05 +0000
Received: from TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:aa:cafe::4c) by TYWPR01CA0020.outlook.office365.com
 (2603:1096:400:aa::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Sun,
 13 Sep 2026 14:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005025.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Sun, 13 Sep 2026 14:40:04 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.2])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 62812300024B;
	Sun, 13 Sep 2026 23:40:01 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net-next 0/2] selftests: drv-net: Add VLAN test
Date: Sun, 13 Sep 2026 14:39:24 +0000
Message-ID: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005025:EE_|TYCPR01MB18414:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 182c3bdb-cd7d-4cb7-28c6-08df11a4e646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|13003099007|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pk9BNdDmPkxhEmMDkbxQiTipLTqe4CXs2M3c9JVHQgddETmPnFdRw7uMOew7+5iLMWXmBeAt/DEFBrd2X+N656cjGY1yawJ/Z8rO1UmCi8ivr3f7/R2ZXzTEFWkUpTYyMQIMSD9kG3S8BalEIPOj/8ujFaPxZ2MUV3DWhV3IQZAU5am9wyE6hs2ob6gH1D8uj5LAPSStAioWeQ8qDxj3VfvR/LF+OusWbSmP4DUy4r5H8xoPHVEjFscyFatdI02N3ST8VCFO4eVjnG8fpJCIeZWPon05Y9HeBT10gcGUs74bMkVYmZLO/3PFgUOiv2ACZJ+LfBW/nFkntkfseHYebN2FpgR6Jsutry9mtR9F/NmkydkDvB5P5ttziyF3fQAoWj1bJkRJT2VwtnoNpyJG/pID6V6lO5E8JZ13UnCbb7UhfIkKVzY0YSc80pVw367qz5816hPROO4EtEfXsVvKMJmesdmX+H1jOsZCv5XKaEHoX8BG845uwKI4ZZX+75CootNbzVSf3RU+z+Mru5b8MKwrDNxvlSVZj2c1CTRH2zgf93zdbwtKFnbDUlizLy7MBHR+rxi/Fw9FZL8dV3PPw2v9wO2M3nS0vsQtSrawneHAOpklljWcwb/d2o3oGWhALBB+NxNs8Q4XTMkv8ykCX6MeApUdJEI+fJLQqS5nF7wfBkQtFTuhYP2nuoLMPTS46SI3Vc/bEKAHimOm2Rv1vg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CO1a+DgwvXpwDZ9zsy3/Ue89Ilq1i35OajIoaB9O2nkT73zv1o2K+StOxT4EPgG7um5GkUYUKYBVnVssL6C0ZKJA3uqi1PGL/KLxM5nq16JJO6U5KPY1fdft0244cWuca0I+ws3zRto7efskqrOk9A7OEE9btbuFPi8FybKH3qKHRllUDGBoOam+oMiAnJHEmqkb3z+FBJ+CvE7BpnZhTX09Qe9/8Uxk6fvpGNt6iPkan02I5lU+W3U2x+SPGWT3z+7XWlA/XOsdaYCi0Q3+cCtH/xdsP5Dj8lFNWCsLNn5FG72kT2EnhsX296UAIux2pW6krGQYVzbxiuFJLq4sUO60/232aEcLExPu6IZfBtwBd/t5KBLINMCCfzgG0ikAytlW+5yWJ8VPU2EYkk5wpuxazn9+SYPyZEEzq4fM5AZ2jDnmk74rc2x2xJsSS83l
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 14:40:04.5081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c3bdb-cd7d-4cb7-28c6-08df11a4e646
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18414

This series adds a selftest that pings over 802.1q, 802.1ad and
QinQ VLAN interfaces with RX VLAN stripping offloads enabled
and disabled.

This series contains only the selftest part of [1].

Changes since v4 of [1]:
- dropped the cfg.require_ipver("4") call
- used a relative import for the lib
- the "hw" variants no longer require rx-vlan-stag-hw-parse to
be changeable. They now enable the features the device supports,
so QinQ traffic is also tested with only C-Tag stripping enabled
(reported by Sashiko)

[1] https://lore.kernel.org/all/20260908164309.59282-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (2):
  selftests: drv-net: Move _set_ethtool_feat() into lib
  selftests: drv-net: Add VLAN test

 .../testing/selftests/drivers/net/gro_lib.py  |  65 +++------
 .../testing/selftests/drivers/net/hw/Makefile |   1 +
 tools/testing/selftests/drivers/net/hw/config |   1 +
 .../drivers/net/hw/lib/py/__init__.py         |   3 +-
 .../testing/selftests/drivers/net/hw/vlan.py  | 127 ++++++++++++++++++
 .../selftests/drivers/net/lib/py/__init__.py  |   3 +-
 .../selftests/drivers/net/lib/py/feat.py      |  35 +++++
 7 files changed, 188 insertions(+), 47 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/hw/vlan.py
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

-- 
2.34.1

