Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9E4E36FD;
	Fri, 18 Sep 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730771; cv=fail; b=aratMZ8K+1R67DpbW/xXGV92XioWwCtqiKL2XCQXvFoTiTO5CvqirWLJ5+M3QW0Zm6+JpaBDCr2uZXAoOliCbRCSaqvqpkoOTg++xEr5fdapv0MEdEVHqsi338X0/eULzPd/sZJdhdTVrkLpQcDowY6nwArcpdXt897nq6tAUNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730771; c=relaxed/simple;
	bh=63ulAEY5zmqHf/1ysTSILankCcdi8v1QZ4kr4PFCEXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mpLR1juH25KJqg2CeJ88YFbpObI94TBnBY+UsHCI/ULUiRxWW6lcPKCSYUTMSLn4yQcLL7BXtUhUwj6A1aNssK1FY1r6mmForgdPOXwBrzz0ZpE3OwnnG3uyjLhzSgg6o+oLl/VoftrDI/tC1LRsKaOqUmH9vreZG/EokC8CApA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H6Y62k+S; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H6Y62k+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stXy4UG38vgncAqE3v9HvHEYw9YHMgBgCnYSgu10S3Xzvl9slPFA5Q8YlMy0Ml7hl2LeXM6LrKyTBLp3veC0Uok6hdaUg5137tGOTUsRJiwLyNcA2i/ud3hyReYHGuMRCBE/1AgFJtXJ5lrf5j283Zz+e6dh+SKOS+g+KFcv2S4lyPqb+vIydbw/tEM03L9ge9NYWsrk7cS6U4wcj4a4VJx/wotFel47al/P/QmKDNE+Z5js9C9RWfSYnDKpNU2AxUL157xvLol9kjFBe3NdVu83EMZMovXro9OpoHc60Sp35KE3rWAP6T0y76u7kx81WmuISktFTZ5lWY1UDHBn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXERstsBxEe4Zlbv2ZU0QcdRtn3gocp8QaUWNSeik5E=;
 b=ggLJKSP7wY0dyvP0iNdWKuKo4f1jitnahL4Wxsm3WHWWimLk0IpQefhCMq/I5CevtjKYrZ0++K45GrNQnmuFeN1kftPOQZoEhm8L6Koo0rIFyIbWuvNbxBIiBNXJp+nJESSrVI7Csabw5B4f5Vrl/jLNF8brOxWnxp7hEDNRhUl9ORHRgNB2bRdSBYLa+B5mv1kHlBX6MbrG0TUOwCctrFjcSxgDM2VoPPrzsyFmwGAJVh7f2TIQck3drJn1tF3gtR9yP4itwlNtvMrzD+J9rvcUXV64kCEXEHcnFPnQ+ezhOMG2em7vIfAYQIFbbVcbOURNknBrBRTxy0IYsXyPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXERstsBxEe4Zlbv2ZU0QcdRtn3gocp8QaUWNSeik5E=;
 b=H6Y62k+SDLh9x2eiQvkyCYG6iEEJlLPeuFHkGbW42Xh3xcTvsyca+SeUzJLGosvxytd9CnUNODzSsTJoJ5fLmHQGW0Mnc7IJPei83bqTgfvLXRh6ttmYn6KoElR5LRv/NwWwP1o4v9FC0GO8arEisbYKJXeFURfHHGGkukUxDI0=
