Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF664E2F0B;
	Fri, 18 Sep 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730771; cv=fail; b=loEfsNh3xGyofcfiHJCsO7dFdIg95ft/1W/c1K9F0AY18auWVF2PLEiqfX7sIKCHIJIprmZ7U1rS0iyLuLL7t+pRmvwMZiWlduBvjpFPSSylIOJDBhjEsPGp0YFB0eoNncZqD4jQBIL4qMDmpk6jAR2Hk3gT/DHbgwJI4gaZ6rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730771; c=relaxed/simple;
	bh=cUGgf8LPypAr1XMUlkyUdri2rq8kvZ0aEoRZhlOg5hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBsGFDNnH38BJoWCrMYFQvoV0Y71XbHPGgdLVTGq/DEiuelCjYx0UffFlh987eOGF4jhKIO8160Vanc01tRvXErM5VZnlpdcYk9joCY4ZUYhOezTFfimetlmA3h0AXQODmXsRIQkVNcMQOGUgCFsxLD6O7lfZ2cplfi1NofezaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KQM+OCix; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KQM+OCix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXgvao8hd5sEQMzfJcF8BP9wP+TVuKnFxt0SgavbO6xx8oFQpwcF6EZbYMag+eu4kL6vXbXJInvTKm+e5VErPXpkiLVKGZXSn0mLN2TTRKogI4DEBLDk9MJLJNdGD/DSNfl2g9BuLrBZ1Gmf64tAg1lWiW2gdA/N8XvJEZLB6Wxz48+Alz/cgThNaRXeCetUtHx1TMe6+oxhtlY3AGzVxvk0Par5hhwkPBeHyFYstWkbSrQ7cd3mYphmaVp3gkm6CQ/6cd42hEm8SP6GhOwso5rPo/NYzqwAinvK7tJMs5CR3YgQABMAt40LBPeQasSTPxThjzWOYe2XlYxBgDtwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVV1PSaHZAImjWliS9DQHZ415jYj8QX1DFqDPMHLqLg=;
 b=J5W2zTloddV0/OHjU+0MIJ+7ibadYS9WTmWRqrXrU3yZ8mSvdcrUmz23b5brMW8T45arhj4wsiuR9YB2ERyezIEk9Bv/zZs2vJm7gMIoT8itcFJszz97PBtm9HHfy8/Gn8aRlThdESNKvXe0R0L0G4046yo2z7x5GoM5LzW5znvkni0JA5NP+BwQgpap5ySRDSxkUYLQHWwP8u/m4dUeabHgw9jzTz6XixqFMsFO2m0oN+idMg//qXg26maAWAkKP+YY7jafLD4FR3EGoc77OOb6An8KJqN6bjMGNLrz4AV82o9Dpfv4XkaeRITwckStaV001Q7p6+Bb2kqq2Fz6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVV1PSaHZAImjWliS9DQHZ415jYj8QX1DFqDPMHLqLg=;
 b=KQM+OCix1eUIpAAl7IiZERcNOemgW3eBHyNwD0Mz9i3bGs++FuNC3fyGBU7Mp6dfCXPO6Fv78EEVci3a+saNB8Hx4u3ICSHpfgBmuZ9kVqxtSBI6six56aCo9sqULmItriKOD2R5aS/nd4RsGvvqKoBd7eCGrh+B70N+BtPXrf8=