Received: from OSTPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:604:221::18)
 by TYCPR01MB8141.jpnprd01.prod.outlook.com (2603:1096:400:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 11:25:58 +0000
Received: from OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:221:cafe::3a) by OSTPR01CA0023.outlook.office365.com
 (2603:1096:604:221::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 11:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003B.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 11:25:56 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.165])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id F033F30001E4;
	Fri, 18 Sep 2026 20:25:52 +0900 (JST)
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
Subject: [PATCH net-next v2 1/3] selftests: drv-net: Move _set_ethtool_feat() into lib
Date: Fri, 18 Sep 2026 11:25:27 +0000
Message-ID: <20260918112529.96039-2-ovidiu.panait.rb@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003B:EE_|TYCPR01MB8141:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 660765c9-ecd0-4ba0-51a1-08df15779ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|6133799003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PPcIXNsVW8qvqs+YPtFFBHcNVVHOX7Qco98p3oxD06yJAvpBZe/S/AXcGKy9JX3A1Ardef5gnGN8O0h81Q0AYfsfB6NCMvhWVLwTBgEyCl5psmgewnaSBLKPj4VIRxcmgaQR6NHItxwBPUgz1OSE+ehOMlV/AfIsf3c/4OIyFTqU934lj87YCheYFjf9fvVOVRgyJPs/xI5A7fkfj93B4+XE0OPfHOUp2AvxpzpvA5evStv9PAXeuhzrsZQ98bzSakPCag06w7qOUKvqJtYz8DshYphqOTC/ScExzdo2nVE7nVXAfXWPMw5SiqFbAdbEr3y5GgwoNU48rrOe8G6q5oxO3uYn6qIMh3n/heRKtbv/gj354c5ZuLU9t6PxpzeNT7QXBFDaY5FtygTDHl66egcOBFXAT1wX4bsh+iCyVNCkalnfPaR0i3fNs1J4mlLejwvEPgvI0xVepBWOdCwP3wWLnY4bNbCAQ6tMhQj1tj1ji6JO23vfVnimikkkVO23UyjW6o9Aq0RjPVSW+c4yZB3uDOaDNSResimZaQVNPdtgMdwUby7yICkiybFAVLgEmQEtvvrEq9j0YZPq1AlQIQTf+82s5T/u4UNuH6i6DEVeO49c9xeCPYmzMl8a58b1WT4s+3EsKmE2mMVv/Tt+DcGRpm7suyLlJMuvhmMOh9VQ3DXFDOi1Qir5qBSbID52SlneNpcG6aPjLwjE2HabIg==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0t3NNcxJv1FWsd8fu8m7evawLAdvwybjifTGytQc4QIRwN/9VDmDED7+zUpkL6pjBJiHSHczrxiXIJwon5k+7lao2rrQS/SJ2TWGpCPE6JhUBoLE65vijsGAaEMCspv/0SBgGPBqW3E52WkoOPJuu3/+jSyNr4Es05bDZ/PXjRLshExNLqGFpS/ScbUIrTzrtYTDwjF7m9OPO3cxSCT5OF1CrsqbjMBlsTELU36/ZH+r72WDUwZP779s3GVqxPFaY+FG6/HLur9IpfjB8I4P8MOv9SspSs6BpkZ7Z0O1SrWIlj6FL9zAimS9iJBd/1Bu+psfh5QrVwRMVtZWz1uKZ1NyO8YKV4cuNvLz7u9YrMOJH7joq4btXNrfNk/1h/D1k4As0/4H3ZCiQkHIRcYRlHfO4gzSV+ortWHORYXcht3s7f1Ni5/Z9dJOwTvwy04s
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:25:56.5729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 660765c9-ecd0-4ba0-51a1-08df15779ba3
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003B.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8141

Move the _set_ethtool_feat() helper from gro_lib.py into lib, so that it
can be reused by the VLAN test added in the next commit. Drop the leading
underscore, now that the helper is exported.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
v2:
- Added Nicolai's "Reviewed-by" tag.

 .../testing/selftests/drivers/net/gro_lib.py  | 65 ++++++-------------
 .../drivers/net/hw/lib/py/__init__.py         |  3 +-
 .../selftests/drivers/net/lib/py/__init__.py  |  3 +-
 .../selftests/drivers/net/lib/py/feat.py      | 35 ++++++++++
 4 files changed, 59 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/lib/py/feat.py

diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
index abecf60baa53..7856ebdd49d3 100644
--- a/tools/testing/selftests/drivers/net/gro_lib.py
+++ b/tools/testing/selftests/drivers/net/gro_lib.py
@@ -52,7 +52,7 @@ import re
 from lib.py import ksft_run, ksft_exit, ksft_pr, ksft_eq
 from lib.py import NetDrvEpEnv, KsftFailEx, KsftSkipEx, KsftXfailEx
 from lib.py import NetdevFamily, EthtoolFamily
-from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip
+from lib.py import bkg, cmd, ctl_file_write, defer, ethtool, ip, set_ethtool_feat
 from lib.py import ksft_variants, KsftNamedVariant
 
 
@@ -125,31 +125,6 @@ def _set_gro_size_restore(cfg, size):
             comment="gro_ipv4_max_size not applied")
 
 
-def _set_ethtool_feat(dev, current, feats, host=None):
-    s2n = {True: "on", False: "off"}
-
-    new = ["-K", dev]
-    old = ["-K", dev]
-    no_change = True
-    for name, state in feats.items():
-        new += [name, s2n[state]]
-        old += [name, s2n[current[name]["active"]]]
-
-        if current[name]["active"] != state:
-            no_change = False
-            if current[name]["fixed"]:
-                raise KsftXfailEx(f"Device does not support {name}")
-    if no_change:
-        return
-
-    eth_cmd = ethtool(" ".join(new), host=host)
-    defer(ethtool, " ".join(old), host=host)
-
-    # If ethtool printed something kernel must have modified some features
-    if eth_cmd.stdout:
-        ksft_pr(eth_cmd)
-
-
 def _get_queue_stats(cfg, queue_id):
     """Get stats for a specific Rx queue."""
     cfg.wait_hw_stats_settle()
@@ -280,15 +255,15 @@ def _setup(cfg, mode, test_name):
             ctl_file_write(flush_path, "200000")
         ctl_file_write(irq_path, "10")
 
-        _set_ethtool_feat(cfg.ifname, cfg.feat,
-                          {"generic-receive-offload": True,
-                           "rx-gro-hw": False,
-                           "large-receive-offload": False})
+        set_ethtool_feat(cfg.ifname, cfg.feat,
+                         {"generic-receive-offload": True,
+                          "rx-gro-hw": False,
+                          "large-receive-offload": False})
     elif mode == "hw":
-        _set_ethtool_feat(cfg.ifname, cfg.feat,
-                          {"generic-receive-offload": False,
-                           "rx-gro-hw": True,
-                           "large-receive-offload": False})
+        set_ethtool_feat(cfg.ifname, cfg.feat,
+                         {"generic-receive-offload": False,
+                          "rx-gro-hw": True,
+                          "large-receive-offload": False})
 
         # Some NICs treat HW GRO as a GRO sub-feature so disabling GRO
         # will also clear HW GRO. Use a hack of installing XDP generic
@@ -303,27 +278,27 @@ def _setup(cfg, mode, test_name):
             # Attaching XDP may change features, fetch the latest state
             feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
 
-            _set_ethtool_feat(cfg.ifname, feat,
-                              {"generic-receive-offload": True,
-                               "rx-gro-hw": True,
-                               "large-receive-offload": False})
+            set_ethtool_feat(cfg.ifname, feat,
+                             {"generic-receive-offload": True,
+                              "rx-gro-hw": True,
+                              "large-receive-offload": False})
     elif mode == "lro":
         # netdevsim advertises LRO for feature inheritance testing with
         # bonding/team tests but it doesn't actually perform the offload
         cfg.require_nsim(nsim_test=False)
 
-        _set_ethtool_feat(cfg.ifname, cfg.feat,
-                          {"generic-receive-offload": False,
-                           "rx-gro-hw": False,
-                           "large-receive-offload": True})
+        set_ethtool_feat(cfg.ifname, cfg.feat,
+                         {"generic-receive-offload": False,
+                          "rx-gro-hw": False,
+                          "large-receive-offload": True})
 
     try:
         # Disable TSO for local tests
         cfg.require_nsim()  # will raise KsftXfailEx if not running on nsim
 