Received: from OSTPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:604:221::8)
 by OS9PR01MB15824.jpnprd01.prod.outlook.com (2603:1096:604:3d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 11:26:00 +0000
Received: from OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:221:cafe::52) by OSTPR01CA0016.outlook.office365.com
 (2603:1096:604:221::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 11:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003B.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 11:26:00 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.165])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 090AE300027D;
	Fri, 18 Sep 2026 20:25:56 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	nb@tipi-net.de
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net-next v2 2/3] selftests: drv-net: Check the features set by set_ethtool_feat()
Date: Fri, 18 Sep 2026 11:25:28 +0000
Message-ID: <20260918112529.96039-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003B:EE_|OS9PR01MB15824:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01620f7c-4bcf-421b-4c52-08df15779e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TvBi8YD6vRfhWwE9WR//DBF/i/AdD37gzLeI1Fl0vMHTNfnrrFENZuSx2K4yqmwzJ4GbqpQfuvtG4WibufFIHHjvTWFRRAwYZgEy0P0ogfwxVQdACn8BOXlYoh5cmGNv2fASsRXOEdCOF7IGuHFDKUcjYLTtGb5AMsConTY9F6nYd8sbOTDbd8Xv+icPQofk4W795m3miq4nHkkxRtv+Jig7bPiOtE0RKIo6xRi6xLIGOmTJEvrzzAerXqKdEft0GDSHw5fo9ZngFVOPYojIidBtPoa2tArI1tiOPuKuJiwPjB+bGpYovfnU5zqmo4SYvz4MEqpVN6MsB2uR4i6TPWoJI+8aBQvsRf+8y25GZpZeQkuCD93WkXJhpOA4GW/XWw2g/nSFXnT/54tChRkvNkDEGurLM+Ehoj3TM5Jp346f3X2cgrZB7q7OShVIIljXiPgXNW+doRPEmmaMxaHpdnAI39sadPCQ5Y6Vw+q9CNbQaBdT8iKaJIyAs7TAQ4Zza5vDwNfRZK3Jp0YbHIhDKQ7PxzdatDf1Mn1PaNT+GWl+rVUPbZS0m/oE4ch5TXe11C2hO0yOiQpug1oq+QsDDVAc7DN3eLWrl1tw22YmURaX8Bk/qBtouQsweswsakYfOBuFwKfKgRBsg6wceUBb6SP52THVLADZvrwLSBXA9iUX/K4jkDf6xNget2/Fo3cg8DLBe1hpsimJhF2ybkfytg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0FpafoDs4x8qkrhswX7m6OYLcdWaDQXXPiMHGedSPlLiGWdF3uaIXSneod1WcGCBUnH7EA9Z5gUI52uYJLE0ghJtw8B3WoW/Ofc9zcfXKDbazFf0Ikt0yFV9Igx/zHP5nOsGIQt9GQavYqUzjJvRIZNBFpQ4fVlcUkVEreVp3QsSJ4OND0lU2Lqk+/AvlchWZYyOlmjEi5yR1yriy+n2qHwvrCnKkIuNxgM+BU6T4lgJYyeZwtg9VM8Rpfhv2Qz5GsOdPasoSboYzPjduRnMP7hqF/jZzqA8bG/lWyyGu9Q6f+HugimGd3Zg6J+cgeNqQXdPiXANe9X47Jy4NGNFTDXvSy3sMII5gpqS9gkA7JgJelTqe8mJC+qENGA+FLAdx/WJl/nRMFmRqTnaWoj25HRI8J+WO67bYRxJ9RtTpFYx1xspPfG6DrCpVZWzR7En
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:26:00.6106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01620f7c-4bcf-421b-4c52-08df15779e0b
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15824

Read back the features after running ethtool -K to check if they were
actually applied. The drivers might refuse to set a feature silently and
the test could run with a different configuration than the requested one.

Add a 'check' parameter to skip this, as the GRO "hw" mode handles the
case where HW GRO is cleared by the driver.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2: New patch.

 tools/testing/selftests/drivers/net/gro_lib.py     |  3 ++-
 tools/testing/selftests/drivers/net/lib/py/feat.py | 10 +++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
index 7856ebdd49d3..875a715b2ae1 100644
--- a/tools/testing/selftests/drivers/net/gro_lib.py
+++ b/tools/testing/selftests/drivers/net/gro_lib.py
@@ -263,7 +263,8 @@ def _setup(cfg, mode, test_name):
         set_ethtool_feat(cfg.ifname, cfg.feat,
                          {"generic-receive-offload": False,
                           "rx-gro-hw": True,
-                          "large-receive-offload": False})
+                          "large-receive-offload": False},
+                          check=False)
 
         # Some NICs treat HW GRO as a GRO sub-feature so disabling GRO
         # will also clear HW GRO. Use a hack of installing XDP generic
diff --git a/tools/testing/selftests/drivers/net/lib/py/feat.py b/tools/testing/selftests/drivers/net/lib/py/feat.py
index b94a24214e59..f0630844f023 100644
--- a/tools/testing/selftests/drivers/net/lib/py/feat.py
+++ b/tools/testing/selftests/drivers/net/lib/py/feat.py
@@ -9,7 +9,7 @@ Provides common operations for changing device features via ethtool.
 from . import KsftXfailEx, defer, ethtool, ksft_pr
 
 
-def set_ethtool_feat(dev, current, feats, host=None):
+def set_ethtool_feat(dev, current, feats, host=None, check=True):
     """Set ethtool features with defer to restore original state."""
     s2n = {True: "on", False: "off"}
 
@@ -33,3 +33,11 @@ def set_ethtool_feat(dev, current, feats, host=None):
     # If ethtool printed something kernel must have modified some features
     if eth_cmd.stdout:
         ksft_pr(eth_cmd)
+
+    if not check:
+        return
+
+    current = ethtool(f"-k {dev}", json=True, host=host)[0]
+    for name, state in feats.items():
+        if current[name]["active"] != state:
+            raise KsftXfailEx(f"{name} was not set to {s2n[state]}")
-- 
2.34.1