-        _set_ethtool_feat(cfg.remote_ifname, cfg.remote_feat,
-                          {"tcp-segmentation-offload": False},
-                          host=cfg.remote)
+        set_ethtool_feat(cfg.remote_ifname, cfg.remote_feat,
+                         {"tcp-segmentation-offload": False},
+                         host=cfg.remote)
     except KsftXfailEx:
         pass
 
diff --git a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
index 81e1d1865cd5..4077f5f1a1be 100644
--- a/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/hw/lib/py/__init__.py
@@ -31,6 +31,7 @@ try:
         ksft_setup, ksft_variants, KsftNamedVariant
     from net.lib.py import ksft_eq, ksft_ge, ksft_in, ksft_is, ksft_lt, \
         ksft_ne, ksft_not_in, ksft_raises, ksft_true, ksft_gt, ksft_not_none
+    from drivers.net.lib.py import set_ethtool_feat
     from drivers.net.lib.py import GenerateTraffic, Remote, Iperf3Runner
     from drivers.net.lib.py import NetDrvEnv, NetDrvEpEnv, NetDrvContEnv
 
@@ -49,7 +50,7 @@ try:
                "ksft_ne", "ksft_not_in", "ksft_raises", "ksft_true", "ksft_gt",
                "ksft_not_none", "ksft_not_none",
                "NetDrvEnv", "NetDrvEpEnv", "NetDrvContEnv", "GenerateTraffic",
-               "Remote", "Iperf3Runner"]
+               "Remote", "Iperf3Runner", "set_ethtool_feat"]
 except ModuleNotFoundError as e:
     print("Failed importing `net` library from kernel sources")
     print(str(e))
diff --git a/tools/testing/selftests/drivers/net/lib/py/__init__.py b/tools/testing/selftests/drivers/net/lib/py/__init__.py
index 591b1e6c7eea..40ccdcf0c378 100644
--- a/tools/testing/selftests/drivers/net/lib/py/__init__.py
+++ b/tools/testing/selftests/drivers/net/lib/py/__init__.py
@@ -48,11 +48,12 @@ try:
                "ksft_not_none", "ksft_not_none"]
 
     from .env import NetDrvEnv, NetDrvEpEnv, NetDrvContEnv
+    from .feat import set_ethtool_feat
     from .load import GenerateTraffic, Iperf3Runner
     from .remote import Remote
 
     __all__ += ["NetDrvEnv", "NetDrvEpEnv", "NetDrvContEnv", "GenerateTraffic",
-                "Remote", "Iperf3Runner"]
+                "Remote", "Iperf3Runner", "set_ethtool_feat"]
 except ModuleNotFoundError as e:
     print("Failed importing `net` library from kernel sources")
     print(str(e))
diff --git a/tools/testing/selftests/drivers/net/lib/py/feat.py b/tools/testing/selftests/drivers/net/lib/py/feat.py
new file mode 100644
index 000000000000..b94a24214e59
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/lib/py/feat.py
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Netdev feature helper utilities for kernel selftests.
+
+Provides common operations for changing device features via ethtool.
+"""
+
+from . import KsftXfailEx, defer, ethtool, ksft_pr
+
+
+def set_ethtool_feat(dev, current, feats, host=None):
+    """Set ethtool features with defer to restore original state."""
+    s2n = {True: "on", False: "off"}
+
+    new = ["-K", dev]
+    old = ["-K", dev]
+    no_change = True
+    for name, state in feats.items():
+        new += [name, s2n[state]]
+        old += [name, s2n[current[name]["active"]]]
+
+        if current[name]["active"] != state:
+            no_change = False
+            if current[name]["fixed"]:
+                raise KsftXfailEx(f"Device does not support {name}")
+    if no_change:
+        return
+
+    eth_cmd = ethtool(" ".join(new), host=host)
+    defer(ethtool, " ".join(old), host=host)
+
+    # If ethtool printed something kernel must have modified some features
+    if eth_cmd.stdout:
+        ksft_pr(eth_cmd)
-- 
2.34.1

